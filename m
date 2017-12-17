From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Dec 2017 14:53:46 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/linphone: remove ffmpeg-related
 patches
Message-ID: <20171217135346.925-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linphone package never provided video support.

While this commit
https://git.buildroot.net/buildroot/commit/package/linphone?id=dec04466549cd40e2696ae7725e90d6559bee640

added support for ffmpeg 3.0+ the next commit, which fixed the build of
the bundled mediastreamer2 library, added --disable-video:
https://git.buildroot.net/buildroot/commit/package/linphone?id=f3492b28d89c1f2448c9662a6f755cb48e8c0f0b

At this point the ffmpeg 3.0 patches could have been removed because
ffmpeg is only used if video support is enabled:

https://github.com/BelledonneCommunications/mediastreamer2/blob/6c2a608800a221942f2a827e0abb60346e7d065f/acinclude.m4#L80
https://github.com/BelledonneCommunications/mediastreamer2/blob/6c2a608800a221942f2a827e0abb60346e7d065f/acinclude.m4#L107

This patch catches up on that to avoid changing the upstream URL for
the patches which is broken.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: removed unneeded ffmpeg patches instead of using
    http://snapshot.debian.org/archive/debian/20161118T211932Z/pool/main/l/linphone
    as proposed by Thomas.

 package/linphone/linphone.hash | 4 ----
 package/linphone/linphone.mk   | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/package/linphone/linphone.hash b/package/linphone/linphone.hash
index 2e202cf10e..9ed9d37f77 100644
--- a/package/linphone/linphone.hash
+++ b/package/linphone/linphone.hash
@@ -1,6 +1,2 @@
 # Locally calculated after checking pgp signature
 sha256	05ba81223e9378c3bce8d33080213b9925af49bd9623cd9004eb3dd22ca9d2a0	linphone-3.6.1.tar.gz
-sha256	bc4ef670c0ecc1bb60bcb79374309b555c11d154bacfa363d809a26a58780933	libav9.patch
-sha256	a50a8ac2caedb389c224f81393901a029fec055ec2ec83aa18d677e1bfe7fc73	libav10.patch
-sha256	e384775c12ea93d3bc35dccfe4ea875c38b74be8af63fcb82e6b7f06e93d1593	libav11.patch
-sha256	3367a26f65f49f4101787b1821402127d29cde9b02d3873112a5001a549cc7d9	ffmpeg_2.9.patch
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 214c116417..4129c2a9e3 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -15,11 +15,6 @@ LINPHONE_INSTALL_STAGING = YES
 LINPHONE_DEPENDENCIES = host-pkgconf libeXosip2 speex
 LINPHONE_LICENSE = GPL-2.0+
 LINPHONE_LICENSE_FILES = COPYING
-LINPHONE_PATCH = \
-	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/libav9.patch \
-	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/libav10.patch \
-	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/libav11.patch \
-	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/ffmpeg_2.9.patch
 
 ifeq ($(BR2_arc),y)
 # toolchain __arc__ define conflicts with libosip2 source
-- 
2.11.0
