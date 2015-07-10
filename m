From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 19:34:21 +0200
Subject: [Buildroot] [git commit] package/e2fsprogs: make /sbin/fsck
	available
Message-ID: <20150710173436.8C00081917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a93fc3455a46ba118a332fcda17809a14d020f60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd looks for fsck in /sbin, so make symlink:
/sbin/fsck -> /usr/sbin/fsck

[Thomas: add comment.]

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e0c4ee2..0537521 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -118,5 +118,14 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FINDFS_SYMLINK
 endif
 
+# systemd really wants to have fsck in /sbin
+define E2FSPROGS_TARGET_FSCK_SYMLINK
+	ln -sf ../usr/sbin/fsck $(TARGET_DIR)/sbin/fsck
+endef
+
+ifeq ($(BR2_PACKAGE_E2FSPROGS_FSCK),y)
+E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FSCK_SYMLINK
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
