From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:55:34 +0100
Subject: [Buildroot] [git commit] fs/tar: make results reproducible
Message-ID: <20161201222139.233737FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59f9c4ca9feb2c070df508c7196f06a6e87307b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to make tar images reproducible, force files order in tarball.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/tar/tar.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 11c69c5..b14c977 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -7,7 +7,8 @@
 TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 define ROOTFS_TAR_CMD
-	tar $(TAR_OPTS) -cf $@ --numeric-owner -C $(TARGET_DIR) .
+	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
+		tar $(TAR_OPTS) -cf $@ --null -T - --no-recursion --numeric-owner)
 endef
 
 $(eval $(call ROOTFS_TARGET,tar))
