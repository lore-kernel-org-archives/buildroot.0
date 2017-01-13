From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 13 Jan 2017 19:19:21 +0100
Subject: [Buildroot] [PATCH 1/1] dieharder: new package
In-Reply-To: <1484259791-7227-1-git-send-email-julien@vdg.name>
References: <1484259791-7227-1-git-send-email-julien@vdg.name>
Message-ID: <e3682b0f-7f5c-6b00-06d7-36a72e31a8f9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

Le 12/01/2017 ? 23:23, Julien Viard de Galbert a ?crit :
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
> Changes v3 -> v4
>   - wrap description to 72 columns (Thomas Petazoni)
>   - fix licence description (Thomas Petazoni)
>   - use _ENV instead of _OPTS for configure tweek (Thomas Petazoni)
>   - fix space around = in .mk (Thomas Petazoni)
>   - switched from _SUBDIR to _STRIP_COMPONENTS to ease patching
>   - added 4 patches :
>      - 2 to fix the build system
>      - 1 for c99 type missing
>      - 1 for compiling with musl libc (Romain Naour, Yann E. MORIN)
>   - depending on libtool, replacing missing libtool m4 files
>      and running autoreconf (found this was necessary when libtool is
>      no installed on host as the tarball ships symlinks to m4 files)
>   - added .hash file
> Changes v2 -> v3
>   - remove intermediate variable use (suggested by Baruch Siach)
> Changes v1 -> v2
>   - fixed typo "bin" instead of "big" (thanks Thomas Petazoni)
>   - select gls in config (suggested by Romain Naour)
>   - specified "includedir" to fix unsafe header path
> 
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
>  package/Config.in                                  |  1 +
>  ...includedir-as-include-search-path-for-bui.patch | 57 ++++++++++++++++++++++
>  .../dieharder/0002-do-not-install-includes.patch   | 25 ++++++++++
>  .../dieharder/0003-Fix-missing-type-intptr_t.patch | 24 +++++++++
>  ...U_SOURCE-for-uint-and-M_PI-with-musl-libc.patch | 24 +++++++++
>  package/dieharder/Config.in                        | 10 ++++
>  package/dieharder/dieharder.hash                   |  3 ++
>  package/dieharder/dieharder.mk                     | 40 +++++++++++++++
>  8 files changed, 184 insertions(+)
>  create mode 100644 package/dieharder/0001-do-not-use-includedir-as-include-search-path-for-bui.patch
>  create mode 100644 package/dieharder/0002-do-not-install-includes.patch
>  create mode 100644 package/dieharder/0003-Fix-missing-type-intptr_t.patch
>  create mode 100644 package/dieharder/0004-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
>  create mode 100644 package/dieharder/Config.in
>  create mode 100644 package/dieharder/dieharder.hash
>  create mode 100644 package/dieharder/dieharder.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8c8c33e..978f5fd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -72,6 +72,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/bonnie/Config.in"
>  	source "package/cache-calibrator/Config.in"
>  	source "package/dhrystone/Config.in"
> +	source "package/dieharder/Config.in"
>  	source "package/dmalloc/Config.in"
>  	source "package/dropwatch/Config.in"
>  	source "package/dstat/Config.in"
> diff --git a/package/dieharder/0001-do-not-use-includedir-as-include-search-path-for-bui.patch b/package/dieharder/0001-do-not-use-includedir-as-include-search-path-for-bui.patch
> new file mode 100644
> index 0000000..4e2dd08
> --- /dev/null
> +++ b/package/dieharder/0001-do-not-use-includedir-as-include-search-path-for-bui.patch
> @@ -0,0 +1,57 @@
> +From 691fd9bde5dce4a4da071a120b76c6eb95abb3a6 Mon Sep 17 00:00:00 2001
> +From: Julien Viard de Galbert <julien@vdg.name>
> +Date: Sun, 17 May 2015 15:04:54 +0200
> +Subject: [PATCH 1/4] do not use includedir as include search path for build

Please add a small patch description and your SoB line here.

http://nightly.buildroot.org/manual.html#_format_and_licensing_of_the_package_patches

> +
> +---
> + configure.ac             | 6 +++---
> + dieharder/Makefile.am    | 2 +-
> + libdieharder/Makefile.am | 2 +-
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index b336115..91f7c64 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -96,9 +96,9 @@ AC_TYPE_SIZE_T
> + AC_C_VOLATILE
> + AC_C_INLINE
> + 
> +-DIEHARDER_CFLAGS="-I$includedir"
> +-dieharder_CFLAGS="-std=c99 -Wall -pedantic -I$includedir"
> +-libdieharder_lo_CFLAGS="-Wall -pedantic -I$includedir"
> ++DIEHARDER_CFLAGS=""
> ++dieharder_CFLAGS="-std=c99 -Wall -pedantic"
> ++libdieharder_lo_CFLAGS="-Wall -pedantic"
> + DIEHARDER_LIBS="-L$libdir -ldieharder"
> + ACLOCAL_AMFLAGS="-I m4"
> + 
> +diff --git a/dieharder/Makefile.am b/dieharder/Makefile.am
> +index e6fbff2..7bdac5c 100644
> +--- a/dieharder/Makefile.am
> ++++ b/dieharder/Makefile.am
> +@@ -64,7 +64,7 @@ DEFINES = -DVERSION=$(VERSION)
> + # CC = gcc
> + 
> + # Compile flags (use fairly standard -O3 as default)
> +-AM_CPPFLAGS = -I ${top_srcdir}/include $(DEFINES) -I ${includedir}
> ++AM_CPPFLAGS = -I ${top_srcdir}/include $(DEFINES)
> + AM_CFLAGS = -O3
> + 
> + # Load flags (optional)
> +diff --git a/libdieharder/Makefile.am b/libdieharder/Makefile.am
> +index 5fd3396..0873f9c 100644
> +--- a/libdieharder/Makefile.am
> ++++ b/libdieharder/Makefile.am
> +@@ -114,7 +114,7 @@ DEFINES = -DVERSION=$(VERSION) -DLITTLE_ENDIAN=$(LITTLE_ENDIAN)
> + # CC = gcc
> + 
> + # Compile flags (use fairly standard -O3 as default)
> +-AM_CPPFLAGS = $(DEFINES) -I ${top_srcdir}/include -I ${includedir}
> ++AM_CPPFLAGS = $(DEFINES) -I ${top_srcdir}/include
> + AM_CFLAGS = -O3 -Wall -pedantic -Wno-unused-variable 
> + 
> + #========================================================================
> +-- 
> +2.1.4
> +
> diff --git a/package/dieharder/0002-do-not-install-includes.patch b/package/dieharder/0002-do-not-install-includes.patch
> new file mode 100644
> index 0000000..c123184
> --- /dev/null
> +++ b/package/dieharder/0002-do-not-install-includes.patch
> @@ -0,0 +1,25 @@
> +From c55ddec8b74c0eb5bc81b0dfec2f80f8125c5947 Mon Sep 17 00:00:00 2001
> +From: Julien Viard de Galbert <julien@vdg.name>
> +Date: Sun, 17 May 2015 15:18:32 +0200
> +Subject: [PATCH 2/4] do not install includes

Dito.

> +
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 489c493..0264c5e 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -74,7 +74,7 @@ SPEC = $(PROJECT).spec
> + # presume the simplest of dependencies and remake if includes change
> + # for example.
> + #========================================================================
> +-all: $(LIBTIME) $(PROGTIME) $(INCTIME)
> ++all: $(LIBTIME) $(PROGTIME)
> + 
> + # This is not, actually, a particularly useful toplevel target.  To
> + # work correctly it also would require a full parsing of all
> +-- 
> +2.1.4
> +
> diff --git a/package/dieharder/0003-Fix-missing-type-intptr_t.patch b/package/dieharder/0003-Fix-missing-type-intptr_t.patch
> new file mode 100644
> index 0000000..f15b828
> --- /dev/null
> +++ b/package/dieharder/0003-Fix-missing-type-intptr_t.patch
> @@ -0,0 +1,24 @@
> +From ab3d1ce0dc67c33a2332ccf3bb16353e1b0e2ef8 Mon Sep 17 00:00:00 2001
> +From: Julien Viard de Galbert <julien@vdg.name>
> +Date: Sun, 8 Jan 2017 23:07:30 +0100
> +Subject: [PATCH 3/4] Fix missing type intptr_t

Dito.

> +
> +---
> + include/dieharder/libdieharder.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/include/dieharder/libdieharder.h b/include/dieharder/libdieharder.h
> +index 2138ebf..d98b758 100644
> +--- a/include/dieharder/libdieharder.h
> ++++ b/include/dieharder/libdieharder.h
> +@@ -17,6 +17,7 @@
> + 
> + /* This turns on uint macro in c99 */
> + #define __USE_MISC 1
> ++#include <stdint.h>
> + #include <sys/types.h>
> + #include <sys/stat.h>
> + #include <unistd.h>
> +-- 
> +2.1.4
> +
> diff --git a/package/dieharder/0004-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch b/package/dieharder/0004-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
> new file mode 100644
> index 0000000..d52f123
> --- /dev/null
> +++ b/package/dieharder/0004-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
> @@ -0,0 +1,24 @@
> +From 36208d9abc76cc888d13eefb26c52e466da2c2c1 Mon Sep 17 00:00:00 2001
> +From: Julien Viard de Galbert <julien@vdg.name>
> +Date: Wed, 11 Jan 2017 21:28:01 +0100
> +Subject: [PATCH 4/4] Add _GNU_SOURCE for uint and M_PI with musl libc
> +

Dito.

> +---
> + include/dieharder/libdieharder.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/include/dieharder/libdieharder.h b/include/dieharder/libdieharder.h
> +index d98b758..c1a5023 100644
> +--- a/include/dieharder/libdieharder.h
> ++++ b/include/dieharder/libdieharder.h
> +@@ -17,6 +17,7 @@
> + 
> + /* This turns on uint macro in c99 */
> + #define __USE_MISC 1
> ++#define _GNU_SOURCE 1
> + #include <stdint.h>
> + #include <sys/types.h>
> + #include <sys/stat.h>
> +-- 
> +2.1.4
> +
> diff --git a/package/dieharder/Config.in b/package/dieharder/Config.in
> new file mode 100644
> index 0000000..0288b82
> --- /dev/null
> +++ b/package/dieharder/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_DIEHARDER
> +	bool "dieharder"
> +	select BR2_PACKAGE_GSL
> +	select BR2_PACKAGE_LIBTOOL

This add libtool for the target.
It seems you only need host-libtool so you can remove this line.

> +	help
> +	  dieharder is a fairly involved random number/uniform deviate
> +	  generator tester. It is thus suitable for use in testing both
> +	  software RNG's and hardware RNG's.
> +
> +	  http://www.phy.duke.edu/~rgb/General/dieharder.php
> diff --git a/package/dieharder/dieharder.hash b/package/dieharder/dieharder.hash
> new file mode 100644
> index 0000000..8a44513
> --- /dev/null
> +++ b/package/dieharder/dieharder.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f dieharder-3.31.1.tgz
> +
> diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
> new file mode 100644
> index 0000000..cc1a359
> --- /dev/null
> +++ b/package/dieharder/dieharder.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# dieharder
> +#
> +################################################################################
> +
> +DIEHARDER_VERSION = 3.31.1
> +DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder

I'm a bit worried about the maintenance of this tool, this version was released
the 14-Oct-2011. But ok since it still build with gcc6 :)

> +DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
> +DIEHARDER_STRIP_COMPONENTS = 2
> +DIEHARDER_LICENSE = GPLv2 with beverage clause
> +DIEHARDER_LICENSE_FILES = $(DIEHARDER_SUBDIR)/COPYING

DIEHARDER_SUBDIR is not set here, I guess you wanted to use dieharder/COPYING.
Actually there are two COPYING files, one in the root of the source directory
and another one in dieharder/COPYING

Otherwise looks good.

Best regards,
Romain

> +DIEHARDER_DEPENDENCIES = gsl host-libtool
> +
> +# Fix m4 links to points to the ones in staging (provided by libtool hence
> +# the patch dependency).
> +define DIEHARDER_POST_PATCH_FIXUP
> +        for m in $(@D)/m4/*; do \
> +		l=$$(readlink $$m) ;\
> +		rm $$m ;\
> +		ln -s $(HOST_DIR)$$l $$m ;\
> +	done
> +endef
> +DIEHARDER_POST_PATCH_HOOKS += DIEHARDER_POST_PATCH_FIXUP
> +
> +# Ensure the libtool version is updated,
> +# also make _CONF_ENV works instead of _CONF_OPTS for endiannes
> +DIEHARDER_AUTORECONF = YES
> +
> +# fix endiannes detection
> +ifeq ($(BR2_ENDIAN),"BIG")
> +DIEHARDER_CONF_ENV = ac_cv_c_endian=big
> +else
> +DIEHARDER_CONF_ENV = ac_cv_c_endian=little
> +endif
> +
> +# parallel build fail, disable it
> +DIEHARDER_MAKE = $(MAKE1)
> +
> +$(eval $(autotools-package))
> 
