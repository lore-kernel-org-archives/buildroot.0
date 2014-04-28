From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 28 Apr 2014 21:00:29 +0200
Subject: [Buildroot] [PATCH 1/4] evemu: disable tests via evemu configure
	option
In-Reply-To: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
References: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
Message-ID: <1398711632-5831-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/evemu/evemu-0002-disable-tests.patch       | 19 ----------
 ...005-configure.ac-add-disable-tests-option.patch | 44 ++++++++++++++++++++++
 package/evemu/evemu.mk                             |  3 ++
 3 files changed, 47 insertions(+), 19 deletions(-)
 delete mode 100644 package/evemu/evemu-0002-disable-tests.patch
 create mode 100644 package/evemu/evemu-0005-configure.ac-add-disable-tests-option.patch

diff --git a/package/evemu/evemu-0002-disable-tests.patch b/package/evemu/evemu-0002-disable-tests.patch
deleted file mode 100644
index e545c91..0000000
--- a/package/evemu/evemu-0002-disable-tests.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-[PATCH] disable tests
-
-The tests need C++ support and add to build time, so disable them for BR.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: evemu-1.2.0/Makefile.am
-===================================================================
---- evemu-1.2.0.orig/Makefile.am
-+++ evemu-1.2.0/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS = src tools python test
-+SUBDIRS = src tools python
- 
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = evemu.pc
diff --git a/package/evemu/evemu-0005-configure.ac-add-disable-tests-option.patch b/package/evemu/evemu-0005-configure.ac-add-disable-tests-option.patch
new file mode 100644
index 0000000..d1f9957
--- /dev/null
+++ b/package/evemu/evemu-0005-configure.ac-add-disable-tests-option.patch
@@ -0,0 +1,44 @@
+From 077722193e4e59e76591abbaddac9d22068be4e6 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 27 Apr 2014 13:14:51 +0200
+Subject: [PATCH 5/8] configure.ac: add '--disable-tests' option
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Makefile.am  | 2 +-
+ configure.ac | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7b68f3d..a83b35f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = src tools python test
++SUBDIRS = src tools python $(SUBDIR_TESTS)
+ 
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = evemu.pc
+diff --git a/configure.ac b/configure.ac
+index ec21a6e..4e0c3b8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,6 +43,15 @@ if test "x$XMLTO" = "x" || test "x$ASCIIDOC" = "x"; then
+ 	AC_MSG_WARN([xmlto or asciidoc not found - cannot create man pages without it])
+ fi
+ 
++AC_ARG_ENABLE([tests],
++	AS_HELP_STRING([--disable-tests], [Disable running tests]))
++
++AS_IF([test "x$enable_tests" != "xno"], [
++	SUBDIR_TESTS=test
++])
++
++AC_SUBST([SUBDIR_TESTS])
++
+ AC_SUBST(AM_CFLAGS,
+          "-Wall -Wextra -pedantic")
+ 
+-- 
+1.8.1.4
+
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 0f25f62..385a982 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -18,6 +18,9 @@ EVEMU_CONF_ENV = ac_cv_path_ASCIIDOC=""
 # of host system version)
 EVEMU_MAKE_ENV = SYSROOT=$(STAGING_DIR)
 
+# disable tests generation because of C++ dependency
+EVEMU_CONF_OPT += --disable-tests
+
 # Uses PKG_CHECK_MODULES() in configure.ac
 EVEMU_DEPENDENCIES = host-pkgconf libevdev
 
-- 
1.8.1.4
