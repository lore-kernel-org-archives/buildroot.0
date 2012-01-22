From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 23:26:25 +0100
Subject: [Buildroot] [git commit] ffmpeg: depends on host-nasm if MMX is
	enabled
Message-ID: <20120122222659.31CE690358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e20ad196d33d957541ac11b3a460ac2971cdc0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: slightly reordered]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 38f04aa..dc572de 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -123,9 +123,14 @@ else
 FFMPEG_CONF_OPT += --disable-zlib
 endif
 
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
 # MMX on is default for x86, disable it for lowly x86-type processors
 ifeq ($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
 FFMPEG_CONF_OPT += --disable-mmx
+else
+# If it is enabled, nasm is required
+FFMPEG_DEPENDENCIES += host-nasm
+endif
 endif
 
 # ARM defaults to v5: clear if less, add extra if more
