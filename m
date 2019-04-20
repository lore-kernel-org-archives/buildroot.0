From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Apr 2019 22:42:51 +0200
Subject: [Buildroot] [PATCH 2/3] package/linknx: bump to version 0.0.1.37
In-Reply-To: <20190420204252.26815-1-fontaine.fabrice@gmail.com>
References: <20190420204252.26815-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420204252.26815-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch, not needed since:
  https://github.com/linknx/linknx/commit/6166831eff645f21a7fd22ec3f7855f36005b8d9
- Needs iconv.h since version 0.0.1.34 and
  https://github.com/linknx/linknx/commit/2cc3a93dcf2703b3b418e0a99975f556354fb1b1
- Add a patch to fix link with libiconv
- Disable cppunit (autodetect by default), added with:
  https://github.com/linknx/linknx/commit/ee2efcde549dda82fdabde4af6d08871689cbb61

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Link-with-libiconv-if-needed.patch   | 30 +++++++++++++
 ...c-suncalc.cpp-fix-build-with-gcc-6.x.patch | 42 -------------------
 package/linknx/Config.in                      |  1 +
 package/linknx/linknx.hash                    |  2 +-
 package/linknx/linknx.mk                      |  8 +++-
 5 files changed, 38 insertions(+), 45 deletions(-)
 create mode 100644 package/linknx/0001-Link-with-libiconv-if-needed.patch
 delete mode 100644 package/linknx/0001-src-suncalc.cpp-fix-build-with-gcc-6.x.patch

diff --git a/package/linknx/0001-Link-with-libiconv-if-needed.patch b/package/linknx/0001-Link-with-libiconv-if-needed.patch
new file mode 100644
index 0000000000..81b1fb7927
--- /dev/null
+++ b/package/linknx/0001-Link-with-libiconv-if-needed.patch
@@ -0,0 +1,30 @@
+From 87373f6c2b48619bb11e566e5eb16ea49d47beb7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 19 Apr 2019 17:07:10 +0200
+Subject: [PATCH] Link with libiconv if needed
+
+Commit 2cc3a93dcf2703b3b418e0a99975f556354fb1b1 added an include to
+iconv which can be provided by libiconv so search and link for it if
+needed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/linknx/linknx/pull/41]
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 22f242c..779fd6f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,6 +15,7 @@ AC_CHECK_HEADER(argp.h,,[AC_MSG_ERROR([argp_parse not found])])
+ AC_SEARCH_LIBS(argp_parse,argp,,[AC_MSG_ERROR([argp_parse not found])])
+ 
+ # Checks for libraries.
++AC_SEARCH_LIBS(libiconv_open,iconv)
+ LIBCURL_CHECK_CONFIG([yes], [7.14.0])
+ 
+ # Checks for header files.
+-- 
+2.20.1
+
diff --git a/package/linknx/0001-src-suncalc.cpp-fix-build-with-gcc-6.x.patch b/package/linknx/0001-src-suncalc.cpp-fix-build-with-gcc-6.x.patch
deleted file mode 100644
index d204a02269..0000000000
--- a/package/linknx/0001-src-suncalc.cpp-fix-build-with-gcc-6.x.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ff52cf04c6fa8b3352544447abf429bfa6000dc8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 20 Aug 2016 12:13:04 +0200
-Subject: [PATCH] src/suncalc.cpp: fix build with gcc 6.x
-
-src/suncalc.cpp currently includes <math.h>, but this causes a build
-failure with gcc 6.x, and <cmath> should be used instead. The build
-failure is:
-
-/home/test/autobuild/run/instance-0/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.1.1/cmath:101:37: error: '__is_integer' was not declared in this scope
-     typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
-                                     ^~~~~~~~~~~~
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/suncalc.cpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/suncalc.cpp b/src/suncalc.cpp
-index ea2366a..b553f96 100644
---- a/src/suncalc.cpp
-+++ b/src/suncalc.cpp
-@@ -22,6 +22,8 @@
-     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- */
- 
-+#include <cmath>
-+
- #include "suncalc.h"
- #include "services.h"
- 
-@@ -44,7 +46,6 @@ Released to the public domain by Paul Schlyter, December 1992
- 
- 
- #include <stdio.h>
--#include <math.h>
- #include <time.h>
- #include <stdlib.h>
- #include <getopt.h>
--- 
-2.7.4
-
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 97fdaff9ce..3b62ce2f95 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LINKNX
 	select BR2_PACKAGE_LIBPTHSEM
 	select BR2_PACKAGE_ARGP_STANDALONE \
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Linknx is an automation platform providing high level
 	  functionalities to EIB/KNX installation.
diff --git a/package/linknx/linknx.hash b/package/linknx/linknx.hash
index 312e43bfd3..79113e6e70 100644
--- a/package/linknx/linknx.hash
+++ b/package/linknx/linknx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 635b8fbd3477fd7d85a95955b93f327cd5a389db80dc18cdae04de19a3a8a972  linknx-0.0.1.33.tar.gz
+sha256 3c3aaf8c409538153b15f5fb975a4485e58c4820cfea289a3f20777ba69782ab  linknx-0.0.1.37.tar.gz
 sha256 c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad  LICENSE
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 5801eb5f87..e593feda36 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -4,19 +4,23 @@
 #
 ################################################################################
 
-LINKNX_VERSION = 0.0.1.33
+LINKNX_VERSION = 0.0.1.37
 LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
 LINKNX_LICENSE = GPL-2.0+
 LINKNX_LICENSE_FILES = LICENSE
 LINKNX_INSTALL_STAGING = YES
+# We're patching configure.ac
+LINKNX_AUTORECONF = YES
 LINKNX_CONF_OPTS = \
+	--without-cppunit \
 	--without-log4cpp \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr \
 	--disable-smtp
 
 LINKNX_DEPENDENCIES = libpthsem \
-	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
+	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LINKNX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
-- 
2.20.1
