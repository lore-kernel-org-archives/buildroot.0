From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Feb 2011 16:11:02 +0100
Subject: [Buildroot] [git commit master 1/1] ffmpeg: disable mmx for low end
	x86-type processors
Message-ID: <20110228151122.5C7638F790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3f6aa3ec56a813a6e9e419e5dfaa9b728561d7ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg enables mmx by default for x86-class processors, so disable it for
processors that lack it (i386, i486, i586, i686, pentium pro, geode).
Solves bug #3325

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 60654de..b37ac90 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -124,6 +124,11 @@ else
 FFMPEG_CONF_OPT += --disable-zlib
 endif
 
+# MMX on is default for x86, disable it for lowly x86-type processors
+ifeq ($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+FFMPEG_CONF_OPT += --disable-mmx
+endif
+
 FFMPEG_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
-- 
1.7.3.4
