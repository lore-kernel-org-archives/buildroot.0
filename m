From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 17:50:31 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/smartmontools: fix build
 without stack-protector
In-Reply-To: <20200223153638.1109360-1-fontaine.fabrice@gmail.com>
References: <20200223153638.1109360-1-fontaine.fabrice@gmail.com>
Message-ID: <20200223165031.GQ8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-23 16:36 +0100, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/0de9f2a69fa2a39164211299f8a429d2fec6935a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ure.ac-fix-stack-protector-detection.patch | 38 +++++++++++++++++++
>  package/smartmontools/smartmontools.mk        |  2 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/smartmontools/0001-configure.ac-fix-stack-protector-detection.patch
> 
> diff --git a/package/smartmontools/0001-configure.ac-fix-stack-protector-detection.patch b/package/smartmontools/0001-configure.ac-fix-stack-protector-detection.patch
> new file mode 100644
> index 0000000000..63f51fc9bc
> --- /dev/null
> +++ b/package/smartmontools/0001-configure.ac-fix-stack-protector-detection.patch
> @@ -0,0 +1,38 @@
> +From 6bd18b0b7b4d916e474ba84707eb784a643b3e71 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 23 Feb 2020 16:23:20 +0100
> +Subject: [PATCH] configure.ac: fix stack-protector detection
> +
> +Use AC_LINK_IFELSE instead of AC_COMPILE_IFELSE to check for
> +stack-protector availability as some compilers could missed the needed
> +library (-lssp or -lssp_nonshared) at linking step:
> +
> +/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/x86_64-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wall -W -Wformat=2 -fstack-protector-strong   -o smartctl smartctl.o atacmdnames.o atacmds.o ataidentify.o ataprint.o dev_ata_cmd_set.o dev_intelliprop.o dev_interface.o dev_jmb39x_raid.o json.o knowndrives.o nvmecmds.o nvmeprint.o scsicmds.o scsiata.o scsinvme.o scsiprint.o utility.o     os_linux.o cciss.o dev_areca.o    -lselinux
> +/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
> +/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/0de9f2a69fa2a39164211299f8a429d2fec6935a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://www.smartmontools.org/ticket/1302]
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 87470d8a..ccb457e1 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -770,7 +770,7 @@ if test "$GXX" = "yes"; then
> +     AC_MSG_CHECKING([whether $CXX supports $option])
> +     save_CXXFLAGS=$CXXFLAGS
> +     CXXFLAGS="$CXXFLAGS $option"
> +-    AC_COMPILE_IFELSE([AC_LANG_PROGRAM()], [res=yes], [res=no; CXXFLAGS=$save_CXXFLAGS])
> ++    AC_LINK_IFELSE([AC_LANG_PROGRAM()], [res=yes], [res=no; CXXFLAGS=$save_CXXFLAGS])
> +     AC_MSG_RESULT([$res])
> +   done
> + else
> +-- 
> +2.25.0
> +
> diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
> index 77eedfabd8..9dc2f789cc 100644
> --- a/package/smartmontools/smartmontools.mk
> +++ b/package/smartmontools/smartmontools.mk
> @@ -8,6 +8,8 @@ SMARTMONTOOLS_VERSION = 7.1
>  SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
>  SMARTMONTOOLS_LICENSE = GPL-2.0+
>  SMARTMONTOOLS_LICENSE_FILES = COPYING
> +# We're patching configure.ac

I've changed that to just list the patch that touches configue.ac. That
way, it is easier to notice to drop autoreconf when we drop the patch.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +SMARTMONTOOLS_AUTORECONF = YES
>  
>  ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
>  SMARTMONTOOLS_CONF_OPTS += --with-libcap-ng
> -- 
> 2.25.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
