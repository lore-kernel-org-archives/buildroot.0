From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 24 Oct 2012 09:16:59 +0200
Subject: [Buildroot] [PATCHv2 02/10] target/generic: add filesystem overlay
	option
In-Reply-To: <1351063027-13800-1-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
Message-ID: <1351063027-13800-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The filesystem overlay is a tree that is copied over the target fs
after building everything - which is currently usually done in the
post-build script.

Also replace the documentation for a custom skeleton with the
filesystem overlay and deprecate the custom skeleton.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                         |    9 +++++++++
 docs/manual/customize-rootfs.txt |   21 +++++++++------------
 docs/manual/customize-store.txt  |   27 +++++++++------------------
 target/generic/Config.in         |   11 +++++++++++
 4 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/Makefile b/Makefile
index 0128839..2122d45 100644
--- a/Makefile
+++ b/Makefile
@@ -463,6 +463,15 @@ endif
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
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index 44de356..7ca0db3 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -127,16 +127,12 @@ you can skip the steps that are not relevant for your use case.
    * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
 1. Create +board/<manufacturer>/<boardname>/fs-overlay+ and fill it
    with additional files you need on your rootfs, e.g.
-   +board/<manufacturer>/<boardname>/etc/inittab+.
+   +board/<manufacturer>/<boardname>/etc/inittab+.  Set +BR2_ROOTFS_OVERLAY+
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
@@ -179,16 +175,11 @@ the buildroot tree).
    * +cp <output>/build/at91bootstrap3-*/.config <path-to-board-directory>/at91bootstrap3.config+
 1. Create +<path-to-board-directory>/fs-overlay+ and fill it
    with additional files you need on your rootfs, e.g.
-   +<path-to-board-directory>/etc/inittab+.
+   +<path-to-board-directory>/etc/inittab+. Set +BR2_ROOTFS_OVERLAY+
+   to +<path-to-board-directory>/fs-overlay+.
 1. Create a post-build script
-   +<path-to-board-directory>/post-build.sh+.  It should contain
-   the following command:
-+
-------------
-rsync -a --exclude .empty --exclude '*~' ${0%/*}/fs-overlay $1
-------------
-+
-1. Set +BR2_ROOTFS_POST_BUILD_SCRIPT+ to +$(BOARDDIR)/post-build.sh+
+   +<path-to-board-directory>/post-build.sh+. Set
+   +BR2_ROOTFS_POST_BUILD_SCRIPT+ to +$(BOARDDIR)/post-build.sh+
 1. If additional setuid permissions have to be set or device nodes have
    to be created, create +<path-to-board-directory>/device_table.txt+
    and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
diff --git a/target/generic/Config.in b/target/generic/Config.in
index b8472f4..7f53a7c 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -166,6 +166,17 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_ROOTFS_OVERLAY
+	string "Root filesystem overlay"
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
 	default ""
-- 
1.7.10.4
