From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 21:35:27 +0200
Subject: [Buildroot] [git commit] package/pngquant: fix target build
Message-ID: <20170906192829.60F547F8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff9aaa82873f693199e947749f70ed6b5ac3f8ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pngquant/pngquant.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index a602cbe..1ce8359 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -22,6 +22,7 @@ define PNGQUANT_CONFIGURE_CMDS
 		./configure --prefix=/usr \
 		$(if $(BR2_PACKAGE_LCMS2),--with-lcms2,--without-lcms2) \
 		$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
+		$(TARGET_CONFIGURE_OPTS) \
 	)
 endef
 
