From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] at: convert old-style hook to
	new-style hook
Message-ID: <20100916113827.A4F388AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0fe621d1ded3611958b29f8a7a7ffd7ba9fdf685
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/at/at.mk |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 57b7847..3799790 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -21,14 +21,13 @@ AT_CONF_OPT = \
         --with-daemon_groupname=root \
 	SENDMAIL=/usr/sbin/sendmail
 
-$(eval $(call AUTOTARGETS,package,at))
-
-$(AT_HOOK_POST_INSTALL): $(AT_TARGET_INSTALL_TARGET)
+define AT_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
-	touch $@
+endef
+
+AT_POST_INSTALL_TARGET_HOOKS += AT_INSTALL_INITSCRIPT
 
-$(AT_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define AT_UNINSTALL_TARGET_CMDS
 	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/atspool \
 					 /usr/lib/atjobs \
 					 /etc/at.deny \
@@ -40,4 +39,6 @@ $(AT_TARGET_UNINSTALL):
 					 /usr/sbin/atrun)
 	rm -f $(addprefix $(TARGET_DIR)/usr/man/man*/, \
 		at.1 atq.1 atrm.1 batch.1 at_allow.5 at_deny.5 atd.8 atrun.8)
-	rm -f $(AT_TARGET_INSTALL_TARGET) $(AT_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,at))
-- 
1.7.1
