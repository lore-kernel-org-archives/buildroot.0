From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Jun 2014 01:13:11 +0200
Subject: [Buildroot] Help about gstreamer h264 in buildroot
In-Reply-To: <539C13BA.5000106@gmail.com>
References: <539C13BA.5000106@gmail.com>
Message-ID: <53A21D07.6040108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/06/14 11:19, Marco Trapanese wrote:
> Hello,
> I'm trying to play mp4 h264 video files on a RPi.
> Attached there is the .config file.
> When I try to play such a file I get this error:
> 
> Warning: "No decoder available for type 'video/x-h264,
> stream-format=(string)avc, alignment=(string)au, level=(string)4,
> profile=(string)main,
> codec_data=(buffer)014d4028ffe10016274d4028a9180f0044fcb8035010101b6c2b5ef7c04001000428de09c8,
> width=(int)1920, height=(int)1080, framerate=(fraction)25/1,
> pixel-aspect-ratio=(fraction)1/1, parsed=(boolean)true'."
> Error: "Your GStreamer installation is missing a plug-in."
> 
> Anyway I selected (and checked with gst-inspect) the x264parse plugin (from bad-
> ones).
> After a search on the web it seems I need also the gst-ffmpeg but this requires
> libavcodec which cannot compile:
> 
> libavcodec/arm/ac3dsp_armv6.S: Assembler messages:
> libavcodec/arm/ac3dsp_armv6.S:40: Error: selected processor does not support ARM
> mode `movw r8,#0x1fe0'

 This is a bug in gst-ffmpeg's libavcodec: we explicitly pass
--enable-armv6 --disable-armv6t2
to configure, but it still uses armv6t2 instructions (movw with 16-bit immediate).

 The upstream ffmpeg patch that fixes it is in
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=9a83adaf346bc5e38183427b2bd11084c11d1c8b

 I'll post a patch in a minute.

 Regards,
 Arnout

> 
> 
> I was working on a 2014.05-git-00366-gba25b12-dirty version.
> I tried on a newer one (2014.08-git-00302-g712414c) but there is the same error.
> 
> What am I missing?
> 
> Thanks!
> Marco
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
