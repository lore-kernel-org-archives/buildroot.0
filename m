From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 23:27:25 +0200
Subject: [Buildroot] [PATCH 17/26] package/procps: bump version and
 rename to procps-ng
In-Reply-To: <40c318b64d99494c2050d99e3abae26822d8c68b.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
 <40c318b64d99494c2050d99e3abae26822d8c68b.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <20140601212725.GP3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-06-01 23:03 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> procps is getting replaced by procps-ng, and there are
> new versions available!

Gee... I forgot to apply a fix-up patch that renames the variables...
Will respin later.

Regards,
Yann E. MORIN.

> diff --git a/package/Config.in b/package/Config.in
> index a5a328e..1152c10 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1105,7 +1105,7 @@ source "package/numactl/Config.in"
>  source "package/nut/Config.in"
>  source "package/polkit/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -source "package/procps/Config.in"
> +source "package/procps-ng/Config.in"
>  source "package/psmisc/Config.in"
>  endif
>  source "package/quota/Config.in"
> diff --git a/package/procps/Config.in b/package/procps-ng/Config.in
> similarity index 100%
> rename from package/procps/Config.in
> rename to package/procps-ng/Config.in
> diff --git a/package/procps-ng/procps-0000-remove-index.patch b/package/procps-ng/procps-0000-remove-index.patch
> new file mode 100644
> index 0000000..1d85b31
> --- /dev/null
> +++ b/package/procps-ng/procps-0000-remove-index.patch
> @@ -0,0 +1,16 @@
> +sysctl: remove use of legacy index()
> +
> +[yann.morin.1998 at free.fr: adapt to procps-ng]
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +diff -durN procps-v3.3.9.orig/sysctl.c procps-v3.3.9/sysctl.c
> +--- procps-v3.3.9.orig/sysctl.c	2013-12-03 12:16:18.000000000 +0100
> ++++ procps-v3.3.9/sysctl.c	2014-05-31 00:45:00.869748741 +0200
> +@@ -794,7 +794,7 @@
> + 		      program_invocation_short_name);
> + 
> + 	for ( ; *argv; argv++) {
> +-		if (WriteMode || index(*argv, '='))
> ++		if (WriteMode || strchr(*argv, '='))
> + 			ReturnCode += WriteSetting(*argv);
> + 		else
> + 			ReturnCode += ReadSetting(*argv);
> diff --git a/package/procps-ng/procps.mk b/package/procps-ng/procps.mk
> new file mode 100644
> index 0000000..326c19c
> --- /dev/null
> +++ b/package/procps-ng/procps.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# procps
> +#
> +################################################################################
> +
> +PROCPS_VERSION = 3.3.9
> +PROCPS_SOURCE = procps-ng-$(PROCPS_VERSION).tar.xz
> +PROCPS_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
> +PROCPS_LICENSE = GPLv2+, libproc and libps LGPLv2+
> +PROCPS_LICENSE_FILES = COPYING COPYING.LIB
> +
> +PROCPS_DEPENDENCIES = ncurses
> +
> +$(eval $(autotools-package))
> diff --git a/package/procps/procps-make-3.82.patch b/package/procps/procps-make-3.82.patch
> deleted file mode 100644
> index 2a56356..0000000
> --- a/package/procps/procps-make-3.82.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -[PATCH] procps: fix build with make 3.82
> -
> -Equivalent to upstream fix:
> -http://procps.cvs.sourceforge.net/viewvc/procps/procps/Makefile?r1=1.70&r2=1.71
> -
> -Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ----
> - Makefile |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: procps-3.2.8/Makefile
> -===================================================================
> ---- procps-3.2.8.orig/Makefile
> -+++ procps-3.2.8/Makefile
> -@@ -174,7 +174,7 @@
> - # want this rule first, use := on ALL, and ALL not filled in yet
> - all: do_all
> - 
> ---include */module.mk
> -+-include proc/module.mk ps/module.mk
> - 
> - do_all:    $(ALL)
> - 
> diff --git a/package/procps/procps-remove-flags.patch b/package/procps/procps-remove-flags.patch
> deleted file mode 100644
> index cb4dc56..0000000
> --- a/package/procps/procps-remove-flags.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -diff -u procps-3.2.5/Makefile procps-3.2.5-patched/Makefile
> ---- procps-3.2.5/Makefile	2005-01-25 22:55:26.000000000 -0600
> -+++ procps-3.2.5-patched/Makefile	2007-07-05 23:09:24.251423681 -0500
> -@@ -70,9 +70,7 @@
> - CURSES := -lncurses
> - 
> - # Preprocessor flags.
> --PKG_CPPFLAGS := -D_GNU_SOURCE -I proc
> --CPPFLAGS     := -I/usr/include/ncurses
> --ALL_CPPFLAGS := $(PKG_CPPFLAGS) $(CPPFLAGS)
> -+ALL_CPPFLAGS := -D_GNU_SOURCE -I proc
> - 
> - # Left out -Wconversion due to noise in glibc headers.
> - # Left out -Wunreachable-code and -Wdisabled-optimization
> -@@ -91,11 +89,9 @@
> -   -Wstrict-prototypes -Wmissing-prototypes
> - # Note that some stuff below is conditional on CFLAGS containing
> - # an option that starts with "-g". (-g, -g2, -g3, -ggdb, etc.)
> --CFLAGS       := -O2 -s
> - ALL_CFLAGS   := $(PKG_CFLAGS) $(CFLAGS)
> - 
> - PKG_LDFLAGS  := -Wl,-warn-common
> --LDFLAGS      :=
> - ALL_LDFLAGS  := $(PKG_LDFLAGS) $(LDFLAGS)
> - 
> - ############ Add some extra flags if gcc allows
> diff --git a/package/procps/procps-remove-index.patch b/package/procps/procps-remove-index.patch
> deleted file mode 100644
> index 4f4cfb7..0000000
> --- a/package/procps/procps-remove-index.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -diff -ur procps-3.2.5/sysctl.c procps-3.2.5-patched/sysctl.c
> ---- procps-3.2.5/sysctl.c	2005-01-05 15:00:47.000000000 -0600
> -+++ procps-3.2.5-patched/sysctl.c	2006-12-04 19:51:36.272843000 -0600
> -@@ -272,7 +272,7 @@
> -       return 0;
> -    } /* end if */
> - 
> --   equals = index(setting, '=');
> -+   equals = strchr(setting, '=');
> -  
> -    if (!equals) {
> -       fprintf(stderr, ERR_NO_EQUALS, setting);
> -@@ -498,7 +498,7 @@
> -          if (NameOnly && Quiet)   // nonsense
> -             return Usage(me);
> -          SwitchesAllowed = false;
> --         if (WriteMode || index(*argv, '='))
> -+         if (WriteMode || strchr(*argv, '='))
> -             ReturnCode = WriteSetting(*argv);
> -          else
> -             ReturnCode = ReadSetting(*argv);
> diff --git a/package/procps/procps-wchar.patch b/package/procps/procps-wchar.patch
> deleted file mode 100644
> index 7915229..0000000
> --- a/package/procps/procps-wchar.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> ---- procps-3.2.7/proc/escape.c	2005-01-06 07:50:26.000000000 +1100
> -+++ procps-3.2.7.fixed/proc/escape.c	2008-09-09 11:55:57.000000000 +1000
> -@@ -15,7 +15,7 @@
> - #include "escape.h"
> - #include "readproc.h"
> - 
> --#if (__GNU_LIBRARY__ >= 6)
> -+#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
> - # include <wchar.h>
> - # include <wctype.h>
> - # include <stdlib.h>  /* MB_CUR_MAX */
> -@@ -23,7 +23,7 @@
> - # include <langinfo.h>
> - #endif
> - 
> --#if (__GNU_LIBRARY__ >= 6)
> -+#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
> - static int escape_str_utf8(char *restrict dst, const char *restrict src, int bufsize, int *maxcells){
> -   int my_cells = 0;
> -   int my_bytes = 0;
> -@@ -123,7 +123,7 @@
> -   "********************************"
> -   "********************************";
> -   
> --#if (__GNU_LIBRARY__ >= 6)
> -+#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
> -   static int utf_init=0;
> -   
> -   if(utf_init==0){
> diff --git a/package/procps/procps.mk b/package/procps/procps.mk
> deleted file mode 100644
> index dc2b841..0000000
> --- a/package/procps/procps.mk
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -################################################################################
> -#
> -# procps
> -#
> -################################################################################
> -
> -PROCPS_VERSION = 3.2.8
> -PROCPS_SITE = http://procps.sourceforge.net/
> -PROCPS_LICENSE = GPLv2+, libproc and libps LGPLv2+
> -PROCPS_LICENSE_FILES = COPYING COPYING.LIB
> -
> -PROCPS_DEPENDENCIES = ncurses
> -
> -define PROCPS_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> -endef
> -
> -define PROCPS_INSTALL_TARGET_CMDS
> -	mkdir -p $(addprefix $(TARGET_DIR)/,usr/bin bin sbin) \
> -		 $(addprefix $(TARGET_DIR)/usr/share/man/,man1 man5 man8)
> -	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) lib64=lib install=install \
> -		ldconfig=true install
> -endef
> -
> -$(eval $(generic-package))
> -- 
> 1.8.3.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
