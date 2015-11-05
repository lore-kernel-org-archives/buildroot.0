From: James Knight <james.knight@rockwellcollins.com>
Date: Thu,  5 Nov 2015 13:41:53 -0500
Subject: [Buildroot] [PATCH v2 2/3] gpsd: cleanup udev rule permissions
In-Reply-To: <1446748914-12628-1-git-send-email-james.knight@rockwellcollins.com>
References: <1446748914-12628-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1446748914-12628-2-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjust a generated udev rule file (25-gpsd.rules) to have user write
permissions. This is to prevent rebuild issues when the gpsd package
fails to re-install on a target (since the `cp` of the rule file will
fail due to permissions).

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v1 -> v2:
  - Package change introduced in change set 2.
---
 package/gpsd/gpsd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 577b43c..5a369b0 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -217,6 +217,8 @@ define GPSD_INSTALL_STAGING_CMDS
 		install)
 endef
 
+# When adding udev rules, ensure rules are writable to prevent rebuild
+# issues.
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 define GPSD_INSTALL_UDEV_RULES
 	(cd $(@D); \
@@ -225,6 +227,8 @@ define GPSD_INSTALL_UDEV_RULES
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		udev-install)
+
+	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
 endef
 
 GPSD_POST_INSTALL_TARGET_HOOKS += GPSD_INSTALL_UDEV_RULES
-- 
1.9.5.msysgit.1
