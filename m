From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 17:23:59 +0100
Subject: [Buildroot] [git commit] Allow to run severals post build scripts
	instead of only one
Message-ID: <20121117163110.54FBE9972A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbf4978e6b1b24973cb7fbf9be636dda3ae67862
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using severals post build scripts is usefull to share
script between severals boards/projects.

[Peter: fix trailing spaces in Config.in]
Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile         |    5 +++--
 system/Config.in |   11 ++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 3e7d520..7602499 100644
--- a/Makefile
+++ b/Makefile
@@ -470,8 +470,9 @@ endif
 	) >  $(TARGET_DIR)/etc/os-release
 
 ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
-	@$(call MESSAGE,"Executing post-build script")
-	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
+	@$(call MESSAGE,"Executing post-build script\(s\)")
+	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
+		$(s) $(TARGET_DIR)$(sep))
 endif
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
diff --git a/system/Config.in b/system/Config.in
index 10c9d9d..5823210 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -170,15 +170,16 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom script to run before creating filesystem images"
 	default ""
 	help
-	  Specify a script to be run after the build has finished and before
-	  Buildroot starts packing the files into selected filesystem images.
+	  Specify a space-separated list of scripts to be run after the build
+	  has finished and before Buildroot starts packing the files into
+	  selected filesystem images.
 
 	  This gives users the oportunity to do board-specific cleanups,
 	  add-ons and the like, so the generated files can be used directly
 	  without further processing.
 
-	  The script is called with the target directory name as first and
-	  only argument. Make sure the exit code of that script is 0,
-	  otherwise make will stop after calling it.
+	  These scripts are called with the target directory name as first and
+	  only argument. Make sure the exit code of those scripts are 0,
+	  otherwise make will stop after calling them.
 
 endmenu
