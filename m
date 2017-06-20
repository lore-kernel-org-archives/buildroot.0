From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:27:05 +0200
Subject: [Buildroot] [git commit] package/x264: disable optional ffmpeg
	support
Message-ID: <20170620203018.EBD4A81911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=310e4f07f8cdb3e3272aaed236142d58cfaa44e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In buildroot ffmpeg uses x264 as optional dependency if
BR2_PACKAGE_FFMPEG_GPL is enabled at the same time.

If BR2_PACKAGE_FFMPEG_GPL is disabled and ffmpeg is built without x264
support before x264 itself is build, x264 picks up certain ffmpeg libs
as optional dependency leading to build errors because x264 does not
correctly link statically against ffmpeg.

To avoid a circular dependency and to avoid teaching x264 how to
correctly link statically with ffmpeg we just disable all ffmpeg-
related options.

Fixes
http://autobuild.buildroot.net/results/36a/36abb5b8f3aab57fb7b63056b216b4a58143ee3e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x264/x264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 7214c96..d1bc767 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -10,7 +10,7 @@ X264_LICENSE = GPL-2.0+
 X264_DEPENDENCIES = host-pkgconf
 X264_LICENSE_FILES = COPYING
 X264_INSTALL_STAGING = YES
-X264_CONF_OPTS = --disable-avs
+X264_CONF_OPTS = --disable-avs --disable-lavf --disable-swscale
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 # yasm needed for assembly files
