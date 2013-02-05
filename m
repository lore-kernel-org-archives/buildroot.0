From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  5 Feb 2013 18:16:00 +0100
Subject: [Buildroot] [PATCH 2/4] target/generic: add filesystem overlay
	option
In-Reply-To: <cover.1360084128.git.arnout@mind.be>
References: <cover.1360084128.git.arnout@mind.be>
Message-ID: <228e7c83b0dda1bb7e9ba6748ade0974368b8335.1360084128.git.arnout@mind.be>
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
v4: Rebased against master.

v3: keep the custom skeleton documentation

v2: don't deprecate custom skeleton
---
 Makefile                         |    9 +++++++++
 docs/manual/customize-rootfs.txt |   17 +++++++++++------
 docs/manual/customize-store.txt  |   13 +++++--------
 system/Config.in                 |   11 +++++++++++
 4 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 6f8ed0e..ac59071 100644
--- a/Makefile
+++ b/Makefile
@@ -501,6 +501,15 @@ endif
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
 	@$(call MESSAGE,"Executing post-build script\(s\)")
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 6399699..fa04d85 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -24,6 +24,12 @@ there are a few ways to customize the resulting target filesystem.
   skeleton are copied to output/target before any package
   installation.
 
+* Create a filesystem overlay: a tree of files that are copied directly
+  over the target filesystem after it has been built.  Set
+  +BR2_ROOTFS_OVERLAY+ to the top of the tree.  +.git+, +.svn+,
+  +.hg+ directories and files ending with +~+ are excluded.
+  _Among these first 3 methods, this one should be preferred_.
+
 * In the Buildroot configuration, you can specify the path to a
   *post-build script*, that gets called 'after' Buildroot builds all the
   selected software, but 'before' the rootfs packages are
@@ -31,12 +37,11 @@ there are a few ways to customize the resulting target filesystem.
   specify the location of your post-build script. This option can be
   found in the +System configuration+ menu. The destination root
   filesystem folder is given as the first argument to this script,
-  and this script can then be used to copy programs, static data or
-  any other needed file to your target filesystem. You should,
-  however, use this feature with care. Whenever you find that a
-  certain package generates wrong or unneeded files, you should fix
-  that package rather than work around it with a post-build cleanup
-  script. _Among these first 3 methods, this one should be preferred_.
+  and this script can then be used to remove or modify any file in your
+  target filesystem. You should, however, use this feature with care.
+  Whenever you find that a certain package generates wrong or unneeded
+  files, you should fix that package rather than work around it with a
+  post-build cleanup script.
   You may also use these variables in your post-build script:
     - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
     - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index 435c1b9..5d004ea 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -136,15 +136,12 @@ you can skip the steps that are not relevant for your use case.
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
index 69863c4..fa01d91 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -249,6 +249,17 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
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
