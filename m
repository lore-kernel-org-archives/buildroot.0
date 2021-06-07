From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:53 -0000
Subject: [Buildroot] [git commit] package/wlroots: use libseat when available
Message-ID: <20210607144654.3E84D81191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22eebe4cde772754048aeabc629d676c9fd0099a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable using libseat for seat management when possible.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wlroots/wlroots.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index a20f6683a9..38ddba743d 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -22,7 +22,7 @@ WLROOTS_DEPENDENCIES = \
 	wayland \
 	wayland-protocols
 
-WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled -Dlibseat=disabled
+WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
 WLROOTS_DEPENDENCIES += ffmpeg
@@ -46,4 +46,11 @@ else
 WLROOTS_CONF_OPTS += -Dx11-backend=disabled -Dxwayland=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT),y)
+WLROOTS_CONF_OPTS += -Dlibseat=enabled
+WLROOTS_DEPENDENCIES += seatd
+else
+WLROOTS_CONF_OPTS += -Dlibseat=disabled
+endif
+
 $(eval $(meson-package))
