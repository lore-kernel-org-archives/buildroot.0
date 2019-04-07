From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 13:51:23 +0200
Subject: [Buildroot] [PATCH 08/10] infra/fs: introduce rootfs-foo-show-info
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <c84f4afccf1a83002880ca9977861e6b060d06aa.1554637858.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similarly to what we introduced for packages, do the same for
filesystems.

This will be usefull later, when we are able to dump the complete
information for a configuration, by also reporting information
about packages that are dependencies for filesystems.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 4ad51fdd0a..2ec27e8e63 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -47,6 +47,19 @@ ROOTFS_COMMON_DEPENDENCIES = \
 	$(BR2_TAR_HOST_DEPENDENCY) \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
+define ROOTFS_COMMON_SHOW_INFO
+	"name": "rootfs-common", \
+	"type": "rootfs", \
+	"depends on": [ \
+		$(call make-comma-list,$(ROOTFS_COMMON_DEPENDENCIES)) \
+	]
+endef
+
+.PHONY: rootfs-common-show-info
+rootfs-common-show-info:
+	@:
+	$(info { $(strip $(ROOTFS_COMMON_SHOW_INFO)) })
+
 rootfs-common-show-dependency-tree: $(patsubst %,%-show-dependency-tree,$(ROOTFS_COMMON_DEPENDENCIES))
 	$(info rootfs-common: host)
 	$(info rootfs-common -> $(foreach d,$(ROOTFS_COMMON_DEPENDENCIES),$(d)))
@@ -84,6 +97,19 @@ ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
 
 ROOTFS_$(2)_DEPENDENCIES += rootfs-common
 
+define ROOTFS_$(2)_SHOW_INFO
+	"name": "rootfs-$(1)", \
+	"type": "rootfs", \
+	"depends on": [ \
+		$$(call make-comma-list,$$(ROOTFS_$(2)_DEPENDENCIES)) \
+	]
+endef
+
+.PHONY: rootfs-$(1)-show-info
+rootfs-$(1)-show-info:
+	@:
+	$$(info { $$(strip $$(ROOTFS_$(2)_SHOW_INFO)) })
+
 rootfs-$(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$(ROOTFS_$(2)_DEPENDENCIES))
 	$$(info rootfs-$(1): host)
 	$$(info rootfs-$(1) -> $$(foreach d,$$(ROOTFS_$(2)_DEPENDENCIES),$$(d)))
-- 
2.14.1
