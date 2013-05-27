From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 May 2013 12:36:42 +0200
Subject: [Buildroot] [PATCH 2/4] target: ensure target/ dir is writable
In-Reply-To: <cover.1369650924.git.yann.morin.1998@free.fr>
References: <cover.1369650924.git.yann.morin.1998@free.fr>
Message-ID: <5bc29f5d47813a98ecd0213cd1312761056e713c.1369650924.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathan Lynch <ntl@pobox.com>

If the source target skeleton is read-only (eg. because Buildroot's
source dir is), modifications to the output target (such as creating
/etc/hostname and /etc/issue) fail.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: we use rsync now, not cp; --chmod=Du+w
 suggested by Arnout; clarify commit log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e8647d1..2a62a65 100644
--- a/Makefile
+++ b/Makefile
@@ -431,7 +431,7 @@ endif
 
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-	rsync -a \
+	rsync -a --chmod=Du+w \
 		--exclude .empty --exclude .svn --exclude .git \
 		--exclude .hg --exclude=CVS --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
@@ -507,7 +507,7 @@ endif
 
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a \
+		rsync -a --chmod=Du+w \
 			--exclude .empty --exclude .svn --exclude .git \
 			--exclude .hg --exclude=CVS --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
-- 
1.8.1.2
