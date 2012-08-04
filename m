From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat,  4 Aug 2012 21:11:01 +0100
Subject: [Buildroot] [PATCH v2] sudo: fix main executable permissions
Message-ID: <1344111062-4616-1-git-send-email-spdawson@gmail.com>
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
 v2: Use generic package permissions mechanism, as suggested by Thomas
 Petazzoni

 package/sudo/sudo.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9b0ebed..15e06fa 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -14,4 +14,8 @@ SUDO_CONF_OPT = \
 		--without-interfaces \
 		--without-pam
 
+define SUDO_PERMISSIONS
+/usr/bin/sudo			 f 4755	0 0 - - - - -
+endef
+
 $(eval $(autotools-package))
-- 
1.7.9.5
