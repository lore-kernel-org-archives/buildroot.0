From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Sep 2017 20:06:21 +0200
Subject: [Buildroot] [PATCH] package/libmad: don't install .pc in target
Message-ID: <20170928180621.24797-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We explicitly remove pkg-config files from target in the target-finalize
step, and our pkg-config looks for .pc files from staging, not target.

So, explicitly installing the .pc in target is useless.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libmad/libmad.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 0729b1e6d4..7175eaa30e 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -23,14 +23,8 @@ define LIBMAD_INSTALL_STAGING_PC
 		$(STAGING_DIR)/usr/lib/pkgconfig/mad.pc
 endef
 
-define LIBMAD_INSTALL_TARGET_PC
-	$(INSTALL) -D package/libmad/mad.pc \
-		$(TARGET_DIR)/usr/lib/pkgconfig/mad.pc
-endef
-
 LIBMAD_POST_PATCH_HOOKS += LIBMAD_PREVENT_AUTOMAKE
 LIBMAD_POST_INSTALL_STAGING_HOOKS += LIBMAD_INSTALL_STAGING_PC
-LIBMAD_POST_INSTALL_TARGET_HOOKS += LIBMAD_INSTALL_TARGET_PC
 
 LIBMAD_CONF_OPTS = \
 	--disable-debugging \
-- 
2.11.0
