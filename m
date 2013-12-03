From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2013 09:05:56 +0100
Subject: [Buildroot] [git commit] util-linux: add agetty->getty symlink
Message-ID: <20131203081319.ACD509BB77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a0b170a55126115d883f6cde9871e06a80f9cc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When busybox isn't installed symlink agetty->getty to make the default
inittab work.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0925ab3..20b3d35 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -112,6 +112,17 @@ endif
 
 UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
 
+# Install agetty->getty symlink to avoid breakage when there's no busybox
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
+ifeq ($(BR2_PACKAGE_BUSYBOX),)
+define UTIL_LINUX_GETTY_SYMLINK
+	ln -sf agetty $(TARGET_DIR)/sbin/getty
+endef
+endif
+endif
+
+UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_GETTY_SYMLINK
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
