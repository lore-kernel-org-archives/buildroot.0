From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Dec 2013 07:49:26 -0300
Subject: [Buildroot] [PATCH 3/5] util-linux: add agetty->getty symlink
In-Reply-To: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1385981368-2235-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When busybox isn't installed symlink agetty->getty to make the default
inittab work.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/util-linux.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

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
 
-- 
1.8.3.2
