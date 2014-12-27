From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 27 Dec 2014 18:01:31 +0100
Subject: [Buildroot] [PATCH 1/1] libvncserver: disable libva support
Message-ID: <1419699691-7765-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libvncclient library (part of libvncserver) has optional support
for HW accelerated H264 video playback using libva

However there are currently two problems with it:

1) it only supports libva compiled with X11 support enabled, but it
   does not verify that is the case, resulting in compile errors.

2) it only supports the libva 1.0.x API, and not newer
   libva versions, like 1.4.x we include with buildroot.

   https://github.com/LibVNC/libvncserver/issues/11

Disabling libva support for now.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/libvncserver/libvncserver.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index ced6689..a8389b4 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -17,6 +17,10 @@ LIBVNCSERVER_DEPENDENCIES = host-pkgconf
 # tarball, so we need to generate them.
 LIBVNCSERVER_AUTORECONF = YES
 
+# libvncserver does not get along with newer libva versions
+# https://github.com/LibVNC/libvncserver/issues/11
+LIBVNCSERVER_CONF_OPTS += --without-libva
+
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += --with-sdl-config=/bin/false
 
-- 
1.9.1
