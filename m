From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 20:58:46 +0200
Subject: [Buildroot] [git commit] fs/common: add option to execute custom
	scripts under fakeroot
Message-ID: <20160703190530.BC84181D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cdb281fa64eb2b58ec1d25cb62c29268aa4b906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some users have the need to be able to tweak the content of the target
rootfs with root-like rights, that is, from inside the fakeroot script.

Add a new system option to allow those users to provide a list of
scripts, like the post-build and post-image scripts, that will be run
from our fakeroot script.

[Peter: pass TARGET_DIR to scripts, tweak help text]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Cam Hutchison <camh@xdna.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk     |  3 +++
 system/Config.in | 38 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index b7202c3..2b31e12 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -92,6 +92,9 @@ endif
 	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
+	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
+		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
+		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
diff --git a/system/Config.in b/system/Config.in
index 15d5b55..385d305 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -454,6 +454,38 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
 	  argument. Make sure the exit code of those scripts are 0, otherwise
 	  make will stop after calling them.
 
+config BR2_ROOTFS_POST_FAKEROOT_SCRIPT
+	string "Custom scripts to run inside the fakeroot environment"
+	default ""
+	help
+	  Specify a space-separated list of scripts to be run at the end
+	  of the fakeroot script right before the image(s) are actually
+	  generated.
+
+	  This gives users the opportunity to do customisations of the
+	  content of the rootfs, which would otherwise require root
+	  rigths.
+
+	  These scripts are called with the target directory name as
+	  first argument. The build will fail on the first scripts that
+	  exits with a non-zero exit code.
+
+	  Note that Buildroot already provides mechanisms to customise
+	  the content of the rootfs:
+
+	    - BR2_ROOTFS_STATIC_DEVICE_TABLE
+	        to create arbitrary entries statically in /dev
+
+	    - BR2_ROOTFS_DEVICE_TABLE
+	        to set arbitrary permissions as well as extended attributes
+	        (such as capabilities) on files and directories,
+
+	    - BR2_ROOTFS_USERS_TABLES:
+	        to create arbitrary users and their home directories
+
+	  It is highly recommended to use those mechanisms if possible,
+	  rather than using custom fakeroot scripts.
+
 config BR2_ROOTFS_POST_IMAGE_SCRIPT
 	string "Custom scripts to run after creating filesystem images"
 	default ""
@@ -473,8 +505,10 @@ config BR2_ROOTFS_POST_IMAGE_SCRIPT
 	  source directory as the current directory.
 
 config BR2_ROOTFS_POST_SCRIPT_ARGS
-	string "Extra post-{build,image} arguments"
-	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" || BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
+	string "Extra arguments passed to custom scripts"
+	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" \
+		|| BR2_ROOTFS_POST_FAKEROOT_SCRIPT != "" \
+		|| BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
 	help
 	  Pass these additional arguments to each post-build or post-image
 	  scripts.
