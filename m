From: Will Newton <will.newton@gmail.com>
Date: Fri, 27 Jul 2012 16:26:23 +0100
Subject: [Buildroot] [PATCH] sysprof: New package.
Message-ID: <CAFbHwiTWnB+EtB=Du5bkAa7mtKfJ7nHeyWGshpq7Rcvjf9O__g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/Config.in          |    1 +
 package/sysprof/Config.in  |   21 +++++++++++++++++++++
 package/sysprof/sysprof.mk |   15 +++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/sysprof/Config.in
 create mode 100644 package/sysprof/sysprof.mk

diff --git a/package/Config.in b/package/Config.in
index 4ac02c8..f97ca16 100644
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
index 0000000..bd71728
--- /dev/null
+++ b/package/sysprof/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_SYSPROF
+	bool "sysprof"
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # glib2
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
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
new file mode 100644
index 0000000..c7dd8ca
--- /dev/null
+++ b/package/sysprof/sysprof.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# sysprof
+#
+#############################################################
+
+SYSPROF_VERSION = 1.1.8
+SYSPROF_SITE = http://sysprof.com
+SYSPROF_DEPENDENCIES = libglib2
+
+ifeq ($(BR2_PACKAGE_SYSPROF_GUI),y)
+SYSPROF_DEPENDENCIES += libgtk2 libglade gdk-pixbuf
+endif
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-sysprof-New-package.patch
Type: application/octet-stream
Size: 2300 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120727/d2e568fa/attachment.obj>
