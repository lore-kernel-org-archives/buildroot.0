From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Apr 2021 11:23:47 -0500
Subject: [Buildroot] [PATCH v3] package/xml-security-c: new package
Message-ID: <20210412162347.15021-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Chris Simons <chris.simons@rockwellcollins.com>

Adds support for the Apache Santuario XML Security for C++ that
implementations the XML Digital Signature and Encryption
specifications.

Signed-off-by: Chris Simons <chris.simons@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
--
Changes
v2 -> v3
[Thomas P
 - Worked around Xerces_autoconf_config.hpp: error: ?char16_t? does not name a type
   by disabling code sourcery toolchains
   (ISO C++ forbids declaration - requires ISO C++ 2011 (code sourcery is GCC 4.8)
v1 -> v2
[Thomas P
 - Added build time dependency on openssl as it is needed (test build
   lucked out that openssl was already built)
 - Added autoconf cached value for getcmd test and upstreamed
 - Made Config.in dependency style updates
---
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...ariable-cache-option-for-getcwd-test.patch | 50 +++++++++++++++++++
 package/xml-security-c/Config.in              | 16 ++++++
 package/xml-security-c/xml-security-c.hash    |  3 ++
 package/xml-security-c/xml-security-c.mk      | 19 +++++++
 6 files changed, 90 insertions(+)
 create mode 100644 package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch
 create mode 100644 package/xml-security-c/Config.in
 create mode 100644 package/xml-security-c/xml-security-c.hash
 create mode 100644 package/xml-security-c/xml-security-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 42758df3b1..5c36fc413e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1813,6 +1813,7 @@ F:	package/valijson/
 F:	package/wpa_supplicant/
 F:	package/wireless_tools/
 F:	package/xen/
+F:	package/xml-security-c/
 F:	support/testing/tests/package/br2-external/openjdk/
 F:	support/testing/tests/package/test_openjdk.py
 F:	support/testing/tests/package/test_opkg/
diff --git a/package/Config.in b/package/Config.in
index 86b4cffc3e..f47ee9f1c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1657,6 +1657,7 @@ menu "JSON/XML"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
 	source "package/xerces/Config.in"
+	source "package/xml-security-c/Config.in"
 	source "package/yajl/Config.in"
 	source "package/yaml-cpp/Config.in"
 endmenu
diff --git a/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch b/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch
new file mode 100644
index 0000000000..26b53ba719
--- /dev/null
+++ b/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch
@@ -0,0 +1,50 @@
+From 9d14fad412a497fe83cfc6ab594ddc612512f02a Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 4 Jun 2020 20:34:11 -0500
+Subject: [PATCH] autoconf variable cache option for getcwd test
+
+The cached variable allows cross compiled builds to successfully set the
+desired default for this value without invoking a test.
+
+Fixes:
+https://issues.apache.org/jira/browse/SANTUARIO-549
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ configure.ac | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b43d7a5..c3d4489 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -74,14 +74,18 @@ AC_CHECK_FUNCS([strcasecmp])
+ 
+ # Check whether getcwd can dynamically allocate memory.
+ AC_MSG_CHECKING([whether getcwd(NULL, 0) works])
+-AC_RUN_IFELSE([AC_LANG_PROGRAM([#include <stdlib.h>
+-     #include <unistd.h>],
+-[char *cwd = getcwd(NULL, 0);
+-return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;])],
+-     [AC_MSG_RESULT(yes)
+-      AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
+-         [Define to 1 if getcwd(NULL, 0) works])],
+-     [AC_MSG_RESULT(no)])
++AC_CACHE_VAL([xml_cv_func_getcwd_null],
++[AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <stdlib.h>
++     #include <unistd.h>
++     char *cwd = getcwd(NULL, 0);
++     return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;]])],
++  [xml_cv_func_getcwd_null=yes],
++  [xml_cv_func_getcwd_null=no])])
++AC_MSG_RESULT([$xml_cv_func_getcwd_null])
++if test $xml_cv_func_getcwd_null = yes; then
++AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
++  [Define to 1 if getcwd(NULL, 0) works])
++fi
+ 
+ AC_LANG(C++)
+ 
+-- 
+2.17.1
+
diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
new file mode 100644
index 0000000000..f761c29ed9
--- /dev/null
+++ b/package/xml-security-c/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_XML_SECURITY_C
+	bool "xml-security-c"
+	depends on BR2_INSTALL_LIBSTDCPP # xerces
+	depends on BR2_USE_WCHAR # xerces
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
+	select BR2_PACKAGE_XERCES
+	select BR2_PACKAGE_OPENSSL
+	help
+	  The xml-security-c library is a C++ implementation of
+	  the XML Digital Signature and Encryption specifications.
+
+	  https://santuario.apache.org/cindex.html
+
+comment "xml-security-c needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+	!BR2_USE_WCHAR
diff --git a/package/xml-security-c/xml-security-c.hash b/package/xml-security-c/xml-security-c.hash
new file mode 100644
index 0000000000..d91ed86e9c
--- /dev/null
+++ b/package/xml-security-c/xml-security-c.hash
@@ -0,0 +1,3 @@
+# From http://www.apache.org/dist/santuario/c-library/xml-security-c-2.0.2.tar.gz.sha256
+sha256  c303a2b08cb9ca0f5594adcbb83829b1e793175d7114a82f7d78def8bb2e30df  xml-security-c-2.0.2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/xml-security-c/xml-security-c.mk b/package/xml-security-c/xml-security-c.mk
new file mode 100644
index 0000000000..36f69483c2
--- /dev/null
+++ b/package/xml-security-c/xml-security-c.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# xml-security-c
+#
+################################################################################
+
+XML_SECURITY_C_VERSION = 2.0.2
+XML_SECURITY_C_SITE = http://archive.apache.org/dist/santuario/c-library
+XML_SECURITY_C_LICENSE = Apache-2.0
+XML_SECURITY_C_LICENSE_FILES = LICENSE.txt
+XML_SECURITY_C_DEPENDENCIES = openssl xerces
+XML_SECURITY_C_INSTALL_STAGING = YES
+
+XML_SECURITY_C_CONF_ENV = xml_cv_func_getcwd_null=yes
+
+# Patched configure.ac
+XML_SECURITY_C_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.17.1
