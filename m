From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  6 Sep 2017 18:39:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/pngquant: fix target build
Message-ID: <20170906163904.14432-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pngquant 2.10 introduced a bundled library libimagequant, Makefile
passes $LIQCONFIGUREFLAGS to the configure script of libimagequant
before building this library:
https://github.com/pornel/pngquant/blob/master/Makefile#L27

This variable is filled by configure with the content of $LIQCONFIGURE
https://github.com/pornel/pngquant/blob/master/configure#L553

We need to pass CC/CFLAGS/LDFLAGS as parameter to configure to fill
$LIQCONFIGURE with correct values in order to use the target toolchain
for building libimagequant:
https://github.com/pornel/pngquant/blob/master/configure#L56

Fixes
http://autobuild.buildroot.net/results/ab1/ab1193db9d76adc02be44d6f273e0986952df3e2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pngquant/pngquant.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index a602cbef5..1ce8359d4 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -22,6 +22,7 @@ define PNGQUANT_CONFIGURE_CMDS
 		./configure --prefix=/usr \
 		$(if $(BR2_PACKAGE_LCMS2),--with-lcms2,--without-lcms2) \
 		$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
+		$(TARGET_CONFIGURE_OPTS) \
 	)
 endef
 
-- 
2.11.0
