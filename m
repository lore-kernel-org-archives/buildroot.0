From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2015 23:47:14 +0100
Subject: [Buildroot] [git commit] package/skeleton: don't handle merged /usr
	for custom skeleton
Message-ID: <20151110232250.3BA9F81E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aab5a2829be17bf7d5472c480ccfee9842763dc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case the user wants to use a custom skeleton, we should not try to
handle the symlinks (resp. mkdir) to handle merged (resp. split) /usr.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton/skeleton.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 11a609b..38391de 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -15,9 +15,9 @@ SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
-else
+else # ! custom skeleton
+
 SKELETON_PATH = system/skeleton
-endif
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 define SKELETON_USR_SYMLINKS_OR_DIRS
@@ -33,6 +33,8 @@ define SKELETON_USR_SYMLINKS_OR_DIRS
 endef
 endif
 
+endif # ! custom skeleton
+
 define SKELETON_INSTALL_TARGET_CMDS
 	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
