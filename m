From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 13 Jan 2014 22:23:06 +0100
Subject: [Buildroot] [PATCH 1/1] ffmpeg: Add mips related configure options
	to fix build errors
Message-ID: <BLU0-SMTP28034465E483AA8202634E5D9BC0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://autobuild.buildroot.net/results/aa5/aa5cb447342af9995d8f198eb0a151fe6e3d5c19//
http://autobuild.buildroot.net/results/355/355f56f6b466521e2c4c71f69b06a0ca2a56949b//

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
The patch is only compile-tested using defconfig from autobuild results quoted above.

 package/ffmpeg/ffmpeg.mk |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index e60ced7..3c16e9b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -269,6 +269,32 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 FFMPEG_CONF_OPT += --enable-neon
 endif
 
+ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
+FFMPEG_CONF_OPT += \
+	--disable-mipsfpu
+else
+FFMPEG_CONF_OPT += \
+	--enable-mipsfpu
+endif
+
+ifeq ($(BR2_mips_32r2),y)
+FFMPEG_CONF_OPT += \
+	--enable-mips32r2
+else
+FFMPEG_CONF_OPT += \
+	--disable-mips32r2
+endif
+
+ifeq ($(BR2_mips_64r2),y)
+FFMPEG_CONF_OPT += \
+	--enable-mipsdspr1 \
+	--enable-mipsdspr2
+else
+FFMPEG_CONF_OPT += \
+	--disable-mipsdspr1 \
+	--disable-mipsdspr2
+endif
+
 # Set powerpc altivec appropriately
 ifeq ($(BR2_powerpc),y)
 ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
-- 
1.7.9.5
