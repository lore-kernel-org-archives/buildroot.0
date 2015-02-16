From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Feb 2015 18:49:16 +0100
Subject: [Buildroot] [PATCH] fs/tar: only store numeric uid/gid
Message-ID: <1424108956-18100-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a target user is asigned a UID (e.g. 1000) that happens to also exist
on the build machine, tar will happily store the username for that user.

This can be seen by some as potential information disclosure.

Instruct tar to just store the numeric uid/gid.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Yes, there are so many other locations where we may have such
information disclosure. But this one is pretty easy to fix.
---
 fs/tar/tar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 780827e..28219cf 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -7,7 +7,7 @@
 TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 define ROOTFS_TAR_CMD
-	tar -c$(TAR_OPTS)f $@ -C $(TARGET_DIR) .
+	tar -c$(TAR_OPTS)f $@ --numeric-owner -C $(TARGET_DIR) .
 endef
 
 $(eval $(call ROOTFS_TARGET,tar))
-- 
1.9.1
