From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 23:31:01 +0100
Subject: [Buildroot] [git commit] package/gd: fix build when libiconv is
	enabled
Message-ID: <20141130223144.BE26B7FD3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0eb957758b9c0b5f6cdcb3d3ba3bfe84806f18a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: also add to LIBS so it ends up in gdlib-config --libs output]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gd/gd.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 1613464..868b45e 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -33,6 +33,13 @@ else
 GD_CONF_OPTS += --without-freetype
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+GD_DEPENDENCIES += libiconv
+# not strictly needed for gd, but ensures -liconv ends up in
+# gdlib-config --libs output
+GD_CONF_ENV += LIBS="-liconv"
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 GD_DEPENDENCIES += jpeg
 GD_CONF_OPTS += --with-jpeg
