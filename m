From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:51:45 +0100
Subject: [Buildroot] [git commit] package/aufs: add support for linux 5.x
Message-ID: <20200226194103.C23508EA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2051060054ed0a15265206633c6249f9edff1464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.ext.in  | 9 ++++++++-
 package/aufs/aufs.mk | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 14140d352c..734a52a533 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -102,7 +102,8 @@ choice
 	help
 	  Select the major series of this version. This must match the
 	  major version of your kernel (e.g. for kernels 3.x, select
-	  aufs3.x; for kernels 4.x, select aufs4.x).
+	  aufs3.x; for kernels 4.x, select aufs4.x; for kernels 5.x,
+	  select aufs5.x ).
 
 	  Note: neither aufs1.x nor aufs2.x (both for kernels older than
 	  3.x) are supported.
@@ -113,12 +114,16 @@ config BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3
 config BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4
 	bool "aufs4.x"
 
+config BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5
+	bool "aufs5.x"
+
 endchoice
 
 config BR2_LINUX_KERNEL_EXT_AUFS_SERIES
 	int
 	default 3 if BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3
 	default 4 if BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4
+	default 5 if BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5
 
 config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
 	string "aufs-standalone version"
@@ -135,6 +140,8 @@ config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
 	  https://sourceforge.net/p/aufs/aufs3-standalone/ref/master/branches/
 	  For aufs4.x:
 	  https://github.com/sfjro/aufs4-standalone/branches/all
+	  For aufs5.x:
+	  https://github.com/sfjro/aufs5-standalone/branches/all
 
 endif # aufs
 
diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
index 55dbf942df..4e95a350a0 100644
--- a/package/aufs/aufs.mk
+++ b/package/aufs/aufs.mk
@@ -13,6 +13,8 @@ AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
 AUFS_SITE_METHOD = git
 else ifeq ($(BR2_PACKAGE_AUFS_SERIES),4)
 AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
+else ifeq ($(BR2_PACKAGE_AUFS_SERIES),5)
+AUFS_SITE = $(call github,sfjro,aufs5-standalone,$(AUFS_VERSION))
 endif
 
 ifeq ($(BR_BUILDING):$(BR2_PACKAGE_AUFS):$(AUFS_VERSION),y:y:)
