From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:30 +0200
Subject: [Buildroot] [PATCH 05/15] package/refpolicy: allow packages to
 select SELinux modules
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-6-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for packages to enable SELinux modules already supported by
the refpolicy, but not selected by default in its policy.

With this commit, packages will be able to do something like:

SYSTEMD_SELINUX_MODULES = systemd udev

to enable additional SELinux modules.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/pkg-generic.mk         | 4 ++++
 package/refpolicy/refpolicy.mk | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c63807047b29..71d6357836f0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1088,6 +1088,10 @@ TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
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
index 0ce83d2cbdcb..c29912a53b0b 100644
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
-- 
2.26.2
