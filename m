From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:39:56 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-vmware:
	fix compilation without udev
Message-ID: <20170301224001.CDE1982293@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19ad2ade72b2b6e5fa4797a2752e28d9a9684c10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://cgit.freedesktop.org/xorg/driver/xf86-video-vmware/commit/configure.ac?id=755e38f373a511bd774a61c9420a67f630f71037
added a check for libudev which fails if the check is not disabled.

Fixes
http://autobuild.buildroot.net/results/7b3/7b38105dd1115ac622964cf243ac137b7624fb43/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index ef262f8..1b2066d 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -11,4 +11,11 @@ XDRIVER_XF86_VIDEO_VMWARE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = mesa3d xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+XDRIVER_XF86_VIDEO_VMWARE_CONF_OPTS += --with-libudev
+XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES += udev
+else
+XDRIVER_XF86_VIDEO_VMWARE_CONF_OPTS += --without-libudev
+endif
+
 $(eval $(autotools-package))
