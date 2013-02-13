From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Wed, 13 Feb 2013 10:20:33 +0100
Subject: [Buildroot] [PATCH v3 1/5] Python menu reorganization
In-Reply-To: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360747237-30048-2-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to have a better support for python external package make the python
menu clearer. Python2 and Python3 are now mutually exclusive

Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/Config.in               |    3 ++-
 package/python-common/Config.in |   35 +++++++++++++++++++++++++++++++++++
 package/python/Config.in        |   14 --------------
 package/python3/Config.in       |   14 --------------
 4 files changed, 37 insertions(+), 29 deletions(-)
 create mode 100644 package/python-common/Config.in

diff --git a/package/Config.in b/package/Config.in
index 2fad94d..5f2c1bd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -315,9 +315,10 @@ endmenu
 endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
+source "package/python-common/Config.in"
 source "package/python/Config.in"
 source "package/python3/Config.in"
-if BR2_PACKAGE_PYTHON
+if (BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
 menu "external python modules"
 source "package/python-bottle/Config.in"
 source "package/python-dpkt/Config.in"
diff --git a/package/python-common/Config.in b/package/python-common/Config.in
new file mode 100644
index 0000000..6523c21
--- /dev/null
+++ b/package/python-common/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_PYTHON_COMMON
+	bool "Python"
+	depends on BR2_USE_WCHAR
+	# uses fork()
+	depends on BR2_USE_MMU
+	help
+	  The python language interpreter.
+
+	  http://www.python.org/
+
+comment "python3 requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
+choice
+	depends on BR2_PACKAGE_PYTHON_COMMON
+	prompt "Python interpreter"
+	help
+	  Select which version of Python you would like to use.
+
+config BR2_PACKAGE_PYTHON
+	bool "python2"
+	select BR2_PACKAGE_LIBFFI
+	help
+	  Use Python 2.x 
+
+
+config BR2_PACKAGE_PYTHON3
+	bool "python3"
+	# uses fork()
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBFFI
+	help
+	  Use Python 3.x 
+
+endchoice
diff --git a/package/python/Config.in b/package/python/Config.in
index 4089cce..b4fd6c2 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,17 +1,3 @@
-config BR2_PACKAGE_PYTHON
-	bool "python"
-	depends on BR2_USE_WCHAR
-	# uses fork()
-	depends on BR2_USE_MMU
-	select BR2_PACKAGE_LIBFFI
-	help
-	  The python language interpreter.
-
-	  http://www.python.org/
-
-comment "python requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
-
 if BR2_PACKAGE_PYTHON
 
 choice
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 5959d31..279f31b 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -1,17 +1,3 @@
-config BR2_PACKAGE_PYTHON3
-	bool "python3"
-	depends on BR2_USE_WCHAR
-	# uses fork()
-	depends on BR2_USE_MMU
-	select BR2_PACKAGE_LIBFFI
-	help
-	  The python language interpreter.
-
-	  http://www.python.org/
-
-comment "python3 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
-
 if BR2_PACKAGE_PYTHON3
 
 choice
-- 
1.7.9.5
