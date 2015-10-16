From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 16 Oct 2015 10:56:09 +0100
Subject: [Buildroot] [PATCH] ffmpeg: librtmp support depends on openssl
Message-ID: <1444989369-34046-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you try to build ffmpeg with librtmp support and you don't have
openssl installed in your system, the configure script will fail with an
error like this one:

ERROR: librtmp not found using pkg-config

This message doesn't highlight the real problem, but a deeper look into
the config.log will reveal the dependency between librtmp and openssl:

check_pkg_config librtmp librtmp/rtmp.h RTMP_Socket
/br/output/host/usr/bin/pkg-config --exists --print-errors librtmp
Package libssl was not found in the pkg-config search path.
Perhaps you should add the directory containing `libssl.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libssl', required by 'librtmp', not found
Package 'libcrypto', required by 'librtmp', not found
ERROR: librtmp not found using pkg-config

So let's enable librtmp support only when openssl support has already
been enabled.

Fixes:

  http://autobuild.buildroot.net/results/ae0/ae0c4bab7975ed2ad77a9f9fd6a300d1327d56b9/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ffmpeg/ffmpeg.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f361970..d4c28e0 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -198,6 +198,13 @@ FFMPEG_CONF_OPTS += --disable-openssl
 else
 FFMPEG_CONF_OPTS += --enable-openssl
 FFMPEG_DEPENDENCIES += openssl
+# librtmp support requires openssl
+ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
+FFMPEG_CONF_OPTS += --enable-librtmp
+FFMPEG_DEPENDENCIES += rtmpdump
+else
+FFMPEG_CONF_OPTS += --disable-librtmp
+endif
 endif
 else
 FFMPEG_CONF_OPTS += --disable-openssl
@@ -246,13 +253,6 @@ else
 FFMPEG_CONF_OPTS += --disable-libbluray
 endif
 
-ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
-FFMPEG_CONF_OPTS += --enable-librtmp
-FFMPEG_DEPENDENCIES += rtmpdump
-else
-FFMPEG_CONF_OPTS += --disable-librtmp
-endif
-
 ifeq ($(BR2_PACKAGE_LAME),y)
 FFMPEG_CONF_OPTS += --enable-libmp3lame
 FFMPEG_DEPENDENCIES += lame
-- 
1.7.1
