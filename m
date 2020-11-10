From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 23:19:19 +0100
Subject: [Buildroot] [git commit branch/next] package/wpewebkit: add
 optional systemd dependency
Message-ID: <20201117203827.847F07FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b98934170eaf6b5e4417341e9f6a0e4df9832840
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

WPE WebKit 2.30.0 added an USE_SYSTEMD buil option, which needs to
be set to avoid CMake from trying to use systemd unconditionally.

Based on a similar patch for package/webkitgtk by Peter Seiderer.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
