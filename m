From: Atharva Lele <itsatharva@gmail.com>
Date: Tue,  2 Jul 2019 15:43:17 +0530
Subject: [Buildroot] [PATCH] fs/tar: explicitly set extended header values
 to ensure binary reproducibility
Message-ID: <20190702101317.18205-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we use --xattrs-include='*' to include all extended attributes,
tar creates a PAX formatted archive. The archive metadata captures atime
and ctime of files. To fix this, GNU recommends that we pass this added
argument to tar to create binary reproducible packages.

Diffoscope output pre-change: https://gitlab.com/snippets/1871111
Diffoscope output after change is blank i.e. binary reproducibile rootfs
is created.

GNU Recommendation: https://www.gnu.org/software/tar/manual/tar.html#SEC147

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 fs/tar/tar.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 4c6327ace8..f6d11baa84 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -8,6 +8,10 @@ TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 ROOTFS_TAR_DEPENDENCIES = $(BR2_TAR_HOST_DEPENDENCY)
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+TAR_OPTS += --pax-option=exthdr.name=%d/PaxHeaders/%f,atime:=0,ctime:=0
+endif
+
 define ROOTFS_TAR_CMD
 	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
 		tar $(TAR_OPTS) -cf $@ --null --xattrs-include='*' --no-recursion -T - --numeric-owner)
-- 
2.20.1
