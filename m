From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 16:54:22 +0300
Subject: [Buildroot] [PATCH v2 4/5] package/wlroots: use libseat when
 available
In-Reply-To: <20210518135423.194507-1-aperez@igalia.com>
References: <20210513163325.1775639-1-aperez@igalia.com>
 <20210518135423.194507-1-aperez@igalia.com>
Message-ID: <20210518135423.194507-5-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable using libseat for seat management when possible.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - No changes.
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
-- 
2.31.1
