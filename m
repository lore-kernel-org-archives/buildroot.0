From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 22:16:03 +0100
Subject: [Buildroot] [git commit] gpsd: adjust udev rules file permissions
Message-ID: <20151105214448.BB06F81ED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0524136e3d14a7d61c002606752b55b414b73447
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust a generated udev rule file (25-gpsd.rules) to have user write
permissions. This is to prevent rebuild issues when the gpsd package
fails to re-install on a target (since the `cp` of the rule file will
fail due to permissions).

[Thomas: minor tweaks to code comments and commit title.]

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 577b43c..87911c3 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -217,6 +217,8 @@ define GPSD_INSTALL_STAGING_CMDS
 		install)
 endef
 
+# After installing the udev rule, make it writable so that this
+# package can be re-built/re-installed.
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 define GPSD_INSTALL_UDEV_RULES
 	(cd $(@D); \
@@ -225,6 +227,7 @@ define GPSD_INSTALL_UDEV_RULES
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		udev-install)
+	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
 endef
 
 GPSD_POST_INSTALL_TARGET_HOOKS += GPSD_INSTALL_UDEV_RULES
