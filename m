From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Apr 2019 21:47:29 +0200
Subject: [Buildroot] [PATCH 07/12 v3] fs: introduce variable with all
 recursive dependencies
In-Reply-To: <cover.1555357644.git.yann.morin.1998@free.fr>
References: <cover.1555357644.git.yann.morin.1998@free.fr>
Message-ID: <4a975afb747616fde0c2cd41ffd0c4ce3b200113.1555357644.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows getting all the recursive dependencies of filesystems,
ike we have for packages, and allows us to treat both in a similar
fashion.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 fs/common.mk | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 286d671d06..5ec28ca183 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -49,6 +49,18 @@ ROOTFS_COMMON_DEPENDENCIES = \
 	$(BR2_TAR_HOST_DEPENDENCY) \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
+ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES = $(sort \
+	$(if $(filter undefined,$(origin ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES__X)), \
+		$(eval ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES__X := \
+			$(foreach p, \
+				$(ROOTFS_COMMON_DEPENDENCIES), \
+				$(p) \
+				$($(call UPPERCASE,$(p))_FINAL_RECURSIVE_DEPENDENCIES) \
+			) \
+		) \
+	) \
+	$(ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES__X))
+
 rootfs-common-show-dependency-tree: $(patsubst %,%-show-dependency-tree,$(ROOTFS_COMMON_DEPENDENCIES))
 	$(info rootfs-common: host)
 	$(info rootfs-common -> $(foreach d,$(ROOTFS_COMMON_DEPENDENCIES),$(d)))
@@ -88,6 +100,18 @@ ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
 
 ROOTFS_$(2)_DEPENDENCIES += rootfs-common
 
+ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES = $$(sort \
+	$$(if $$(filter undefined,$$(origin ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES__X)), \
+		$$(eval ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES__X := \
+			$$(foreach p, \
+				$$(ROOTFS_$(2)_DEPENDENCIES), \
+				$$(p) \
+				$$($$(call UPPERCASE,$$(p))_FINAL_RECURSIVE_DEPENDENCIES) \
+			) \
+		) \
+	) \
+	$$(ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES__X))
+
 rootfs-$(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$(ROOTFS_$(2)_DEPENDENCIES))
 	$$(info rootfs-$(1): host)
 	$$(info rootfs-$(1) -> $$(foreach d,$$(ROOTFS_$(2)_DEPENDENCIES),$$(d)))
-- 
2.14.1
