From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:07:39 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/imagemagick: fix
 host build for old distributions
Message-ID: <20190829210407.C115288517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=512a14e982f7ca37eac47cf8961822447e436983
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
http://autobuild.buildroot.net/results/5f0/5f0b85033e800c9eebc46812592966ec6826bb5d/

imagemagick uses clock_gettime, which was provided by librt rather than libc
in glibc < 2.17 - Causing link errors.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 273427f9286d0d0fd4c02cfd681f3a19bc045064)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 624ff168ff..df1dbe86da 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -181,6 +181,9 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--with-png \
 	--with-zlib
 
+# uses clock_gettime, which was provided by librt in glibc < 2.17
+HOST_IMAGEMAGICK_CONF_ENV = LIBS="-lrt"
+
 HOST_IMAGEMAGICK_DEPENDENCIES = \
 	host-libjpeg \
 	host-libpng \
