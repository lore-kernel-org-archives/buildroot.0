From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 21:35:33 +0100
Subject: [Buildroot] [git commit] target/generic: add filesystem overlay
	option
Message-ID: <20130205204625.2C3649A9A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f86089292e4fa7e6a7b1907611bd007153f452a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The filesystem overlay is a tree that is copied over the target fs
after building everything - which is currently usually done in the
post-build script.

[Peter: don't ignore missing directories]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                         |    7 +++++++
 docs/manual/customize-rootfs.txt |   17 +++++++++++------
 docs/manual/customize-store.txt  |   13 +++++--------
 system/Config.in                 |   11 +++++++++++
 4 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 6f8ed0e..98db8b1 100644
--- a/Makefile
+++ b/Makefile
@@ -501,6 +501,13 @@ endif
 		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
 	) >  $(TARGET_DIR)/etc/os-release
 
+	@for dir in $(call qstrip,$(BR2_ROOTFS_OVERLAY)); do \
+		$(call MESSAGE,"Copying overlay $${dir}"); \
+		rsync -a \
+			--exclude .svn --exclude .git --exclude .hg --exclude '*~' \
+			$${dir}/ $(TARGET_DIR); \
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
index b6e3d08..298b5e9 100644
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
