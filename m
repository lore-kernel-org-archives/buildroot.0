From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 10 Nov 2020 11:02:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add optional systemd
 dependency
Message-ID: <20201110090204.1581432-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WPE WebKit 2.30.0 added an USE_SYSTEMD buil option, which needs to
be set to avoid CMake from trying to use systemd unconditionally.

Based on a similar patch for package/webkitgtk by Peter Seiderer.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 6233505ca7..6f83775e96 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -63,6 +63,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=ON
+WPEWEBKIT_DEPENDENCIES += systemd
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=OFF
+endif
+
 # JIT is not supported for MIPS r6, but the WebKit build system does not
 # have a check for these processors. The same goes for ARMv5 and ARMv6.
 # Disable JIT forcibly here and use the CLoop interpreter instead.
-- 
2.29.2
