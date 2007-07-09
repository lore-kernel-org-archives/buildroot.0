From: Allan Clark <allanc@chickenandporn.com>
Date: Mon, 9 Jul 2007 10:26:24 -0400
Subject: [Buildroot] r19025 breaks non-libintl.h
Message-ID: <37c712e0707090726y455b1382i57828bc63c436a20@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(top-post to make more visible)

This change to trunk/buildroot/Makefile breaks non-libintl.h platforms.

in package/config/Makefile.kconfig HOSTCFLAGS is altered when
'#include <libintl.h>' fails to build -- it adds -DKBUILD_NO_NLS to
HOSTCFLAGS, which is then used in lkc.h included by conf.c

r19025 change overrides the HOSTCFLAGS on the $(MAKE) command-line,
removing this and other configs.

A quick-fix (works on MacOSX-10.4.10) would be to change
Makefile.kconfig to set this value on the HOST_EXTRACFLAGS:


Index: package/config/Makefile.kconfig
===================================================================
--- package/config/Makefile.kconfig     (revision 19054)
+++ package/config/Makefile.kconfig     (working copy)
@@ -147,7 +147,7 @@
      then echo yes ; \
      else echo no ; fi)
 ifeq ($(KBUILD_HAVE_NLS),no)
-HOSTCFLAGS     += -DKBUILD_NO_NLS
+HOST_EXTRACFLAGS       += -DKBUILD_NO_NLS
 endif

 # generated files seem to need this to find local include files



Allan


On 7/7/07, aldot at uclibc.org <aldot@uclibc.org> wrote:
> Author: aldot
> Date: 2007-07-07 17:00:17 -0700 (Sat, 07 Jul 2007)
> New Revision: 19025
>
> Log:
> - silence a cosmetic warning (closes several issues in mantis).
>   This also provides a nice up-to-date filestamp if something got reconfigured (e.g. c++ support got toggled) that can be used in the future to depend accordingly.
>
>
> Modified:
>    trunk/buildroot/Makefile
>    trunk/buildroot/package/config/confdata.c
>    trunk/buildroot/package/config/kconfig-to-buildroot2.patch
>
>
> Changeset:
> Modified: trunk/buildroot/Makefile
> ===================================================================
> --- trunk/buildroot/Makefile    2007-07-07 23:55:19 UTC (rev 19024)
> +++ trunk/buildroot/Makefile    2007-07-08 00:00:17 UTC (rev 19025)
> @@ -84,7 +84,7 @@
>  HOSTCXX:=$(shell $(CONFIG_SHELL) which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
>  HOSTLD:=$(shell $(CONFIG_SHELL) which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
>  ifndef CFLAGS_FOR_BUILD
> -CFLAGS_FOR_BUILD:="-g -O2"
> +CFLAGS_FOR_BUILD:=-g -O2
>  endif
>  export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
>
> @@ -264,40 +264,61 @@
>  # ---------------------------------------------------------------------------
>
>  $(CONFIG)/conf:
> -       $(MAKE) CC="$(HOSTCC)" CFLAGS=$(CFLAGS_FOR_BUILD) MAKECMDGOALS="$(MAKECMDGOALS)" \
> +       $(MAKE) CC="$(HOSTCC)" HOSTCFLAGS="$(CFLAGS_FOR_BUILD)" MAKECMDGOALS="$(MAKECMDGOALS)" \
>                 -C $(CONFIG) conf
>         - at if [ ! -f .config ] ; then \
>                 cp $(CONFIG_DEFCONFIG) .config; \
>         fi
>  $(CONFIG)/mconf:
> -       $(MAKE) CC="$(HOSTCC)" CFLAGS=$(CFLAGS_FOR_BUILD) MAKECMDGOALS="$(MAKECMDGOALS)" \
> +       $(MAKE) CC="$(HOSTCC)" HOSTCFLAGS="$(CFLAGS_FOR_BUILD)" MAKECMDGOALS="$(MAKECMDGOALS)" \
>                 -C $(CONFIG) conf mconf
>         - at if [ ! -f .config ] ; then \
>                 cp $(CONFIG_DEFCONFIG) .config; \
>         fi
>
>  menuconfig: $(CONFIG)/mconf
> -       @$(CONFIG)/mconf $(CONFIG_CONFIG_IN)
> +       @-mkdir -p include/config
> +       @KCONFIG_AUTOCONFIG=include/config/auto.conf \
> +               KCONFIG_AUTOHEADER=include/autoconf.h \
> +               $(CONFIG)/mconf $(CONFIG_CONFIG_IN)
>
>  config: $(CONFIG)/conf
> -       @$(CONFIG)/conf $(CONFIG_CONFIG_IN)
> +       @-mkdir -p include/config
> +       @KCONFIG_AUTOCONFIG=include/config/auto.conf \
> +               KCONFIG_AUTOHEADER=include/autoconf.h \
> +               $(CONFIG)/conf $(CONFIG_CONFIG_IN)
>
>  oldconfig: $(CONFIG)/conf
> -       @$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
> +       @-mkdir -p include/config
> +       @KCONFIG_AUTOCONFIG=include/config/auto.conf \
> +               KCONFIG_AUTOHEADER=include/autoconf.h \
> +               $(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
>
>  randconfig: $(CONFIG)/conf
> -       @$(CONFIG)/conf -r $(CONFIG_CONFIG_IN)
> +       @-mkdir -p include/config
> +       @KCONFIG_AUTOCONFIG=include/config/auto.conf \
> +               KCONFIG_AUTOHEADER=include/autoconf.h \
> +               $(CONFIG)/conf -r $(CONFIG_CONFIG_IN)
>
>  allyesconfig: $(CONFIG)/conf
> -       cp $(CONFIG_DEFCONFIG) .config
> -       @$(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
> +       cat $(CONFIG_DEFCONFIG) > .config
> +       @-mkdir -p include/config
> +       @KCONFIG_AUTOCONFIG=include/config/auto.conf \
> +               KCONFIG_AUTOHEADER=include/autoconf.h \
> +               $(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
>         #sed -i -e "s/^CONFIG_DEBUG.*/# CONFIG_DEBUG is not set/" .config
>
>  allnoconfig: $(CONFIG)/conf
> -       @$(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
> +       @-mkdir -p include/config
> +       @KCONFIG_AUTOCONFIG=include/config/auto.conf \
> +               KCONFIG_AUTOHEADER=include/autoconf.h \
> +               $(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
>
>  defconfig: $(CONFIG)/conf
> -       @$(CONFIG)/conf -d $(CONFIG_CONFIG_IN)
> +       @-mkdir -p include/config
> +       @KCONFIG_AUTOCONFIG=include/config/auto.conf \
> +               KCONFIG_AUTOHEADER=include/autoconf.h \
> +               $(CONFIG)/conf -d $(CONFIG_CONFIG_IN)
>
>  # check if download URLs are outdated
>  source-check: allyesconfig
>
> Modified: trunk/buildroot/package/config/confdata.c
> ===================================================================
> --- trunk/buildroot/package/config/confdata.c   2007-07-07 23:55:19 UTC (rev 19024)
> +++ trunk/buildroot/package/config/confdata.c   2007-07-08 00:00:17 UTC (rev 19025)
> @@ -11,6 +11,7 @@
>  #include <string.h>
>  #include <time.h>
>  #include <unistd.h>
> +#include <libgen.h>
>
>  #define LKC_DIRECT_LINK
>  #include "lkc.h"
> @@ -529,7 +530,7 @@
>
>  int conf_split_config(void)
>  {
> -       char *name, path[128];
> +       char *name, path[128], *opwd, *dir, *_name;
>         char *s, *d, c;
>         struct symbol *sym;
>         struct stat sb;
> @@ -540,8 +541,20 @@
>                 name = "include/config/auto.conf";
>         conf_read_simple(name, S_DEF_AUTO);
>
> -       if (chdir("include/config"))
> +       opwd = malloc(256);
> +       _name = strdup(name);
> +       if (opwd == NULL || _name == NULL)
>                 return 1;
> +       opwd = getcwd(opwd, 256);
> +       dir = dirname(_name);
> +       if (dir == NULL) {
> +               res = 1;
> +               goto err;
> +       }
> +       if (chdir(dir)) {
> +               res = 1;
> +               goto err;
> +       }
>
>         res = 0;
>         for_all_symbols(i, sym) {
> @@ -634,9 +647,11 @@
>                 close(fd);
>         }
>  out:
> -       if (chdir("../.."))
> -               return 1;
> -
> +       if (chdir(opwd))
> +               res = 1;
> +err:
> +       free(opwd);
> +       free(_name);
>         return res;
>  }
>
>
> Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
> ===================================================================
> --- trunk/buildroot/package/config/kconfig-to-buildroot2.patch  2007-07-07 23:55:19 UTC (rev 19024)
> +++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch  2007-07-08 00:00:17 UTC (rev 19025)
> @@ -667,3 +667,60 @@
>
>         if (conf_split_config())
>                 return 1;
> +diff -rdup x/config/confdata.c package/config/confdata.c
> +--- x/config/confdata.c        2007-07-07 11:13:12.000000000 +0200
> ++++ package/config/confdata.c  2007-07-08 01:30:44.000000000 +0200
> +@@ -11,6 +11,7 @@
> + #include <string.h>
> + #include <time.h>
> + #include <unistd.h>
> ++#include <libgen.h>
> +
> + #define LKC_DIRECT_LINK
> + #include "lkc.h"
> +@@ -529,7 +530,7 @@ int conf_write(const char *name)
> +
> + int conf_split_config(void)
> + {
> +-      char *name, path[128];
> ++      char *name, path[128], *opwd, *dir, *_name;
> +       char *s, *d, c;
> +       struct symbol *sym;
> +       struct stat sb;
> +@@ -540,8 +541,20 @@ int conf_split_config(void)
> +               name = "include/config/auto.conf";
> +       conf_read_simple(name, S_DEF_AUTO);
> +
> +-      if (chdir("include/config"))
> ++      opwd = malloc(256);
> ++      _name = strdup(name);
> ++      if (opwd == NULL || _name == NULL)
> +               return 1;
> ++      opwd = getcwd(opwd, 256);
> ++      dir = dirname(_name);
> ++      if (dir == NULL) {
> ++              res = 1;
> ++              goto err;
> ++      }
> ++      if (chdir(dir)) {
> ++              res = 1;
> ++              goto err;
> ++      }
> +
> +       res = 0;
> +       for_all_symbols(i, sym) {
> +@@ -634,9 +647,11 @@ int conf_split_config(void)
> +               close(fd);
> +       }
> + out:
> +-      if (chdir("../.."))
> +-              return 1;
> +-
> ++      if (chdir(opwd))
> ++              res = 1;
> ++err:
> ++      free(opwd);
> ++      free(_name);
> +       return res;
> + }
> +
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>


-- 
allanc at chickenandporn.com  "??" http://linkedin.com/in/goldfish
please, no proprietary attachments (http://tinyurl.com/cbgq)
