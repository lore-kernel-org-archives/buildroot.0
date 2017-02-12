From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 12 Feb 2017 14:33:20 +0100
Subject: [Buildroot] [PATCH v7 1/2] dieharder: new package
In-Reply-To: <1486589873-29117-1-git-send-email-julien@vdg.name>
References: <1486589873-29117-1-git-send-email-julien@vdg.name>
Message-ID: <1a9e73e3-0a81-a85f-92ac-4c020c4505d4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien, All,

Le 08/02/2017 ? 22:37, Julien Viard de Galbert a ?crit :
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
> Changes v6 -> v7
>   - reword comments to try to better explain what's going on
>   - drop patch to not install includes
>   - refresh patches
>   - separated patch to DEVELOPERS
> Changes v5 -> v6
>   - regenerated patched with git format-patch -N
>   - fix dieharder.hash:3: empty line at end of file
>   - fix dieharder.mk:18: expected indent with tabs
> Changes v4 -> v5 (Following Romain's comments)
>   - added comments and signoff to patches
>   - removed select BR2_PACKAGE_LIBTOOL as target libtool is not needed
>   - fixed _LICENSE_FILES path
>   - adding myself to DEVELOPERS for the dieharder package
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

I think it's ok to merge it, no build issue has been reported by the newly
introduced test-pkg script for all toolchain :)

./support/scripts/test-pkg -d test-pkg/ -p dieharder -c defconfig

Also, no issue with the coding style (check-package script net yet in master or
next branch).

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/Config.in                                  |  1 +
>  ...includedir-as-include-search-path-for-bui.patch | 62 ++++++++++++++++++++++
>  .../dieharder/0002-Fix-missing-type-intptr_t.patch | 27 ++++++++++
>  ...U_SOURCE-for-uint-and-M_PI-with-musl-libc.patch | 28 ++++++++++
>  package/dieharder/Config.in                        |  9 ++++
>  package/dieharder/dieharder.hash                   |  2 +
>  package/dieharder/dieharder.mk                     | 47 ++++++++++++++++
>  7 files changed, 176 insertions(+)
>  create mode 100644 package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch
>  create mode 100644 package/dieharder/0002-Fix-missing-type-intptr_t.patch
>  create mode 100644 package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
>  create mode 100644 package/dieharder/Config.in
>  create mode 100644 package/dieharder/dieharder.hash
>  create mode 100644 package/dieharder/dieharder.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 114a5ad..2b09f04 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -73,6 +73,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/bonnie/Config.in"
>  	source "package/cache-calibrator/Config.in"
>  	source "package/dhrystone/Config.in"
> +	source "package/dieharder/Config.in"
>  	source "package/dmalloc/Config.in"
>  	source "package/dropwatch/Config.in"
>  	source "package/dstat/Config.in"
> diff --git a/package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch b/package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch
> new file mode 100644
> index 0000000..b475e5c
> --- /dev/null
> +++ b/package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch
> @@ -0,0 +1,62 @@
> +From fbc9b7c3b83a99ac996c0a268487d1f800630328 Mon Sep 17 00:00:00 2001
> +From: Julien Viard de Galbert <julien@vdg.name>
> +Date: Wed, 8 Feb 2017 21:26:58 +0100
> +Subject: [PATCH] Do not use includedir as include search path for build
> +
> +--includedir is not used to specify where a program should
> +look for headers of libraries, but to tell where it should
> +install its own headers.
> +
> +Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
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
> diff --git a/package/dieharder/0002-Fix-missing-type-intptr_t.patch b/package/dieharder/0002-Fix-missing-type-intptr_t.patch
> new file mode 100644
> index 0000000..12ea5e7
> --- /dev/null
> +++ b/package/dieharder/0002-Fix-missing-type-intptr_t.patch
> @@ -0,0 +1,27 @@
> +From 6f550841943f19612af064b3d3a1db134078e03c Mon Sep 17 00:00:00 2001
> +From: Julien Viard de Galbert <julien@vdg.name>
> +Date: Sat, 14 Jan 2017 14:18:10 +0100
> +Subject: [PATCH] Fix missing type intptr_t
> +
> +With glibc-2.23 unistd.h need intptr_t when __USE_MISC is defined.
> +
> +Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
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
> diff --git a/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch b/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
> new file mode 100644
> index 0000000..d71cd57
> --- /dev/null
> +++ b/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
> @@ -0,0 +1,28 @@
> +From 526510a27ef47a16699dd34a2373ad9b6bb5e8f3 Mon Sep 17 00:00:00 2001
> +From: Julien Viard de Galbert <julien@vdg.name>
> +Date: Sat, 14 Jan 2017 14:19:47 +0100
> +Subject: [PATCH] Add _GNU_SOURCE for uint and M_PI with musl libc
> +
> +When building with musl libc _GNU_SOURCE need to be defined
> +to provide uint type and M_PI macro
> +
> +Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
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
> index 0000000..9f442b5
> --- /dev/null
> +++ b/package/dieharder/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_DIEHARDER
> +	bool "dieharder"
> +	select BR2_PACKAGE_GSL
> +	help
> +	  dieharder is a fairly involved random number/uniform deviate
> +	  generator tester. It is thus suitable for use in testing both
> +	  software RNG's and hardware RNG's.
> +
> +	  http://www.phy.duke.edu/~rgb/General/dieharder.php
> diff --git a/package/dieharder/dieharder.hash b/package/dieharder/dieharder.hash
> new file mode 100644
> index 0000000..eefe4b7
> --- /dev/null
> +++ b/package/dieharder/dieharder.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f dieharder-3.31.1.tgz
> diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
> new file mode 100644
> index 0000000..f8b5357
> --- /dev/null
> +++ b/package/dieharder/dieharder.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# dieharder
> +#
> +################################################################################
> +
> +DIEHARDER_VERSION = 3.31.1
> +DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder
> +DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
> +DIEHARDER_STRIP_COMPONENTS = 2
> +DIEHARDER_LICENSE = GPLv2 with beverage clause
> +DIEHARDER_LICENSE_FILES = COPYING
> +DIEHARDER_DEPENDENCIES = gsl host-libtool
> +
> +# The tarball provides libtool m4 files as symbolic links to host
> +# as the host is not required to have libtool, fix the links to
> +# use the one is staging (hence the host-libtool dependency).
> +# Even if we use autoreconf later, the files need to exist for it to run
> +define DIEHARDER_POST_PATCH_FIXUP
> +	for m in $(@D)/m4/*; do \
> +		l=$$(readlink $$m) ;\
> +		rm $$m ;\
> +		ln -s $(HOST_DIR)$$l $$m ;\
> +	done
> +endef
> +DIEHARDER_POST_PATCH_HOOKS += DIEHARDER_POST_PATCH_FIXUP
> +
> +# The original configure does not use variables provided in the environment
> +# so _CONF_ENV does not work. (_CONF_OPTS does).
> +# The libtool version in the tarball (2.2.10) depends on files not provided
> +# (see above) and we are replacing them with current version, this ends up
> +# in a "Version mismatch error".
> +# Using autoreconf regenerate those files and fix the two above listed issues
> +# We patch configure.ac and some Makefile.am so we need to autoreconf anyway
> +DIEHARDER_AUTORECONF = YES
> +
> +# fix endianness detection
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
