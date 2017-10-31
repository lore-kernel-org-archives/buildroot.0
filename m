From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 31 Oct 2017 23:22:19 +0100
Subject: [Buildroot] Libpng missing a link dependency in 2017-08?
In-Reply-To: <20171031214249.7db64df4@windsurf>
References: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
 <20171031214249.7db64df4@windsurf>
Message-ID: <c5a035da-84c6-f07c-8f99-98b3a38456c9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve, Thomas,

Le 31/10/2017 ? 21:42, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Sun, 29 Oct 2017 15:36:37 -0500, Steve Kenton wrote:
>> I recently began evaluating a switch to buildroot-2017.08 and started 
>> getting the following message (transcribed from a screen shot)
>>
>> ffprobe: Relink `/usr/lib64/libpng16.so.16' with 
>> `/lib64/libpthread.so.0' for IFUNC symbol `longjmp'
>>
>> As far as I can determine it is because libpng 1.6.31 uses longjmp() and 
>> it needs another link dependency to avoid the runtime fixup above.
>>
>> I did not see anything on the list about this and buildroot 2017-08.1 
>> did not switch to libpng 1.6.32 although I'm building it anyway on 
>> general principles.
>>
>> So, is this likely a libpng build issue or should I start digging into? 
>> ffmpeg?
> 
> It seems to be a glibc issue. Very similar to the report at
> https://sourceware.org/bugzilla/show_bug.cgi?id=21041, which says the
> bug is fixed by
> https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=fc5ad7024c620cdfe9b76e94638aac83b99c5bf8
> in glibc.
> 
> However, this patch is only available in glibc's master branch. It has
> not been backported to the 2.25 and 2.26 branches apparently.
> 
> It would be nice to see if the patch fixes the problem on glibc 2.25
> (which Buildroot 2017.08 is using).

I'm able to reproduce this issue with my latest bleeding edge toolchain (gcc
7.2, glibc 2.26-73

# ffmpeg -i Splash.jpg junk.jpg
ffmpeg: Relink `/usr/lib64/libpng16.so.16' with `/lib64/libpthread.so.0' for
IFUNC symbol `longjmp'
ffmpeg version 3.3.5 Copyright (c) 2000-2017 the FFmpeg developers
  built with gcc 7.2.0 (Buildroot 2017.11-git-00863-g82f356d)
  configuration: --enable-cross-compile
--cross-prefix=/home/naourr/buildroot-test/test/arete/host/bin/x86_64-linux-
--sysroot=/home/naourr/buildroot-test/test/arete/host/x86_64-buildroot-linux-gnu/sysroot
--host-cc=/usr/bin/gcc --arch=x86_64 --target-os=linux --disable-stripping
--pkg-config=/home/naourr/buildroot-test/test/arete/host/bin/pkg-config
--disable-static --enable-shared --prefix=/usr --enable-avfilter
--disable-version3 --enable-logging --enable-optimizations
--disable-extra-warnings --enable-avdevice --enable-avcodec --enable-avformat
--enable-network --disable-gray --enable-swscale-alpha --disable-small
--enable-dct --enable-fft --enable-mdct --enable-rdft --disable-crystalhd
--disable-dxva2 --enable-runtime-cpudetect --disable-hardcoded-tables
--disable-mipsdsp --disable-mipsdspr2 --disable-msa --enable-hwaccels
--disable-cuda --disable-cuvid --disable-nvenc --disable-avisynth
--disable-frei0r --disable-libopencore-amrnb --disable-libopencore-amrwb
--disable-libcdio --disable-libdc1394 --disable-libgsm --disable-libilbc
--disable-libnut --disable-libopenjpeg --disable-libschroedinger
--disable-libvo-amrwbenc --disable-symver --disable-doc --disable-gpl
--disable-nonfree --enable-ffmpeg --disable-ffplay --disable-ffserver
--disable-avresample --disable-ffprobe --disable-postproc --disable-swscale
--enable-indevs --enable-outdevs --enable-pthreads --enable-zlib --enable-bzlib
--disable-libfdk-aac --disable-gnutls --enable-openssl --disable-libopenh264
--enable-libvorbis --enable-muxer=ogg --enable-encoder=libvorbis --enable-vaapi
--enable-vdpau --disable-mmal --disable-omx --disable-omx-rpi
--disable-libopencv --disable-libopus --disable-libvpx --disable-libass
--disable-libbluray --disable-librtmp --disable-libmp3lame --enable-libmodplug
--enable-libspeex --enable-libtheora --disable-libwavpack --enable-libfreetype
--enable-fontconfig --disable-libx264 --disable-libx265 --enable-yasm
--enable-sse --enable-sse2 --enable-sse3 --disable-ssse3 --disable-sse4
--disable-sse42 --disable-avx --disable-avx2 --disable-armv6 --disable-armv6t2
--disable-vfp --disable-neon --disable-altivec --extra-libs=-latomic
--enable-pic --cpu=nocona
  libavutil      55. 58.100 / 55. 58.100
  libavcodec     57. 89.100 / 57. 89.100
  libavformat    57. 71.100 / 57. 71.100
  libavdevice    57.  6.100 / 57.  6.100
  libavfilter     6. 82.100 /  6. 82.100
  libswresample   2.  7.100 /  2.  7.100
Input #0, image2, from 'Splash.jpg':
  Duration: 00:00:00.04, start: 0.000000, bitrate: 8070 kb/s
    Stream #0:0: Video: mjpeg, yuvj420p(pc, bt470bg/unknown/unknown), 720x486
[SAR 28:28 DAR 40:27], 25 tbr, 25 tbn, 25 tbc
Stream mapping:
  Stream #0:0 -> #0:0 (mjpeg (native) -> mjpeg (native))
Press [q] to stop, [?] for help
Output #0, image2, to 'junk.jpg':
  Metadata:
    encoder         : Lavf57.71.100
    Stream #0:0: Video: mjpeg, yuvj420p(pc), 720x486 [SAR 28:28 DAR 40:27],
q=2-31, 200 kb/s, 25 fps, 25 tbn, 25 tbc
    Metadata:
      encoder         : Lavc57.89.100 mjpeg
    Side data:
      cpb: bitrate max/min/avg: 0/0/200000 buffer size: 0 vbv_delay: -1
frame=    1 fps=0.0 q=5.5 Lsize=N/A time=00:00:00.04 bitrate=N/A speed=0.636x
video:27kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB muxing
overhead: unknown


And with the same toolchain + the patch [1] applied:

[1]
https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=fc5ad7024c620cdfe9b76e94638aac83b99c5bf8


# ffmpeg -i Splash.jpg junk.jpg
ffmpeg version 3.3.5 Copyright (c) 2000-2017 the FFmpeg developers
  built with gcc 7.2.0 (Buildroot 2017.11-git-00942-g79922c1)
  configuration: --enable-cross-compile
--cross-prefix=/home/naourr/buildroot-test/test/random/host/bin/x86_64-linux-
--sysroot=/home/naourr/buildroot-test/test/random/host/x86_64-buildroot-linux-gnu/sysroot
--host-cc=/usr/bin/gcc --arch=x86_64 --target-os=linux --disable-stripping
--pkg-config=/home/naourr/buildroot-test/test/random/host/bin/pkg-config
--disable-static --enable-shared --prefix=/usr --enable-avfilter
--disable-version3 --enable-logging --enable-optimizations
--disable-extra-warnings --enable-avdevice --enable-avcodec --enable-avformat
--enable-network --disable-gray --enable-swscale-alpha --disable-small
--enable-dct --enable-fft --enable-mdct --enable-rdft --disable-crystalhd
--disable-dxva2 --enable-runtime-cpudetect --disable-hardcoded-tables
--disable-mipsdsp --disable-mipsdspr2 --disable-msa --enable-hwaccels
--disable-cuda --disable-cuvid --disable-nvenc --disable-avisynth
--disable-frei0r --disable-libopencore-amrnb --disable-libopencore-amrwb
--disable-libcdio --disable-libdc1394 --disable-libgsm --disable-libilbc
--disable-libnut --disable-libopenjpeg --disable-libschroedinger
--disable-libvo-amrwbenc --disable-symver --disable-doc --disable-gpl
--disable-nonfree --enable-ffmpeg --disable-ffplay --disable-ffserver
--disable-avresample --disable-ffprobe --disable-postproc --disable-swscale
--enable-indevs --enable-outdevs --enable-pthreads --enable-zlib --disable-bzlib
--disable-libfdk-aac --disable-gnutls --disable-openssl --disable-libopenh264
--disable-vaapi --disable-vdpau --disable-mmal --disable-omx --disable-omx-rpi
--disable-libopencv --disable-libopus --disable-libvpx --disable-libass
--disable-libbluray --disable-librtmp --disable-libmp3lame --disable-libmodplug
--disable-libspeex --disable-libtheora --disable-libwavpack --enable-libfreetype
--disable-fontconfig --disable-libx264 --disable-libx265 --enable-yasm
--enable-sse --enable-sse2 --enable-sse3 --disable-ssse3 --disable-sse4
--disable-sse42 --disable-avx --disable-avx2 --disable-armv6 --disable-armv6t2
--disable-vfp --disable-neon --disable-altivec --extra-libs=-latomic
--enable-pic --cpu=nocona
  libavutil      55. 58.100 / 55. 58.100
  libavcodec     57. 89.100 / 57. 89.100
  libavformat    57. 71.100 / 57. 71.100
  libavdevice    57.  6.100 / 57.  6.100
  libavfilter     6. 82.100 /  6. 82.100
  libswresample   2.  7.100 /  2.  7.100
Input #0, image2, from 'Splash.jpg':
  Duration: 00:00:00.04, start: 0.000000, bitrate: 8070 kb/s
    Stream #0:0: Video: mjpeg, yuvj420p(pc, bt470bg/unknown/unknown), 720x486
[SAR 28:28 DAR 40:27], 25 tbr, 25 tbn, 25 tbc
Stream mapping:
  Stream #0:0 -> #0:0 (mjpeg (native) -> mjpeg (native))
Press [q] to stop, [?] for help
Output #0, image2, to 'junk.jpg':
  Metadata:
    encoder         : Lavf57.71.100
    Stream #0:0: Video: mjpeg, yuvj420p(pc), 720x486 [SAR 28:28 DAR 40:27],
q=2-31, 200 kb/s, 25 fps, 25 tbn, 25 tbc
    Metadata:
      encoder         : Lavc57.89.100 mjpeg
    Side data:
      cpb: bitrate max/min/avg: 0/0/200000 buffer size: 0 vbv_delay: -1
frame=    1 fps=0.0 q=5.5 Lsize=N/A time=00:00:00.04 bitrate=N/A speed=2.05x
video:27kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB muxing
overhead: unknown

I don't know why this patch is not backported to 2.26 stable branch (and other
branch).

Steve, can you ask on the glibc mailing list ?

Thanks for the report!

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
