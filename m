From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 22:36:47 +0200
Subject: [Buildroot] [git commit] evemu: build python2 binding only if
	target python2 is enabled
Message-ID: <20140721204953.E9E939B999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c189442f1bbcd990f8815771eda350ae4808e4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ure.ac-add-disable-python-bindings-option.patch |   46 ++++++++++++++++++++
 package/evemu/evemu.mk                             |    9 ++++
 2 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch b/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch
new file mode 100644
index 0000000..f174c62
--- /dev/null
+++ b/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch
@@ -0,0 +1,46 @@
+From 3169736eab530cdbd5d123e7df10f51c44090e0b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 27 Apr 2014 13:23:41 +0200
+Subject: [PATCH] configure.ac: add '--disable-python-bindings' option
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Makefile.am  |  2 +-
+ configure.ac | 11 +++++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a83b35f..fb87c76 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = src tools python $(SUBDIR_TESTS)
++SUBDIRS = src tools $(SUBDIR_PYTHON_BINDINGS) $(SUBDIR_TESTS)
+ 
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = evemu.pc
+diff --git a/configure.ac b/configure.ac
+index 4e0c3b8..ab1b553 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,6 +52,17 @@ AS_IF([test "x$enable_tests" != "xno"], [
+ 
+ AC_SUBST([SUBDIR_TESTS])
+ 
++AC_ARG_ENABLE([python-bindings],
++	AS_HELP_STRING([--disable-python-bindings],
++		 [Disable generation of python bindings]))
++
++AS_IF([test "x$enable_python_bindings" != "xno"], [
++	SUBDIR_PYTHON_BINDINGS=python
++])
++
++AC_SUBST([SUBDIR_PYTHON_BINDINGS])
++
++
+ AC_SUBST(AM_CFLAGS,
+          "-Wall -Wextra -pedantic")
+ 
+-- 
+1.8.1.4
+
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 07ad6f6..9ff9922 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -27,6 +27,15 @@ EVEMU_DEPENDENCIES = host-pkgconf libevdev
 # Needs Python for header file generation
 EVEMU_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 
+# Check for target python (python3 bindings disabled because
+# of build/byte-compile problems)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+EVEMU_CONF_OPT += --enable-python-bindings
+EVEMU_DEPENDENCIES += python
+else
+EVEMU_CONF_OPT += --disable-python-bindings
+endif
+
 # package source code coming from git, so it doesn't have generated
 # configure and Makefile.in
 EVEMU_AUTORECONF = YES
