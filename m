From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 17:42:53 +0100
Subject: [Buildroot] [git commit] weston: add weston-imx variant when using
 imx-gpu-viv
Message-ID: <20190206164130.F063E88127@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18fb3abad1ae4188ecd9342a005a58f940538757
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variant contains various optimizations for i.MX processors.

For instance, on i.MX6/7 devices with GPU, the gl-renderer needs to be
enabled for the fbdev-backend which was removed from upstream weston
long time ago.

Also, weston-imx adds support for G2D which is enabled by default, this
patch makes sure to disable it when imx-gpu-g2d isn't selected.

The tag version rel_imx_4.9.51_8mq_ga proved to work fine on both
i.MX6Q/DL and i.MX8MQ processors.

Here are the commands used to start weston on i.MX6Q:
- Using 3D GPU (gl-renderer):
 # weston --tty=1 --device=/dev/fb0
- Using 2D GPU (G2D):
 # weston --tty=1 --device=/dev/fb0 --use-g2d=1

Upstream repository:
https://source.codeaurora.org/external/imx/weston-imx/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: add comment why no --enable option is passed]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/weston/weston.hash |  2 ++
 package/weston/weston.mk   | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index a44bbcb08b..799d371dc0 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -3,3 +3,5 @@ md5 752a04ce3c65af4884cfac4e57231bdb  weston-5.0.0.tar.xz
 sha1 56b42b1fbea9e120a8127736328e4c71ac781a57  weston-5.0.0.tar.xz
 sha256 15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf  weston-5.0.0.tar.xz
 sha512 b6f97eca014ea47f3de0c5ddd89712f896cd66423d0eb499e1d88d35aab616cef1e735ebb8e0cefd8b60085314b6ec3d56b39d7c4776188bb56d58efc84a52cf  weston-5.0.0.tar.xz
+# locally computed
+sha256 0f0de7b7b1f65870139c95dde7abc19ed305631ae7c5d37c386db40cde108632  weston-rel_imx_4.9.51_8mq_ga.tar.gz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 61b32d33a3..7fbe39b98e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,9 +4,16 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
+WESTON_VERSION = rel_imx_4.9.51_8mq_ga
+WESTON_SITE = https://source.codeaurora.org/external/imx/weston-imx
+WESTON_SITE_METHOD = git
+WESTON_AUTORECONF = YES
+else
 WESTON_VERSION = 5.0.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
+endif
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
@@ -50,6 +57,15 @@ else
 WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
+ifeq ($(BR2_PACKAGE_IMX_GPU_G2D),y)
+WESTON_DEPENDENCIES += imx-gpu-g2d
+# --enable-imxg2d actually disables it, so no CONF_OPTS
+else
+WESTON_CONF_OPTS += --disable-imxg2d
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
 WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl libgles
