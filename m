From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 12:08:04 +0100
Subject: [Buildroot] [PATCH v3 04/18] fs/tar: make results reproducible
In-Reply-To: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
References: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479899298-14655-5-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to make tar images reproducible, force files order in tarball.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 fs/tar/tar.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 11c69c5..70dc454 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -7,7 +7,8 @@
 TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 define ROOTFS_TAR_CMD
-	tar $(TAR_OPTS) -cf $@ --numeric-owner -C $(TARGET_DIR) .
+	( cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
+		tar $(TAR_OPTS) -cf $@ --null -T - --no-recursion --numeric-owner )
 endef
 
 $(eval $(call ROOTFS_TARGET,tar))
-- 
1.9.1
