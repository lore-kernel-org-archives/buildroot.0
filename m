From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Jun 2010 21:41:32 +0200
Subject: [Buildroot] [git commit master] jffs2: let makedevs create device
	files
Message-ID: <20100605194211.AD40C12F56E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3754c51560b5d250b7f0283d1291fea1ec25c55c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The common filesystem infrastructure in fs/common.mk uses a smart
combination of makedevs and fakeroot to create the device files in the
target filesystem images without being root. This technique is applied
to all filesystem formats that rely on this common infrastructure, and
JFFS2 is one of them.

Therefore, using the -D option of mkfs.jffs2, which allows to specify
a device table, is redundant with the usage of makedevs. And it is
worst than redundant: for some reason, -D does not create all device
files with the correct major and minor numbers, as reported in
bug #1771.

For coherence, we just remove the usage of mkfs.jffs2 -D option, and
rely on makedevs/fakeroot to create the device files.

This commit fixes bug #1771.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES           |    1 +
 fs/jffs2/jffs2.mk |    4 ----
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6fddc14..a3a5203 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#1771: Fakeroot and the target/generic/device_table.txt create bad...
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
 
 2010.05, Released May 30th, 2010:
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
1.6.3.3
