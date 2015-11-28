From: David du Colombier <0intro@gmail.com>
Date: Sat, 28 Nov 2015 22:17:30 +0100
Subject: [Buildroot] [PATCH 1/1] coreutils: disable stdbuf for static builds
Message-ID: <1448745450-19283-1-git-send-email-0intro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When stdbuf is enabled, it builds a shared library,
but it will fail in a static-only scenario.

Signed-off-by: David du Colombier <0intro@gmail.com>
---
 package/coreutils/coreutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 60455ac..d8e2ee6 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -109,6 +109,10 @@ endef
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
+endif
+
 define COREUTILS_CLEANUP
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
-- 
2.4.3
