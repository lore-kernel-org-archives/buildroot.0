From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 18:36:02 +0100
Subject: [Buildroot] [PATCH 4/5] radvd: switch to new patch naming
	convention, use Git formatted patches
In-Reply-To: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416764163-12826-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit renames the radvd patches to follow the new naming
convention, and reformats them to be Git patches.

Since the patches are renamed, we adjust the comment in the .mk file
explaining why we autoreconf the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-check-requirement-we-don-t-do-unit-tests.patch | 29 ++++++++++++++++++++++
 ...-fstack-protector-the-toolchain-might-lac.patch | 27 ++++++++++++++++++++
 package/radvd/radvd-01-drop-check.patch            | 18 --------------
 package/radvd/radvd-02-drop-stack-protector.patch  | 15 -----------
 package/radvd/radvd.mk                             |  2 +-
 5 files changed, 57 insertions(+), 34 deletions(-)
 create mode 100644 package/radvd/0001-Drop-check-requirement-we-don-t-do-unit-tests.patch
 create mode 100644 package/radvd/0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
 delete mode 100644 package/radvd/radvd-01-drop-check.patch
 delete mode 100644 package/radvd/radvd-02-drop-stack-protector.patch

diff --git a/package/radvd/0001-Drop-check-requirement-we-don-t-do-unit-tests.patch b/package/radvd/0001-Drop-check-requirement-we-don-t-do-unit-tests.patch
new file mode 100644
index 0000000..0bbbf28
--- /dev/null
+++ b/package/radvd/0001-Drop-check-requirement-we-don-t-do-unit-tests.patch
@@ -0,0 +1,29 @@
+From 2074114cef857f95104367c51ac9367082fc8060 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sun, 23 Nov 2014 12:16:32 +0100
+Subject: [PATCH 1/3] Drop check requirement, we don't do unit tests
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 59b18a8..5dde3b2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -50,10 +50,6 @@ dnl Determine CC and preset CFLAGS
+ AC_PROG_CC_C99
+ AC_PROG_RANLIB
+ 
+-if test "$arch" = "linux" ; then
+-PKG_CHECK_MODULES([CHECK], [check >= 0.9.4])
+-fi
+-
+ dnl Determine of netlink is available
+ AC_MSG_CHECKING(netlink)
+ AC_TRY_COMPILE([
+-- 
+2.1.0
+
diff --git a/package/radvd/0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch b/package/radvd/0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
new file mode 100644
index 0000000..4476808
--- /dev/null
+++ b/package/radvd/0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
@@ -0,0 +1,27 @@
+From 324e1ebc7b86f68f49fb4f1c34a4de60d18dd3c1 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sun, 23 Nov 2014 12:17:11 +0100
+Subject: [PATCH 2/3] Don't force -fstack-protector, the toolchain might lack
+ support for it
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 80633e7..8b5a2e4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -43,7 +43,6 @@ DISABLE_WARNINGS = \
+ 
+ AM_CFLAGS = \
+ 	-fno-strict-aliasing \
+-	-fstack-protector \
+ 	$(ENABLE_WARNINGS) \
+ 	$(DISABLE_WARNINGS)
+ 
+-- 
+2.1.0
+
diff --git a/package/radvd/radvd-01-drop-check.patch b/package/radvd/radvd-01-drop-check.patch
deleted file mode 100644
index 670d5b2..0000000
--- a/package/radvd/radvd-01-drop-check.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Drop check requirement, we don't do unit tests.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura radvd-2.6.orig/configure.ac radvd-2.6/configure.ac
---- radvd-2.6.orig/configure.ac	2014-09-04 15:54:41.735038724 -0300
-+++ radvd-2.6/configure.ac	2014-09-04 15:54:53.106431815 -0300
-@@ -50,10 +50,6 @@
- AC_PROG_CC_C99
- AC_PROG_RANLIB
- 
--if test "$arch" = "linux" ; then
--PKG_CHECK_MODULES([CHECK], [check >= 0.9.4])
--fi
--
- dnl Determine of netlink is available
- AC_MSG_CHECKING(netlink)
- AC_TRY_COMPILE([
diff --git a/package/radvd/radvd-02-drop-stack-protector.patch b/package/radvd/radvd-02-drop-stack-protector.patch
deleted file mode 100644
index 532c1b6..0000000
--- a/package/radvd/radvd-02-drop-stack-protector.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Don't force -fstack-protector, the toolchain might lack support for it.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura radvd-2.1.orig/Makefile.am radvd-2.1/Makefile.am
---- radvd-2.1.orig/Makefile.am	2014-07-22 08:23:12.642260069 -0300
-+++ radvd-2.1/Makefile.am	2014-07-22 08:26:42.651380759 -0300
-@@ -43,7 +43,6 @@
- 
- AM_CFLAGS = \
- 	-fno-strict-aliasing \
--	-fstack-protector \
- 	$(ENABLE_WARNINGS) \
- 	$(DISABLE_WARNINGS)
- 
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index e0d4f69..bd2086d 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -9,7 +9,7 @@ RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
 RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-# For radvd-01-drop-check.patch & radvd-02-drop-stack-protector.patch
+# We're patching configure.ac/Makefile.am.
 RADVD_AUTORECONF = YES
 
 define RADVD_INSTALL_INITSCRIPT
-- 
2.1.0
