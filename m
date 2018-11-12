From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Nov 2018 18:33:16 +0100
Subject: [Buildroot] [PATCH 6/6 v2] fs: make static device nodes creation
 more logical
In-Reply-To: <cover.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <ae80646fbb9d0e7f40434b16ebe5173ee3a4654c.1542043922.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the creation of the static device nodes is under a weird (but
correct) condition: it depends on whether a statice device table is
defined or not. Since that option already depend on static /dev
management, that is coorrect, even if not totally obvious at first sight.

Yet, the creation of the per-package static devices is conditional to
using a static /dev management, which is already implied by the
enclosing condition, as explained above.

However, there is still a gotcha: if doing static /dev management, but
using no static device table [0], then the per-package static devices
are not created.

Fix that by inverting the logic, with the outter condition being on
using a static /dev management, conditionng per-package devices to that,
and with the inner condition on static device tables only conditioning
the use of said device tables.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index d50698078b..ad9217bc78 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -62,10 +62,10 @@ ifneq ($(ROOTFS_USERS_TABLES),)
 endif
 
 	$(Q)touch $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
-ifneq ($(ROOTFS_STATIC_DEVICE_TABLES),)
-	cat $(ROOTFS_STATIC_DEVICE_TABLES) >> $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
+ifneq ($(ROOTFS_STATIC_DEVICE_TABLES),)
+	cat $(ROOTFS_STATIC_DEVICE_TABLES) >> $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
 endif
 endif
 
-- 
2.14.1
