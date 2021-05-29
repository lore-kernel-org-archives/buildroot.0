From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 May 2021 10:28:04 +0200
Subject: [Buildroot] [git commit] package/pipewire: alsa needs ucm
Message-ID: <20210529075931.EE6EB81831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fce8cd4ae87001c499064b021b32fef65c0c045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
