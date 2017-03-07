From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Mar 2017 00:00:31 +0100
Subject: [Buildroot] [PATCH 6/6] python3: make readline, gzip,
	bzip2 and xz really optional
In-Reply-To: <1488927631-21945-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488927631-21945-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1488927631-21945-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_PACKAGE_PYTHON3_{READLINE,ZLIB,BZIP2,XZ} options were so far
only bringing in the necessary dependencies, relying on the Python
build system to automatically detect them.

However, this means that even if one of those option was disabled, if
their dependency was found, Python would build the corresponding module,
which is really not what the user would expect.

For example, if you have:

  BR2_PACKAGE_READLINE=y
  # BR2_PACKAGE_PYTHON3_READLINE is not set

Then you would still get the readline Python module built and installed.

This commit fixes that by adding new --{enable,disable} options, and use
them in python3.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-an-option-to-disable-the-readline-module.patch | 30 ++++++++++++++++
 ...ions-to-disable-zlib-bzip2-and-xz-modules.patch | 42 ++++++++++++++++++++++
 package/python3/python3.mk                         |  8 +++++
 3 files changed, 80 insertions(+)
 create mode 100644 package/python3/0032-Add-an-option-to-disable-the-readline-module.patch
 create mode 100644 package/python3/0033-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch

diff --git a/package/python3/0032-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0032-Add-an-option-to-disable-the-readline-module.patch
new file mode 100644
index 0000000..4d205ca
--- /dev/null
+++ b/package/python3/0032-Add-an-option-to-disable-the-readline-module.patch
@@ -0,0 +1,30 @@
+From c01d039d96909a6f4df6fff5f6e7ffe7e3f1e7b2 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 7 Mar 2017 23:29:05 +0100
+Subject: [PATCH] Add an option to disable the readline module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 65c0ce0..c274e13 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3033,6 +3033,12 @@ AC_ARG_ENABLE(openssl,
+ 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
+ 	  fi])
+ 
++AC_ARG_ENABLE(readline,
++	AS_HELP_STRING([--disable-readline], [disable readline]),
++	[ if test "$enableval" = "no"; then
++	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
++	  fi])
++
+ AC_SUBST(TK)
+ AC_ARG_ENABLE(tk,
+ 	AS_HELP_STRING([--disable-tk], [disable tk]),
+-- 
+2.7.4
+
diff --git a/package/python3/0033-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0033-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
new file mode 100644
index 0000000..a641a96
--- /dev/null
+++ b/package/python3/0033-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -0,0 +1,42 @@
+From 69a5a3b7a0307476772943da70162dfe716c674f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 7 Mar 2017 23:31:11 +0100
+Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c274e13..fac9c57 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3039,6 +3039,24 @@ AC_ARG_ENABLE(readline,
+ 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
+ 	  fi])
+ 
++AC_ARG_ENABLE(bzip2,
++	AS_HELP_STRING([--disable-bzip2], [disable bzip2]),
++	[ if test "$enableval" = "no"; then
++	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _bz2"
++	  fi])
++
++AC_ARG_ENABLE(zlib,
++	AS_HELP_STRING([--disable-zlib], [disable zlib]),
++	[ if test "$enableval" = "no"; then
++	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} zlib"
++	  fi])
++
++AC_ARG_ENABLE(xz,
++	AS_HELP_STRING([--disable-xz], [disable xz]),
++	[ if test "$enableval" = "no"; then
++	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _lzma"
++	  fi])
++
+ AC_SUBST(TK)
+ AC_ARG_ENABLE(tk,
+ 	AS_HELP_STRING([--disable-tk], [disable tk]),
+-- 
+2.7.4
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4ca049c..c8f8e1b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -56,6 +56,8 @@ PYTHON3_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
 PYTHON3_DEPENDENCIES += readline
+else
+PYTHON3_CONF_OPTS += --disable-readline
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_CURSES),y)
@@ -104,14 +106,20 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
+else
+PYTHON3_CONF_OPTS += --disable-bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_XZ),y)
 PYTHON3_DEPENDENCIES += xz
+else
+PYTHON3_CONF_OPTS += --disable-xz
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
 PYTHON3_DEPENDENCIES += zlib
+else
+PYTHON3_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-- 
2.7.4
