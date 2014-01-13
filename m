From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 13:11:39 +0100
Subject: [Buildroot] [git commit] ffmpeg: fix build with gpl suboption and
	openssl
Message-ID: <20140113121429.C79F99C43D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=457b6467edcfbfe73da3de398d3dbefac79ef472
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openssl's license isn't compatible with GPL, so ffmpeg's configure script
only allows this combination if nonfree is enabled.

Fixes http://autobuild.buildroot.net/results/ed6/ed6129d584229ebe4a0b291bc6a1dd0be23cc92a/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 2168785..e60ced7 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -198,8 +198,13 @@ FFMPEG_CONF_OPT += --disable-bzlib
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+# openssl isn't license compatible with GPL
+ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
+FFMPEG_CONF_OPT += --disable-openssl
+else
 FFMPEG_CONF_OPT += --enable-openssl
 FFMPEG_DEPENDENCIES += openssl
+endif
 else
 FFMPEG_CONF_OPT += --disable-openssl
 endif
