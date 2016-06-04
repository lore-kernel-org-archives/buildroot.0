From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 18:13:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/audiofile: fix compilation with gcc6
Message-ID: <1465056832-24721-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

make[3]: Entering directory '/home/buildroot/br7_freeswitch/output/build/audiofile-0.3.6/libaudiofile/modules'
/bin/bash ../../libtool  --tag=CXX   --mode=compile /home/buildroot/br7_freeswitch/output/host/usr/bin/i586-buildroot-linux-uclibc-g++ -DHAVE_CONFIG_H -I. -I../.. -I./..  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DNDEBUG -Wall -Wno-multichar    -fvisibility=hidden -fno-rtti -fno-exceptions -fvisibility-inlines-hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -c -o ALAC.lo ALAC.cpp
libtool: compile:  /home/buildroot/br7_freeswitch/output/host/usr/bin/i586-buildroot-linux-uclibc-g++ -DHAVE_CONFIG_H -I. -I../.. -I./.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DNDEBUG -Wall -Wno-multichar -fvisibility=hidden -fno-rtti -fno-exceptions -fvisibility-inlines-hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c ALAC.cpp  -fPIC -DPIC -o .libs/ALAC.o
In file included from ALAC.cpp:29:0:
SimpleModule.h: In instantiation of 'const int signConverter<(FormatCode)0>::kMinSignedValue':
SimpleModule.h:130:52:   required from 'signConverter<Format>::UnsignedType signConverter<Format>::signedToUnsigned::operator()(signConverter<Format>::SignedType) [with FormatCode Format = (FormatCode)0; signConverter<Format>::UnsignedType = unsigned char; signConverter<Format>::SignedType = signed char]'
/home/buildroot/br7_freeswitch/output/host/usr/i586-buildroot-linux-uclibc/include/c++/6.1.0/bits/stl_algo.h:4184:24:   required from '_OIter std::transform(_IIter, _IIter, _OIter, _UnaryOperation) [with _IIter = const signed char*; _OIter = unsigned char*; _UnaryOperation = signConverter<(FormatCode)0>::signedToUnsigned]'
SimpleModule.h:104:16:   required from 'void transform(const void*, void*, size_t) [with UnaryFunction = signConverter<(FormatCode)0>::signedToUnsigned; size_t = unsigned int]'
SimpleModule.h:176:62:   required from 'static void ConvertSign::convertSignedToUnsigned(const void*, void*, size_t) [with FormatCode Format = (FormatCode)0; size_t = unsigned int]'
SimpleModule.h:183:51:   required from here
SimpleModule.h:126:40: error: left operand of shift expression '(-1 << 7)' is negative [-fpermissive]
  static const int kMinSignedValue = -1 << kScaleBits;
                                     ~~~^~~~~~~~~~~~~

To reproduce the build error use this defconfig:

BR2_GCC_VERSION_6_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_AUDIOFILE=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/audiofile/0002-cast-to-unsigned-gcc6.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/audiofile/0002-cast-to-unsigned-gcc6.patch

diff --git a/package/audiofile/0002-cast-to-unsigned-gcc6.patch b/package/audiofile/0002-cast-to-unsigned-gcc6.patch
new file mode 100644
index 0000000..01baeb5
--- /dev/null
+++ b/package/audiofile/0002-cast-to-unsigned-gcc6.patch
@@ -0,0 +1,28 @@
+From 28cfdbbcb96a69087c3d21faf69b5eae7bcf6d69 Mon Sep 17 00:00:00 2001
+From: Hodorgasm <nsane457@gmail.com>
+Date: Wed, 11 May 2016 21:42:07 -0400
+Subject: [PATCH] Cast to unsigned while left bit-shifting
+
+GCC-6 now treats the left bitwise-shift of a negative integer as nonconformant so explicitly cast to an unsigned int while bit-shifting.
+
+Downloaded from upstream PR:
+https://github.com/mpruett/audiofile/pull/28
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libaudiofile/modules/SimpleModule.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libaudiofile/modules/SimpleModule.h b/libaudiofile/modules/SimpleModule.h
+index 03c6c69..4014fb2 100644
+--- a/libaudiofile/modules/SimpleModule.h
++++ b/libaudiofile/modules/SimpleModule.h
+@@ -123,7 +123,7 @@ struct signConverter
+ 	typedef typename IntTypes<Format>::UnsignedType UnsignedType;
+ 
+ 	static const int kScaleBits = (Format + 1) * CHAR_BIT - 1;
+-	static const int kMinSignedValue = -1 << kScaleBits;
++	static const int kMinSignedValue = static_cast<signed>(static_cast<unsigned>(-1) << kScaleBits);;
+ 
+ 	struct signedToUnsigned : public std::unary_function<SignedType, UnsignedType>
+ 	{
-- 
2.8.1
