From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 10:52:20 +0200
Subject: [Buildroot] [git commit] package/refpolicy: allow packages to
 select SELinux modules
Message-ID: <20200904123951.9844F87D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0228f521d637ec374546196e77db38361312f466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for packages to enable SELinux modules already supported by
the refpolicy, but not selected by default in its policy.

With this commit, packages will be able to do something like:

SYSTEMD_SELINUX_MODULES = systemd udev

to enable additional SELinux modules.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk         | 4 ++++
 package/refpolicy/refpolicy.mk | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3a4c5d5970..7b6a08b016 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1089,6 +1089,10 @@ TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
 KEEP_PYTHON_PY_FILES += $$($(2)_KEEP_PY_FILES)
 
+ifneq ($$($(2)_SELINUX_MODULES),)
+PACKAGES_SELINUX_MODULES += $$($(2)_SELINUX_MODULES)
+endif
+
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
 else ifeq ($$($(2)_SITE_METHOD),git)
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 0ce83d2cbd..c29912a53b 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -45,13 +45,14 @@ REFPOLICY_MODULES = \
 	sysadm \
 	sysnetwork \
 	unconfined \
-	userdomain
+	userdomain \
+	$(PACKAGES_SELINUX_MODULES)
 
 # In the context of a monolithic policy enabling a piece of the policy as
 # 'base' or 'module' is equivalent, so we enable them as 'base'.
 define REFPOLICY_CONFIGURE_MODULES
 	$(SED) "s/ = module/ = no/g" $(@D)/policy/modules.conf
-	$(foreach m,$(REFPOLICY_MODULES),
+	$(foreach m,$(sort $(REFPOLICY_MODULES)),
 		$(SED) "/^$(m) =/c\$(m) = base" $(@D)/policy/modules.conf
 	)
 endef
