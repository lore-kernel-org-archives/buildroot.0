From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 13:51:24 +0200
Subject: [Buildroot] [PATCH 09/10] infar/fs: introduce
 rootfs-foo-show-recursive-info
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <9a471617476e974c88477799ad526832515332a7.1554637858.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As for packages, recursively display the information for a filesystem
and its complete dependency tree.

Note that this does not generate a valid JSON blurb, as records are not
comma-separated. It is not trivial to do, so we leave this for later (or
as an exrecise to the user).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 2ec27e8e63..5b4e04e6bf 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -56,6 +56,9 @@ define ROOTFS_COMMON_SHOW_INFO
 endef
 
 .PHONY: rootfs-common-show-info
+.PHONY: rootfs-common-show-info rootfs-common-show-recursive-info
+rootfs-common-show-recursive-info: rootfs-common-show-info
+rootfs-common-show-recursive-info: $(patsubst %,%-show-recursive-info,$(ROOTFS_COMMON_DEPENDENCIES))
 rootfs-common-show-info:
 	@:
 	$(info { $(strip $(ROOTFS_COMMON_SHOW_INFO)) })
@@ -106,6 +109,9 @@ define ROOTFS_$(2)_SHOW_INFO
 endef
 
 .PHONY: rootfs-$(1)-show-info
+.PHONY: rootfs-$(1)-show-info rootfs-$(1)-show-recursive-info
+rootfs-$(1)-show-recursive-info: rootfs-$(1)-show-info
+rootfs-$(1)-show-recursive-info: $$(patsubst %,%-show-recursive-info,$$(ROOTFS_$(2)_DEPENDENCIES))
 rootfs-$(1)-show-info:
 	@:
 	$$(info { $$(strip $$(ROOTFS_$(2)_SHOW_INFO)) })
-- 
2.14.1
