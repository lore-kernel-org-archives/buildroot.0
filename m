From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 22:08:28 +0100
Subject: [Buildroot] [git commit] fs/common.mk: add host-mkpasswd if
	PACKAGES_USERS is not empty
Message-ID: <20140122210913.B2F979C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22cdb652f51f08c52a87f66da49036eecdf68e8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using a custom rootfs skeleton, the host-mkpasswd target is not
automatically built, even if some packages add users (i.e. when
PACKAGES_USERS is not empty).

In this case, the rootfs generation may fail because the mkpasswd
provided by some distribution does not support all options used in the
mkusers script.

This patch avoids such trouble by automatically adding the host-mkpasswd
package to the dependency list of the rootfs targets if users needs
to be created.

[Peter: minor rewording of commit message]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
