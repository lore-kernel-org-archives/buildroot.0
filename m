From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Aug 2020 18:03:27 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: support hooks and
 tables in virtual packages
Message-ID: <20200902161639.E6A2085EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67249bc32e0c4a154727a9b4513c073a024d88c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Virtual packages are not built but it's useful to allow them to have
permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.

With this change we don't need to duplicate data as currently done in
eudev and systemd user tables, or test if the package is selected to add
a target-finalize hook as in luainterpreter.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c63807047b..3a4c5d5970 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -959,6 +959,7 @@ $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
 # Compute the name of the Kconfig option that correspond to the
 # package being enabled. We handle three cases: the special Linux
 # kernel case, the bootloaders case, and the normal packages case.
+# Virtual packages are handled separately (see below).
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
 else ifneq ($$(filter boot/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/boot/%),$(pkgdir)),)
@@ -1151,6 +1152,22 @@ ifneq ($$($(2)_HELP_CMDS),)
 HELP_PACKAGES += $(2)
 endif
 
+# Virtual packages are not built but it's useful to allow them to have
+# permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.
+else ifeq ($$(BR2_PACKAGE_HAS_$(2)),y) # $(2)_KCONFIG_VAR
+
+ifneq ($$($(2)_PERMISSIONS),)
+PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
+endif
+ifneq ($$($(2)_DEVICES),)
+PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
+endif
+ifneq ($$($(2)_USERS),)
+PACKAGES_USERS += $$($(2)_USERS)$$(sep)
+endif
+TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
+ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
+
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
 
