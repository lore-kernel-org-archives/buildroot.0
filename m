From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 18:28:00 -0500
Subject: [Buildroot] [PATCH v8 14/16] squashfs: Add xattr support
In-Reply-To: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1436570882-56442-15-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding extended attribute support for the squashfs tools when the attr
package is selected. This is needed for SELinux support.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

---
Changes v7 -> v8:
  - Reverted changes to the host build options to leave xattr support
    disabled due to too many host system dependencies issues.
  - Cleaned up the target xattr options and added a dependency on attr
    to ensure it is built before squashfs (Suggested by Thomas P.)

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes
---
 package/squashfs/squashfs.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 8ca9e2e..3204d05 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -10,8 +10,12 @@ SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squas
 SQUASHFS_LICENSE = GPLv2+
 SQUASHFS_LICENSE_FILES = COPYING
 
-# no libattr in BR
-SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
+ifeq ($(BR2_PACKAGE_ATTR),y)
+SQUASHFS_DEPENDENCIES += attr
+SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=1
+else
+SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=0
+endif
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
 SQUASHFS_DEPENDENCIES += lz4
-- 
1.9.1
