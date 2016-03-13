From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Mar 2016 22:53:13 +0100
Subject: [Buildroot] Bug during Kodi compile with host gcc <4.7,
 question regarding autobuilders
Message-ID: <934hrcx7vo.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

before sending a patch which fixes a problem with host gcc < 4.7 I would 
like to ask whether this patch is needed@all. Are there autobuilders 
where the host version of gcc is < 4.7?

While testing Kodi compilation using buildroot master this error occurs:

cc1plus: error: unrecognized command line option '-std=c++11'
make[4]: *** [md5.o] Error 1
make[4]: *** Waiting for unfinished jobs....
cc1plus: error: unrecognized command line option '-std=c++11'cc1plus: 
error: unrecognized command line option '-std=c++11'

make[4]: *** [DecoderManager.o] Error 1
make[4]: *** [XBTFWriter.o] Error 1
cc1plus: error: unrecognized command line option '-std=c++11'
make[4]: *** [TexturePacker.o] Error 1
cc1plus: error: unrecognized command line option '-std=c++11'
make[4]: *** [decoder/PNGDecoder.o] Error 1
make[3]: *** [all] Error 2
make[2]: *** [native/TexturePacker] Error 2
make[1]: *** [/home/fli4l/buildroot/output/build/kodi-16.0-
Jarvis/.stamp_configured] Error 2

while the host version of TexturePacker is compiled during autoreconf on 
Ubuntu 12.04.5 with "gcc-Version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5)".

To fix the problem change "-std=c++11" to "-std=c++0x" in tools/depends/
native/TexturePacker/src/Makefile.am.

To reproduce the bug use this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y

Regards, Bernd
