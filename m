From: unixmania at gmail.com <unixmania@gmail.com>
Date: Wed, 30 Oct 2019 10:27:57 -0300
Subject: [Buildroot] [PATCH RFC 1/3] package/pkg-generic.mk: support hooks
 and tables in virtual packages
In-Reply-To: <20191030132759.8643-1-unixmania@gmail.com>
References: <20191030132759.8643-1-unixmania@gmail.com>
Message-ID: <20191030132759.8643-2-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Virtual packages are not built but it's useful to allow them to have
permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.

With this change we don't need to replicate date as currently done in
eudev and systemd user tables or test if the package is selected to add
a target-finalize hook as in luainterpreter.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/pkg-generic.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 893faba22a..7b3f1646ae 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -930,6 +930,7 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 # Compute the name of the Kconfig option that correspond to the
 # package being enabled. We handle three cases: the special Linux
 # kernel case, the bootloaders case, and the normal packages case.
+# Virtual packages are handled separately (see below).
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
 else ifneq ($$(filter boot/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/boot/%),$(pkgdir)),)
@@ -1118,6 +1119,22 @@ ifneq ($$($(2)_HELP_CMDS),)
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
 
-- 
2.18.1
