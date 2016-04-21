From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:26:00 +0200
Subject: [Buildroot] [git commit] weston: disable v4l simple dmabuf for
	headers < 3.8
Message-ID: <20160421212604.4D02081E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7329a0db442026c6b856e76ea964107fa3c730f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses VIDIOC_EXPBUF which only came to light with kernel 3.8, so
disable it if headers are older. Fixes:
http://autobuild.buildroot.net/results/7fb/7fb9968b13f144c4576b28ecd01c82b74e4ed9d5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 9f7405c..63c43a3 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -28,6 +28,11 @@ WESTON_CONF_OPTS = \
 WESTON_MAKE_OPTS = \
 	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
 
+# Uses VIDIOC_EXPBUF, only available from 3.8+
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
+WESTON_CONF_OPTS += --disable-simple-dmabuf-v4l-client
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 WESTON_CONF_OPTS += --enable-dbus
 WESTON_DEPENDENCIES += dbus
