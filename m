From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 21:51:25 +0200
Subject: [Buildroot] libfslcodecs libraries installation location
Message-ID: <20150712215125.4675bd5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary,

You recently updated the libfslcodecs package, and said it was working
for you with the Freescale GStreamer 0.10 plugin.

However, what seems weird is that many of the libraries installed by
libfslcodecs are not in /lib or /usr/lib, but in the
custom /usr/lib/imx-mm/ directory:

$ find output/target/usr/lib/imx-mm/
output/target/usr/lib/imx-mm/
output/target/usr/lib/imx-mm/video-codec
output/target/usr/lib/imx-mm/video-codec/lib_jpeg_dec_arm11_elinux.so
output/target/usr/lib/imx-mm/video-codec/lib_jpeg_dec_arm9_elinux.so
output/target/usr/lib/imx-mm/video-codec/lib_H264_dec_arm11_elinux.so.2
output/target/usr/lib/imx-mm/video-codec/lib_png_dec_arm11_elinux.so.1
output/target/usr/lib/imx-mm/video-codec/lib_deinterlace_arm11_elinux.so
[...]

And the GStreamer plugins are linked against those libraries (i.e they
are not loaded using dlopen) :

$ LANG=C readelf -d output/target/usr/lib/gstreamer-0.10/libmfw_gst_mp3enc.so | grep lib_mp3
 0x00000001 (NEEDED)                     Shared library: [lib_mp3_enc_arm12_elinux.so.2]

How it is possible that the glibc dynamic linker finds such libraries?

We have a very old patch at http://patchwork.ozlabs.org/patch/409684/
that was moving around the libraries installed in imx-mm to make them
appear in /usr/lib rather than /usr/lib/imx-mm. The same problem was
also reported in 2014 by J?r?me Pouiller:
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-skeleton-ld-so-conf-include-ld-so-conf-d-conf-td81900.html.

Can you confirm that you tested that the GStreamer plugin was working ?
Did you validate that the video is really decoded using the Freescale
stuff and not decoded by the CPU ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
