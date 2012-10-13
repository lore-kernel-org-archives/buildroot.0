From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:14:48 +0200
Subject: [Buildroot] [PATCH 12/13] target/generic: add filesystem overlay
	option
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231448.17317.37653.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

The filesystem overlay is a tree that is copied over the target fs
after building everything - which is currently usually done in the
post-build script.

Also replace the documentation for a custom skeleton with the
filesystem overlay and deprecate the custom skeleton.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                         |    9 +++++++++
 docs/manual/customize-rootfs.txt |   21 +++++++++------------
 target/generic/Config.in         |   13 +++++++++++++
 3 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index a3b88f7..31770ce 100644
--- a/Makefile
+++ b/Makefile
@@ -466,6 +466,15 @@ endif
 		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
 	) >  $(TARGET_DIR)/etc/os-release
 
+	@for dir in $(call qstrip,$(BR2_ROOTFS_OVERLAY)); do \
+		if [ -d $${dir} ]; then \
+			$(call MESSAGE,"Copying overlay $${dir}"); \
+			rsync -a \
+				--exclude .svn --exclude .git --exclude .hg --exclude '*~' \
+				$${dir}/ $(TARGET_DIR); \
+		fi \
+	done
+
 ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
 	@$(call MESSAGE,"Executing post-build script")
 	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 8c3ea82..b3c160b 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -1,5 +1,6 @@
 Customizing the generated target filesystem
 -------------------------------------------
+[customize-rootfs]
 
 There are a few ways to customize the resulting target filesystem:
 
@@ -10,24 +11,20 @@ There are a few ways to customize the resulting target filesystem:
   anything to the target filesystem, but if you decide to completely
   rebuild your toolchain and tools, these changes will be lost.
 
-* Create your own 'target skeleton'. You can start with the default
-  skeleton available under +fs/skeleton+ and then customize it to suit
-  your needs. The +BR2_ROOTFS_SKELETON_CUSTOM+ and
-  +BR2_ROOTFS_SKELETON_CUSTOM_PATH+ will allow you to specify the
-  location of your custom skeleton. At build time, the contents of the
-  skeleton are copied to output/target before any package
-  installation.
+* Create a filesystem overlay: a tree of files that are copied directly
+  over the target filesystem after it has been built.  Set
+  +BR2_ROOTFS_OVERLAY+ to the top of the tree.  +.git+, +.svn+,
+  +.hg+ directories and files ending with +~+ are excluded.
 
 * In the Buildroot configuration, you can specify the path to a
   post-build script, that gets called 'after' Buildroot builds all the
   selected software, but 'before' the rootfs packages are
   assembled. The destination root filesystem folder is given as the
   first argument to this script, and this script can then be used to
-  copy programs, static data or any other needed file to your target
-  filesystem. You should, however, use this feature with care.
-  Whenever you find that a certain package generates wrong or unneeded
-  files, you should fix that package rather than work around it with a
-  post-build cleanup script.
+  remove or modify any file in your target filesystem. You should,
+  however, use this feature with care. Whenever you find that a certain
+  package generates wrong or unneeded files, you should fix that
+  package rather than work around it with a post-build cleanup script.
 
 * A special package, 'customize', stored in +package/customize+ can be
   used. You can put all the files that you want to see in the final
diff --git a/target/generic/Config.in b/target/generic/Config.in
index 76137b7..35cadfb 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -105,6 +105,7 @@ config BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
+	depends on BR2_DEPRECATED
 	help
 	  Use custom target skeleton.
 
@@ -168,6 +169,18 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_ROOTFS_OVERLAY
+	string "Root filesystem overlay"
+	default "$(PROJECT_DIR)/rootfs-overlay" if BR2_PROJECT_DIR != ""
+	default ""
+	help
+	  Specify a list of directories that are copied over the target
+	  root filesystem after the build has finished and before it is
+	  packed into the selected filesystem images.
+
+	  It is copied as-is into the rootfs, excluding files ending with
+	  ~ and .git, .svn and .hg directories.
+
 config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom script to run before creating filesystem images"
 	default "$(PROJECT_DIR)/post-build.sh" if BR2_PROJECT_DIR != ""
