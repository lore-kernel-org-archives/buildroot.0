From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  8 Nov 2012 09:36:08 +0100
Subject: [Buildroot] [PATCH v3 02/10] target/generic: add filesystem overlay
	option
In-Reply-To: <1352363776-23638-1-git-send-email-arnout@mind.be>
References: <1352363776-23638-1-git-send-email-arnout@mind.be>
Message-ID: <1352363776-23638-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The filesystem overlay is a tree that is copied over the target fs
after building everything - which is currently usually done in the
post-build script.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v3: keep the custom skeleton documentation

v2: don't deprecate custom skeleton
---
 Makefile                         |    9 +++++++++
 docs/manual/customize-rootfs.txt |   15 ++++++++++-----
 docs/manual/customize-store.txt  |   13 +++++--------
 system/Config.in                 |   11 +++++++++++
 4 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index c526fe1..e6eb379 100644
--- a/Makefile
+++ b/Makefile
@@ -464,6 +464,15 @@ endif
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
index 44007c7..9be23ae 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -1,5 +1,6 @@
 Customizing the generated target filesystem
 -------------------------------------------
+[customize-rootfs]
 
 There are a few ways to customize the resulting target filesystem:
 
@@ -18,16 +19,20 @@ There are a few ways to customize the resulting target filesystem:
   skeleton are copied to output/target before any package
   installation.
 
+* Create a filesystem overlay: a tree of files that are copied directly
+  over the target filesystem after it has been built.  Set
+  +BR2_ROOTFS_OVERLAY+ to the top of the tree.  +.git+, +.svn+,
+  +.hg+ directories and files ending with +~+ are excluded.
+
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
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index a62d3e2..aa57660 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -134,15 +134,12 @@ you can skip the steps that are not relevant for your use case.
 1. Create +board/<manufacturer>/<boardname>/fs-overlay/+ and fill it
    with additional files you need on your rootfs, e.g.
    +board/<manufacturer>/<boardname>/fs-overlay/etc/inittab+.
+   Set +BR2_ROOTFS_OVERLAY+
+   to +board/<manufacturer>/<boardname>/fs-overlay+.
 1. Create a post-build script
-   +board/<manufacturer>/<boardname>/post-build.sh+.  It should contain
-   the following command:
-+
-------------
-rsync -a --exclude .empty --exclude '*~' ${0%/*}/fs-overlay $1
-------------
-+
-1. Set +BR2_ROOTFS_POST_BUILD_SCRIPT+ to +board/<manufacturer>/<boardname>/post-build.sh+
+   +board/<manufacturer>/<boardname>/post-build.sh+.  Set
+   +BR2_ROOTFS_POST_BUILD_SCRIPT+ to
+   +board/<manufacturer>/<boardname>/post-build.sh+
 1. If additional setuid permissions have to be set or device nodes have
    to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
    and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
diff --git a/system/Config.in b/system/Config.in
index 10c9d9d..1859be6 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -166,6 +166,17 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_ROOTFS_OVERLAY
+	string "Root filesystem overlay directories"
+	default ""
+	help
+	  Specify a list of directories that are copied over the target
+	  root filesystem after the build has finished and before it is
+	  packed into the selected filesystem images.
+
+	  They are copied as-is into the rootfs, excluding files ending with
+	  ~ and .git, .svn and .hg directories.
+
 config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom script to run before creating filesystem images"
 	default ""
-- 
1.7.10.4
