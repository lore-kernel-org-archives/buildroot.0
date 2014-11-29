From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Nov 2014 21:54:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/gd: fix build when libiconv is
	enabled
Message-ID: <1417294477-12145-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First of two patches to fix
http://autobuild.buildroot.net/results/238/2386edb7f95920e84a35811a33f4333ee0a7a860/

gd links against libiconv if it is already built, depend on libiconv
to get reproducable builds.

readelf output without libiconv present:
$ output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/bfin-linux-uclibc-readelf \
  -a output/staging/usr/lib/libgd.a | grep iconv
    15: 00000000    12 FUNC    GLOBAL HIDDEN     1 _iconv_open
    16: 0000000c    12 FUNC    GLOBAL HIDDEN     1 _iconv
    17: 00000018    12 FUNC    GLOBAL HIDDEN     1 _iconv_close

readelf output with libiconv present:
$ output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/bfin-linux-uclibc-readelf \
  -a output/staging/usr/lib/libgd.a | grep iconv
000000e4  0000100a R_BFIN_PCREL24    00000000   _libiconv_open + 0
00000140  0000140a R_BFIN_PCREL24    00000000   _libiconv + 0
0000019a  0000160a R_BFIN_PCREL24    00000000   _libiconv_close + 0
    16: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND _libiconv_open
    20: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND _libiconv
    22: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND _libiconv_close

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gd/gd.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 1613464..50737e5 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -33,6 +33,10 @@ else
 GD_CONF_OPTS += --without-freetype
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+GD_DEPENDENCIES += libiconv
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 GD_DEPENDENCIES += jpeg
 GD_CONF_OPTS += --with-jpeg
-- 
1.7.10.4
