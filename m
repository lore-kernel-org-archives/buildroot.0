From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 21:25:23 +0100
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: add
 optional systemd dependency
Message-ID: <20201117203827.6B78A7FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9eded3afc3c3459edc7d7cab7ff143b43716c13b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- systemd support/USE_SYSTEMD option was added since 2.30.0,
  so add an optional dependency

Fixes:

  -- Could NOT find Systemd (missing: Systemd_LIBRARY Systemd_INCLUDE_DIR)
  CMake Error at Source/cmake/OptionsGTK.cmake:425 (message):
    libsystemd is needed for USE_SYSTEMD

Reported-by: C Larbi <pkl2000us@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 5209eeed2d..84078f8b9a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -104,6 +104,13 @@ else
 WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+WEBKITGTK_CONF_OPTS += -DUSE_SYSTEMD=ON
+WEBKITGTK_DEPENDENCIES += systemd
+else
+WEBKITGTK_CONF_OPTS += -DUSE_SYSTEMD=OFF
+endif
+
 # JIT is not supported for MIPS r6, but the WebKit build system does not
 # have a check for these processors. The same goes for ARMv5 and ARMv6.
 # Disable JIT forcibly here and use the CLoop interpreter instead.
