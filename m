From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 22 Jan 2014 21:59:41 +0100
Subject: [Buildroot] [PATCH v2 5/5] fs/common.mk: add host-mkpasswd if
	PACKAGES_USERS is not empty
In-Reply-To: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
References: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390424381-6889-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using a custom rootfs skeleton, the host-mkpasswd target is not
automatically built, even if some packages add usersi (i.e. when
PACKAGES_USERS is not empty).

In this case, the rootfs generation may fail because the mkpasswd
provided by some distribution does not support all options used in the
mkusers script.

This patch avoids such a trouble by automatically adding the
host-mkpasswd package to the dependency list of the rootfs targets.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 fs/common.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index aa9d961..9f32620 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -37,7 +37,8 @@ USERS_TABLE = $(BUILD_DIR)/_users_table.txt
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
-ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs
+ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
+	$(if $(PACKAGES_USERS),host-mkpasswd)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
-- 
1.8.5.3
