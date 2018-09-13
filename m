From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 13 Sep 2018 08:38:45 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] sysvinit: bump to version 2.90
In-Reply-To: <20180913041800.7242-1-benj.calderon@gmail.com>
References: <20180913041800.7242-1-benj.calderon@gmail.com>
Message-ID: <1828163027.9525.1536838725411.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Benjamin Calderon" <benj.calderon@gmail.com>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "DATACOM" <casantos@datacom.com.br>, "Benjamin Calderon" <benj.calderon@gmail.com>
> Sent: Thursday, September 13, 2018 1:18:00 AM
> Subject: [PATCH 1/1] sysvinit: bump to version 2.90

> This commit updates sysvinit package using the upstream tarball at
> http://download.savannah.nongnu.org/releases/sysvinit/ instead of the
> Debian tarball + patches currently in use
> 
> Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
> ---
> package/sysvinit/0001-fix-libcrypt-test.patch | 20 ----------
> .../0002-musl-fix-compilation-errors.patch    | 38 -------------------
> package/sysvinit/sysvinit.hash                |  8 ++--
> package/sysvinit/sysvinit.mk                  | 17 ++-------
> 4 files changed, 8 insertions(+), 75 deletions(-)
> delete mode 100644 package/sysvinit/0001-fix-libcrypt-test.patch
> delete mode 100644 package/sysvinit/0002-musl-fix-compilation-errors.patch
> 
> diff --git a/package/sysvinit/0001-fix-libcrypt-test.patch
> b/package/sysvinit/0001-fix-libcrypt-test.patch
> deleted file mode 100644
> index 6c22436d74..0000000000
> --- a/package/sysvinit/0001-fix-libcrypt-test.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Make the libcrypt test somewhat cross-compilation compliant
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -Index: b/src/Makefile
> -===================================================================
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -78,8 +78,9 @@ else
> - endif
> -
> - # Additional libs for GNU libc.
> --ifneq ($(wildcard /usr/lib*/libcrypt.a),)
> --  SULOGINLIBS	+= -lcrypt
> -+HAS_LIBCRYPT=$(shell f=`mktemp` && echo 'int main(void) {}' | $(CC) -o $$f -xc
> - -lcrypt >/dev/null 2>&1 && echo yes; rm -f $$f)
> -+ifeq ($(HAS_LIBCRYPT),yes)
> -+  SULOGINLIBS += -lcrypt
> - endif
> -
> - all:		$(BIN) $(SBIN) $(USRBIN)
> diff --git a/package/sysvinit/0002-musl-fix-compilation-errors.patch
> b/package/sysvinit/0002-musl-fix-compilation-errors.patch
> deleted file mode 100644
> index 5dcdecf72b..0000000000
> --- a/package/sysvinit/0002-musl-fix-compilation-errors.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Fix various compilation errors when compiling against must libc
> -
> -Signed-off-by: Dagg Stompler <daggs@gmx.com>
> -
> -diff -Nupr a/src/init.c b/src/init.c
> ---- a/src/init.c	2017-08-13 18:44:27.000000000 +0300
> -+++ b/src/init.c	2017-08-13 18:34:45.000000000 +0300
> -@@ -37,6 +37,7 @@
> - #include <sys/kd.h>
> - #endif
> - #include <sys/resource.h>
> -+#include <sys/ttydefaults.h>
> - #include <stdlib.h>
> - #include <unistd.h>
> - #include <errno.h>
> -diff -Nupr a/src/init.h b/src/init.h
> ---- a/src/init.h	2017-08-13 19:35:46.000000000 +0300
> -+++ b/src/init.h	2017-08-13 19:36:01.000000000 +0300
> -@@ -22,6 +22,8 @@
> -  *
> -  */
> -
> -+#include <time.h>
> -+
> - /* Standard configuration */
> - #define CHANGE_WAIT 0			/* Change runlevel while
> - 					   waiting for a process to exit? */
> -diff -Nupr a/src/mountpoint.c b/src/mountpoint.c
> ---- a/src/mountpoint.c	2017-08-13 20:28:26.000000000 +0300
> -+++ b/src/mountpoint.c	2017-08-13 20:28:40.000000000 +0300
> -@@ -24,6 +24,7 @@
> -  */
> -
> - #include <sys/stat.h>
> -+#include <sys/types.h>
> - #include <unistd.h>
> - #include <stdlib.h>
> - #include <string.h>
> diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
> index 268b9841b0..2161fb38bd 100644
> --- a/package/sysvinit/sysvinit.hash
> +++ b/package/sysvinit/sysvinit.hash
> @@ -1,3 +1,5 @@
> -# From
> http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/sysvinit/sysvinit_2.88dsf-13.1%2Bsqueeze1.dsc
> -sha256	b016f937958d2809a020d407e1287bdc09abf1d44efaa96530e2ea57f544f4e8
> 	sysvinit_2.88dsf.orig.tar.gz
> -sha256	26b456a31036b1e1c2486c22ca2b7fde6d723b7c63669604eacc61cfb6609ef8
> 	sysvinit_2.88dsf-13.1+squeeze1.diff.gz
> +# Locally computed:
> +sha256	114cffc8ef514a38b9916de2050bb6d73b43dff7afd05aee6b09d2f6cea7664e
> sysvinit-2.90.tar.xz
> +
> +# Hash for license files:
> +sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6
> COPYING
> diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
> index 993e399e73..98aa5a417b 100644
> --- a/package/sysvinit/sysvinit.mk
> +++ b/package/sysvinit/sysvinit.mk
> @@ -4,10 +4,9 @@
> #
> ################################################################################
> 
> -SYSVINIT_VERSION = 2.88
> -SYSVINIT_SOURCE = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
> -SYSVINIT_PATCH = sysvinit_$(SYSVINIT_VERSION)dsf-13.1+squeeze1.diff.gz
> -SYSVINIT_SITE =
> http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/sysvinit
> +SYSVINIT_VERSION = 2.90
> +SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
> +SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
> SYSVINIT_LICENSE = GPL-2.0+
> SYSVINIT_LICENSE_FILES = COPYING
> 
> @@ -18,17 +17,7 @@ SYSVINIT_DEPENDENCIES += libselinux
> SYSVINIT_MAKE_OPTS += WITH_SELINUX="yes"
> endif
> 
> -define SYSVINIT_DEBIAN_PATCHES
> -	if [ -d $(@D)/debian/patches ]; then \
> -		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
> -	fi
> -endef
> -
> -SYSVINIT_POST_PATCH_HOOKS = SYSVINIT_DEBIAN_PATCHES
> -
> define SYSVINIT_BUILD_CMDS
> -	# Force sysvinit to link against libcrypt as it otherwise
> -	# use an incorrect test to see if it's available
> 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(SYSVINIT_MAKE_OPTS) -C $(@D)/src
> endef
> 
> --
> 2.19.0

Tested-by: Carlos Santos <casantos@datacom.com.br>

Tested duild, install, reinstall, rebuild, reconfigure and legal-info
make targets for x86-64. Ran it on a VM (qemu/KVM).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
