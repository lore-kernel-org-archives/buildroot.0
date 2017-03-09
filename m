From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:35:23 +0100
Subject: [Buildroot] [git commit] python: make hashlib and readline modules
	really optional
Message-ID: <20170309213619.868C57F969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc3e1fb22ef641916938fff76bef10a1347ef0f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_PYTHON_{READLINE,HASHLIB} options were so far only
bringing in the necessary dependencies, relying on the Python build
system to automatically detect them.

However, this means that even if one of those option was disabled, if
their dependency was found, Python would build the corresponding module,
which is really not what the user would expect.

For example, if you have:

   BR2_PACKAGE_READLINE=y
   # BR2_PACKAGE_PYTHON_READLINE is not set

Then you would still get the readline Python module built and installed.

This commit fixes that by adding new --{enable,disable} options, and use
them in python.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Add-option-to-disable-the-hashlib-module.patch | 30 ++++++++++++++++++++++
 ...-Add-an-option-to-disable-readline-module.patch | 30 ++++++++++++++++++++++
 package/python/python.mk                           |  4 +++
 3 files changed, 64 insertions(+)

diff --git a/package/python/0032-Add-option-to-disable-the-hashlib-module.patch b/package/python/0032-Add-option-to-disable-the-hashlib-module.patch
new file mode 100644
index 0000000..bb3ccfa
--- /dev/null
+++ b/package/python/0032-Add-option-to-disable-the-hashlib-module.patch
@@ -0,0 +1,30 @@
+From f11dc326ae216911a67bd563b619f39522c14bf2 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 7 Mar 2017 22:33:02 +0100
+Subject: [PATCH] Add option to disable the hashlib module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8dc573e..854724d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2840,6 +2840,12 @@ AC_ARG_ENABLE(ssl,
+     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
+   	  fi])
+ 
++AC_ARG_ENABLE(hashlib,
++	AS_HELP_STRING([--disable-hashlib], [disable hashlib]),
++	[ if test "$enableval" = "no"; then
++	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _hashlib"
++	  fi])
++
+ AC_ARG_ENABLE(bz2,
+        AS_HELP_STRING([--disable-bz2], [disable BZIP2]),
+        [ if test "$enableval" = "no"; then
+-- 
+2.7.4
+
diff --git a/package/python/0033-Add-an-option-to-disable-readline-module.patch b/package/python/0033-Add-an-option-to-disable-readline-module.patch
new file mode 100644
index 0000000..ade729f
--- /dev/null
+++ b/package/python/0033-Add-an-option-to-disable-readline-module.patch
@@ -0,0 +1,30 @@
+From 6b461f698bd33b3493207baf79f4ee02286be8e8 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 7 Mar 2017 22:33:55 +0100
+Subject: [PATCH] Add an option to disable readline module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 854724d..0a06497 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2846,6 +2846,12 @@ AC_ARG_ENABLE(hashlib,
+ 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _hashlib"
+ 	  fi])
+ 
++AC_ARG_ENABLE(readline,
++	AS_HELP_STRING([--disable-readline], [disable readline]),
++	[ if test "$enableval" = "no"; then
++	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
++	  fi])
++
+ AC_ARG_ENABLE(bz2,
+        AS_HELP_STRING([--disable-bz2], [disable BZIP2]),
+        [ if test "$enableval" = "no"; then
+-- 
+2.7.4
+
diff --git a/package/python/python.mk b/package/python/python.mk
index 281130c..7541e0b 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -62,6 +62,8 @@ PYTHON_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
 PYTHON_DEPENDENCIES += readline
+else
+PYTHON_CONF_OPTS += --disable-readline
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_CURSES),y)
@@ -125,6 +127,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
 PYTHON_DEPENDENCIES += openssl
+else
+PYTHON_CONF_OPTS += --disable-hashlib
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_OSSAUDIODEV),y)
