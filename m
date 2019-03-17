From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 22:51:20 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] libraw: bump to version
 0.18.11
Message-ID: <20190317220406.39BC88EC65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=724dcdc43193d8d9976d9c7b7aff4e1263fce395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

- Remove all patches (already in version)
- Since version 0.18 (2016-12-07), there is no
  'LibRaw Software License 27032010' licensing anymore (and all signed
  agreements have expired). LibRaw is now dual-licensed: LGPL 2.1 or
  CDDL 1.0
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6232e9f894e01781c54430f843e63c53c62ab564)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...emove-paths-which-break-cross-compilation.patch |  29 --
 ...002-libraw_x3f.cpp-remove-Byte-order-mark.patch |  39 ---
 ...ernal-dcraw_common-rename-internal-powf64.patch | 348 ---------------------
 package/libraw/libraw.hash                         |   6 +-
 package/libraw/libraw.mk                           |  11 +-
 5 files changed, 7 insertions(+), 426 deletions(-)

diff --git a/package/libraw/0001-Remove-paths-which-break-cross-compilation.patch b/package/libraw/0001-Remove-paths-which-break-cross-compilation.patch
deleted file mode 100644
index 0f0eee1a64..0000000000
--- a/package/libraw/0001-Remove-paths-which-break-cross-compilation.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1f9c2ebc9c65e8ce7fdbece55d578cf00c6c4b46 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 30 Jan 2016 17:06:04 +0100
-Subject: [PATCH 1/1] Remove paths which break cross-compilation
-
-Patch sent upstream: https://github.com/LibRaw/LibRaw/pull/57
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9bb07b2..78064d9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -16,9 +16,6 @@ AC_SUBST(LIBTOOL_DEPS)
- 
- # Config files to generate
- 
--CPPFLAGS="$CPPFLAGS -I/usr/local/include"
--LDFLAGS="$LDFLAGS -L/usr/local/lib"
--
- AC_CONFIG_FILES([
- 	Makefile
- 	libraw.pc
--- 
-2.7.0.rc3
-
diff --git a/package/libraw/0002-libraw_x3f.cpp-remove-Byte-order-mark.patch b/package/libraw/0002-libraw_x3f.cpp-remove-Byte-order-mark.patch
deleted file mode 100644
index 24f0eb1897..0000000000
--- a/package/libraw/0002-libraw_x3f.cpp-remove-Byte-order-mark.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0f2507bfe30f2df10dfc38b94cdfde5594902b8e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 12 Feb 2016 10:00:12 +0100
-Subject: [PATCH] libraw_x3f.cpp: remove Byte order mark
-
-The U+FEFF character, which is a Byte order mark, at the beginning of
-libraw_x3f.cpp, prevents gcc 4.3.x from building this file:
-
-src/../internal/libraw_x3f.cpp:1: error: stray '\357' in program
-src/../internal/libraw_x3f.cpp:1: error: stray '\273' in program
-src/../internal/libraw_x3f.cpp:1: error: stray '\277' in program
-
-Support in gcc for the Byte order mark has been added in gcc
-4.4.x. Since anyway this Byte order mark is not useful, we simply
-remove it.
-
-See https://en.wikipedia.org/wiki/Byte_order_mark for more details.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-Submitted upstream at:
-https://github.com/LibRaw/LibRaw/pull/61
-
- internal/libraw_x3f.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/internal/libraw_x3f.cpp b/internal/libraw_x3f.cpp
-index dbf28c1..67047ab 100644
---- a/internal/libraw_x3f.cpp
-+++ b/internal/libraw_x3f.cpp
-@@ -1,4 +1,4 @@
--???/* Library for accessing X3F Files 
-+/* Library for accessing X3F Files 
- ----------------------------------------------------------------
- BSD-style License
- ----------------------------------------------------------------
--- 
-2.6.4
-
diff --git a/package/libraw/0003-internal-dcraw_common-rename-internal-powf64.patch b/package/libraw/0003-internal-dcraw_common-rename-internal-powf64.patch
deleted file mode 100644
index ef3b81aa24..0000000000
--- a/package/libraw/0003-internal-dcraw_common-rename-internal-powf64.patch
+++ /dev/null
@@ -1,348 +0,0 @@
-From 045c57d9d030075575409cf50cd7f6ee635df5c0 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Mon, 5 Feb 2018 16:22:39 +0100
-Subject: [PATCH] internal/dcraw_common: rename internal powf64()
-
-Starting with Glibc 2.27, powf64() is provided by the C library
-and colide with the one defined dy libraw.
-
-Rename internal powf64 to libraw_powf64.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- internal/dcraw_common.cpp | 98 +++++++++++++++++++++++------------------------
- 1 file changed, 49 insertions(+), 49 deletions(-)
-
-diff --git a/internal/dcraw_common.cpp b/internal/dcraw_common.cpp
-index 0c7c07a..cf26865 100644
---- a/internal/dcraw_common.cpp
-+++ b/internal/dcraw_common.cpp
-@@ -5537,7 +5537,7 @@ static float powf_lim(float a, float b, float limup)
- {
-   return (b>limup || b < -limup)?0.f:powf(a,b);
- }
--static float powf64(float a, float b)
-+static float libraw_powf64(float a, float b)
- {
-   return powf_lim(a,b,64.f);
- }
-@@ -5561,7 +5561,7 @@ static float my_roundf(float x) {
- static float _CanonConvertAperture(ushort in)
- {
-   if ((in == (ushort)0xffe0) || (in == (ushort)0x7fff)) return 0.0f;
--  return powf64(2.0, in/64.0);
-+  return libraw_powf64(2.0, in/64.0);
- }
- 
- void CLASS setCanonBodyFeatures (unsigned id)
-@@ -5902,21 +5902,21 @@ void CLASS processNikonLensData (uchar *LensData, unsigned len)
-     if (fabsf(imgdata.lens.makernotes.MinFocal) < 1.1f)
-     {
-       if ((imgdata.lens.nikon.NikonLensType ^ (uchar)0x01) || LensData[i + 2])
--        imgdata.lens.makernotes.MinFocal = 5.0f * powf64(2.0f, (float)LensData[i + 2] / 24.0f);
-+        imgdata.lens.makernotes.MinFocal = 5.0f * libraw_powf64(2.0f, (float)LensData[i + 2] / 24.0f);
-       if ((imgdata.lens.nikon.NikonLensType ^ (uchar)0x01) || LensData[i + 3])
--        imgdata.lens.makernotes.MaxFocal = 5.0f * powf64(2.0f, (float)LensData[i + 3] / 24.0f);
-+        imgdata.lens.makernotes.MaxFocal = 5.0f * libraw_powf64(2.0f, (float)LensData[i + 3] / 24.0f);
-       if ((imgdata.lens.nikon.NikonLensType ^ (uchar)0x01) || LensData[i + 4])
--        imgdata.lens.makernotes.MaxAp4MinFocal = powf64(2.0f, (float)LensData[i + 4] / 24.0f);
-+        imgdata.lens.makernotes.MaxAp4MinFocal = libraw_powf64(2.0f, (float)LensData[i + 4] / 24.0f);
-       if ((imgdata.lens.nikon.NikonLensType ^ (uchar)0x01) || LensData[i + 5])
--        imgdata.lens.makernotes.MaxAp4MaxFocal = powf64(2.0f, (float)LensData[i + 5] / 24.0f);
-+        imgdata.lens.makernotes.MaxAp4MaxFocal = libraw_powf64(2.0f, (float)LensData[i + 5] / 24.0f);
-     }
-     imgdata.lens.nikon.NikonMCUVersion = LensData[i + 6];
-     if (i != 2)
-       {
-         if ((LensData[i - 1]) &&
-             (fabsf(imgdata.lens.makernotes.CurFocal) < 1.1f))
--          imgdata.lens.makernotes.CurFocal = 5.0f * powf64(2.0f, (float)LensData[i - 1] / 24.0f);
--        if (LensData[i + 7]) imgdata.lens.nikon.NikonEffectiveMaxAp = powf64(2.0f, (float)LensData[i + 7] / 24.0f);
-+          imgdata.lens.makernotes.CurFocal = 5.0f * libraw_powf64(2.0f, (float)LensData[i - 1] / 24.0f);
-+        if (LensData[i + 7]) imgdata.lens.nikon.NikonEffectiveMaxAp = libraw_powf64(2.0f, (float)LensData[i + 7] / 24.0f);
-       }
-     imgdata.lens.makernotes.LensID =
-       (unsigned long long) LensData[i] << 56 |
-@@ -6088,13 +6088,13 @@ void CLASS PentaxLensInfo (unsigned id, unsigned len)	// tag 0x0207
- 		if (table_buf[iLensData+9] &&
- 			(fabs(imgdata.lens.makernotes.CurFocal) < 0.1f))
- 		  imgdata.lens.makernotes.CurFocal =
--			10*(table_buf[iLensData+9]>>2) * powf64(4, (table_buf[iLensData+9] & 0x03)-2);
-+			10*(table_buf[iLensData+9]>>2) * libraw_powf64(4, (table_buf[iLensData+9] & 0x03)-2);
- 		if (table_buf[iLensData+10] & 0xf0)
- 		  imgdata.lens.makernotes.MaxAp4CurFocal =
--			powf64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
-+			libraw_powf64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
- 		if (table_buf[iLensData+10] & 0x0f)
- 		  imgdata.lens.makernotes.MinAp4CurFocal =
--			powf64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
-+			libraw_powf64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
- 
- 		if (iLensData != 12)
- 		  {
-@@ -6111,14 +6111,14 @@ void CLASS PentaxLensInfo (unsigned id, unsigned len)	// tag 0x0207
- 			if ((table_buf[iLensData+14] > 1) &&
- 				(fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
- 			  imgdata.lens.makernotes.MaxAp4CurFocal =
--				powf64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
-+				libraw_powf64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
- 		  }
- 		else if ((id != 0x12e76) &&	// K-5
- 				 (table_buf[iLensData+15] > 1) &&
- 				 (fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
- 		  {
- 			imgdata.lens.makernotes.MaxAp4CurFocal =
--			  powf64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
-+			  libraw_powf64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
- 		  }
- 	  }
- 	free(table_buf);
-@@ -6525,11 +6525,11 @@ void CLASS process_Sony_0x9050 (uchar * buf, unsigned id)
-     {
-       if (buf[0])
-         imgdata.lens.makernotes.MaxAp4CurFocal =
--          my_roundf(powf64(2.0f, ((float)SonySubstitution[buf[0]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
-+          my_roundf(libraw_powf64(2.0f, ((float)SonySubstitution[buf[0]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
- 
-       if (buf[1])
-         imgdata.lens.makernotes.MinAp4CurFocal =
--          my_roundf(powf64(2.0f, ((float)SonySubstitution[buf[1]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
-+          my_roundf(libraw_powf64(2.0f, ((float)SonySubstitution[buf[1]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
-     }
- 
-   if (imgdata.lens.makernotes.CameraMount != LIBRAW_MOUNT_FixedLens)
-@@ -6539,7 +6539,7 @@ void CLASS process_Sony_0x9050 (uchar * buf, unsigned id)
-           lid = SonySubstitution[buf[0x3d]] << 8 |
-             SonySubstitution[buf[0x3c]];
-           imgdata.lens.makernotes.CurAp =
--            powf64(2.0f, ((float)lid/256.0f - 16.0f) / 2.0f);
-+            libraw_powf64(2.0f, ((float)lid/256.0f - 16.0f) / 2.0f);
-         }
-       if (buf[0x105] && (imgdata.lens.makernotes.LensMount != LIBRAW_MOUNT_Canon_EF))
-         imgdata.lens.makernotes.LensMount =
-@@ -6924,7 +6924,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
-           {
-             unsigned char cc;
-             fread(&cc, 1, 1, ifp);
--            iso_speed = (int)(100.0 * powf64(2.0, (double)(cc) / 12.0 - 5.0));
-+            iso_speed = (int)(100.0 * libraw_powf64(2.0, (double)(cc) / 12.0 - 5.0));
-             break;
-           }
-       }
-@@ -6957,7 +6957,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
-           }
-           break;
-         case 0x1002:
--          imgdata.lens.makernotes.CurAp = powf64(2.0f, getreal(type)/2);
-+          imgdata.lens.makernotes.CurAp = libraw_powf64(2.0f, getreal(type)/2);
-           break;
-         case 0x20100201:
-           imgdata.lens.makernotes.LensID =
-@@ -6977,10 +6977,10 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
-           fread(imgdata.lens.makernotes.Lens, MIN(len,127), 1, ifp);
-           break;
-         case 0x20100205:
--          imgdata.lens.makernotes.MaxAp4MinFocal = powf64(sqrt(2.0f), get2() / 256.0f);
-+          imgdata.lens.makernotes.MaxAp4MinFocal = libraw_powf64(sqrt(2.0f), get2() / 256.0f);
-           break;
-         case 0x20100206:
--          imgdata.lens.makernotes.MaxAp4MaxFocal = powf64(sqrt(2.0f), get2() / 256.0f);
-+          imgdata.lens.makernotes.MaxAp4MaxFocal = libraw_powf64(sqrt(2.0f), get2() / 256.0f);
-           break;
-         case 0x20100207:
-           imgdata.lens.makernotes.MinFocal = (float)get2();
-@@ -6991,7 +6991,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
-             imgdata.lens.makernotes.MaxFocal = imgdata.lens.makernotes.MinFocal;
-           break;
-         case 0x2010020a:
--          imgdata.lens.makernotes.MaxAp4CurFocal = powf64(sqrt(2.0f), get2() / 256.0f);
-+          imgdata.lens.makernotes.MaxAp4CurFocal = libraw_powf64(sqrt(2.0f), get2() / 256.0f);
-           break;
-         case 0x20100301:
-           imgdata.lens.makernotes.TeleconverterID = fgetc(ifp) << 8;
-@@ -7195,7 +7195,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
-                   lid = (((ushort)table_buf[2])<<8) |
-                     ((ushort)table_buf[3]);
-                   imgdata.lens.makernotes.CurAp =
--                    powf64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
-+                    libraw_powf64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
-                 }
-               break;
-             case 1536:
-@@ -7669,7 +7669,7 @@ void CLASS parse_makernote (int base, int uptag)
-           }
-           break;
-         case 0x1002:
--          imgdata.lens.makernotes.CurAp = powf64(2.0f, getreal(type)/2);
-+          imgdata.lens.makernotes.CurAp = libraw_powf64(2.0f, getreal(type)/2);
-           break;
-         case 0x20100201:
-           {
-@@ -7694,10 +7694,10 @@ void CLASS parse_makernote (int base, int uptag)
-           fread(imgdata.lens.makernotes.Lens, MIN(len,127), 1, ifp);
-           break;
-         case 0x20100205:
--          imgdata.lens.makernotes.MaxAp4MinFocal = powf64(sqrt(2.0f), get2() / 256.0f);
-+          imgdata.lens.makernotes.MaxAp4MinFocal = libraw_powf64(sqrt(2.0f), get2() / 256.0f);
-           break;
-         case 0x20100206:
--          imgdata.lens.makernotes.MaxAp4MaxFocal = powf64(sqrt(2.0f), get2() / 256.0f);
-+          imgdata.lens.makernotes.MaxAp4MaxFocal = libraw_powf64(sqrt(2.0f), get2() / 256.0f);
-           break;
-         case 0x20100207:
-           imgdata.lens.makernotes.MinFocal = (float)get2();
-@@ -7708,7 +7708,7 @@ void CLASS parse_makernote (int base, int uptag)
-             imgdata.lens.makernotes.MaxFocal = imgdata.lens.makernotes.MinFocal;
-           break;
-         case 0x2010020a:
--          imgdata.lens.makernotes.MaxAp4CurFocal = powf64(sqrt(2.0f), get2() / 256.0f);
-+          imgdata.lens.makernotes.MaxAp4CurFocal = libraw_powf64(sqrt(2.0f), get2() / 256.0f);
-           break;
-         case 0x20100301:
-           imgdata.lens.makernotes.TeleconverterID = fgetc(ifp) << 8;
-@@ -7977,7 +7977,7 @@ void CLASS parse_makernote (int base, int uptag)
-                   lid = (((ushort)table_buf[2])<<8) |
-                     ((ushort)table_buf[3]);
-                   imgdata.lens.makernotes.CurAp =
--                    powf64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
-+                    libraw_powf64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
-                 }
-               break;
-             case 1536:
-@@ -8064,19 +8064,19 @@ void CLASS parse_makernote (int base, int uptag)
-       {
-         unsigned char cc;
-         fread(&cc,1,1,ifp);
--        iso_speed = int(100.0 * powf64(2.0f,float(cc)/12.0-5.0));
-+        iso_speed = int(100.0 * libraw_powf64(2.0f,float(cc)/12.0-5.0));
-       }
-     if (tag == 4 && len > 26 && len < 35) {
-       if ((i=(get4(),get2())) != 0x7fff && (!iso_speed || iso_speed == 65535))
--	iso_speed = 50 * powf64(2.0, i/32.0 - 4);
-+	iso_speed = 50 * libraw_powf64(2.0, i/32.0 - 4);
- #ifdef LIBRAW_LIBRARY_BUILD
-       get4();
- #else
-       if ((i=(get2(),get2())) != 0x7fff && !aperture)
--	aperture = powf64(2.0, i/64.0);
-+	aperture = libraw_powf64(2.0, i/64.0);
- #endif
-       if ((i=get2()) != 0xffff && !shutter)
--	shutter = powf64(2.0, (short) i/-32.0);
-+	shutter = libraw_powf64(2.0, (short) i/-32.0);
-       wbi = (get2(),get2());
-       shot_order = (get2(),get2());
-     }
-@@ -8579,7 +8579,7 @@ void CLASS parse_exif (int base)
-         imgdata.lens.Lens[0] = 0;
-       break;
-     case 0x9205:
--      imgdata.lens.EXIF_MaxAp = powf64(2.0f, (getreal(type) / 2.0f));
-+      imgdata.lens.EXIF_MaxAp = libraw_powf64(2.0f, (getreal(type) / 2.0f));
-       break;
- #endif
-       case 33434:  shutter = getreal(type);		break;
-@@ -8592,10 +8592,10 @@ void CLASS parse_exif (int base)
-       case 36867:
-       case 36868:  get_timestamp(0);			break;
-       case 37377:  if ((expo = -getreal(type)) < 128 && shutter == 0.)
--          shutter = powf64(2.0, expo);		break;
-+          shutter = libraw_powf64(2.0, expo);		break;
-       case 37378:                                       // 0x9202 ApertureValue
-         if ((fabs(ape = getreal(type))<256.0) && (!aperture))
--          aperture = powf64(2.0, ape/2);
-+          aperture = libraw_powf64(2.0, ape/2);
-         break;
-       case 37385:  flash_used = getreal(type);          break;
-       case 37386:  focal_len = getreal(type);		break;
-@@ -9196,7 +9196,7 @@ int CLASS parse_tiff_ifd (int base)
-         imgdata.lens.Lens[0] = 0;
-       break;
-     case 0x9205:
--				imgdata.lens.EXIF_MaxAp = powf64(2.0f, (getreal(type) / 2.0f));
-+				imgdata.lens.EXIF_MaxAp = libraw_powf64(2.0f, (getreal(type) / 2.0f));
-       break;
- // IB end
- #endif
-@@ -9970,22 +9970,22 @@ void CLASS parse_ciff (int offset, int length, int depth)
-       thumb_length = len;
-     }
-     if (type == 0x1818) {
--      shutter = powf64(2.0f, -int_to_float((get4(),get4())));
--      aperture = powf64(2.0f, int_to_float(get4())/2);
-+      shutter = libraw_powf64(2.0f, -int_to_float((get4(),get4())));
-+      aperture = libraw_powf64(2.0f, int_to_float(get4())/2);
- #ifdef LIBRAW_LIBRARY_BUILD
- 			imgdata.lens.makernotes.CurAp = aperture;
- #endif
-     }
-     if (type == 0x102a) {
- 			//      iso_speed = pow (2.0, (get4(),get2())/32.0 - 4) * 50;
--      iso_speed = powf64(2.0f, ((get2(),get2()) + get2())/32.0f - 5.0f) * 100.0f;
-+      iso_speed = libraw_powf64(2.0f, ((get2(),get2()) + get2())/32.0f - 5.0f) * 100.0f;
- #ifdef LIBRAW_LIBRARY_BUILD
-       aperture  = _CanonConvertAperture((get2(),get2()));
-       imgdata.lens.makernotes.CurAp = aperture;
- #else
--      aperture  = powf64(2.0, (get2(),(short)get2())/64.0);
-+      aperture  = libraw_powf64(2.0, (get2(),(short)get2())/64.0);
- #endif
--      shutter   = powf64(2.0,-((short)get2())/32.0);
-+      shutter   = libraw_powf64(2.0,-((short)get2())/32.0);
-       wbi = (get2(),get2());
-       if (wbi > 17) wbi = 0;
-       fseek (ifp, 32, SEEK_CUR);
-@@ -10189,8 +10189,8 @@ void CLASS parse_phase_one (int base)
-       setPhaseOneFeatures(unique_id);
-       break;
-     case 0x0401:
--      if (type == 4) imgdata.lens.makernotes.CurAp =  powf64(2.0f, (int_to_float(data)/2.0f));
--      else imgdata.lens.makernotes.CurAp = powf64(2.0f, (getreal(type)/2.0f));
-+      if (type == 4) imgdata.lens.makernotes.CurAp =  libraw_powf64(2.0f, (int_to_float(data)/2.0f));
-+      else imgdata.lens.makernotes.CurAp = libraw_powf64(2.0f, (getreal(type)/2.0f));
-       break;
-     case 0x0403:
-       if (type == 4) imgdata.lens.makernotes.CurFocal =  int_to_float(data);
-@@ -10204,16 +10204,16 @@ void CLASS parse_phase_one (int base)
-       break;
-     case 0x0414:
-       if (type == 4) {
--      	imgdata.lens.makernotes.MaxAp4CurFocal = powf64(2.0f, (int_to_float(data)/2.0f));
-+      	imgdata.lens.makernotes.MaxAp4CurFocal = libraw_powf64(2.0f, (int_to_float(data)/2.0f));
-       } else {
--        imgdata.lens.makernotes.MaxAp4CurFocal = powf64(2.0f, (getreal(type) / 2.0f));
-+        imgdata.lens.makernotes.MaxAp4CurFocal = libraw_powf64(2.0f, (getreal(type) / 2.0f));
-       }
-       break;
-     case 0x0415:
-       if (type == 4) {
--      	imgdata.lens.makernotes.MinAp4CurFocal = powf64(2.0f, (int_to_float(data)/2.0f));
-+      	imgdata.lens.makernotes.MinAp4CurFocal = libraw_powf64(2.0f, (int_to_float(data)/2.0f));
-       } else {
--        imgdata.lens.makernotes.MinAp4CurFocal = powf64(2.0f, (getreal(type) / 2.0f));
-+        imgdata.lens.makernotes.MinAp4CurFocal = libraw_powf64(2.0f, (getreal(type) / 2.0f));
-       }
-       break;
-     case 0x0416:
-@@ -12119,15 +12119,15 @@ void CLASS identify()
-       case 18: iso_speed = 320; break;
-       case 19: iso_speed = 400; break;
-     }
--    shutter = powf64(2.0f, (((float)get4())/8.0f)) / 16000.0f;
-+    shutter = libraw_powf64(2.0f, (((float)get4())/8.0f)) / 16000.0f;
-     FORC4 cam_mul[c ^ (c >> 1)] = get4();
-     fseek (ifp, 88, SEEK_SET);
--    aperture = powf64(2.0f, ((float)get4())/16.0f);
-+    aperture = libraw_powf64(2.0f, ((float)get4())/16.0f);
-     fseek (ifp, 112, SEEK_SET);
-     focal_len = get4();
- #ifdef LIBRAW_LIBRARY_BUILD
-     fseek (ifp, 104, SEEK_SET);
--    imgdata.lens.makernotes.MaxAp4CurFocal = powf64(2.0f, ((float)get4())/16.0f);
-+    imgdata.lens.makernotes.MaxAp4CurFocal = libraw_powf64(2.0f, ((float)get4())/16.0f);
-     fseek (ifp, 124, SEEK_SET);
-     fread(imgdata.lens.makernotes.Lens, 32, 1, ifp);
-     imgdata.lens.makernotes.CameraMount = LIBRAW_MOUNT_Contax_N;
--- 
-2.14.3
-
diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index 29794252f1..c546b1bee5 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,3 +1,5 @@
 # Locally calculated
-sha256	e599651a4cc37e00cfc2d2b56be87c3a4e4dae2c360b680fe9ab3f93d07cdea1	LibRaw-0.17.1.tar.gz
-sha256	3c09bc4d70268e78798696c5ea3a8cc65fe4e161811d5321fc3ef2ca012d8fd1	0001-Fix_gcc6_narrowing_conversion.patch?id=d890937aaca6359df45a66b35e547c94ca564823
+sha256	7cf724a40a0d8915869498f51062a952167e4f5bae2b6920542c9e0e079a471d	LibRaw-0.18.11.tar.gz
+sha256	eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449	LICENSE.LGPL
+sha256	0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f	LICENSE.CDDL
+sha256	7fe7564c5d48c5d353d7c1966dcddada3791586a4c2eedbc68ad56e96955e75d	README
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 589ff891be..4ff7462647 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,22 +4,17 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.17.1
+LIBRAW_VERSION = 0.18.11
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
-LIBRAW_PATCH = \
-	https://anonscm.debian.org/cgit/pkg-phototools/libraw.git/plain/debian/patches/0001-Fix_gcc6_narrowing_conversion.patch?id=d890937aaca6359df45a66b35e547c94ca564823
-
 LIBRAW_INSTALL_STAGING = YES
-# we patch configure.ac
-LIBRAW_AUTORECONF = YES
 LIBRAW_CONF_OPTS += \
 	--disable-examples \
 	--disable-openmp \
 	--disable-demosaic-pack-gpl2 \
 	--disable-demosaic-pack-gpl3
-LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0 or LibRaw Software License 27032010
-LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
+LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0
+LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL README
 LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
