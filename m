From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 8 Feb 2017 23:02:25 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-02-07
In-Reply-To: <20170208072913.50E8320C4D@mail.free-electrons.com>
References: <20170208072913.50E8320C4D@mail.free-electrons.com>
Message-ID: <c9a56df9-7137-1fb4-0550-e79785aaacd3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo, Thomas,

Le 08/02/2017 ? 08:29, Thomas Petazzoni a ?crit :
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2017-02-07, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Build failures related to your packages:
> 
>          arm |                     efl-1.18.4 | http://autobuild.buildroot.net/results/8d0b78798abf0c4ca124952d0d0455da6f8fa14f
> 

This build is broken since sunxi-mali package is used as OpenGL ES w/ EGL provider.

The config.log says:

output/host/usr/bin/arm-none-linux-gnueabi-gcc -std=gnu99 -o conftest
-Ioutput/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
-Ioutput/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -fPIC -DPIC
conftest.c -lGLESv2 -lEGL -lm  -pthread

arm-none-linux-gnueabi/bin/ld: warning: libUMP.so.2, needed by
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so,
not found (try using -rpath or -rpath-link)

output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
undefined reference to `ump_close'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
undefined reference to `ump_mapped_pointer_get'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
undefined reference to `ump_secure_id_get'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
undefined reference to `ump_mapped_pointer_release'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so:
undefined reference to `ump_reference_add'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so:
undefined reference to `ump_size_get'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
undefined reference to `ump_reference_release'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so:
undefined reference to `ump_open'
collect2: error: ld returned 1 exit status

I'm not sure that's an efl issue here... It look like sunxi-mali package is
broken since it want libUMP.so.2 but only libUMP.so.3 is present in staging.

Best regards,
Romain
