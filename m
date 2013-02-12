From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Tue, 12 Feb 2013 13:24:05 +0100
Subject: [Buildroot] [PATCH 1/5] In order to have a better support for
	python external package make the python menu clearer. Python2
	and Python3 are now mutually exclusive
In-Reply-To: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
References: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360671849-7621-2-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/Config.in                |   19 +------------
 package/python-generic/Config.in |   56 ++++++++++++++++++++++++++++++++++++++
 package/python/Config.in         |   14 ----------
 package/python3/Config.in        |   14 ----------
 4 files changed, 57 insertions(+), 46 deletions(-)
 create mode 100644 package/python-generic/Config.in

diff --git a/package/Config.in b/package/Config.in
index 2fad94d..b7da22f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -315,24 +315,7 @@ endmenu
 endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
-source "package/python/Config.in"
-source "package/python3/Config.in"
-if BR2_PACKAGE_PYTHON
-menu "external python modules"
-source "package/python-bottle/Config.in"
-source "package/python-dpkt/Config.in"
-source "package/python-id3/Config.in"
-source "package/python-mad/Config.in"
-source "package/python-meld3/Config.in"
-source "package/python-netifaces/Config.in"
-source "package/python-nfc/Config.in"
-source "package/python-protobuf/Config.in"
-source "package/python-pygame/Config.in"
-source "package/python-pyparsing/Config.in"
-source "package/python-serial/Config.in"
-source "package/python-setuptools/Config.in"
-endmenu
-endif
+source "package/python-generic/Config.in"
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
diff --git a/package/python-generic/Config.in b/package/python-generic/Config.in
new file mode 100644
index 0000000..4acd79b
--- /dev/null
+++ b/package/python-generic/Config.in
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_PYTHON_GENERIC
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
+	depends on BR2_PACKAGE_PYTHON_GENERIC
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
+
+source "package/python/Config.in"
+source "package/python3/Config.in"
+
+if (BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
+menu "external python modules"
+source "package/python-bottle/Config.in"
+source "package/python-dpkt/Config.in"
+source "package/python-id3/Config.in"
+source "package/python-mad/Config.in"
+source "package/python-meld3/Config.in"
+source "package/python-netifaces/Config.in"
+source "package/python-nfc/Config.in"
+source "package/python-protobuf/Config.in"
+source "package/python-pygame/Config.in"
+source "package/python-pyparsing/Config.in"
+source "package/python-serial/Config.in"
+source "package/python-setuptools/Config.in"
+endmenu
+endif
+
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
1.7.10.4
