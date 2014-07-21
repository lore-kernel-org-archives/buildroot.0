From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 22:18:42 +0200
Subject: [Buildroot] [git commit] evemu: disable tests via evemu configure
	option
Message-ID: <20140721204953.DC9C79D2A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d96a061649181437055ce3545c02c524e47c3fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...002-configure.ac-add-disable-tests-option.patch |   44 ++++++++++++++++++++
 package/evemu/evemu-0002-disable-tests.patch       |   19 --------
 package/evemu/evemu.mk                             |    3 +
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch b/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch
new file mode 100644
index 0000000..cbc025d
--- /dev/null
+++ b/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch
@@ -0,0 +1,44 @@
+From 077722193e4e59e76591abbaddac9d22068be4e6 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 27 Apr 2014 13:14:51 +0200
+Subject: [PATCH] configure.ac: add '--disable-tests' option
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
 
