From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 08:29:05 +0100
Subject: [Buildroot] [git commit] ffmpeg: disable freetype support on
	microblaze/glibc
Message-ID: <20150131074531.862817FF3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64a49804fb3b89e99c8b7840aebd66ff07f5f54c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/6dd/6ddefaf001b9275ee073effbd6eb07be9f43e24d/

While it does provide fenv.h, it doesn't support the needed exceptions so
disable it.

Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 16f53be..f9c1d94 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -234,8 +234,9 @@ FFMPEG_CONF_OPTS += --disable-libvpx
 endif
 
 # ffmpeg freetype support require fenv.h which is only
-# available/working on glibc
-ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_TOOLCHAIN_USES_GLIBC),yy)
+# available/working on glibc.
+# The microblaze variant doesn't provide the needed exceptions
+ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_TOOLCHAIN_USES_GLIBC)x$(BR2_microblaze),yyx)
 FFMPEG_CONF_OPTS += --enable-libfreetype
 FFMPEG_DEPENDENCIES += freetype
 else
