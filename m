From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 5 Mar 2015 17:43:46 +0100
Subject: [Buildroot] mjpgstreamer build error with ccache and J=0
In-Reply-To: <20150305145830.67207a96@free-electrons.com>
References: <10AA8E3F675B42669EDF6C02D65AAE63@JohanW7>
 <20150305145830.67207a96@free-electrons.com>
Message-ID: <00C4503C104D4EF284ED7523CEE3AAA3@JohanW7>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

 

-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: donderdag 5 maart 2015 14:59
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] mjpgstreamer build error with ccache and J=0

Dear Sagaert Johan,

On Thu, 5 Mar 2015 14:44:38 +0100, Sagaert Johan wrote:

> mjpgstreamer seems to fail bilding when I have ccache on and number of jobs=0
> 
> I cleaned the ccache before building.
> 
> This is the output of make V=1

Can you try the below patch?

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 2385429..2a0c717 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -15,7 +15,7 @@ MJPG_STREAMER_LICENSE_FILES = LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
 
 define MJPG_STREAMER_BUILD_CMDS
-       $(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+       $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define MJPG_STREAMER_INSTALL_TARGET_CMDS

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com



Dear Thomas

No it is not solved :

make V=1 output 

[7m>>> mjpg-streamer 730b5bcdc378b6a201131c6c2620eedbe0f6eb30 Building[27m
PATH="/home/buildroot12git2/output/host/bin:/home/buildroot12git2/output/host/sbin:/home/buildroot12git2/output/host/usr/bin:/home/b
uildroot12git2/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/h
ost-cmake-3.0.2/bin" /usr/bin/make -j5
PATH="/home/buildroot12git2/output/host/bin:/home/buildroot12git2/output/host/sbin:/home/buildroot12git2/output/host/usr/bin:/home/b
uildroot12git2/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/h
ost-cmake-3.0.2/bin" AR="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-ar"
AS="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-as"
LD="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-ld"
NM="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-nm" CC="/home/buildroot12git2/output/host/usr/bin/ccache
/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc" GCC="/home/buildroot12git2/output/host/usr/bin/ccache
/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc"
CPP="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-cpp"
CXX="/home/buildroot12git2/output/host/usr/bin/ccache /home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-g++"
FC="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-gfortran"
RANLIB="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-ranlib"
READELF="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-readelf"
STRIP="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-strip"
OBJCOPY="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-objcopy"
OBJDUMP="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/home/buildroot12git2/output/host/usr/bin/ccache /usr/bin/gcc"
GCC_FOR_BUILD="/home/buildroot12git2/output/host/usr/bin/ccache /usr/bin/gcc"
CXX_FOR_BUILD="/home/buildroot12git2/output/host/usr/bin/ccache /usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/buildroot12git2/output/host/usr/include" CFLAGS_FOR_BUILD="-O2
-I/home/buildroot12git2/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/buildroot12git2/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/buildroot12git2/output/host/lib -L/home/buildroot12git2/output/host/usr/lib
-Wl,-rpath,/home/buildroot12git2/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-as"
DEFAULT_LINKER="/home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-ld" CPPFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/buildroot12git2/output/host/usr/bin/pkg-config"
STAGING_DIR="/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot" INTLTOOL_PERL=/usr/bin/perl -C
/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30
make[1]: Entering directory `/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30'
make -C plugins/input_uvc all
make -C plugins/output_http all
make -C plugins/input_testpicture all
make[2]: Entering directory
`/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/plugins/input_uvc'
make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
make[2]: Entering directory
`/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/plugins/output_http'
make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
make[2]: Entering directory
`/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/plugins/input_testpicture'
make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
/home/buildroot12git2/output/host/usr/bin/ccache /home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -o input_uvc.so input_uvc.c v4l2uvc.lo jpeg_utils.lo
dynctrl.lo -ljpeg
/home/buildroot12git2/output/host/usr/bin/ccache /home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -o output_http.so output_http.c httpd.lo
/home/buildroot12git2/output/host/usr/bin/ccache /home/buildroot12git2/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -o input_testpicture.so input_testpicture.c
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crt1.o: In function `_start':
init.c:(.text+0x34): undefined reference to `main'
/tmp/ccl8npe1.o: In function `output_stop':
output_http.c:(.text+0x354): undefined reference to `pthread_cancel'
/tmp/ccl8npe1.o: In function `output_run':
output_http.c:(.text+0x38c): undefined reference to `pthread_create'
output_http.c:(.text+0x394): undefined reference to `pthread_detach'
httpd.lo: In function `server_thread':
httpd.c:(.text+0x1488): undefined reference to `__pthread_register_cancel'
httpd.c:(.text+0x1904): undefined reference to `pthread_create'
httpd.c:(.text+0x1928): undefined reference to `pthread_detach'
httpd.c:(.text+0x1938): undefined reference to `__pthread_unregister_cancel'
collect2: error: ld returned 1 exit status
make[2]: *** [output_http.so] Error 1
make[2]: Leaving directory
`/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/plugins/output_http'
make[1]: *** [output_http.so] Error 2
make[1]: *** Waiting for unfinished jobs....
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crt1.o: In function `_start':
init.c:(.text+0x34): undefined reference to `main'
/tmp/ccafTIv2.o: In function `input_stop':
input_uvc.c:(.text+0x1a4): undefined reference to `pthread_cancel'
/tmp/ccafTIv2.o: In function `input_run':
input_uvc.c:(.text+0x21c): undefined reference to `pthread_create'
input_uvc.c:(.text+0x224): undefined reference to `pthread_detach'
/tmp/ccafTIv2.o: In function `cam_thread':
input_uvc.c:(.text+0xb18): undefined reference to `__pthread_register_cancel'
input_uvc.c:(.text+0xd24): undefined reference to `__pthread_unregister_cancel'
collect2: error: ld returned 1 exit status
make[2]: *** [input_uvc.so] Error 1
make[2]: Leaving directory
`/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/plugins/input_uvc'
make[1]: *** [input_uvc.so] Error 2
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crt1.o: In function `_start':
init.c:(.text+0x34): undefined reference to `main'
/tmp/cc3LX1W2.o: In function `input_stop':
input_testpicture.c:(.text+0xc): undefined reference to `pthread_cancel'
/tmp/cc3LX1W2.o: In function `input_run':
input_testpicture.c:(.text+0x60): undefined reference to `pthread_create'
input_testpicture.c:(.text+0x98): undefined reference to `pthread_detach'
/tmp/cc3LX1W2.o: In function `worker_thread':
input_testpicture.c:(.text+0x4a8): undefined reference to `__pthread_register_cancel'
input_testpicture.c:(.text+0x560): undefined reference to `__pthread_unregister_cancel'
collect2: error: ld returned 1 exit status
make[2]: *** [input_testpicture.so] Error 1
make[2]: Leaving directory
`/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/plugins/input_testpicture'
make[1]: *** [input_testpicture.so] Error 2
make[1]: Leaving directory `/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30'
make: *** [/home/buildroot12git2/output/build/mjpg-streamer-730b5bcdc378b6a201131c6c2620eedbe0f6eb30/.stamp_built] Error 2
