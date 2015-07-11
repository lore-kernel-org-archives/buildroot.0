From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 09:29:17 +0200
Subject: [Buildroot] [git commit] squashfs: Add xattr support
Message-ID: <20150711073056.A14B880DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a409d76e8375fdc8db30e4009cb282ed96d790fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding extended attribute support for the squashfs tools when the attr
package is selected. This is needed for SELinux support.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squashfs/squashfs.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

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
