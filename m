From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 17:06:46 +0200
Subject: [Buildroot] [git commit] swupdate: provide sensible error message
	if no config file is specified
Message-ID: <20151003150921.927D4801E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6d1848c89afd0001b5419f5f1e8983c6cf83b91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we do it for the other kconfig packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 86bbf14..9338fc8 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -103,4 +103,12 @@ define SWUPDATE_INSTALL_TARGET_CMDS
 		cp -dpf $(@D)/www/* $(TARGET_DIR)/var/www/swupdate)
 endef
 
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR2_PACKAGE_SWUPDATE)$(BR_BUILDING),yy)
+ifeq ($(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG)),)
+$(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDATE_CONFIG setting)
+endif
+endif
+
 $(eval $(kconfig-package))
