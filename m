From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:02:59 +0100
Subject: [Buildroot] [git commit] fs/tar: only store numeric uid/gid
Message-ID: <20150302222719.8E001807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66ee6dc8721ce8746a8352f02f52663b90887c63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a target user is asigned a UID (e.g. 1000) that happens to also exist
on the build machine, tar will happily store the username for that user.

This can be seen by some as potential information disclosure.

Instruct tar to just store the numeric uid/gid.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/tar/tar.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
