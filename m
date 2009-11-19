From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 19 Nov 2009 05:51:06 -0600
Subject: [Buildroot]  Add ability to force a static BB build
Message-ID: <200911190551.09090.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This one I find to be useful for people (like myself)
that need a static linked busybox before setting up
a dynamically linked system.

A1: Yes, this feature could be selected in the busybox config file;
but exposing the feature in BR allows the use of "canned" BB config
files without creating a custom one with only "static" changed.

"Signed-off-by" == "works for me"

Signed-off-by: Michael S. Zick <minimod@morethan.org>

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 7438a8d..90cec45 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -56,6 +56,20 @@ config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 
 	  If you wish to just install /bin/busybox, then answer N.
 
+config BR2_PACKAGE_BUSYBOX_MKSTATIC
+    bool "Build a staticly linked BusyBox"
+    depends on BR2_PACKAGE_BUSYBOX
+    default n
+    help
+        This will produce a staticly linked BusyBox.
+
+        Over-rides the selection made in the BusyBox config file.
+
+        Generates a larger BusyBox that can be run independently
+        of the rest of the system being built.
+        Useful if you need to run BusyBox before setting up for
+        a dynamically linked system.
+
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
 	depends on BR2_PACKAGE_BUSYBOX
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb79134..187a06a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -77,6 +77,11 @@ ifeq ($(BR2_INET_RPC),y)
 else
 	$(SED) "s/^.*CONFIG_FEATURE_MOUNT_NFS.*/CONFIG_FEATURE_MOUNT_NFS=n/;" $(BUSYBOX_DIR)/.config
 endif
+ifeq ($(BR2_PACKAGE_BUSYBOX_MKSTATIC),y)
+	# force static build on
+	$(SED) "s/^.*CONFIG_STATIC.*/CONFIG_STATIC=y/" $(BUSYBOX_DIR)/.config
+	$(SED) "s/^.*CONFIG_PIE.*/CONFIG_PIE=n/" $(BUSYBOX_DIR)/.config
+endif
 ifeq ($(BR2_PACKAGE_BUSYBOX_SKELETON),y)
 	# force mdev on
 	$(SED) "s/^.*CONFIG_MDEV.*/CONFIG_MDEV=y/" $(BUSYBOX_DIR)/.config
