From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 19:06:46 +0200
Subject: [Buildroot] [git commit] dieharder: new package
Message-ID: <20170401170708.3297E8254B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fdfadda630ec597ccdc38c46fc48f011acb9b30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - remove complicated DIEHARDER_POST_PATCH_FIXUP that replaces bogus
   libtool .m4 files: since we are anyway autoreconfiguring the
   package, this is not necessary. And therefore, remove host-libtool
   in the dependencies.
 - use GPL-2.0 instead of GPLv2
 - add entry in DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 ...includedir-as-include-search-path-for-bui.patch | 62 ++++++++++++++++++++++
 .../dieharder/0002-Fix-missing-type-intptr_t.patch | 27 ++++++++++
 ...U_SOURCE-for-uint-and-M_PI-with-musl-libc.patch | 28 ++++++++++
 package/dieharder/Config.in                        |  9 ++++
 package/dieharder/dieharder.hash                   |  2 +
 package/dieharder/dieharder.mk                     | 35 ++++++++++++
 8 files changed, 167 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7b5df72..01d3c0e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -907,6 +907,9 @@ F:	package/qt5/
 N:	Julien Floret <julien.floret@6wind.com>
 F:	package/lldpd/
 
+N:	Julien Viard de Galbert <julien@vdg.name>
+F:	package/dieharder/
+
 N:	Justin Maggard <jmaggard@netgear.com>
 F:	package/dtach/
 
diff --git a/package/Config.in b/package/Config.in
index 12fb1a0..2a6418f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -73,6 +73,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/dhrystone/Config.in"
+	source "package/dieharder/Config.in"
 	source "package/dmalloc/Config.in"
 	source "package/dropwatch/Config.in"
 	source "package/dstat/Config.in"
diff --git a/package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch b/package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch
new file mode 100644
index 0000000..b475e5c
--- /dev/null
+++ b/package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch
@@ -0,0 +1,62 @@
+From fbc9b7c3b83a99ac996c0a268487d1f800630328 Mon Sep 17 00:00:00 2001
+From: Julien Viard de Galbert <julien@vdg.name>
+Date: Wed, 8 Feb 2017 21:26:58 +0100
+Subject: [PATCH] Do not use includedir as include search path for build
+
+--includedir is not used to specify where a program should
+look for headers of libraries, but to tell where it should
+install its own headers.
+
+Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
+---
+ configure.ac             | 6 +++---
+ dieharder/Makefile.am    | 2 +-
+ libdieharder/Makefile.am | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b336115..91f7c64 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -96,9 +96,9 @@ AC_TYPE_SIZE_T
+ AC_C_VOLATILE
+ AC_C_INLINE
+ 
+-DIEHARDER_CFLAGS="-I$includedir"
+-dieharder_CFLAGS="-std=c99 -Wall -pedantic -I$includedir"
+-libdieharder_lo_CFLAGS="-Wall -pedantic -I$includedir"
++DIEHARDER_CFLAGS=""
++dieharder_CFLAGS="-std=c99 -Wall -pedantic"
++libdieharder_lo_CFLAGS="-Wall -pedantic"
+ DIEHARDER_LIBS="-L$libdir -ldieharder"
+ ACLOCAL_AMFLAGS="-I m4"
+ 
+diff --git a/dieharder/Makefile.am b/dieharder/Makefile.am
+index e6fbff2..7bdac5c 100644
+--- a/dieharder/Makefile.am
++++ b/dieharder/Makefile.am
+@@ -64,7 +64,7 @@ DEFINES = -DVERSION=$(VERSION)
+ # CC = gcc
+ 
+ # Compile flags (use fairly standard -O3 as default)
+-AM_CPPFLAGS = -I ${top_srcdir}/include $(DEFINES) -I ${includedir}
++AM_CPPFLAGS = -I ${top_srcdir}/include $(DEFINES)
+ AM_CFLAGS = -O3
+ 
+ # Load flags (optional)
+diff --git a/libdieharder/Makefile.am b/libdieharder/Makefile.am
+index 5fd3396..0873f9c 100644
+--- a/libdieharder/Makefile.am
++++ b/libdieharder/Makefile.am
+@@ -114,7 +114,7 @@ DEFINES = -DVERSION=$(VERSION) -DLITTLE_ENDIAN=$(LITTLE_ENDIAN)
+ # CC = gcc
+ 
+ # Compile flags (use fairly standard -O3 as default)
+-AM_CPPFLAGS = $(DEFINES) -I ${top_srcdir}/include -I ${includedir}
++AM_CPPFLAGS = $(DEFINES) -I ${top_srcdir}/include
+ AM_CFLAGS = -O3 -Wall -pedantic -Wno-unused-variable 
+ 
+ #========================================================================
+-- 
+2.1.4
+
diff --git a/package/dieharder/0002-Fix-missing-type-intptr_t.patch b/package/dieharder/0002-Fix-missing-type-intptr_t.patch
new file mode 100644
index 0000000..12ea5e7
--- /dev/null
+++ b/package/dieharder/0002-Fix-missing-type-intptr_t.patch
@@ -0,0 +1,27 @@
+From 6f550841943f19612af064b3d3a1db134078e03c Mon Sep 17 00:00:00 2001
+From: Julien Viard de Galbert <julien@vdg.name>
+Date: Sat, 14 Jan 2017 14:18:10 +0100
+Subject: [PATCH] Fix missing type intptr_t
+
+With glibc-2.23 unistd.h need intptr_t when __USE_MISC is defined.
+
+Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
+---
+ include/dieharder/libdieharder.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/dieharder/libdieharder.h b/include/dieharder/libdieharder.h
+index 2138ebf..d98b758 100644
+--- a/include/dieharder/libdieharder.h
++++ b/include/dieharder/libdieharder.h
+@@ -17,6 +17,7 @@
+ 
+ /* This turns on uint macro in c99 */
+ #define __USE_MISC 1
++#include <stdint.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+-- 
+2.1.4
+
diff --git a/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch b/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
new file mode 100644
index 0000000..d71cd57
--- /dev/null
+++ b/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
@@ -0,0 +1,28 @@
+From 526510a27ef47a16699dd34a2373ad9b6bb5e8f3 Mon Sep 17 00:00:00 2001
+From: Julien Viard de Galbert <julien@vdg.name>
+Date: Sat, 14 Jan 2017 14:19:47 +0100
+Subject: [PATCH] Add _GNU_SOURCE for uint and M_PI with musl libc
+
+When building with musl libc _GNU_SOURCE need to be defined
+to provide uint type and M_PI macro
+
+Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
+---
+ include/dieharder/libdieharder.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/dieharder/libdieharder.h b/include/dieharder/libdieharder.h
+index d98b758..c1a5023 100644
+--- a/include/dieharder/libdieharder.h
++++ b/include/dieharder/libdieharder.h
+@@ -17,6 +17,7 @@
+ 
+ /* This turns on uint macro in c99 */
+ #define __USE_MISC 1
++#define _GNU_SOURCE 1
+ #include <stdint.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+-- 
+2.1.4
+
diff --git a/package/dieharder/Config.in b/package/dieharder/Config.in
new file mode 100644
index 0000000..e7a9f54
--- /dev/null
+++ b/package/dieharder/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DIEHARDER
+	bool "dieharder"
+	select BR2_PACKAGE_GSL
+	help
+	  dieharder is a fairly involved random number/uniform deviate
+	  generator tester. It is thus suitable for use in testing
+	  both software RNG's and hardware RNG's.
+
+	  http://www.phy.duke.edu/~rgb/General/dieharder.php
diff --git a/package/dieharder/dieharder.hash b/package/dieharder/dieharder.hash
new file mode 100644
index 0000000..eefe4b7
--- /dev/null
+++ b/package/dieharder/dieharder.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f dieharder-3.31.1.tgz
diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
new file mode 100644
index 0000000..05ca253
--- /dev/null
+++ b/package/dieharder/dieharder.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# dieharder
+#
+################################################################################
+
+DIEHARDER_VERSION = 3.31.1
+DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder
+DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
+DIEHARDER_STRIP_COMPONENTS = 2
+DIEHARDER_LICENSE = GPL-2.0 with beverage clause
+DIEHARDER_LICENSE_FILES = COPYING
+DIEHARDER_DEPENDENCIES = gsl
+
+# The original configure does not use variables provided in the
+# environment so _CONF_ENV does not work. (_CONF_OPTS does).
+#
+# In addition, the m4/*.m4 files are symlinks to /usr/share, which
+# clearly doesn't work, so doing an autoreconf replaces them.
+#
+# Finally, we patch configure.ac and some Makefile.am so we need to
+# autoreconf anyway
+DIEHARDER_AUTORECONF = YES
+
+# fix endianness detection
+ifeq ($(BR2_ENDIAN),"BIG")
+DIEHARDER_CONF_ENV = ac_cv_c_endian=big
+else
+DIEHARDER_CONF_ENV = ac_cv_c_endian=little
+endif
+
+# parallel build fail, disable it
+DIEHARDER_MAKE = $(MAKE1)
+
+$(eval $(autotools-package))
