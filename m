From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:20:13 +0100
Subject: [Buildroot] [PATCH v2 19/38] package/libsquish: remove deprecated
	package
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi removed the dependency for libsquish:
https://github.com/xbmc/xbmc/commit/ed03f828be3615d294eb4a4cfccc5cdccec22997

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                  |   8 +
 DEVELOPERS                        |   1 -
 package/Config.in                 |   1 -
 package/libsquish/0001-kodi.patch | 327 --------------------------------------
 package/libsquish/Config.in       |  13 --
 package/libsquish/libsquish.hash  |   2 -
 package/libsquish/libsquish.mk    |  37 -----
 7 files changed, 8 insertions(+), 381 deletions(-)
 delete mode 100644 package/libsquish/0001-kodi.patch
 delete mode 100644 package/libsquish/Config.in
 delete mode 100644 package/libsquish/libsquish.hash
 delete mode 100644 package/libsquish/libsquish.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 7dd9189ee..fa849201c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.02"
 
+config BR2_PACKAGE_LIBSQUISH
+	bool "libsquish removed"
+	select BR2_LEGACY
+	help
+	  Kodi 17-Krypton removed the dependency to libsquish.
+	  It was the only package needing libsquish, so this package
+	  was no longer useful.
+
 config BR2_PACKAGE_PERL_DB_FILE
 	bool "perl-db-file removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 11011406e..f1a35b807 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -202,7 +202,6 @@ F:	package/libsilk/
 F:	package/libsndfile/
 F:	package/libsoil/
 F:	package/libsoundtouch/
-F:	package/libsquish/
 F:	package/liburiparser/
 F:	package/libva/
 F:	package/libva-intel-driver/
diff --git a/package/Config.in b/package/Config.in
index d1c517aa5..0ac61483b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -901,7 +901,6 @@ endmenu
 
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
-	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
diff --git a/package/libsquish/0001-kodi.patch b/package/libsquish/0001-kodi.patch
deleted file mode 100644
index a9bca6690..000000000
--- a/package/libsquish/0001-kodi.patch
+++ /dev/null
@@ -1,327 +0,0 @@
-Add Kodi-specific patch
-
-Kodi 15.0 contains an updated version of libsquish:
-https://github.com/xbmc/xbmc/tree/master/tools/depends/native/libsquish-native
-
-The OpenElec project provides a separate tarball including the Kodi-
-specific patches:
-http://sources.openelec.tv/devel/libsquish-1.10-openelec.tar.gz
-
-This patch contains the relevant diff between upstream libsquish 1.13
-and the OpenElec tarball.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uwNr 1.13/squish.cpp libsquish-1.10-openelec/squish.cpp
---- 1.13/squish.cpp	2015-04-30 12:48:49.000000000 +0200
-+++ libsquish-1.10-openelec/squish.cpp	2015-01-09 10:58:43.000000000 +0100
-@@ -23,6 +23,7 @@
- 
-    -------------------------------------------------------------------------- */
- 
-+#include <string.h>
- #include <squish.h>
- #include "colourset.h"
- #include "maths.h"
-@@ -39,7 +40,7 @@
-     // grab the flag bits
-     int method = flags & ( kDxt1 | kDxt3 | kDxt5 );
-     int fit = flags & ( kColourIterativeClusterFit | kColourClusterFit | kColourRangeFit );
--    int extra = flags & kWeightColourByAlpha;
-+	int extra = flags & ( kWeightColourByAlpha | kSourceBGRA );
- 
-     // set defaults
-     if( method != kDxt3 && method != kDxt5 )
-@@ -124,8 +125,30 @@
-     return blockcount*blocksize;
- }
- 
-+void CopyRGBA( u8 const* source, u8* dest, int flags )
-+{
-+	if (flags & kSourceBGRA)
-+	{
-+		// convert from bgra to rgba
-+		dest[0] = source[2];
-+		dest[1] = source[1];
-+		dest[2] = source[0];
-+		dest[3] = source[3];
-+	}
-+	else
-+	{
-+		for( int i = 0; i < 4; ++i )
-+			*dest++ = *source++;
-+	}
-+}
-+
- void CompressImage( u8 const* rgba, int width, int height, void* blocks, int flags, float* metric )
- {
-+	CompressImage(rgba, width, height, width*4, blocks, flags, metric);
-+}
-+  
-+void CompressImage( u8 const* rgba, int width, int height, int pitch, void* blocks, int flags, float* metric )
-+{
-     // fix any bad flags
-     flags = FixFlags( flags );
- 
-@@ -154,20 +177,14 @@
-                     if( sx < width && sy < height )
-                     {
-                         // copy the rgba value
--                        u8 const* sourcePixel = rgba + 4*( width*sy + sx );
--                        for( int i = 0; i < 4; ++i )
--                            *targetPixel++ = *sourcePixel++;
--
-+						u8 const* sourcePixel = rgba + pitch*sy + 4*sx;
-+						CopyRGBA(sourcePixel, targetPixel, flags);
-                         // enable this pixel
-                         mask |= ( 1 << ( 4*py + px ) );
-                     }
--                    else
--                    {
--                        // skip this pixel as its outside the image
-                         targetPixel += 4;
-                     }
-                 }
--            }
- 
-             // compress it into the output
-             CompressMasked( sourceRgba, mask, targetBlock, flags, metric );
-@@ -180,6 +197,11 @@
- 
- void DecompressImage( u8* rgba, int width, int height, void const* blocks, int flags )
- {
-+	DecompressImage( rgba, width, height, width*4, blocks, flags );
-+}
-+
-+void DecompressImage( u8* rgba, int width, int height, int pitch, void const* blocks, int flags )
-+{
-     // fix any bad flags
-     flags = FixFlags( flags );
- 
-@@ -207,24 +229,132 @@
-                     int sy = y + py;
-                     if( sx < width && sy < height )
-                     {
--                        u8* targetPixel = rgba + 4*( width*sy + sx );
-+						u8* targetPixel = rgba + pitch*sy + 4*sx;
- 
-                         // copy the rgba value
-+						CopyRGBA(sourcePixel, targetPixel, flags);
-+					}
-+					sourcePixel += 4;
-+				}
-+			}
-+			
-+			// advance
-+			sourceBlock += bytesPerBlock;
-+		}
-+	}
-+}
-+
-+static double ErrorSq(double x, double y)
-+{
-+	return (x - y) * (x - y);
-+}
-+
-+static void ComputeBlockWMSE(u8 const *original, u8 const *compressed, unsigned int w, unsigned int h, double &cmse, double &amse)
-+{
-+	// Computes the MSE for the block and weights it by the variance of the original block.
-+	// If the variance of the original block is less than 4 (i.e. a standard deviation of 1 per channel)
-+	// then the block is close to being a single colour. Quantisation errors in single colour blocks
-+	// are easier to see than similar errors in blocks that contain more colours, particularly when there
-+	// are many such blocks in a large area (eg a blue sky background) as they cause banding.  Given that
-+	// banding is easier to see than small errors in "complex" blocks, we weight the errors by a factor
-+	// of 5. This implies that images with large, single colour areas will have a higher potential WMSE
-+	// than images with lots of detail.
-+
-+	cmse = amse = 0;
-+	unsigned int sum_p[4];  // per channel sum of pixels
-+	unsigned int sum_p2[4]; // per channel sum of pixels squared
-+	memset(sum_p, 0, sizeof(sum_p));
-+	memset(sum_p2, 0, sizeof(sum_p2));
-+	for( unsigned int py = 0; py < 4; ++py )
-+	{
-+		for( unsigned int px = 0; px < 4; ++px )
-+		{
-+			if( px < w && py < h )
-+			{
-+				double pixelCMSE = 0;
-+				for( int i = 0; i < 3; ++i )
-+				{
-+					pixelCMSE += ErrorSq(original[i], compressed[i]);
-+					sum_p[i] += original[i];
-+					sum_p2[i] += (unsigned int)original[i]*original[i];
-+				}
-+				if( original[3] == 0 && compressed[3] == 0 )
-+					pixelCMSE = 0; // transparent in both, so colour is inconsequential
-+				amse += ErrorSq(original[3], compressed[3]);
-+				cmse += pixelCMSE;
-+				sum_p[3] += original[3];
-+				sum_p2[3] += (unsigned int)original[3]*original[3];
-+			}
-+			original += 4;
-+			compressed += 4;
-+		}
-+	}
-+	unsigned int variance = 0;
-                         for( int i = 0; i < 4; ++i )
--                            *targetPixel++ = *sourcePixel++;
-+		variance += w*h*sum_p2[i] - sum_p[i]*sum_p[i];
-+	if( variance < 4 * w * w * h * h )
-+	{
-+		amse *= 5;
-+		cmse *= 5;
-                     }
--                    else
-+}
-+  
-+void ComputeMSE( u8 const *rgba, int width, int height, u8 const *dxt, int flags, double &colourMSE, double &alphaMSE )
-                     {
--                        // skip this pixel as its outside the image
--                        sourcePixel += 4;
-+	ComputeMSE(rgba, width, height, width*4, dxt, flags, colourMSE, alphaMSE);
-+}
-+                
-+void ComputeMSE( u8 const *rgba, int width, int height, int pitch, u8 const *dxt, int flags, double &colourMSE, double &alphaMSE )
-+{
-+	// fix any bad flags
-+	flags = FixFlags( flags );
-+	colourMSE = alphaMSE = 0;
-+
-+	// initialise the block input
-+	squish::u8 const* sourceBlock = dxt;
-+	int bytesPerBlock = ( ( flags & squish::kDxt1 ) != 0 ) ? 8 : 16;
-+
-+	// loop over blocks
-+	for( int y = 0; y < height; y += 4 )
-+	{
-+		for( int x = 0; x < width; x += 4 )
-+		{
-+			// decompress the block
-+			u8 targetRgba[4*16];
-+			Decompress( targetRgba, sourceBlock, flags );
-+			u8 const* sourcePixel = targetRgba;
-+
-+			// copy across to a similar pixel block
-+			u8 originalRgba[4*16];
-+			u8* originalPixel = originalRgba;
-+
-+			for( int py = 0; py < 4; ++py )
-+			{
-+				for( int px = 0; px < 4; ++px )
-+				{
-+					int sx = x + px;
-+					int sy = y + py;
-+					if( sx < width && sy < height )
-+					{
-+						u8 const* targetPixel = rgba + pitch*sy + 4*sx;
-+						CopyRGBA(targetPixel, originalPixel, flags);
-                     }
-+					sourcePixel += 4;
-+					originalPixel += 4;
-                 }
-             }
- 
-+			// compute the weighted MSE of the block
-+			double blockCMSE, blockAMSE;
-+			ComputeBlockWMSE(originalRgba, targetRgba, std::min(4, width - x), std::min(4, height - y), blockCMSE, blockAMSE);
-+			colourMSE += blockCMSE;
-+			alphaMSE += blockAMSE;
-             // advance
-             sourceBlock += bytesPerBlock;
-         }
-     }
-+	colourMSE /= (width * height * 3);
-+	alphaMSE /= (width * height);
- }
- 
- } // namespace squish
-diff -uwNr 1.13/squish.h libsquish-1.10-openelec/squish.h
---- 1.13/squish.h	2015-04-30 12:55:27.000000000 +0200
-+++ libsquish-1.10-openelec/squish.h	2015-01-09 10:58:43.000000000 +0100
-@@ -57,7 +57,10 @@
-     kColourRangeFit = ( 1 << 4 ),
- 
-     //! Weight the colour by alpha during cluster fit (disabled by default).
--    kWeightColourByAlpha = ( 1 << 7 )
-+	kWeightColourByAlpha = ( 1 << 7 ),
-+	
-+	//! Source is BGRA rather than RGBA
-+	kSourceBGRA = ( 1 << 9 ),
- };
- 
- // -----------------------------------------------------------------------------
-@@ -194,6 +197,7 @@
-     @param rgba   The pixels of the source.
-     @param width  The width of the source image.
-     @param height The height of the source image.
-+	@param pitch	The pitch of the source image.
-     @param blocks Storage for the compressed output.
-     @param flags  Compression flags.
-     @param metric An optional perceptual metric.
-@@ -231,6 +235,7 @@
-     to allocate for the compressed output.
- */
- void CompressImage( u8 const* rgba, int width, int height, void* blocks, int flags, float* metric = 0 );
-+void CompressImage( u8 const* rgba, int width, int height, int pitch, void* blocks, int flags, float* metric = 0 );
- 
- // -----------------------------------------------------------------------------
- 
-@@ -239,6 +244,7 @@
-     @param rgba   Storage for the decompressed pixels.
-     @param width  The width of the source image.
-     @param height The height of the source image.
-+	@param pitch    The pitch of the decompressed pixels.
-     @param blocks The compressed DXT blocks.
-     @param flags  Compression flags.
- 
-@@ -254,6 +260,32 @@
-     Internally this function calls squish::Decompress for each block.
- */
- void DecompressImage( u8* rgba, int width, int height, void const* blocks, int flags );
-+void DecompressImage( u8* rgba, int width, int height, int pitch, void const* blocks, int flags );
-+
-+// -----------------------------------------------------------------------------
-+
-+/*! @brief Computes MSE of an compressed image in memory.
-+
-+	@param rgba		The original image pixels.
-+	@param width	The width of the source image.
-+	@param height	The height of the source image.
-+	@param pitch  	The pitch of the source image.
-+	@param dxt		The compressed dxt blocks
-+	@param flags	Compression flags.
-+	@param colourMSE	The MSE of the colour values.
-+	@param alphaMSE	The MSE of the alpha values.
-+	
-+	The colour MSE and alpha MSE are computed across all pixels. The colour MSE is
-+	averaged across all rgb values (i.e. colourMSE = sum sum_k ||dxt.k - rgba.k||/3)
-+	
-+	The flags parameter should specify either kDxt1, kDxt3 or kDxt5 compression, 
-+	however, DXT1 will be used by default if none is specified. All other flags 
-+	are ignored.
-+
-+	Internally this function calls squish::Decompress for each block.
-+*/
-+void ComputeMSE(u8 const *rgba, int width, int height, u8 const *dxt, int flags, double &colourMSE, double &alphaMSE);
-+void ComputeMSE(u8 const *rgba, int width, int height, int pitch, u8 const *dxt, int flags, double &colourMSE, double &alphaMSE);
- 
- // -----------------------------------------------------------------------------
- 
-diff -uwNr 1.13/squish.pc.in libsquish-1.10-openelec/squish.pc.in
---- 1.13/squish.pc	1970-01-01 01:00:00.000000000 +0100
-+++ libsquish-1.10-openelec/squish.pc	2015-01-09 10:58:43.000000000 +0100
-@@ -0,0 +1,13 @@
-+prefix=/usr
-+exec_prefix=${prefix}
-+libdir=${prefix}/lib
-+sharedlibdir=${libdir}
-+includedir=${prefix}/include
-+
-+Name: squish
-+Description: squish DXT lib
-+Version: 1.1.3-kodi
-+
-+Requires:
-+Libs: -L${libdir} -L${sharedlibdir} -lsquish
-+Cflags: -I${includedir}
diff --git a/package/libsquish/Config.in b/package/libsquish/Config.in
deleted file mode 100644
index eabe6c54a..000000000
--- a/package/libsquish/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_LIBSQUISH
-	bool "libsquish"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
-	help
-	  The libSquish library compresses images with the DXT standard
-	  (also known as S3TC). This standard is mainly used by OpenGL
-	  and DirectX for the lossy compression of RGBA textures.
-
-	  http://sourceforge.net/projects/libsquish
-
-comment "libsquish needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/libsquish/libsquish.hash b/package/libsquish/libsquish.hash
deleted file mode 100644
index caa719864..000000000
--- a/package/libsquish/libsquish.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://sourceforge.net/projects/libsquish/files
-sha1	7bcdd7d0f0460a29e25dcdab8dc41a30e58bb366	libsquish-1.13.tgz
diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
deleted file mode 100644
index 73f8de9cc..000000000
--- a/package/libsquish/libsquish.mk
+++ /dev/null
@@ -1,37 +0,0 @@
-################################################################################
-#
-# libsquish
-#
-################################################################################
-
-LIBSQUISH_VERSION = 1.13
-LIBSQUISH_SOURCE = libsquish-$(LIBSQUISH_VERSION).tgz
-LIBSQUISH_SITE = http://downloads.sourceforge.net/project/libsquish
-LIBSQUISH_INSTALL_STAGING = YES
-LIBSQUISH_STRIP_COMPONENTS = 0
-LIBSQUISH_LICENSE = MIT
-LIBSQUISH_LICENSE_FILES = README
-
-define LIBSQUISH_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-endef
-
-define LIBSQUISH_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/usr/include
-	mkdir -p $(STAGING_DIR)/usr/lib
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		install PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr
-	$(INSTALL) -D -m 644 $(@D)/squish.pc $(STAGING_DIR)/usr/lib/pkgconfig/squish.pc
-	ln -sf libsquish.so.0.0 $(STAGING_DIR)/usr/lib/libsquish.so
-	ln -sf libsquish.so.0.0 $(STAGING_DIR)/usr/lib/libsquish.so.0
-endef
-
-define LIBSQUISH_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/include
-	mkdir -p $(TARGET_DIR)/usr/lib
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		install PREFIX=/usr INSTALL_DIR=$(TARGET_DIR)/usr
-	ln -sf libsquish.so.0.0 $(TARGET_DIR)/usr/lib/libsquish.so.0
-endef
-
-$(eval $(generic-package))
-- 
2.11.0
