From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:50 -0000
Subject: [Buildroot] [git commit branch/next] e2fsprogs: remove busybox
	tune2fs when installing full version
Message-ID: <20150808105639.8B49F803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa02829240b2927b2cb379eb904b6f40ff751237
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, busybox installs a version of tune2fs in /sbin/ while
e2fsprogs installs at /usr/sbin/. This causes issues if a user is
expecting the to use the full version from a prompt via 'tune2fs'
since busybox's tune2fs will be found first from the default path
search.

Fix this by removing the busybox version of tune2fs when a user has
selected the option to install tune2fs from e2fsprogs.

[Thomas: don't hijack E2FSPROGS_TARGET_TUNE2FS_SYMLINK for the removal
and instead introduce a separate E2FSPROGS_REMOVE_BUSYBOX_APPLETS post
install target hook, and do related code re-organization.]

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 0537521..ca54b70 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -102,6 +102,20 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_E2FSCK_SYMLINKS
 endif
 
+# Remove busybox tune2fs and e2label, since we want the e2fsprogs full
+# blown variants to take precedence, but they are not installed in the
+# same location.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+E2FSPROGS_DEPENDENCIES += busybox
+
+define E2FSPROGS_REMOVE_BUSYBOX_APPLETS
+	$(RM) -f $(TARGET_DIR)/sbin/tune2fs
+	$(RM) -f $(TARGET_DIR)/sbin/e2label
+
+endef
+E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
+endif
+
 define E2FSPROGS_TARGET_TUNE2FS_SYMLINK
 	ln -sf e2label $(TARGET_DIR)/usr/sbin/tune2fs
 endef
