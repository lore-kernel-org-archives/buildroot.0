From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Jun 2010 17:18:40 +0200
Subject: [Buildroot] [PATCH 1/1] jffs2: let makedevs create device files
In-Reply-To: <cover.1275751113.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275751113.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5682fe13ee493517e0d0007caa2f61ed676f2789.1275751113.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The common filesystem infrastructure in fs/common.mk uses a smart
combination of makedevs and fakeroot to create the device files in the
target filesystem images without being root. This technique is applied
to all filesystem formats that rely on this common infrastructure, and
JFFS2 is one of them.

Therefore, using the -D option of mkfs.jffs2, which allows to specify
a device table, is redundant with the usage of makedevs. And it is
worst than redundant: for some reason, -D does not create all device
files with the correct major and minor numbers, as reported in bug

For coherence, we just remove the usage of mkfs.jffs2 -D option, and
rely on makedevs/fakeroot to create the device files.

This commit fixes bug #1771.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/jffs2/jffs2.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index 36be037..fd5da0c 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -32,10 +32,6 @@ JFFS2_OPTS += -n
 SUMTOOL_OPTS += -n
 endif
 
-ifneq ($(ROOTFS_DEVICE_TABLE),)
-JFFS2_OPTS += -D $(ROOTFS_DEVICE_TABLE)
-endif
-
 ROOTFS_JFFS2_DEPENDENCIES = host-mtd
 
 ifneq ($(BR2_TARGET_ROOTFS_JFFS2_SUMMARY),)
-- 
1.7.0.4
