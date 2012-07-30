From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 23:50:11 +0200
Subject: [Buildroot] [git commit] sysprof: New package.
Message-ID: <20120730215613.F1B8296BA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58a62766a1869c913845a649890855515aebb016
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[thomas.petazzoni at free-electrons.com:
 - add dependencies on the supported architectures to avoid build
   failures on ARM and other unsupported arches
 - add a patch that removes an useless warning about the kernel
   version. This patch is present upstream. However since it modifies
   configure.ac, we need to autoreconf the package.]

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/sysprof/Config.in                          |   24 ++++++++++++++++++
 .../sysprof-01-fix-kernel-version-warning.patch    |   26 ++++++++++++++++++++
 package/sysprof/sysprof.mk                         |   22 ++++++++++++++++
 4 files changed, 73 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f664b8e..f308de7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -39,6 +39,7 @@ source "package/ramspeed/Config.in"
 source "package/rt-tests/Config.in"
 source "package/strace/Config.in"
 source "package/stress/Config.in"
+source "package/sysprof/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
 source "package/pv/Config.in"
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
new file mode 100644
index 0000000..513a32c
--- /dev/null
+++ b/package/sysprof/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_SYSPROF
+	bool "sysprof"
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # glib2
+	# In its util.h file, sysprof contains architecture-specific
+	# code
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
+	help
+	  Sysprof is a statistical, system-wide profiler that can
+	  profile user and kernel code using the perf API.
+
+	  http://sysprof.com
+
+config BR2_PACKAGE_SYSPROF_GUI
+	bool "sysprof GUI"
+	depends on BR2_PACKAGE_SYSPROF
+	depends on BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBGLADE
+	select BR2_PACKAGE_GDK_PIXBUF
+	help
+	  GUI for the sysprof system-wide statistical profiler.
+
+comment "sysprof requires a toolchain with WCHAR support"
+        depends on !BR2_USE_WCHAR
diff --git a/package/sysprof/sysprof-01-fix-kernel-version-warning.patch b/package/sysprof/sysprof-01-fix-kernel-version-warning.patch
new file mode 100644
index 0000000..7b45b30
--- /dev/null
+++ b/package/sysprof/sysprof-01-fix-kernel-version-warning.patch
@@ -0,0 +1,26 @@
+From 6a5dfd385ca86b9e40b1a73237408f76b671b490 Mon Sep 17 00:00:00 2001
+From: Pauli Nieminen <suokkos@gmail.com>
+Date: Mon, 09 Apr 2012 18:12:59 +0000
+Subject: Don't complain about old kernel for 3.0+ kernels
+
+Linux kernel version received bump to 3.0 that causes configure to
+complain about older kernel. To avoid the warning configure needs to
+check major and minor versions before micro.
+
+Signed-off-by: Pauli Nieminen <suokkos@gmail.com>
+---
+diff --git a/configure.ac b/configure.ac
+index 34fdc43..e4f6d5d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -83,7 +83,7 @@ Makefile
+ 
+ AC_OUTPUT
+ 
+-if [[ $KMICRO -lt 31 ]] ; then
++if [[ $KMAJOR -eq 2 -a $KMINOR -eq 6 -a $KMICRO -lt 31 ]] ; then
+    echo
+    echo "%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%"
+    echo "@"  
+--
+cgit v0.9.0.2
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
new file mode 100644
index 0000000..03355d8
--- /dev/null
+++ b/package/sysprof/sysprof.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# sysprof
+#
+#############################################################
+
+SYSPROF_VERSION = 1.1.8
+SYSPROF_SITE = http://sysprof.com
+SYSPROF_DEPENDENCIES = libglib2
+SYSPROF_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_SYSPROF_GUI),y)
+SYSPROF_DEPENDENCIES += libgtk2 libglade gdk-pixbuf
+endif
+
+define SYSPROF_CREATE_M4_DIR
+	mkdir -p $(@D)/m4
+endef
+
+SYSPROF_POST_PATCH_HOOKS += SYSPROF_CREATE_M4_DIR
+
+$(eval $(autotools-package))
