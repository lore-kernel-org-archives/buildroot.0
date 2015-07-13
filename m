From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jul 2015 09:58:50 +0200
Subject: [Buildroot] libfslcodecs libraries installation location
In-Reply-To: <20150712215125.4675bd5f@free-electrons.com>
References: <20150712215125.4675bd5f@free-electrons.com>
Message-ID: <CAAMH-yuiKwzK1_q0hwxC3SigU+veYQA3wQTiZRdGYO0j=K=Z5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Jul 12, 2015 9:51 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello Gary,
>
> You recently updated the libfslcodecs package, and said it was working
> for you with the Freescale GStreamer 0.10 plugin.
>
> However, what seems weird is that many of the libraries installed by
> libfslcodecs are not in /lib or /usr/lib, but in the
> custom /usr/lib/imx-mm/ directory:
>
> $ find output/target/usr/lib/imx-mm/
> output/target/usr/lib/imx-mm/
> output/target/usr/lib/imx-mm/video-codec
> output/target/usr/lib/imx-mm/video-codec/lib_jpeg_dec_arm11_elinux.so
> output/target/usr/lib/imx-mm/video-codec/lib_jpeg_dec_arm9_elinux.so
> output/target/usr/lib/imx-mm/video-codec/lib_H264_dec_arm11_elinux.so.2
> output/target/usr/lib/imx-mm/video-codec/lib_png_dec_arm11_elinux.so.1
> output/target/usr/lib/imx-mm/video-codec/lib_deinterlace_arm11_elinux.so
> [...]
>
> And the GStreamer plugins are linked against those libraries (i.e they
> are not loaded using dlopen) :
>
> $ LANG=C readelf -d
output/target/usr/lib/gstreamer-0.10/libmfw_gst_mp3enc.so | grep lib_mp3
>  0x00000001 (NEEDED)                     Shared library:
[lib_mp3_enc_arm12_elinux.so.2]
>
> How it is possible that the glibc dynamic linker finds such libraries?

I remember discussions about it and I didn't get the issue at first for
some reason. Then I reproduced it and used ld.so.conf to add imx-mm folder.

> We have a very old patch at http://patchwork.ozlabs.org/patch/409684/
> that was moving around the libraries installed in imx-mm to make them
> appear in /usr/lib rather than /usr/lib/imx-mm. The same problem was
> also reported in 2014 by J?r?me Pouiller:
>
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-skeleton-ld-so-conf-include-ld-so-conf-d-conf-td81900.html
.
>
> Can you confirm that you tested that the GStreamer plugin was working ?
> Did you validate that the video is really decoded using the Freescale
> stuff and not decoded by the CPU ?

Yes, I'm using the 1080p video to make sure it strikes me if not using the
VPU as the CPU can't handle it well. However I hope I didn't use the
ld.so.conf.
I'm on vacation for two weeks so I'll only be able to do some testing
starting on the 27th.

Thanks,
Gary
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150713/d85889ba/attachment.html>
