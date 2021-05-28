From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 May 2021 22:15:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: alsa needs ucm
Message-ID: <20210528201528.2287085-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

alsa unconditionally uses ucm since version 0.3.7 and
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/1612f5e4d215bd5edf7d649d220b53ff1ed7c098
which will result in the following build failure since commit
a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:

../spa/plugins/alsa/acp/alsa-ucm.h:26:10: fatal error: alsa/use-case.h: No such file or directory
   26 | #include <alsa/use-case.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ef53534daf84397b4e22392f2a6be2c335819ab5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/pipewire.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index e5185aeb8c..847798e6f8 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -52,7 +52,7 @@ endif
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=enabled
 PIPEWIRE_DEPENDENCIES += alsa-lib
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yy)
 PIPEWIRE_CONF_OPTS += -Dalsa=enabled
 else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled
-- 
2.30.2
