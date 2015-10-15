From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Oct 2015 20:55:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Disable rtmpdump support
	when PolarSSL is enabled
Message-ID: <1444935326-19634-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using rtmpdump with PolarSSL breaks ffmpeg configure:
/home/test/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/librtmp.so: undefined reference to `havege_random'
/home/test/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/librtmp.so: undefined reference to `havege_init'

This problem could be fixed by enabling POLARSSL_HAVEGE_C:
http://freetz.org/browser/trunk/make/libs/polarssl/patches/050-activate-havege-random-generator-needed-by-rtmpdump.polarssl.patch?rev=10797

This option is however accompanied by a warning in
include/polarssl/config.h:

 * Warning: the HAVEGE random generator is dependent on timing and specific
 *          processor traits. It is therefore not advised to use HAVEGE as
 *          your applications primary random generator or primary entropy pool
 *          input. As a secondary input to your entropy pool, it IS able add
 *          the (limited) extra entropy it provides.

Since rtmpdump is not a vital part of ffmpeg it is save to disable
rtmpdump support when PolarSSL is used.

Fixes
http://autobuild.buildroot.net/results/ae0/ae0c4bab7975ed2ad77a9f9fd6a300d1327d56b9/
http://autobuild.buildroot.net/results/45d/45dd9adbac449ce0ed66af5b4655b4d9b37faa62/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f361970..41e648b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -246,7 +246,8 @@ else
 FFMPEG_CONF_OPTS += --disable-libbluray
 endif
 
-ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
+# rtmpdump is broken with polarssl
+ifeq ($(BR2_PACKAGE_RTMPDUMP)$(BR2_PACKAGE_POLARSSL),y)
 FFMPEG_CONF_OPTS += --enable-librtmp
 FFMPEG_DEPENDENCIES += rtmpdump
 else
-- 
2.6.1
