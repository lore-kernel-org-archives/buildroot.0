From: Philippe Reynes <philippe.reynes@sagemcom.com>
Date: Sat, 17 Nov 2012 13:01:22 +0100
Subject: [Buildroot] [PATCH v4] Allow to run severals post build scripts
	instead of only one
Message-ID: <30186_1353153693_50A77C9C_30186_8127_1_1353153682-31020-1-git-send-email-philippe.reynes@sagemcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using severals post build scripts is usefull to share
script between severals boards/projects.

Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
---

v4: rebase patch with latest change

 Makefile         |    5 +++--
 system/Config.in |   11 ++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index c526fe1..03be469 100644
--- a/Makefile
+++ b/Makefile
@@ -465,8 +465,9 @@ endif
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
index 10c9d9d..e448a40 100644
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
-- 
1.7.1


#
" Ce courriel et les documents qui lui sont joints peuvent contenir des
informations confidentielles ou ayant un caract?re priv?. S'ils ne vous sont
pas destin?s, nous vous signalons qu'il est strictement interdit de les
divulguer, de les reproduire ou d'en utiliser de quelque mani?re que ce
soit le contenu. Si ce message vous a ?t? transmis par erreur, merci d'en
informer l'exp?diteur et de supprimer imm?diatement de votre syst?me
informatique ce courriel ainsi que tous les documents qui y sont attach?s."


                               ******

" This e-mail and any attached documents may contain confidential or
proprietary information. If you are not the intended recipient, you are
notified that any dissemination, copying of this e-mail and any attachments
thereto or use of their contents by any means whatsoever is strictly
prohibited. If you have received this e-mail in error, please advise the
sender immediately and delete this e-mail and all attached documents
from your computer system."
#
