From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 18 Nov 2016 16:24:27 +0100
Subject: [Buildroot] [PATCH 2/2] e2fsprogs: keep util-linux's fsck if chosen
In-Reply-To: <20161118152427.16515-1-maxime.hadjinlian@gmail.com>
References: <20161118152427.16515-1-maxime.hadjinlian@gmail.com>
Message-ID: <20161118152427.16515-2-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since e2fsprogs depends on util-linux, it's build after it. It means
that if you want the fsck wrapper from util-linux (which is better
maintained and you are sure that it's compatible with systemd) and you
want e2fsck, it won't work.

Because of the merge of /usr/bin and /bin, we end up deleting the fsck
from util-linux.

This makes an attempt at fixing the issues.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
I am cleary not satisfied by the way I handled that, I am not even sure
it works in all cases. I can't spend much more time on this right now,
so I need advice/help from the community to fix that in a proper/generic
manner.
---
 package/e2fsprogs/e2fsprogs.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index b01336a..97efc9f 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -75,7 +75,11 @@ E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2LABEL) += usr/sbin/e2label
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2UNDO) += usr/sbin/e2undo
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E4DEFRAG) += usr/sbin/e4defrag
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FILEFRAG) += usr/sbin/filefrag
+# don't delete util-linux's fsck if it was selected by the user, especially
+# since e2fsprogs depend's on util-linux.
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_FSCK),)
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FSCK) += usr/sbin/fsck
+endif
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LOGSAVE) += usr/sbin/logsave
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LSATTR) += usr/bin/lsattr
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += usr/sbin/mke2fs
@@ -135,11 +139,17 @@ E2FSPROGS_DEPENDENCIES += busybox
 define E2FSPROGS_REMOVE_BUSYBOX_APPLETS
 	$(RM) -f $(TARGET_DIR)/bin/chattr
 	$(RM) -f $(TARGET_DIR)/bin/lsattr
-	$(RM) -f $(TARGET_DIR)/sbin/fsck
 	$(RM) -f $(TARGET_DIR)/sbin/tune2fs
 	$(RM) -f $(TARGET_DIR)/sbin/e2label
 endef
 E2FSPROGS_PRE_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
+
+# don't delete util-linux's fsck if it was selected by the user, especially
+# since e2fsprogs depend's on util-linux.
+# It's especially true with the merged /usr when you want to use systemd.
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_FSCK),)
+	E2FSPROGS_REMOVE_BUSYBOX_APPLETS += $(RM) -f $(TARGET_DIR)/sbin/fsck
+endif
 endif
 
 define E2FSPROGS_TARGET_TUNE2FS_SYMLINK
-- 
2.10.2
