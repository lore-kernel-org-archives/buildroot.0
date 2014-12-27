From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 18:46:51 +0100
Subject: [Buildroot] [git commit] libvncserver: disable libva support
Message-ID: <20141227174706.9A7518045B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc5b451b5ea48eef88ed0713be0af1f65a3c015b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvncserver/libvncserver.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
 
