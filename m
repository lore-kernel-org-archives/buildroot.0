From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Sun,  6 Apr 2014 09:48:20 +0200
Subject: [Buildroot] [PATCH 1/2] rootfs-gzip: use host-gzip instead of local
	gzip
In-Reply-To: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
References: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <1396770501-9443-2-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
---
 fs/common.mk         |    3 ++-
 package/gzip/gzip.mk |    3 +++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index d95c26b..57bcd2d 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -41,8 +41,9 @@ ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
 	$(if $(PACKAGES_USERS),host-mkpasswd)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
+ROOTFS_$(2)_DEPENDENCIES += host-gzip
 ROOTFS_$(2)_COMPRESS_EXT = .gz
-ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = $$(GZIP) -9 -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
 ROOTFS_$(2)_COMPRESS_EXT = .bz2
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index e1a7bef..ced6485 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -11,3 +11,6 @@ GZIP_LICENSE = GPLv3+
 GZIP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
+GZIP = $(HOST_DIR)/usr/bin/gzip
-- 
1.7.4.4
