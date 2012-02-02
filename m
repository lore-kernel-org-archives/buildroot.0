From: Endejan, Edward <Edward.Endejan@dmh-global.com>
Date: Thu, 2 Feb 2012 12:04:47 -0800
Subject: [Buildroot] install-to-staging OK but install-to-target fails
Message-ID: <D921DC3114DE02419F1BFD413E98678E102B2859C8@VA3DIAXVS331.RED001.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm attempting to build gstreamer and gst-plugins-base from git 
repositories with buildroot, cross-compiling for ARM. The build 
and install-to-staging phases complete without error, but then 
install-to-target fails as follows:

libtool: install: warning: relinking `libgstbase-0.10.la'
libtool: install: (cd /home/ee/prj/buildroot/output/build/gstreamer-b64067f96110edccc73110a4ef4e6a7c6fac195d/libs/gst/base; /bin/bash /home/ee/prj/buildroot/output/build/gstreamer-b64067f96110edccc73110a4ef4e6a7c6fac195d/libtool  --silent --tag CC --mode=relink /home/ee/prj/buildroot/output/host/usr/bin/ccache /home/ee/prj/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -std=gnu99 -I../../../libs -I../../.. -I../../../libs -I../../.. -pthread -I/home/ee/prj/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/ee/prj/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -DG_THREADS_MANDATORY -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-statement -Wvla -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wformat-nonliteral -Wformat-security -Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress -Waggregate-return -Wno-multichar -Wnested-externs -g -Os -pipe -march=armv7-a -mtune=cortex-a8 -mfpu=neon -ftree-vectorize -mfloat-abi=softfp -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -export-symbols-regex "^_*(gst_|Gst|GST_).*" -no-undefined -Wl,-Bsymbolic-functions -version-info 30:0:30 -o libgstbase-0.10.la -rpath /usr/lib libgstbase_0.10_la-gstadapter.lo libgstbase_0.10_la-gstbaseparse.lo libgstbase_0.10_la-gstbasesink.lo libgstbase_0.10_la-gstbasesrc.lo libgstbase_0.10_la-gstbasetransform.lo libgstbase_0.10_la-gstbitreader.lo libgstbase_0.10_la-gstbytereader.lo libgstbase_0.10_la-gstbytewriter.lo libgstbase_0.10_la-gstcollectpads.lo libgstbase_0.10_la-gstcollectpads2.lo libgstbase_0.10_la-gstpushsrc.lo libgstbase_0.10_la-gsttypefindhelper.lo libgstbase_0.10_la-gstdataqueue.lo ../../../gst/libgstreamer-0.10.la -pthread -lgobject-2.0 -lgthread-2.0 -lgmodule-2.0 -lglib-2.0 -lintl -ldl -inst-prefix-dir /home/ee/prj/buildroot/output/target)
/usr/lib/libdl.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status
libtool: install: error: relink `libgstbase-0.10.la' with the above command before installing it
make[5]: *** [install-libLTLIBRARIES] Error 1

The error is due to an attempted re-link against libraries upon 
which this library depends, but the library format is invalid 
since in this phase the host machine libraries (x86) are being 
found rather than the target machine libraries (ARM). The 
command lines for the install-to-staging and install-to-target 
phases are almost identical with the exception of this path 
argument:

-inst-prefix-dir for install-to-staging:
/home/ee/prj/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot

-inst-prefix-dir install-to-target:
/home/ee/prj/buildroot/output/target

But these paths _should_ be different.

All I can figure is that one or more *.la files are different 
between the two phases, but I'm not sure why.

Can someone give me a hint as to what I am doing wrong and why 
install-to-staging succeeds while install-to-target fails?

Thanks for any hints or help you can provide.

Best Regards,
Ed
