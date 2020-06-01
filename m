From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  1 Jun 2020 07:17:41 -0500
Subject: [Buildroot] [NEXT] package/xml-security-c: new package
Message-ID: <20200601121741.47471-1-matthew.weber@rockwellcollins.com>
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
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...0001-Fix-cross-compile-build-failure.patch | 37 +++++++++++++++++++
 package/xml-security-c/Config.in              | 13 +++++++
 package/xml-security-c/xml-security-c.hash    |  4 ++
 package/xml-security-c/xml-security-c.mk      | 17 +++++++++
 6 files changed, 73 insertions(+)
 create mode 100644 package/xml-security-c/0001-Fix-cross-compile-build-failure.patch
 create mode 100644 package/xml-security-c/Config.in
 create mode 100644 package/xml-security-c/xml-security-c.hash
 create mode 100644 package/xml-security-c/xml-security-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9cbe5727a7..eab95f0402 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1683,6 +1683,7 @@ F:	package/valijson/
 F:	package/wpa_supplicant/
 F:	package/wireless_tools/
 F:	package/xen/
+F:	package/xml-security-c/
 F:	support/testing/tests/package/br2-external/openjdk/
 F:	support/testing/tests/package/test_openjdk.py
 F:	support/testing/tests/package/test_opkg/
diff --git a/package/Config.in b/package/Config.in
index d3e9c12784..57eaae8480 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1563,6 +1563,7 @@ menu "JSON/XML"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
 	source "package/xerces/Config.in"
+	source "package/xml-security-c/Config.in"
 	source "package/yajl/Config.in"
 	source "package/yaml-cpp/Config.in"
 endmenu
diff --git a/package/xml-security-c/0001-Fix-cross-compile-build-failure.patch b/package/xml-security-c/0001-Fix-cross-compile-build-failure.patch
new file mode 100644
index 0000000000..6bbfef7a91
--- /dev/null
+++ b/package/xml-security-c/0001-Fix-cross-compile-build-failure.patch
@@ -0,0 +1,37 @@
+From c783fce79895efbad5138666eb18a1b47f5d0db8 Mon Sep 17 00:00:00 2001
+From: Chris Simons <chris.simons@rockwellcollins.com>
+Date: Wed, 13 May 2020 14:12:39 -0500
+Subject: [PATCH] xml-security-c: Fix cross compile build failure.
+
+Fix build for cross compiling.
+
+Signed-off-by: Chris Simons <chris.simons@rockwellcollins.com>
+---
+ configure.ac | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b43d7a58..f701069b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -72,17 +72,6 @@ AC_CHECK_HEADERS([unistd.h direct.h])
+ 
+ AC_CHECK_FUNCS([strcasecmp])
+ 
+-# Check whether getcwd can dynamically allocate memory.
+-AC_MSG_CHECKING([whether getcwd(NULL, 0) works])
+-AC_RUN_IFELSE([AC_LANG_PROGRAM([#include <stdlib.h>
+-     #include <unistd.h>],
+-[char *cwd = getcwd(NULL, 0);
+-return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;])],
+-     [AC_MSG_RESULT(yes)
+-      AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
+-         [Define to 1 if getcwd(NULL, 0) works])],
+-     [AC_MSG_RESULT(no)])
+-
+ AC_LANG(C++)
+ 
+ # Note that the pkg-config macros improperly set pkg_CFLAGS rather
+-- 
+2.17.1
+
diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
new file mode 100644
index 0000000000..91314f9ed6
--- /dev/null
+++ b/package/xml-security-c/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_XML_SECURITY_C
+	bool "xml-security-c"
+	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR # xerces
+	select BR2_PACKAGE_XERCES
+	select BR2_PACKAGE_OPENSSL
+	help
+	  The xml-security-c library is a C++ implementation of
+	  the XML Digital Signature and Encryption specifications.
+
+	  https://santuario.apache.org/cindex.html
+
+comment "xml-security-c needs a toolchain w/ C++, wchar"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/xml-security-c/xml-security-c.hash b/package/xml-security-c/xml-security-c.hash
new file mode 100644
index 0000000000..9a82a55f17
--- /dev/null
+++ b/package/xml-security-c/xml-security-c.hash
@@ -0,0 +1,4 @@
+# From http://www.apache.org/dist/santuario/c-library/xml-security-c-2.0.2.tar.gz.sha256
+sha256  c303a2b08cb9ca0f5594adcbb83829b1e793175d7114a82f7d78def8bb2e30df  xml-security-c-2.0.2.tar.gz
+
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/xml-security-c/xml-security-c.mk b/package/xml-security-c/xml-security-c.mk
new file mode 100644
index 0000000000..21178a95ee
--- /dev/null
+++ b/package/xml-security-c/xml-security-c.mk
@@ -0,0 +1,17 @@
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
+XML_SECURITY_C_DEPENDENCIES = xerces
+XML_SECURITY_C_INSTALL_STAGING = YES
+
+# Patched configure.ac
+XML_SECURITY_C_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.17.1
