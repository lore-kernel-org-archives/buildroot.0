From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  3 Aug 2012 13:48:31 +0100
Subject: [Buildroot] [PATCH] sudo: fix main executable permissions
Message-ID: <1343998111-15331-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The sudo executable is installed without the setuid bit set, which prevents
sudo from working.

This patch adds a post-install hook to fix the permissions of the sudo
executable.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sudo/sudo.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9b0ebed..542edb6 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -14,4 +14,10 @@ SUDO_CONF_OPT = \
 		--without-interfaces \
 		--without-pam
 
+define SUDO_FIX_PERMISSIONS
+  chmod 4755 $(TARGET_DIR)/usr/bin/sudo
+endef
+
+SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_FIX_PERMISSIONS
+
 $(eval $(autotools-package))
-- 
1.7.9.5
