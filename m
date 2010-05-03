From: Javier Viguera <javier.viguera@digi.com>
Date: Mon, 3 May 2010 12:06:08 +0200
Subject: [Buildroot] gst-plugins-ugly fail to build
Message-ID: <4BDEA010.4010509@digi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Seems that somehow a host library is leaking when cross-building 
gst-plugins-ugly for ARM.

My current setup is latest buildroot (git sha1 0cd0d0647) with external 
toolchain built with crosstool-NG (arm + eglibc toolchain).

The error reported is:

libtool: link: 
/usr/local/DigiEL-5.5/x-tools/arm-unknown-linux-gnueabi/bin/arm-linux-gcc 
-O3 -mcpu=cortex-a8 -mfpu=neon -ftree-vectorize -mfloat-abi=softfp 
-ffast-math -fsingle-precision-constant -O3  -mabi=aapcs-linux 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
--sysroot /data/repo/buildroot.git/output/staging/ -shared 
.libs/libgstmpegaudioparse_la-plugin.o 
.libs/libgstmpegaudioparse_la-gstmpegaudioparse.o 
.libs/libgstmpegaudioparse_la-gstxingmux.o   -Wl,-rpath 
-Wl,/data/repo/buildroot.git/output/host/usr/lib -Wl,-rpath 
-Wl,/data/repo/buildroot.git/output/host/usr/lib -lgstbase-0.10 
-L/data/repo/buildroot.git/output/host/lib 
-L/data/repo/buildroot.git/output/host/usr/lib -lgstreamer-0.10 
/data/repo/buildroot.git/output/host/usr/lib/libgobject-2.0.so 
/data/repo/buildroot.git/output/host/usr/lib/libgmodule-2.0.so -ldl 
/data/repo/buildroot.git/output/host/usr/lib/libgthread-2.0.so -lpthread 
-lrt -lxml2 /data/repo/buildroot.git/output/host/usr/lib/libglib-2.0.so 
-lintl  -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mabi=aapcs-linux 
-mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mabi=aapcs-linux -pthread 
-pthread   -pthread -Wl,-soname -Wl,libgstmpegaudioparse.so 
-Wl,-version-script -Wl,.libs/libgstmpegaudioparse.ver -o 
.libs/libgstmpegaudioparse.so

> /data/repo/buildroot.git/output/host/usr/lib/libgobject-2.0.so: could not read symbols: File in wrong format
> collect2: ld returned 1 exit status

So it seems that it's trying to link a library built for the host while 
cross-compiling for the target and it fails.

Attached also the failing buildroot config file for anyone to reproduce. 
I have also a complete build.log file but it is about 175KB compressed 
so i guess the list won't accept such big files.

Does anyone have the same problem? Known bug?

-- 
Regards,

Javier Viguera
Software Engineer

Digi International Spain, S.A.
http://www.digi.com
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: br.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100503/b3e05cb4/attachment-0001.diff>
