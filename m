From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  2 Aug 2019 15:40:44 +0200
Subject: [Buildroot] [PATCH] package/imagemagick: fix host build for old
 distributions
Message-ID: <20190802134044.22094-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/5f0/5f0b85033e800c9eebc46812592966ec6826bb5d/

imagemagick uses clock_gettime, which was provided by librt rather than libc
in glibc < 2.17 - Causing link errors.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index fff00fcfb1..3a37371e7b 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -176,6 +176,9 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--with-png \
 	--with-zlib
 
+# uses clock_gettime, which was provided by librt in glibc < 2.17
+HOST_IMAGEMAGICK_CONF_ENV = LIBS="-lrt"
+
 HOST_IMAGEMAGICK_DEPENDENCIES = \
 	host-libjpeg \
 	host-libpng \
-- 
2.11.0
