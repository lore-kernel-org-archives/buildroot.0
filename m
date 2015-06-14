From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:00 +0200
Subject: [Buildroot] [PATCH/RFC v2 01/44] package/libsquish: New package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for Kodi 15.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                 |    1 +
 package/libsquish/0001-kodi.patch | 1504 +++++++++++++++++++++++++++++++++++++
 package/libsquish/Config.in       |   11 +
 package/libsquish/libsquish.hash  |    2 +
 package/libsquish/libsquish.mk    |   27 +
 5 files changed, 1545 insertions(+)
 create mode 100644 package/libsquish/0001-kodi.patch
 create mode 100644 package/libsquish/Config.in
 create mode 100644 package/libsquish/libsquish.hash
 create mode 100644 package/libsquish/libsquish.mk

diff --git a/package/Config.in b/package/Config.in
index 6dbc32d..8823c8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -705,6 +705,7 @@ endmenu
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
 	source "package/libzip/Config.in"
+	source "package/libsquish/Config.in"
 	source "package/lzo/Config.in"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
diff --git a/package/libsquish/0001-kodi.patch b/package/libsquish/0001-kodi.patch
new file mode 100644
index 0000000..1bab6a6
--- /dev/null
+++ b/package/libsquish/0001-kodi.patch
@@ -0,0 +1,1504 @@
+Add Kodi-specific patch
+
+Kodi 15.0 contains an updated version of libsquish:
+https://github.com/xbmc/xbmc/tree/master/tools/depends/native/libsquish-native
+
+The OpenElec project provides a separate tarball including the Kodi-
+specific patches:
+http://sources.openelec.tv/devel/libsquish-1.10-openelec.tar.gz
+
+This patch is the diff between upstream libsquish 1.10 and the OpenElec
+tarball without the vs7/ directory.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uwNr squish-1.10/alpha.cpp libsquish-1.10-openelec/alpha.cpp
+--- squish-1.10/alpha.cpp	2006-06-29 14:43:24.000000000 +0200
++++ libsquish-1.10-openelec/alpha.cpp	2015-01-09 10:58:43.000000000 +0100
+@@ -24,6 +24,7 @@
+    -------------------------------------------------------------------------- */
+    
+ #include "alpha.h"
++#include <limits.h>
+ #include <algorithm>
+ 
+ namespace squish {
+diff -uwNr squish-1.10/clusterfit.cpp libsquish-1.10-openelec/clusterfit.cpp
+--- squish-1.10/clusterfit.cpp	2007-03-23 11:19:20.000000000 +0100
++++ libsquish-1.10-openelec/clusterfit.cpp	2015-01-09 10:58:43.000000000 +0100
+@@ -31,22 +31,21 @@
+ 
+ namespace squish {
+ 
+-ClusterFit::ClusterFit( ColourSet const* colours, int flags ) 
++ClusterFit::ClusterFit( ColourSet const* colours, int flags, float* metric ) 
+   : ColourFit( colours, flags )
+ {
+ 	// set the iteration count
+ 	m_iterationCount = ( m_flags & kColourIterativeClusterFit ) ? kMaxIterations : 1;
+ 
+-	// initialise the best error
+-	m_besterror = VEC4_CONST( FLT_MAX );
+-
+-	// initialise the metric
+-	bool perceptual = ( ( m_flags & kColourMetricPerceptual ) != 0 );
+-	if( perceptual )
+-		m_metric = Vec4( 0.2126f, 0.7152f, 0.0722f, 0.0f );
++	// initialise the metric (old perceptual = 0.2126f, 0.7152f, 0.0722f)
++	if( metric )
++		m_metric = Vec4( metric[0], metric[1], metric[2], 1.0f );
+ 	else
+ 		m_metric = VEC4_CONST( 1.0f );	
+ 
++	// initialise the best error
++	m_besterror = VEC4_CONST( FLT_MAX );
++
+ 	// cache some values
+ 	int const count = m_colours->GetCount();
+ 	Vec3 const* values = m_colours->GetPoints();
+diff -uwNr squish-1.10/clusterfit.h libsquish-1.10-openelec/clusterfit.h
+--- squish-1.10/clusterfit.h	2007-03-23 11:19:20.000000000 +0100
++++ libsquish-1.10-openelec/clusterfit.h	2015-01-09 10:58:43.000000000 +0100
+@@ -37,7 +37,7 @@
+ class ClusterFit : public ColourFit
+ {
+ public:
+-	ClusterFit( ColourSet const* colours, int flags );
++	ClusterFit( ColourSet const* colours, int flags, float* metric );
+ 	
+ private:
+ 	bool ConstructOrdering( Vec3 const& axis, int iteration );
+diff -uwNr squish-1.10/colourfit.cpp libsquish-1.10-openelec/colourfit.cpp
+--- squish-1.10/colourfit.cpp	2006-04-07 19:30:11.000000000 +0200
++++ libsquish-1.10-openelec/colourfit.cpp	2015-01-09 10:58:43.000000000 +0100
+@@ -34,6 +34,10 @@
+ {
+ }
+ 
++ColourFit::~ColourFit()
++{
++}
++
+ void ColourFit::Compress( void* block )
+ {
+ 	bool isDxt1 = ( ( m_flags & kDxt1 ) != 0 );
+diff -uwNr squish-1.10/colourfit.h libsquish-1.10-openelec/colourfit.h
+--- squish-1.10/colourfit.h	2006-04-07 19:30:11.000000000 +0200
++++ libsquish-1.10-openelec/colourfit.h	2015-01-09 10:58:43.000000000 +0100
+@@ -27,6 +27,7 @@
+ #define SQUISH_COLOURFIT_H
+ 
+ #include <squish.h>
++#include <limits.h>
+ #include "maths.h"
+ 
+ namespace squish {
+@@ -37,6 +38,7 @@
+ {
+ public:
+ 	ColourFit( ColourSet const* colours, int flags );
++	virtual ~ColourFit();
+ 
+ 	void Compress( void* block );
+ 
+diff -uwNr squish-1.10/config libsquish-1.10-openelec/config
+--- squish-1.10/config	2006-10-01 21:40:09.000000000 +0200
++++ libsquish-1.10-openelec/config	2015-01-09 16:51:36.000000000 +0100
+@@ -18,5 +18,4 @@
+ endif
+ 
+ # where should we install to
+-INSTALL_DIR ?= /usr/local
+-
++INSTALL_DIR ?= @PREFIX@
+diff -uwNr squish-1.10/config.h libsquish-1.10-openelec/config.h
+--- squish-1.10/config.h	2006-10-01 21:40:09.000000000 +0200
++++ libsquish-1.10-openelec/config.h	2015-01-09 10:58:43.000000000 +0100
+@@ -28,15 +28,25 @@
+ 
+ // Set to 1 when building squish to use Altivec instructions.
+ #ifndef SQUISH_USE_ALTIVEC
++#if defined(__ALTIVEC__)
++#define SQUISH_USE_ALTIVEC 1
++#else
+ #define SQUISH_USE_ALTIVEC 0
+ #endif
++#endif
+ 
+ // Set to 1 or 2 when building squish to use SSE or SSE2 instructions.
+ #ifndef SQUISH_USE_SSE
++#if defined(__SSE2__)
++#define SQUISH_USE_SSE 2
++#elif defined(__SSE__)
++#define SQUISH_USE_SSE 1
++#else
+ #define SQUISH_USE_SSE 0
+ #endif
++#endif
+ 
+-// Internally et SQUISH_USE_SIMD when either Altivec or SSE is available.
++// Internally set SQUISH_USE_SIMD when either Altivec or SSE is available.
+ #if SQUISH_USE_ALTIVEC && SQUISH_USE_SSE
+ #error "Cannot enable both Altivec and SSE!"
+ #endif
+diff -uwNr squish-1.10/config.in libsquish-1.10-openelec/config.in
+--- squish-1.10/config.in	1970-01-01 01:00:00.000000000 +0100
++++ libsquish-1.10-openelec/config.in	2015-01-09 10:58:43.000000000 +0100
+@@ -0,0 +1,21 @@
++# config file used for the Makefile only
++
++# define to 1 to use Altivec instructions
++USE_ALTIVEC ?= 0
++
++# define to 1 to use SSE2 instructions
++USE_SSE ?= 0
++
++# default flags
++CXXFLAGS ?= -O2
++ifeq ($(USE_ALTIVEC),1)
++CPPFLAGS += -DSQUISH_USE_ALTIVEC=1
++CXXFLAGS += -maltivec
++endif
++ifeq ($(USE_SSE),1)
++CPPFLAGS += -DSQUISH_USE_SSE=2
++CXXFLAGS += -msse
++endif
++
++# where should we install to
++INSTALL_DIR ?= @PREFIX@
+diff -uwNr squish-1.10/extra/squishpng.cpp libsquish-1.10-openelec/extra/squishpng.cpp
+--- squish-1.10/extra/squishpng.cpp	2007-03-21 20:31:51.000000000 +0100
++++ libsquish-1.10-openelec/extra/squishpng.cpp	2015-01-09 10:58:43.000000000 +0100
+@@ -25,11 +25,13 @@
+    
+ /*! @file
+ 
+-	@brief	Example program that converts between the PNG and DXT formats.
++	@brief	Test program that compresses images loaded using the PNG format.
+ 	
+-	This program requires libpng for PNG input and output, and is designed
+-	to show how to prepare data for the squish library when it is not simply
+-	a contiguous block of memory.
++	This program requires libpng for PNG input and output, and is designed to
++	test the RMS error for DXT compression for a set of test images.
++
++	This program uses the high-level image compression and decompression
++	functions that process an entire image at a time.
+ */
+ 
+ #include <iostream>
+@@ -74,9 +76,17 @@
+ class Mem : NonCopyable
+ {
+ public:
++	Mem() : m_p( 0 ) {}
+ 	explicit Mem( int size ) : m_p( new u8[size] ) {}
+ 	~Mem() { delete[] m_p; }
+ 	
++	void Reset( int size )
++	{
++		u8 *p = new u8[size];
++		delete m_p;
++		m_p = p;
++	}
++	
+ 	u8* Get() const { return m_p; }
+ 	
+ private:
+@@ -172,53 +182,71 @@
+ class PngRows : NonCopyable
+ {
+ public:
+-	PngRows( int width, int height, int stride ) : m_width( width ), m_height( height )
++	PngRows( int pitch, int height ) : m_height( height )
+ 	{
+-		m_rows = ( png_bytep* )malloc( m_height*sizeof( png_bytep ) );
++		m_rows = new png_bytep[m_height];
+ 		for( int i = 0; i < m_height; ++i )
+-			m_rows[i] = ( png_bytep )malloc( m_width*stride );
++			m_rows[i] = new png_byte[pitch];
+ 	}
+ 	
+ 	~PngRows() 
+ 	{
+ 		for( int i = 0; i < m_height; ++i )
+-			free( m_rows[i] );
+-		free( m_rows );
++			delete[] m_rows[i];
++		delete[] m_rows;
+ 	}
+ 	
+ 	png_bytep* Get() const { return m_rows; }
+ 	
++	png_bytep operator[](int y) const { return m_rows[y]; }
++	
+ private:
+ 	png_bytep* m_rows;
+-	int m_width, m_height;
++	int m_height;
+ };
+ 
+-class PngImage
++//! Represents a DXT compressed image in memory.
++struct DxtData
++{
++	int width;
++	int height;
++	int format;		//!< Either kDxt1, kDxt3 or kDxt5.
++	Mem data;
++	bool isColour;
++	bool isAlpha;
++};
++
++//! Represents an uncompressed RGBA image in memory.
++class Image
+ {
+ public:
+-	explicit PngImage( std::string const& fileName );
++	Image();
+ 
+-	int GetWidth() const { return m_width; }
+-	int GetHeight() const { return m_height; }
+-	int GetStride() const { return m_stride; }
+-	bool IsColour() const { return m_colour; }
+-	bool IsAlpha() const { return m_alpha; }
++	void LoadPng( std::string const& fileName );
++	void SavePng( std::string const& fileName ) const;
+ 	
+-	u8 const* GetRow( int row ) const { return ( u8* )m_rows[row]; }
++	void Decompress( DxtData const& dxt );
++	void Compress( DxtData& dxt, int flags ) const;
+ 
+-private:
+-	PngReadStruct m_png;
++	double GetRmsError( Image const& image ) const;
+ 
++private:
+ 	int m_width;
+ 	int m_height;
+-	int m_stride;
+-	bool m_colour;
+-	bool m_alpha;
+-	
+-	png_bytep* m_rows;
++	bool m_isColour;	//!< Either colour or luminance.
++	bool m_isAlpha;		//!< Either alpha or not.
++	Mem m_pixels;
+ };
+ 
+-PngImage::PngImage( std::string const& fileName )
++Image::Image() 
++  : m_width( 0 ), 
++  	m_height( 0 ),
++	m_isColour( false ),
++	m_isAlpha( false )
++{
++}
++
++void Image::LoadPng( std::string const& fileName )
+ {
+ 	// open the source file
+ 	File file( fopen( fileName.c_str(), "rb" ) );
+@@ -231,7 +259,9 @@
+ 	
+ 	// check the signature bytes
+ 	png_byte header[8];
+-	fread( header, 1, 8, file.Get() );
++	size_t check = fread( header, 1, 8, file.Get() );
++	if( check != 8 )
++		throw Error( "file read error" );
+ 	if( png_sig_cmp( header, 0, 8 ) )
+ 	{
+ 		std::ostringstream oss;
+@@ -240,16 +270,17 @@
+ 	}
+ 	
+ 	// read the image into memory
+-	png_init_io( m_png.GetPng(), file.Get() );
+-	png_set_sig_bytes( m_png.GetPng(), 8 );
+-	png_read_png( m_png.GetPng(), m_png.GetInfo(), PNG_TRANSFORM_EXPAND, 0 );
++	PngReadStruct png;
++	png_init_io( png.GetPng(), file.Get() );
++	png_set_sig_bytes( png.GetPng(), 8 );
++	png_read_png( png.GetPng(), png.GetInfo(), PNG_TRANSFORM_EXPAND, 0 );
+ 
+ 	// get the image info
+ 	png_uint_32 width;
+ 	png_uint_32 height;
+ 	int bitDepth;
+ 	int colourType;
+-	png_get_IHDR( m_png.GetPng(), m_png.GetInfo(), &width, &height, &bitDepth, &colourType, 0, 0, 0 );
++	png_get_IHDR( png.GetPng(), png.GetInfo(), &width, &height, &bitDepth, &colourType, 0, 0, 0 );
+ 	
+ 	// check the image is 8 bit
+ 	if( bitDepth != 8 )
+@@ -259,234 +290,156 @@
+ 		throw Error( oss.str() );
+ 	}
+ 	
+-	// save the info
++	// copy the data into a contiguous array
+ 	m_width = width;
+ 	m_height = height;
+-	m_colour = ( ( colourType & PNG_COLOR_MASK_COLOR ) != 0 );
+-	m_alpha = ( ( colourType & PNG_COLOR_MASK_ALPHA ) != 0 );
+-	m_stride = ( m_colour ? 3 : 1 ) + ( m_alpha ? 1 : 0 );
++	m_isColour = ( ( colourType & PNG_COLOR_MASK_COLOR ) != 0 );
++	m_isAlpha = ( ( colourType & PNG_COLOR_MASK_ALPHA ) != 0 );
++	m_pixels.Reset(4*width*height);
+ 
+ 	// get the image rows
+-	m_rows = png_get_rows( m_png.GetPng(), m_png.GetInfo() );
+-	if( !m_rows )
++	png_bytep const *rows = png_get_rows( png.GetPng(), png.GetInfo() );
++	if( !rows )
+ 		throw Error( "failed to get image rows" );
+-}
+-
+-static void Compress( std::string const& sourceFileName, std::string const& targetFileName, int flags )
+-{
+-	// load the source image
+-	PngImage sourceImage( sourceFileName );
+-
+-	// get the image info
+-	int width = sourceImage.GetWidth();
+-	int height = sourceImage.GetHeight();
+-	int stride = sourceImage.GetStride();
+-	bool colour = sourceImage.IsColour();
+-	bool alpha = sourceImage.IsAlpha();
+ 
+-	// check the image dimensions
+-	if( ( width % 4 ) != 0 || ( height % 4 ) != 0 )
+-	{
+-		std::ostringstream oss;
+-		oss << "cannot compress " << width << "x" << height
+-			<< "image (dimensions must be multiples of 4)";
+-		throw Error( oss.str() );
+-	}
+-	
+-	// create the target data
+-	int bytesPerBlock = ( ( flags & kDxt1 ) != 0 ) ? 8 : 16;
+-	int targetDataSize = bytesPerBlock*width*height/16;
+-	Mem targetData( targetDataSize );
+-	
+-	// loop over blocks and compress them
+-	clock_t start = std::clock();
+-	u8* targetBlock = targetData.Get();
+-	for( int y = 0; y < height; y += 4 )
+-	{
+-		// process a row of blocks
+-		for( int x = 0; x < width; x += 4 )
+-		{
+-			// get the block data
+-			u8 sourceRgba[16*4];
+-			for( int py = 0, i = 0; py < 4; ++py )
+-			{
+-				u8 const* row = sourceImage.GetRow( y + py ) + x*stride;
+-				for( int px = 0; px < 4; ++px, ++i )
+-				{
+-					// get the pixel colour 
+-					if( colour )
+-					{
+-						for( int j = 0; j < 3; ++j )
+-							sourceRgba[4*i + j] = *row++;
++	// copy the pixels into the storage
++	u8 *dest = m_pixels.Get();
++	for( int y = 0; y < m_height; ++y )
++	{
++		u8 const *src = rows[y];
++		for( int x = 0; x < m_width; ++x )
++		{
++			if( m_isColour )
++			{
++				dest[0] = src[0];
++				dest[1] = src[1];
++				dest[2] = src[2];
++				src += 3;
+ 					}
+ 					else
+ 					{
+-						for( int j = 0; j < 3; ++j )
+-							sourceRgba[4*i + j] = *row;
+-						++row;
++				u8 lum = *src++;
++				dest[0] = lum;
++				dest[1] = lum;
++				dest[2] = lum;
+ 					}
+ 					
+-					// skip alpha for now
+-					if( alpha )
+-						sourceRgba[4*i + 3] = *row++;
++			if( m_isAlpha )
++				dest[3] = *src++;
+ 					else
+-						sourceRgba[4*i + 3] = 255;
+-				}
+-			}
+-			
+-			// compress this block
+-			Compress( sourceRgba, targetBlock, flags );
++				dest[3] = 255;
+ 			
+-			// advance
+-			targetBlock += bytesPerBlock;			
++			dest += 4;
+ 		}
+ 	}
+-	clock_t end = std::clock();
+-	double duration = ( double )( end - start ) / CLOCKS_PER_SEC;
+-	std::cout << "time taken: " << duration << " seconds" << std::endl;
+-	
+-	// open the target file
+-	File targetFile( fopen( targetFileName.c_str(), "wb" ) );
+-	if( !targetFile.IsValid() )
+-	{
+-		std::ostringstream oss;
+-		oss << "failed to open \"" << sourceFileName << "\" for writing";
+-		throw Error( oss.str() );
+ 	}
+ 	
+-	// write the header
+-	fwrite( &width, sizeof( int ), 1, targetFile.Get() );
+-	fwrite( &height, sizeof( int ), 1, targetFile.Get() );
+-	
+-	// write the data
+-	fwrite( targetData.Get(), 1, targetDataSize, targetFile.Get() );
+-}
+-
+-static void Decompress( std::string const& sourceFileName, std::string const& targetFileName, int flags )
+-{
+-	// open the source file
+-	File sourceFile( fopen( sourceFileName.c_str(), "rb" ) );
+-	if( !sourceFile.IsValid() )
++void Image::SavePng( std::string const& fileName ) const
+ 	{
+-		std::ostringstream oss;
+-		oss << "failed to open \"" << sourceFileName << "\" for reading";
+-		throw Error( oss.str() );
+-	}
+-	
+-	// get the width and height
+-	int width, height;
+-	fread( &width, sizeof( int ), 1, sourceFile.Get() ); 
+-	fread( &height, sizeof( int ), 1, sourceFile.Get() );
+-	
+-	// work out the data size
+-	int bytesPerBlock = ( ( flags & kDxt1 ) != 0 ) ? 8 : 16;
+-	int sourceDataSize = bytesPerBlock*width*height/16;
+-	Mem sourceData( sourceDataSize );
+-	
+-	// read the source data
+-	fread( sourceData.Get(), 1, sourceDataSize, sourceFile.Get() );
+-		
+ 	// create the target rows
+-	PngRows targetRows( width, height, 4 );
++	int const pixelSize = ( m_isColour ? 3 : 1 ) + ( m_isAlpha ? 1 : 0 );
++	PngRows rows( m_width*pixelSize, m_height );
+ 	
+-	// loop over blocks and compress them
+-	u8 const* sourceBlock = sourceData.Get();
+-	for( int y = 0; y < height; y += 4 )
+-	{
+-		// process a row of blocks
+-		for( int x = 0; x < width; x += 4 )
+-		{
+-			// decompress back
+-			u8 targetRgba[16*4];
+-			Decompress( targetRgba, sourceBlock, flags );
+-			
+-			// write the data into the target rows
+-			for( int py = 0, i = 0; py < 4; ++py )
+-			{
+-				u8* row = ( u8* )targetRows.Get()[y + py] + x*4;
+-				for( int px = 0; px < 4; ++px, ++i )
+-				{	
+-					for( int j = 0; j < 4; ++j )
+-						*row++ = targetRgba[4*i + j];
+-				}
++	// fill the rows with pixel data
++	u8 const *src = m_pixels.Get();
++	for( int y = 0; y < m_height; ++y )
++	{
++		u8 *dest = rows[y];
++		for( int x = 0; x < m_width; ++x )
++		{
++			if( m_isColour )
++			{
++				dest[0] = src[0];
++				dest[1] = src[1];
++				dest[2] = src[2];
++				dest += 3;
+ 			}
++			else
++				*dest++ = src[1];
+ 			
+-			// advance
+-			sourceBlock += bytesPerBlock;
++			if( m_isAlpha )
++				*dest++ = src[3];
++
++			src += 4;
+ 		}
+ 	}
+ 	
+-	// create the target PNG
+-	PngWriteStruct targetPng;
+-
+ 	// set up the image
++	PngWriteStruct png;
+ 	png_set_IHDR(
+-		targetPng.GetPng(), targetPng.GetInfo(), width, height,
+-		8, PNG_COLOR_TYPE_RGBA, PNG_INTERLACE_NONE,
+-		PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT 
++		png.GetPng(), png.GetInfo(), m_width, m_height,
++		8, ( m_isColour ? PNG_COLOR_MASK_COLOR : 0) | ( m_isAlpha ? PNG_COLOR_MASK_ALPHA : 0 ), 
++		PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT 
+ 	);
+ 	   
+ 	// open the target file
+-	File targetFile( fopen( targetFileName.c_str(), "wb" ) );
+-	if( !targetFile.IsValid() )
++	File file( fopen( fileName.c_str(), "wb" ) );
++	if( !file.IsValid() )
+ 	{
+ 		std::ostringstream oss;
+-		oss << "failed to open \"" << targetFileName << "\" for writing";
++		oss << "failed to open \"" << fileName << "\" for writing";
+ 		throw Error( oss.str() );
+ 	}
+ 	
+ 	// write the image
+-	png_set_rows( targetPng.GetPng(), targetPng.GetInfo(), targetRows.Get() );
+-	png_init_io( targetPng.GetPng(), targetFile.Get() );
+-	png_write_png( targetPng.GetPng(), targetPng.GetInfo(), PNG_TRANSFORM_IDENTITY, 0 );
++	png_set_rows( png.GetPng(), png.GetInfo(), rows.Get() );
++	png_init_io( png.GetPng(), file.Get() );
++	png_write_png( png.GetPng(), png.GetInfo(), PNG_TRANSFORM_IDENTITY, 0 );
+ }
+ 
+-static void Diff( std::string const& sourceFileName, std::string const& targetFileName )
++void Image::Decompress( DxtData const& dxt )
+ {
+-	// load the images
+-	PngImage sourceImage( sourceFileName );
+-	PngImage targetImage( targetFileName );
++	// allocate storage
++	m_width = dxt.width;
++	m_height = dxt.height;
++	m_isColour = dxt.isColour;
++	m_isAlpha = dxt.isAlpha;
++	m_pixels.Reset( 4*m_width*m_height );
+ 	
+-	// get the image info
+-	int width = sourceImage.GetWidth();
+-	int height = sourceImage.GetHeight();
+-	int sourceStride = sourceImage.GetStride();
+-	int targetStride = targetImage.GetStride();
+-	int stride = std::min( sourceStride, targetStride );
++	// use the whole image decompression function to do the work
++	DecompressImage( m_pixels.Get(), m_width, m_height, dxt.data.Get(), dxt.format );
++}
++
++void Image::Compress( DxtData& dxt, int flags ) const
++{
++	// work out how much memory we need
++	int storageSize = GetStorageRequirements( m_width, m_height, flags );
+ 
+-	// check they match
+-	if( width != targetImage.GetWidth() || height != targetImage.GetHeight() )
+-		throw Error( "source and target dimensions do not match" );
++	// set the structure fields and allocate it
++	dxt.width = m_width;
++	dxt.height = m_height;
++	dxt.format = flags & ( kDxt1 | kDxt3 | kDxt5 );
++	dxt.isColour = m_isColour;
++	dxt.isAlpha = m_isAlpha;
++	dxt.data.Reset( storageSize );
+ 		
+-	// work out the error
+-	double error = 0.0;
+-	for( int y = 0; y < height; ++y )
++	// use the whole image compression function to do the work
++	CompressImage( m_pixels.Get(), m_width, m_height, dxt.data.Get(), flags );
++}
++
++double Image::GetRmsError( Image const& image ) const
+ 	{
+-		u8 const* sourceRow = sourceImage.GetRow( y );
+-		u8 const* targetRow = targetImage.GetRow( y );
+-		for( int x = 0; x < width; ++x )
++	if( m_width != image.m_width || m_height != image.m_height )
++		throw Error( "image dimensions mismatch when computing RMS error" );
++
++	// accumulate colour error
++	double difference = 0;
++	u8 const *a = m_pixels.Get();
++	u8 const *b = image.m_pixels.Get();
++	for( int y = 0; y < m_height; ++y )
+ 		{	
+-			u8 const* sourcePixel = sourceRow + x*sourceStride;
+-			u8 const* targetPixel = targetRow + x*targetStride;
+-			for( int i = 0; i < stride; ++i )
++		for( int x = 0; x < m_width; ++x )
+ 			{
+-				int diff = ( int )sourcePixel[i] - ( int )targetPixel[i];
+-				error += ( double )( diff*diff );
++			int d0 = ( int )a[0] - ( int )b[0];
++			int d1 = ( int )a[1] - ( int )b[1];
++			int d2 = ( int )a[2] - ( int )b[2];
++			difference += ( double )( d0*d0 + d1*d1 + d2*d2 ); 
++			a += 4;
++			b += 4;
+ 			}
+ 		}
++	return std::sqrt( difference/( double )( m_width*m_height ) );
+ 	}
+-	error = std::sqrt( error / ( width*height ) );
+-	
+-	// print it out
+-	std::cout << "rms error: " << error << std::endl;
+-}
+-
+-enum Mode
+-{
+-	kCompress, 
+-	kDecompress,
+-	kDiff
+-};
+ 
+ int main( int argc, char* argv[] )
+ {
+@@ -495,13 +448,12 @@
+ 		// parse the command-line
+ 		std::string sourceFileName;
+ 		std::string targetFileName;
+-		Mode mode = kCompress;
+-		int method = kDxt1;
+-		int metric = kColourMetricPerceptual;
++		int format = kDxt1;
+ 		int fit = kColourClusterFit;
+ 		int extra = 0;
+ 		bool help = false;
+ 		bool arguments = true;
++		bool error = false;
+ 		for( int i = 1; i < argc; ++i )
+ 		{
+ 			// check for options
+@@ -513,20 +465,16 @@
+ 					switch( word[j] )
+ 					{
+ 					case 'h': help = true; break;
+-					case 'c': mode = kCompress; break;
+-					case 'd': mode = kDecompress; break;
+-					case 'e': mode = kDiff; break;
+-					case '1': method = kDxt1; break;
+-					case '3': method = kDxt3; break;
+-					case '5': method = kDxt5; break;
+-					case 'u': metric = kColourMetricUniform; break;
++					case '1': format = kDxt1; break;
++					case '3': format = kDxt3; break;
++					case '5': format = kDxt5; break;
+ 					case 'r': fit = kColourRangeFit; break;
+ 					case 'i': fit = kColourIterativeClusterFit; break;
+ 					case 'w': extra = kWeightColourByAlpha; break;
+ 					case '-': arguments = false; break;
+ 					default:
+-						std::cerr << "unknown option '" << word[j] << "'" << std::endl;
+-						return -1;
++						std::cerr << "squishpng error: unknown option '" << word[j] << "'" << std::endl;
++						error = true;
+ 					}
+ 				}
+ 			}
+@@ -538,60 +486,53 @@
+ 					targetFileName.assign( word );
+ 				else
+ 				{
+-					std::cerr << "unexpected argument \"" << word << "\"" << std::endl;
++					std::cerr << "squishpng error: unexpected argument \"" << word << "\"" << std::endl;
++					error = true;
+ 				}
+ 			}
+ 		}
+ 		
+ 		// check arguments
+-		if( help )
++		if( sourceFileName.empty() )
++		{
++			std::cerr << "squishpng error: no source file given" << std::endl;
++			error = true;
++		}
++		if( help || error )
+ 		{
+ 			std::cout 
+ 				<< "SYNTAX" << std::endl
+-				<< "\tsquishpng [-cde135] <source> <target>" << std::endl 
++				<< "\tsquishpng [-135riw] <source> [<target>]" << std::endl 
+ 				<< "OPTIONS" << std::endl
+-				<< "\t-c\tCompress source png to target raw dxt (default)" << std::endl
++				<< "\t-h\tPrint this help message" << std::endl
+ 				<< "\t-135\tSpecifies whether to use DXT1 (default), DXT3 or DXT5 compression" << std::endl
+-				<< "\t-u\tUse a uniform colour metric during colour compression" << std::endl
+ 				<< "\t-r\tUse the fast but inferior range-based colour compressor" << std::endl
+ 				<< "\t-i\tUse the very slow but slightly better iterative colour compressor" << std::endl
+ 				<< "\t-w\tWeight colour values by alpha in the cluster colour compressor" << std::endl
+-				<< "\t-d\tDecompress source raw dxt to target png" << std::endl
+-				<< "\t-e\tDiff source and target png" << std::endl
+ 				;
+ 			
+-			return 0;
+-		}
+-		if( sourceFileName.empty() )
+-		{
+-			std::cerr << "no source file given" << std::endl;
+-			return -1;
+-		}
+-		if( targetFileName.empty() )
+-		{
+-			std::cerr << "no target file given" << std::endl;
+-			return -1;
++			return error ? -1 : 0;
+ 		}
+ 
+-		// do the work
+-		switch( mode )
+-		{
+-		case kCompress:
+-			Compress( sourceFileName, targetFileName, method | metric | fit | extra );
+-			break;
++		// load the source image
++		Image sourceImage;
++		sourceImage.LoadPng( sourceFileName );
+ 		
+-		case kDecompress:
+-			Decompress( sourceFileName, targetFileName, method );
+-			break;
++		// compress to DXT
++		DxtData dxt;
++		sourceImage.Compress( dxt, format | fit | extra );
+ 			
+-		case kDiff:
+-			Diff( sourceFileName, targetFileName );
+-			break;
++		// decompress back
++		Image targetImage;
++		targetImage.Decompress( dxt );
+ 			
+-		default:
+-			std::cerr << "unknown mode" << std::endl;
+-			throw std::exception();
+-		}
++		// compare the images
++		double rmsError = sourceImage.GetRmsError( targetImage );
++		std::cout << sourceFileName << " " << rmsError << std::endl;
++
++		// save the target image if necessary
++		if( !targetFileName.empty() )
++			targetImage.SavePng( targetFileName );
+ 	}
+ 	catch( std::exception& excuse )
+ 	{
+diff -uwNr squish-1.10/extra/squishtest.cpp libsquish-1.10-openelec/extra/squishtest.cpp
+--- squish-1.10/extra/squishtest.cpp	2006-03-03 21:20:22.000000000 +0100
++++ libsquish-1.10-openelec/extra/squishtest.cpp	2015-01-09 10:58:43.000000000 +0100
+@@ -35,6 +35,7 @@
+ #include <iostream>
+ #include <cmath>
+ #include <cfloat>
++#include <cstdlib>
+ 
+ using namespace squish;
+ 
+diff -uwNr squish-1.10/Makefile libsquish-1.10-openelec/Makefile
+--- squish-1.10/Makefile	2006-04-07 19:30:11.000000000 +0200
++++ libsquish-1.10-openelec/Makefile	2015-01-09 16:52:04.000000000 +0100
+@@ -7,11 +7,12 @@
+ 
+ LIB = libsquish.a
+ 
+-all : $(LIB)
++all : $(LIB) squish.pc
+ 
+-install : $(LIB)
++install : $(LIB) squish.pc
+ 	install squish.h $(INSTALL_DIR)/include 
+ 	install libsquish.a $(INSTALL_DIR)/lib
++	install squish.pc $(INSTALL_DIR)/lib/pkgconfig
+ 
+ uninstall:
+ 	$(RM) $(INSTALL_DIR)/include/squish.h
+@@ -27,5 +28,6 @@
+ clean :
+ 	$(RM) $(OBJ) $(LIB)
+ 
+-
++squish.pc:
++	sed 's|@PREFIX@|$(PREFIX)|' $@.in > $@
+ 
+diff -uwNr squish-1.10/maths.cpp libsquish-1.10-openelec/maths.cpp
+--- squish-1.10/maths.cpp	2006-01-19 22:10:49.000000000 +0100
++++ libsquish-1.10-openelec/maths.cpp	2015-01-09 10:58:43.000000000 +0100
+@@ -30,6 +30,7 @@
+ */
+ 
+ #include "maths.h"
++#include "simd.h"
+ #include <cfloat>
+ 
+ namespace squish {
+@@ -44,6 +45,7 @@
+ 		total += weights[i];
+ 		centroid += weights[i]*points[i];
+ 	}
++	if( total > FLT_EPSILON )
+ 	centroid /= total;
+ 
+ 	// accumulate the covariance matrix
+@@ -65,6 +67,8 @@
+ 	return covariance;
+ }
+ 
++#if 0
++
+ static Vec3 GetMultiplicity1Evector( Sym3x3 const& matrix, float evalue )
+ {
+ 	// compute M
+@@ -224,4 +228,32 @@
+ 	}
+ }
+ 
++#else
++
++#define POWER_ITERATION_COUNT 	8
++
++Vec3 ComputePrincipleComponent( Sym3x3 const& matrix )
++{
++	Vec4 const row0( matrix[0], matrix[1], matrix[2], 0.0f );
++	Vec4 const row1( matrix[1], matrix[3], matrix[4], 0.0f );
++	Vec4 const row2( matrix[2], matrix[4], matrix[5], 0.0f );
++	Vec4 v = VEC4_CONST( 1.0f );
++	for( int i = 0; i < POWER_ITERATION_COUNT; ++i )
++	{
++		// matrix multiply
++		Vec4 w = row0*v.SplatX();
++		w = MultiplyAdd(row1, v.SplatY(), w);
++		w = MultiplyAdd(row2, v.SplatZ(), w);
++
++		// get max component from xyz in all channels
++		Vec4 a = Max(w.SplatX(), Max(w.SplatY(), w.SplatZ()));
++
++		// divide through and advance
++		v = w*Reciprocal(a);
++	}
++	return v.GetVec3();
++}
++
++#endif
++
+ } // namespace squish
+diff -uwNr squish-1.10/rangefit.cpp libsquish-1.10-openelec/rangefit.cpp
+--- squish-1.10/rangefit.cpp	2006-09-02 10:48:17.000000000 +0200
++++ libsquish-1.10-openelec/rangefit.cpp	2015-01-09 10:58:43.000000000 +0100
+@@ -30,13 +30,12 @@
+ 
+ namespace squish {
+ 
+-RangeFit::RangeFit( ColourSet const* colours, int flags ) 
++RangeFit::RangeFit( ColourSet const* colours, int flags, float* metric ) 
+   : ColourFit( colours, flags )
+ {
+-	// initialise the metric
+-	bool perceptual = ( ( m_flags & kColourMetricPerceptual ) != 0 );
+-	if( perceptual )
+-		m_metric = Vec3( 0.2126f, 0.7152f, 0.0722f );
++	// initialise the metric (old perceptual = 0.2126f, 0.7152f, 0.0722f)
++	if( metric )
++		m_metric = Vec3( metric[0], metric[1], metric[2] );
+ 	else
+ 		m_metric = Vec3( 1.0f );
+ 
+diff -uwNr squish-1.10/rangefit.h libsquish-1.10-openelec/rangefit.h
+--- squish-1.10/rangefit.h	2006-07-25 16:28:13.000000000 +0200
++++ libsquish-1.10-openelec/rangefit.h	2015-01-09 10:58:43.000000000 +0100
+@@ -37,7 +37,7 @@
+ class RangeFit : public ColourFit
+ {
+ public:
+-	RangeFit( ColourSet const* colours, int flags );
++	RangeFit( ColourSet const* colours, int flags, float* metric );
+ 	
+ private:
+ 	virtual void Compress3( void* block );
+diff -uwNr squish-1.10/simd_ve.h libsquish-1.10-openelec/simd_ve.h
+--- squish-1.10/simd_ve.h	2007-03-21 20:31:51.000000000 +0100
++++ libsquish-1.10-openelec/simd_ve.h	2015-01-09 10:58:43.000000000 +0100
+@@ -31,7 +31,7 @@
+ 
+ namespace squish {
+ 
+-#define VEC4_CONST( X ) Vec4( ( vector float )( X ) )
++#define VEC4_CONST( X ) Vec4( ( vector float ){ X } )
+ 
+ class Vec4
+ {
+@@ -96,7 +96,7 @@
+ 	
+ 	Vec4& operator*=( Arg v )
+ 	{
+-		m_v = vec_madd( m_v, v.m_v, ( vector float )( -0.0f ) );
++		m_v = vec_madd( m_v, v.m_v, ( vector float ){ -0.0f } );
+ 		return *this;
+ 	}
+ 	
+@@ -112,7 +112,7 @@
+ 	
+ 	friend Vec4 operator*( Vec4::Arg left, Vec4::Arg right  )
+ 	{
+-		return Vec4( vec_madd( left.m_v, right.m_v, ( vector float )( -0.0f ) ) );
++		return Vec4( vec_madd( left.m_v, right.m_v, ( vector float ){ -0.0f } ) );
+ 	}
+ 	
+ 	//! Returns a*b + c
+@@ -133,7 +133,7 @@
+ 		vector float estimate = vec_re( v.m_v );
+ 		
+ 		// one round of Newton-Rhaphson refinement
+-		vector float diff = vec_nmsub( estimate, v.m_v, ( vector float )( 1.0f ) );
++		vector float diff = vec_nmsub( estimate, v.m_v, ( vector float ){ 1.0f } );
+ 		return Vec4( vec_madd( diff, estimate, estimate ) );
+ 	}
+ 	
+diff -uwNr squish-1.10/squish.cpp libsquish-1.10-openelec/squish.cpp
+--- squish-1.10/squish.cpp	2007-03-21 20:31:51.000000000 +0100
++++ libsquish-1.10-openelec/squish.cpp	2015-01-09 10:58:43.000000000 +0100
+@@ -23,6 +23,7 @@
+ 	
+    -------------------------------------------------------------------------- */
+    
++#include <string.h>
+ #include <squish.h>
+ #include "colourset.h"
+ #include "maths.h"
+@@ -39,28 +40,19 @@
+ 	// grab the flag bits
+ 	int method = flags & ( kDxt1 | kDxt3 | kDxt5 );
+ 	int fit = flags & ( kColourIterativeClusterFit | kColourClusterFit | kColourRangeFit );
+-	int metric = flags & ( kColourMetricPerceptual | kColourMetricUniform );
+-	int extra = flags & kWeightColourByAlpha;
++	int extra = flags & ( kWeightColourByAlpha | kSourceBGRA );
+ 	
+ 	// set defaults
+ 	if( method != kDxt3 && method != kDxt5 )
+ 		method = kDxt1;
+-	if( fit != kColourRangeFit )
++	if( fit != kColourRangeFit && fit != kColourIterativeClusterFit )
+ 		fit = kColourClusterFit;
+-	if( metric != kColourMetricUniform )
+-		metric = kColourMetricPerceptual;
+ 		
+ 	// done
+-	return method | fit | metric | extra;
++	return method | fit | extra;
+ }
+ 
+-void Compress( u8 const* rgba, void* block, int flags )
+-{
+-	// compress with full mask
+-	CompressMasked( rgba, 0xffff, block, flags );
+-}
+-
+-void CompressMasked( u8 const* rgba, int mask, void* block, int flags )
++void CompressMasked( u8 const* rgba, int mask, void* block, int flags, float* metric )
+ {
+ 	// fix any bad flags
+ 	flags = FixFlags( flags );
+@@ -84,13 +76,13 @@
+ 	else if( ( flags & kColourRangeFit ) != 0 || colours.GetCount() == 0 )
+ 	{
+ 		// do a range fit
+-		RangeFit fit( &colours, flags );
++		RangeFit fit( &colours, flags, metric );
+ 		fit.Compress( colourBlock );
+ 	}
+ 	else
+ 	{
+ 		// default to a cluster fit (could be iterative or not)
+-		ClusterFit fit( &colours, flags );
++		ClusterFit fit( &colours, flags, metric );
+ 		fit.Compress( colourBlock );
+ 	}
+ 	
+@@ -133,7 +125,29 @@
+ 	return blockcount*blocksize;	
+ }
+ 
+-void CompressImage( u8 const* rgba, int width, int height, void* blocks, int flags )
++void CopyRGBA( u8 const* source, u8* dest, int flags )
++{
++	if (flags & kSourceBGRA)
++	{
++		// convert from bgra to rgba
++		dest[0] = source[2];
++		dest[1] = source[1];
++		dest[2] = source[0];
++		dest[3] = source[3];
++	}
++	else
++	{
++		for( int i = 0; i < 4; ++i )
++			*dest++ = *source++;
++	}
++}
++
++void CompressImage( u8 const* rgba, int width, int height, void* blocks, int flags, float* metric )
++{
++	CompressImage(rgba, width, height, width*4, blocks, flags, metric);
++}
++  
++void CompressImage( u8 const* rgba, int width, int height, int pitch, void* blocks, int flags, float* metric )
+ {
+ 	// fix any bad flags
+ 	flags = FixFlags( flags );
+@@ -163,23 +177,17 @@
+ 					if( sx < width && sy < height )
+ 					{
+ 						// copy the rgba value
+-						u8 const* sourcePixel = rgba + 4*( width*sy + sx );
+-						for( int i = 0; i < 4; ++i )
+-							*targetPixel++ = *sourcePixel++;
+-							
++						u8 const* sourcePixel = rgba + pitch*sy + 4*sx;
++						CopyRGBA(sourcePixel, targetPixel, flags);
+ 						// enable this pixel
+ 						mask |= ( 1 << ( 4*py + px ) );
+ 					}
+-					else
+-					{
+-						// skip this pixel as its outside the image
+ 						targetPixel += 4;
+ 					}
+ 				}
+-			}
+ 			
+ 			// compress it into the output
+-			CompressMasked( sourceRgba, mask, targetBlock, flags );
++			CompressMasked( sourceRgba, mask, targetBlock, flags, metric );
+ 			
+ 			// advance
+ 			targetBlock += bytesPerBlock;
+@@ -189,6 +197,11 @@
+ 
+ void DecompressImage( u8* rgba, int width, int height, void const* blocks, int flags )
+ {
++	DecompressImage( rgba, width, height, width*4, blocks, flags );
++}
++
++void DecompressImage( u8* rgba, int width, int height, int pitch, void const* blocks, int flags )
++{
+ 	// fix any bad flags
+ 	flags = FixFlags( flags );
+ 
+@@ -216,24 +229,132 @@
+ 					int sy = y + py;
+ 					if( sx < width && sy < height )
+ 					{
+-						u8* targetPixel = rgba + 4*( width*sy + sx );
++						u8* targetPixel = rgba + pitch*sy + 4*sx;
+ 						
+ 						// copy the rgba value
++						CopyRGBA(sourcePixel, targetPixel, flags);
++					}
++					sourcePixel += 4;
++				}
++			}
++			
++			// advance
++			sourceBlock += bytesPerBlock;
++		}
++	}
++}
++
++static double ErrorSq(double x, double y)
++{
++	return (x - y) * (x - y);
++}
++
++static void ComputeBlockWMSE(u8 const *original, u8 const *compressed, unsigned int w, unsigned int h, double &cmse, double &amse)
++{
++	// Computes the MSE for the block and weights it by the variance of the original block.
++	// If the variance of the original block is less than 4 (i.e. a standard deviation of 1 per channel)
++	// then the block is close to being a single colour. Quantisation errors in single colour blocks
++	// are easier to see than similar errors in blocks that contain more colours, particularly when there
++	// are many such blocks in a large area (eg a blue sky background) as they cause banding.  Given that
++	// banding is easier to see than small errors in "complex" blocks, we weight the errors by a factor
++	// of 5. This implies that images with large, single colour areas will have a higher potential WMSE
++	// than images with lots of detail.
++
++	cmse = amse = 0;
++	unsigned int sum_p[4];  // per channel sum of pixels
++	unsigned int sum_p2[4]; // per channel sum of pixels squared
++	memset(sum_p, 0, sizeof(sum_p));
++	memset(sum_p2, 0, sizeof(sum_p2));
++	for( unsigned int py = 0; py < 4; ++py )
++	{
++		for( unsigned int px = 0; px < 4; ++px )
++		{
++			if( px < w && py < h )
++			{
++				double pixelCMSE = 0;
++				for( int i = 0; i < 3; ++i )
++				{
++					pixelCMSE += ErrorSq(original[i], compressed[i]);
++					sum_p[i] += original[i];
++					sum_p2[i] += (unsigned int)original[i]*original[i];
++				}
++				if( original[3] == 0 && compressed[3] == 0 )
++					pixelCMSE = 0; // transparent in both, so colour is inconsequential
++				amse += ErrorSq(original[3], compressed[3]);
++				cmse += pixelCMSE;
++				sum_p[3] += original[3];
++				sum_p2[3] += (unsigned int)original[3]*original[3];
++			}
++			original += 4;
++			compressed += 4;
++		}
++	}
++	unsigned int variance = 0;
+ 						for( int i = 0; i < 4; ++i )
+-							*targetPixel++ = *sourcePixel++;
++		variance += w*h*sum_p2[i] - sum_p[i]*sum_p[i];
++	if( variance < 4 * w * w * h * h )
++	{
++		amse *= 5;
++		cmse *= 5;
+ 					}
+-					else
++}
++  
++void ComputeMSE( u8 const *rgba, int width, int height, u8 const *dxt, int flags, double &colourMSE, double &alphaMSE )
+ 					{
+-						// skip this pixel as its outside the image
+-						sourcePixel += 4;
++	ComputeMSE(rgba, width, height, width*4, dxt, flags, colourMSE, alphaMSE);
++}
++                
++void ComputeMSE( u8 const *rgba, int width, int height, int pitch, u8 const *dxt, int flags, double &colourMSE, double &alphaMSE )
++{
++	// fix any bad flags
++	flags = FixFlags( flags );
++	colourMSE = alphaMSE = 0;
++
++	// initialise the block input
++	squish::u8 const* sourceBlock = dxt;
++	int bytesPerBlock = ( ( flags & squish::kDxt1 ) != 0 ) ? 8 : 16;
++
++	// loop over blocks
++	for( int y = 0; y < height; y += 4 )
++	{
++		for( int x = 0; x < width; x += 4 )
++		{
++			// decompress the block
++			u8 targetRgba[4*16];
++			Decompress( targetRgba, sourceBlock, flags );
++			u8 const* sourcePixel = targetRgba;
++
++			// copy across to a similar pixel block
++			u8 originalRgba[4*16];
++			u8* originalPixel = originalRgba;
++
++			for( int py = 0; py < 4; ++py )
++			{
++				for( int px = 0; px < 4; ++px )
++				{
++					int sx = x + px;
++					int sy = y + py;
++					if( sx < width && sy < height )
++					{
++						u8 const* targetPixel = rgba + pitch*sy + 4*sx;
++						CopyRGBA(targetPixel, originalPixel, flags);
+ 					}
++					sourcePixel += 4;
++					originalPixel += 4;
+ 				}
+ 			}
+ 			
++			// compute the weighted MSE of the block
++			double blockCMSE, blockAMSE;
++			ComputeBlockWMSE(originalRgba, targetRgba, std::min(4, width - x), std::min(4, height - y), blockCMSE, blockAMSE);
++			colourMSE += blockCMSE;
++			alphaMSE += blockAMSE;
+ 			// advance
+ 			sourceBlock += bytesPerBlock;
+ 		}
+ 	}
++	colourMSE /= (width * height * 3);
++	alphaMSE /= (width * height);
+ }
+ 
+ } // namespace squish
+diff -uwNr squish-1.10/squish.h libsquish-1.10-openelec/squish.h
+--- squish-1.10/squish.h	2007-03-21 21:13:51.000000000 +0100
++++ libsquish-1.10-openelec/squish.h	2015-01-09 10:58:43.000000000 +0100
+@@ -56,14 +56,11 @@
+ 	//! Use a fast but low quality colour compressor.
+ 	kColourRangeFit	= ( 1 << 4 ),
+ 	
+-	//! Use a perceptual metric for colour error (the default).
+-	kColourMetricPerceptual = ( 1 << 5 ),
+-
+-	//! Use a uniform metric for colour error.
+-	kColourMetricUniform = ( 1 << 6 ),
+-	
+ 	//! Weight the colour by alpha during cluster fit (disabled by default).
+-	kWeightColourByAlpha = ( 1 << 7 )
++	kWeightColourByAlpha = ( 1 << 7 ),
++	
++	//! Source is BGRA rather than RGBA
++	kSourceBGRA = ( 1 << 9 ),
+ };
+ 
+ // -----------------------------------------------------------------------------
+@@ -71,74 +68,90 @@
+ /*! @brief Compresses a 4x4 block of pixels.
+ 
+ 	@param rgba		The rgba values of the 16 source pixels.
++	@param mask		The valid pixel mask.
+ 	@param block	Storage for the compressed DXT block.
+ 	@param flags	Compression flags.
++	@param metric	An optional perceptual metric.
+ 	
+ 	The source pixels should be presented as a contiguous array of 16 rgba
+ 	values, with each component as 1 byte each. In memory this should be:
+ 	
+ 		{ r1, g1, b1, a1, .... , r16, g16, b16, a16 }
+ 	
++	The mask parameter enables only certain pixels within the block. The lowest
++	bit enables the first pixel and so on up to the 16th bit. Bits beyond the
++	16th bit are ignored. Pixels that are not enabled are allowed to take
++	arbitrary colours in the output block. An example of how this can be used
++	is in the CompressImage function to disable pixels outside the bounds of
++	the image when the width or height is not divisible by 4.
++	
+ 	The flags parameter should specify either kDxt1, kDxt3 or kDxt5 compression, 
+ 	however, DXT1 will be used by default if none is specified. When using DXT1 
+ 	compression, 8 bytes of storage are required for the compressed DXT block. 
+ 	DXT3 and DXT5 compression require 16 bytes of storage per block.
+ 	
+-	The flags parameter can also specify a preferred colour compressor and 
+-	colour error metric to use when fitting the RGB components of the data. 
+-	Possible colour compressors are: kColourClusterFit (the default), 
+-	kColourRangeFit or kColourIterativeClusterFit. Possible colour error metrics 
+-	are: kColourMetricPerceptual (the default) or kColourMetricUniform. If no 
+-	flags are specified in any particular category then the default will be 
+-	used. Unknown flags are ignored.
+-	
+-	When using kColourClusterFit, an additional flag can be specified to
+-	weight the colour of each pixel by its alpha value. For images that are
+-	rendered using alpha blending, this can significantly increase the 
+-	perceived quality.
++	The flags parameter can also specify a preferred colour compressor to use 
++	when fitting the RGB components of the data. Possible colour compressors 
++	are: kColourClusterFit (the default), kColourRangeFit (very fast, low 
++	quality) or kColourIterativeClusterFit (slowest, best quality).
++		
++	When using kColourClusterFit or kColourIterativeClusterFit, an additional 
++	flag can be specified to weight the importance of each pixel by its alpha 
++	value. For images that are rendered using alpha blending, this can 
++	significantly increase the perceived quality.
++	
++	The metric parameter can be used to weight the relative importance of each
++	colour channel, or pass NULL to use the default uniform weight of 
++	{ 1.0f, 1.0f, 1.0f }. This replaces the previous flag-based control that 
++	allowed either uniform or "perceptual" weights with the fixed values
++	{ 0.2126f, 0.7152f, 0.0722f }. If non-NULL, the metric should point to a 
++	contiguous array of 3 floats.
+ */
+-void Compress( u8 const* rgba, void* block, int flags );
++void CompressMasked( u8 const* rgba, int mask, void* block, int flags, float* metric = 0 );
+ 
+ // -----------------------------------------------------------------------------
+ 
+ /*! @brief Compresses a 4x4 block of pixels.
+ 
+ 	@param rgba		The rgba values of the 16 source pixels.
+-	@param mask		The valid pixel mask.
+ 	@param block	Storage for the compressed DXT block.
+ 	@param flags	Compression flags.
++	@param metric	An optional perceptual metric.
+ 	
+ 	The source pixels should be presented as a contiguous array of 16 rgba
+ 	values, with each component as 1 byte each. In memory this should be:
+ 	
+ 		{ r1, g1, b1, a1, .... , r16, g16, b16, a16 }
+ 		
+-	The mask parameter enables only certain pixels within the block. The lowest
+-	bit enables the first pixel and so on up to the 16th bit. Bits beyond the
+-	16th bit are ignored. Pixels that are not enabled are allowed to take
+-	arbitrary colours in the output block. An example of how this can be used
+-	is in the CompressImage function to disable pixels outside the bounds of
+-	the image when the width or height is not divisible by 4.
+-	
+ 	The flags parameter should specify either kDxt1, kDxt3 or kDxt5 compression, 
+ 	however, DXT1 will be used by default if none is specified. When using DXT1 
+ 	compression, 8 bytes of storage are required for the compressed DXT block. 
+ 	DXT3 and DXT5 compression require 16 bytes of storage per block.
+ 	
+-	The flags parameter can also specify a preferred colour compressor and 
+-	colour error metric to use when fitting the RGB components of the data. 
+-	Possible colour compressors are: kColourClusterFit (the default), 
+-	kColourRangeFit or kColourIterativeClusterFit. Possible colour error metrics 
+-	are: kColourMetricPerceptual (the default) or kColourMetricUniform. If no 
+-	flags are specified in any particular category then the default will be 
+-	used. Unknown flags are ignored.
+-	
+-	When using kColourClusterFit, an additional flag can be specified to
+-	weight the colour of each pixel by its alpha value. For images that are
+-	rendered using alpha blending, this can significantly increase the 
+-	perceived quality.
+-*/
+-void CompressMasked( u8 const* rgba, int mask, void* block, int flags );
++	The flags parameter can also specify a preferred colour compressor to use 
++	when fitting the RGB components of the data. Possible colour compressors 
++	are: kColourClusterFit (the default), kColourRangeFit (very fast, low 
++	quality) or kColourIterativeClusterFit (slowest, best quality).
++		
++	When using kColourClusterFit or kColourIterativeClusterFit, an additional 
++	flag can be specified to weight the importance of each pixel by its alpha 
++	value. For images that are rendered using alpha blending, this can 
++	significantly increase the perceived quality.
++	
++	The metric parameter can be used to weight the relative importance of each
++	colour channel, or pass NULL to use the default uniform weight of 
++	{ 1.0f, 1.0f, 1.0f }. This replaces the previous flag-based control that 
++	allowed either uniform or "perceptual" weights with the fixed values
++	{ 0.2126f, 0.7152f, 0.0722f }. If non-NULL, the metric should point to a 
++	contiguous array of 3 floats.
++	
++	This method is an inline that calls CompressMasked with a mask of 0xffff, 
++	provided for compatibility with older versions of squish.
++*/
++inline void Compress( u8 const* rgba, void* block, int flags, float* metric = 0 )
++{
++	CompressMasked( rgba, 0xffff, block, flags, metric );
++}
+ 
+ // -----------------------------------------------------------------------------
+ 
+@@ -184,8 +197,10 @@
+ 	@param rgba		The pixels of the source.
+ 	@param width	The width of the source image.
+ 	@param height	The height of the source image.
++	@param pitch	The pitch of the source image.
+ 	@param blocks	Storage for the compressed output.
+ 	@param flags	Compression flags.
++	@param metric	An optional perceptual metric.
+ 	
+ 	The source pixels should be presented as a contiguous array of width*height
+ 	rgba values, with each component as 1 byte each. In memory this should be:
+@@ -197,24 +212,30 @@
+ 	compression, 8 bytes of storage are required for each compressed DXT block. 
+ 	DXT3 and DXT5 compression require 16 bytes of storage per block.
+ 	
+-	The flags parameter can also specify a preferred colour compressor and 
+-	colour error metric to use when fitting the RGB components of the data. 
+-	Possible colour compressors are: kColourClusterFit (the default), 
+-	kColourRangeFit or kColourIterativeClusterFit. Possible colour error metrics 
+-	are: kColourMetricPerceptual (the default) or kColourMetricUniform. If no 
+-	flags are specified in any particular category then the default will be 
+-	used. Unknown flags are ignored.
+-	
+-	When using kColourClusterFit, an additional flag can be specified to
+-	weight the colour of each pixel by its alpha value. For images that are
+-	rendered using alpha blending, this can significantly increase the 
+-	perceived quality.
+-	
+-	Internally this function calls squish::Compress for each block. To see how
+-	much memory is required in the compressed image, use
+-	squish::GetStorageRequirements.
++	The flags parameter can also specify a preferred colour compressor to use 
++	when fitting the RGB components of the data. Possible colour compressors 
++	are: kColourClusterFit (the default), kColourRangeFit (very fast, low 
++	quality) or kColourIterativeClusterFit (slowest, best quality).
++		
++	When using kColourClusterFit or kColourIterativeClusterFit, an additional 
++	flag can be specified to weight the importance of each pixel by its alpha 
++	value. For images that are rendered using alpha blending, this can 
++	significantly increase the perceived quality.
++	
++	The metric parameter can be used to weight the relative importance of each
++	colour channel, or pass NULL to use the default uniform weight of 
++	{ 1.0f, 1.0f, 1.0f }. This replaces the previous flag-based control that 
++	allowed either uniform or "perceptual" weights with the fixed values
++	{ 0.2126f, 0.7152f, 0.0722f }. If non-NULL, the metric should point to a 
++	contiguous array of 3 floats.
++	
++	Internally this function calls squish::CompressMasked for each block, which 
++	allows for pixels outside the image to take arbitrary values. The function 
++	squish::GetStorageRequirements can be called to compute the amount of memory
++	to allocate for the compressed output.
+ */
+-void CompressImage( u8 const* rgba, int width, int height, void* blocks, int flags );
++void CompressImage( u8 const* rgba, int width, int height, void* blocks, int flags, float* metric = 0 );
++void CompressImage( u8 const* rgba, int width, int height, int pitch, void* blocks, int flags, float* metric = 0 );
+ 
+ // -----------------------------------------------------------------------------
+ 
+@@ -223,6 +244,7 @@
+ 	@param rgba		Storage for the decompressed pixels.
+ 	@param width	The width of the source image.
+ 	@param height	The height of the source image.
++	@param pitch    The pitch of the decompressed pixels.
+ 	@param blocks	The compressed DXT blocks.
+ 	@param flags	Compression flags.
+ 	
+@@ -238,6 +260,32 @@
+ 	Internally this function calls squish::Decompress for each block.
+ */
+ void DecompressImage( u8* rgba, int width, int height, void const* blocks, int flags );
++void DecompressImage( u8* rgba, int width, int height, int pitch, void const* blocks, int flags );
++
++// -----------------------------------------------------------------------------
++
++/*! @brief Computes MSE of an compressed image in memory.
++
++	@param rgba		The original image pixels.
++	@param width	The width of the source image.
++	@param height	The height of the source image.
++	@param pitch  	The pitch of the source image.
++	@param dxt		The compressed dxt blocks
++	@param flags	Compression flags.
++	@param colourMSE	The MSE of the colour values.
++	@param alphaMSE	The MSE of the alpha values.
++	
++	The colour MSE and alpha MSE are computed across all pixels. The colour MSE is
++	averaged across all rgb values (i.e. colourMSE = sum sum_k ||dxt.k - rgba.k||/3)
++	
++	The flags parameter should specify either kDxt1, kDxt3 or kDxt5 compression, 
++	however, DXT1 will be used by default if none is specified. All other flags 
++	are ignored.
++
++	Internally this function calls squish::Decompress for each block.
++*/
++void ComputeMSE(u8 const *rgba, int width, int height, u8 const *dxt, int flags, double &colourMSE, double &alphaMSE);
++void ComputeMSE(u8 const *rgba, int width, int height, int pitch, u8 const *dxt, int flags, double &colourMSE, double &alphaMSE);
+ 
+ // -----------------------------------------------------------------------------
+ 
+diff -uwNr squish-1.10/squish.pc.in libsquish-1.10-openelec/squish.pc.in
+--- squish-1.10/squish.pc.in	1970-01-01 01:00:00.000000000 +0100
++++ libsquish-1.10-openelec/squish.pc.in	2015-01-09 10:58:43.000000000 +0100
+@@ -0,0 +1,13 @@
++prefix=@PREFIX@
++exec_prefix=${prefix}
++libdir=${prefix}/lib
++sharedlibdir=${libdir}
++includedir=${prefix}/include
++
++Name: squish
++Description: squish DXT lib
++Version: 1.0.0-kodi
++
++Requires:
++Libs: -L${libdir} -L${sharedlibdir} -lsquish
++Cflags: -I${includedir}
diff --git a/package/libsquish/Config.in b/package/libsquish/Config.in
new file mode 100644
index 0000000..10af979
--- /dev/null
+++ b/package/libsquish/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSQUISH
+	bool "libsquish"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The squish library (abbreviated to libsquish) is an open source DXT
+	  compression library written in C++
+
+	  https://code.google.com/p/libsquish
+
+comment "libsquish needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsquish/libsquish.hash b/package/libsquish/libsquish.hash
new file mode 100644
index 0000000..f582b92
--- /dev/null
+++ b/package/libsquish/libsquish.hash
@@ -0,0 +1,2 @@
+# From https://code.google.com/p/libsquish/downloads/detail?name=squish-1.10.tar.gz
+sha1	b15e6b970cd0bfd475848c5d1ceaf97cdd98e1b0	squish-1.10.tar.gz
diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
new file mode 100644
index 0000000..29da627
--- /dev/null
+++ b/package/libsquish/libsquish.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libsquish
+#
+################################################################################
+
+LIBSQUISH_VERSION = 1.10
+LIBSQUISH_SOURCE = squish-$(LIBSQUISH_VERSION).tar.gz
+LIBSQUISH_SITE = https://libsquish.googlecode.com/files
+LIBSQUISH_INSTALL_STAGING = YES
+LIBSQUISH_LICENSE = MIT
+LIBSQUISH_LICENSE_FILES = README
+
+define LIBSQUISH_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
+	CXX=$(TARGET_CXX) CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	$(MAKE) -C $(@D) install PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr
+endef
+
+define LIBSQUISH_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/include/
+	mkdir -p $(TARGET_DIR)/usr/lib/pkgconfig/
+	CXX=$(TARGET_CXX) CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	$(MAKE) -C $(@D) install PREFIX=/usr INSTALL_DIR=$(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
