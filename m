From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 27 Jul 2015 13:35:00 +0200
Subject: [Buildroot] libfslcodecs libraries installation location
In-Reply-To: <20150713100336.0de992c5@free-electrons.com>
References: <20150712215125.4675bd5f@free-electrons.com>
 <CAAMH-yuiKwzK1_q0hwxC3SigU+veYQA3wQTiZRdGYO0j=K=Z5g@mail.gmail.com>
 <20150713100336.0de992c5@free-electrons.com>
Message-ID: <CAAMH-ytR6pzKajyZ_KhL8jR7dsFqLN-oK2+BEJr5yYZeP2TPHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jul 13, 2015 at 10:03 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Gary Bisson,
>
> On Mon, 13 Jul 2015 09:58:50 +0200, Gary Bisson wrote:
>
>> > How it is possible that the glibc dynamic linker finds such libraries?
>>
>> I remember discussions about it and I didn't get the issue at first for
>> some reason. Then I reproduced it and used ld.so.conf to add imx-mm folder.
>
> Ah, so you confirm that back then you used ld.so.conf, but not recently?

I just did some testing again and confirm that I didn't need it for my
testing as it wasn't covering every scenario.

>> > We have a very old patch at http://patchwork.ozlabs.org/patch/409684/
>> > that was moving around the libraries installed in imx-mm to make them
>> > appear in /usr/lib rather than /usr/lib/imx-mm. The same problem was
>> > also reported in 2014 by J?r?me Pouiller:
>> >
>> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-skeleton-ld-so-conf-include-ld-so-conf-d-conf-td81900.html
>> .
>> >
>> > Can you confirm that you tested that the GStreamer plugin was working ?
>> > Did you validate that the video is really decoded using the Freescale
>> > stuff and not decoded by the CPU ?
>>
>> Yes, I'm using the 1080p video to make sure it strikes me if not using the
>> VPU as the CPU can't handle it well. However I hope I didn't use the
>> ld.so.conf.
>
> But it seems that not all codecs use those libraries. Arnout was saying
> that maybe some codecs such as H.264 are decoded by real
> dedicated hardware, while some others (like the MP3 example are gave)
> require a firmware to be pushed to a DSP. And in this last case, a
> library in imx-mm would be needed.
>
> Can you try playing a MP3 file for example?

Indeed, only a few (audio) plugins are using the libraries located
under /usr/lib/imx-mm:
$ for i in `find target/usr/lib/gstreamer-0.10/*`; do readelf -d $i |
grep NEEDED | grep lib_ && echo "($i)"; done
 0x00000001 (NEEDED)                     Shared library:
[lib_nb_amr_dec_arm9_elinux.so.2]
 0x00000001 (NEEDED)                     Shared library:
[lib_wb_amr_dec_arm9_elinux.so.2]
(target/usr/lib/gstreamer-0.10/libmfw_gst_amrdec.so)
 0x00000001 (NEEDED)                     Shared library:
[lib_peq_arm11_elinux.so.1]
(target/usr/lib/gstreamer-0.10/libmfw_gst_audio_pp.so)
 0x00000001 (NEEDED)                     Shared library:
[lib_mp3_enc_arm12_elinux.so.2]
(target/usr/lib/gstreamer-0.10/libmfw_gst_mp3enc.so)

For the audio plugins above, it requires to add
/usr/lib/imx-mm/audio-codec/ to LD_LIBRARY_PATH. Funny thing is that
all the other libs (video-codec) do not seem to be used.

Anyway, it seems the ld.so.conf is still needed for those specific plugins:
# gst-launch audiotestsrc ! mfw_mp3encoder ! fakesink

(gst-launch-0.10:267): GStreamer-WARNING **: Failed to load plugin
'/usr/lib/gstreamer-0.10/libmfw_gst_mp3enc.so': li
b_mp3_enc_arm12_elinux.so.2: cannot open shared object file: No such
file or directory
WARNING: erroneous pipeline: no element "mfw_mp3encoder"
# export LD_LIBRARY_PATH=/usr/lib/imx-mm/audio-codec/
# gst-launch audiotestsrc ! mfw_mp3encoder ! fakesink
BLN_MAD-MMCODECS_MP3E_ARM_02.03.00_ARM12  build on Jun 17 2013 11:16:14.
MFW_GST_MP3_ENCODER_PLUGIN 4.0.2 build on Jul 26 2015 19:56:47.
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
...

I'd use Jerome approach (ld.so.conf) instead of copying the libraries
to another path.

Regards,
Gary
