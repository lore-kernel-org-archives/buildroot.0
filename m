From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Nov 2014 11:08:46 +0200
Subject: [Buildroot] [PATCH] mpdecimal: disable static build
Message-ID: <235ca63e3c273ed4feb8d39cfbb5c05b1fe50d0f.1416733726.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpdecimal always tries to build its shared library.

Fixes:
http://autobuild.buildroot.net/results/276/2764bd8c42ba659682760ffc6afa933b7530d06c/
http://autobuild.buildroot.net/results/3cc/3cca0aacc4d66c49b21d23681813abea5a1b32e0/
http://autobuild.buildroot.net/results/207/20783d1448464d957862e1c70585844f86aed237/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mpdecimal/Config.in | 4 ++++
 package/python3/Config.in   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/mpdecimal/Config.in b/package/mpdecimal/Config.in
index 929d41514399..2aae520c15d9 100644
--- a/package/mpdecimal/Config.in
+++ b/package/mpdecimal/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MPDECIMAL
 	bool "mpdecimal"
 	help
+	depends on !BR2_PREFER_STATIC_LIB
 	  mpdecimal is a package for correctly-rounded arbitrary
 	  precision decimal floating point arithmetic. Starting from
 	  version 2.4, mpdecimal includes only the libmpdec
@@ -8,3 +9,6 @@ config BR2_PACKAGE_MPDECIMAL
 	  exclusively on libmpdec.
 
 	  http://www.bytereef.org/mpdecimal/
+
+comment "mpdecimal needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 375390fcf69d..afcb74229474 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -57,10 +57,14 @@ config BR2_PACKAGE_PYTHON3_CURSES
 
 config BR2_PACKAGE_PYTHON3_DECIMAL
 	select BR2_PACKAGE_MPDECIMAL
+	depends on !BR2_PREFER_STATIC_LIB # mpdecimal
 	bool "decimal module"
 	help
 	  decimal module for Python3.
 
+comment "decimal module needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_EXPAT
 	bool "pyexpat"
-- 
2.1.3
