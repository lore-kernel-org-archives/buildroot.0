From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 28 Apr 2014 21:00:31 +0200
Subject: [Buildroot] [PATCH 3/4] evemu: build python2 binding only if target
	python2 is enabled
In-Reply-To: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
References: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
Message-ID: <1398711632-5831-4-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...gure.ac-add-disable-python-binding-option.patch | 46 ++++++++++++++++++++++
 package/evemu/evemu.mk                             |  8 ++++
 2 files changed, 54 insertions(+)
 create mode 100644 package/evemu/evemu-0006-configure.ac-add-disable-python-binding-option.patch

diff --git a/package/evemu/evemu-0006-configure.ac-add-disable-python-binding-option.patch b/package/evemu/evemu-0006-configure.ac-add-disable-python-binding-option.patch
new file mode 100644
index 0000000..f100b2e
--- /dev/null
+++ b/package/evemu/evemu-0006-configure.ac-add-disable-python-binding-option.patch
@@ -0,0 +1,46 @@
+From 44f42cfa6b58a256d3b89bce1043b0efed7eeaeb Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 27 Apr 2014 13:23:41 +0200
+Subject: [PATCH 6/8] configure.ac: add '--disable-python-binding' option
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Makefile.am  |  2 +-
+ configure.ac | 11 +++++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a83b35f..446ec4c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = src tools python $(SUBDIR_TESTS)
++SUBDIRS = src tools $(SUBDIR_PYTHON_BINDING) $(SUBDIR_TESTS)
+ 
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = evemu.pc
+diff --git a/configure.ac b/configure.ac
+index 4e0c3b8..bb49bbc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,6 +52,17 @@ AS_IF([test "x$enable_tests" != "xno"], [
+ 
+ AC_SUBST([SUBDIR_TESTS])
+ 
++AC_ARG_ENABLE([python-binding],
++	AS_HELP_STRING([--disable-python-binding],
++		 [Disable generation of python binding]))
++
++AS_IF([test "x$enable_python_binding" != "xno"], [
++	SUBDIR_PYTHON_BINDING=python
++])
++
++AC_SUBST([SUBDIR_PYTHON_BINDING])
++
++
+ AC_SUBST(AM_CFLAGS,
+          "-Wall -Wextra -pedantic")
+ 
+-- 
+1.8.1.4
+
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 07ad6f6..44b8b89 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -27,6 +27,14 @@ EVEMU_DEPENDENCIES = host-pkgconf libevdev
 # Needs Python for header file generation
 EVEMU_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 
+# Check for target python (python3 binding disabled because
+# of build/byte-compile problems)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+	EVEMU_DEPENDENCIES += python
+else
+	EVEMU_CONF_OPT += --disable-python-binding
+endif
+
 # package source code coming from git, so it doesn't have generated
 # configure and Makefile.in
 EVEMU_AUTORECONF = YES
-- 
1.8.1.4
