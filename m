From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:35:36 +0200
Subject: [Buildroot] [git commit] package/refpolicy: enable systemd support
Message-ID: <20200705135158.5330186385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19063d043c11e40cd2fb3f66347fa84ecfc1b1d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch enables systemd support in the refpolicy by turning on the
'SYSTEMD' policy build option when systemd is enabled in Buildroot. This
enables conditional rules in SELinux policy modules (by defining
'init_systemd'), to better support systemd.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/refpolicy.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index a5716f5fce..9346649b2c 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -29,11 +29,18 @@ REFPOLICY_POLICY_VERSION = $(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION)
 REFPOLICY_POLICY_STATE = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+define REFPOLICY_CONFIGURE_SYSTEMD
+	$(SED) "/SYSTEMD/c\SYSTEMD = y" $(@D)/build.conf
+endef
+endif
+
 define REFPOLICY_CONFIGURE_CMDS
 	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
 		$(@D)/build.conf
 	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
 	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
+	$(REFPOLICY_CONFIGURE_SYSTEMD)
 endef
 
 define REFPOLICY_BUILD_CMDS
