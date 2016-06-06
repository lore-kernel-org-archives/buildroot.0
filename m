From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 23:22:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/audiofile: fix compilation with
 gcc6
In-Reply-To: <1465056832-24721-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465056832-24721-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160606232208.37c2c394@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Jun 2016 18:13:52 +0200, Bernd Kuhls wrote:
> Fixes
> 
> make[3]: Entering directory '/home/buildroot/br7_freeswitch/output/build/audiofile-0.3.6/libaudiofile/modules'
> /bin/bash ../../libtool  --tag=CXX   --mode=compile /home/buildroot/br7_freeswitch/output/host/usr/bin/i586-buildroot-linux-uclibc-g++ -DHAVE_CONFIG_H -I. -I../.. -I./..  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DNDEBUG -Wall -Wno-multichar    -fvisibility=hidden -fno-rtti -fno-exceptions -fvisibility-inlines-hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -c -o ALAC.lo ALAC.cpp
> libtool: compile:  /home/buildroot/br7_freeswitch/output/host/usr/bin/i586-buildroot-linux-uclibc-g++ -DHAVE_CONFIG_H -I. -I../.. -I./.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DNDEBUG -Wall -Wno-multichar -fvisibility=hidden -fno-rtti -fno-exceptions -fvisibility-inlines-hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c ALAC.cpp  -fPIC -DPIC -o .libs/ALAC.o
> In file included from ALAC.cpp:29:0:
> SimpleModule.h: In instantiation of 'const int signConverter<(FormatCode)0>::kMinSignedValue':
> SimpleModule.h:130:52:   required from 'signConverter<Format>::UnsignedType signConverter<Format>::signedToUnsigned::operator()(signConverter<Format>::SignedType) [with FormatCode Format = (FormatCode)0; signConverter<Format>::UnsignedType = unsigned char; signConverter<Format>::SignedType = signed char]'
> /home/buildroot/br7_freeswitch/output/host/usr/i586-buildroot-linux-uclibc/include/c++/6.1.0/bits/stl_algo.h:4184:24:   required from '_OIter std::transform(_IIter, _IIter, _OIter, _UnaryOperation) [with _IIter = const signed char*; _OIter = unsigned char*; _UnaryOperation = signConverter<(FormatCode)0>::signedToUnsigned]'
> SimpleModule.h:104:16:   required from 'void transform(const void*, void*, size_t) [with UnaryFunction = signConverter<(FormatCode)0>::signedToUnsigned; size_t = unsigned int]'
> SimpleModule.h:176:62:   required from 'static void ConvertSign::convertSignedToUnsigned(const void*, void*, size_t) [with FormatCode Format = (FormatCode)0; size_t = unsigned int]'
> SimpleModule.h:183:51:   required from here
> SimpleModule.h:126:40: error: left operand of shift expression '(-1 << 7)' is negative [-fpermissive]
>   static const int kMinSignedValue = -1 << kScaleBits;
>                                      ~~~^~~~~~~~~~~~~
> 
> To reproduce the build error use this defconfig:
> 
> BR2_GCC_VERSION_6_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_AUDIOFILE=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/audiofile/0002-cast-to-unsigned-gcc6.patch | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/audiofile/0002-cast-to-unsigned-gcc6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
