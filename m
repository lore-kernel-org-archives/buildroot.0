From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:28:20 +0100
Subject: [Buildroot] [git commit] ffmpeg: fix build for xtensa
Message-ID: <20131225113133.98C989C1C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ec35e76b8a31810a0b8955a6dee787cefa013bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ffmpeg package generates libraries that are too large for the xtensa
default placement of literals in a dedicated section. Use
-mtext-section-literal to place literals in the text section.

Fixes
http://autobuild.buildroot.net/results/606/60670d35f16c3b8fe19debf7f8e40a046a579520/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6685110..f1fc920 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -21,6 +21,14 @@ FFMPEG_CONF_OPT = \
 	--disable-avfilter	\
 	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
 
+FFMPEG_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_xtensa),y)
+FFMPEG_CFLAGS += -mtext-section-literals
+endif
+
+FFMPEG_CONF_ENV = CFLAGS="$(FFMPEG_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_CONF_OPT += --enable-gpl
 else
