From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2015 23:47:53 +0100
Subject: [Buildroot] [git commit] package/skeleton: ensure custom skeleton
	uses merged /usr if needed
Message-ID: <20151110232250.4C91080E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08fc0a47e153735d54362823b8824988252c08d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using systemd, the policy in Buildroot is to use a merged /usr
(see c5bd8af6, "system: add options for /bin /sbin and /lib to be
symlinks into /usr" for more info). So, we apply a few tricks in some
packages to account for the merged /usr case.

However, when using a custom skeleton, we have no say in how that
skeleton is organised, so it may well have a split /usr. In that case,
our little tricks might not work as expected.

So, when the user uses a custom skeleton and wants systemd as an init
system, we must check that the custom skeleton is setup with a merged
/usr.

We do that by checking that each pair of {/lib,/usr/lib} {/bin,/usr/bin}
and {/sbin,/usr/sbin} have the same inode numbers, i.e. /lib must have
the same inode number as /usr/lib (and so on...). When a pair does not
share the same inode number, this is not a merged /usr and we abort.

We implement that check with make constructs, so it is done very early
in the build process, and we can abort early if need be.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton/skeleton.mk |   38 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 38391de..46e8cc4 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -14,7 +14,45 @@ SKELETON_SOURCE =
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
+
 SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
+
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+
+# Ensure the user has prepared a merged /usr.
+#
+# Extract the inode numbers for all of those directories. In case any is
+# a symlink, we want to get the inode of the pointed-to directory, so we
+# append '/.' to be sure we get the target directory. Since the symlinks
+# can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
+# all of them.
+#
+SKELETON_LIB_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/lib/.)
+SKELETON_BIN_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/bin/.)
+SKELETON_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/sbin/.)
+SKELETON_USR_LIB_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/usr/lib/.)
+SKELETON_USR_BIN_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/usr/bin/.)
+SKELETON_USR_SBIN_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/usr/sbin/.)
+
+ifneq ($(SKELETON_LIB_INODE),$(SKELETON_USR_LIB_INODE))
+SKELETON_CUSTOM_NOT_MERGED_USR += /lib
+endif
+ifneq ($(SKELETON_BIN_INODE),$(SKELETON_USR_BIN_INODE))
+SKELETON_CUSTOM_NOT_MERGED_USR += /bin
+endif
+ifneq ($(SKELETON_SBIN_INODE),$(SKELETON_USR_SBIN_INODE))
+SKELETON_CUSTOM_NOT_MERGED_USR += /sbin
+endif
+
+ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR),)
+$(error Use of systemd as an init system requires a merged /usr. \
+	However, the custom skeleton in $(SKELETON_PATH) is not \
+	using a merged /usr for the following directories: \
+	$(SKELETON_CUSTOM_NOT_MERGED_USR))
+endif
+
+endif # merged /usr
+
 else # ! custom skeleton
 
 SKELETON_PATH = system/skeleton
