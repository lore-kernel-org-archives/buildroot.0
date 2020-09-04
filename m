From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 10:51:38 +0200
Subject: [Buildroot] [git commit] package/refpolicy: smaller monolithic
 policy
Message-ID: <20200904123951.9010E87D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11a7a0af2a3f8b3e4c8c903522f501a90c09ba8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The refpolicy is configured to use a monolithic build, compiling all the
available modules (whether they're 'base' or 'modules' ones) in the
binary policy. The result is a quite big SELinux policy, with a lot more
rules than what would be needed in a Buildroot image.

Refactor the refpolicy build configuration to enable less modules by
default. To achieve this, all the modules marked as being part of the
'base' policy are kept but all the modules marked as being only
'modules' are disabled. Then a static list of modules (in addition to
the already selected 'base' ones) are enabled. The result is a much
smaller refpolicy: tests showed a reduction of the binary policy from
2.4M to 249K (~90% smaller).

This minimal set of SELinux modules should allow to boot a system in
enforcing mode in the future. It currently does not work, not because
extra modules are needed, but because of required changes within the
selected modules.

This patch would break backward compatibility as the refpolicy will no
longer have all the modules provided by the project, but only those
selected. This should not be an issue as this configuration was not
suitable directly for a real system. Modifications had to be done. If we
still find out later that this is an issue for someone, we'll have the
ability to mimic what was done previously thanks to other mechanisms
(such as providing the upstream policy as a "custom" policy location).

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/refpolicy.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 9346649b2c..0ce83d2cbd 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -29,6 +29,33 @@ REFPOLICY_POLICY_VERSION = $(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION)
 REFPOLICY_POLICY_STATE = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
+REFPOLICY_MODULES = \
+	application \
+	authlogin \
+	getty \
+	init \
+	libraries \
+	locallogin \
+	logging \
+	miscfiles \
+	modutils \
+	mount \
+	selinuxutil \
+	storage \
+	sysadm \
+	sysnetwork \
+	unconfined \
+	userdomain
+
+# In the context of a monolithic policy enabling a piece of the policy as
+# 'base' or 'module' is equivalent, so we enable them as 'base'.
+define REFPOLICY_CONFIGURE_MODULES
+	$(SED) "s/ = module/ = no/g" $(@D)/policy/modules.conf
+	$(foreach m,$(REFPOLICY_MODULES),
+		$(SED) "/^$(m) =/c\$(m) = base" $(@D)/policy/modules.conf
+	)
+endef
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 define REFPOLICY_CONFIGURE_SYSTEMD
 	$(SED) "/SYSTEMD/c\SYSTEMD = y" $(@D)/build.conf
@@ -45,6 +72,7 @@ endef
 
 define REFPOLICY_BUILD_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) bare conf
+	$(REFPOLICY_CONFIGURE_MODULES)
 endef
 
 define REFPOLICY_INSTALL_STAGING_CMDS
