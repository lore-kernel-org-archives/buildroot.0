From: Atharva Lele <itsatharva@gmail.com>
Date: Sat,  6 Jul 2019 12:25:01 +0530
Subject: [Buildroot] [PATCH v3] fs/tar: explicitly set extended header
 values to ensure binary reproducibility
Message-ID: <20190706065501.3959-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we use --xattrs-include='*' to include all extended attributes,
tar creates a PAX formatted archive. The archive metadata captures atime
and ctime of files. To fix this, GNU recommends that we pass this added
argument to tar to create binary reproducible packages. Setting of mtime
is handled in fs/common.mk using touch on all files.

Diffoscope output pre-change: https://gitlab.com/snippets/1871111
Diffoscope output after change is blank i.e. binary reproducibile rootfs
is created.

GNU Recommendation: https://www.gnu.org/software/tar/manual/tar.html#SEC147

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v2 -> v2:
  - Add comment (suggested by Peter)
  - Does not depend on BR2_REPRODUCIBLE since we don't need atime/ctime anyway
Changes v1 -> v2:
  - Added comment about mtime handling
---
 fs/tar/tar.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 4c6327ace8..393d01bfe8 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -8,6 +8,9 @@ TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 ROOTFS_TAR_DEPENDENCIES = $(BR2_TAR_HOST_DEPENDENCY)
 
+# do not store atime/ctime in PaxHeaders to ensure reproducbility
+TAR_OPTS += --pax-option=exthdr.name=%d/PaxHeaders/%f,atime:=0,ctime:=0
+
 define ROOTFS_TAR_CMD
 	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
 		tar $(TAR_OPTS) -cf $@ --null --xattrs-include='*' --no-recursion -T - --numeric-owner)
-- 
2.22.0
