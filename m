From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 21:02:30 +0100
Subject: [Buildroot] [PATCH 1/1] gst-ffmpeg: Use internal libav instead
	of external ffmpeg
In-Reply-To: <BLU0-SMTP442A9DE801569E9B4917C36D9BE0@phx.gbl> (Bernd Kuhls's
 message of "Wed, 15 Jan 2014 19:44:21 +0100")
References: <BLU0-SMTP442A9DE801569E9B4917C36D9BE0@phx.gbl>
Message-ID: <87lhyht3mx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > External ffmpeg 1.2.4 is incompatible, gst-ffmpeg suggests
 > to always use internal libav.

 > Adding two patches:
 > Allow uClibc compilation: gst-ffmpeg-uclibc.patch
 > Fixes compiling with gcc-4.7: gst-ffmpeg-0.10.13_gcc47.patch (taken from Slackware)

 > Fixes
 > http://autobuild.buildroot.net/results/ab8/ab8ec4904020ceb848a1e50f1865f594f46b8295//
 > http://autobuild.buildroot.net/results/f0a/f0a420015a92ebb8868c41c0dbf82cf27b2bdd0f//

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 
 > +GST_FFMPEG_CONF_OPT = --with-ffmpeg-extra-configure="--cross-prefix=$(TARGET_CROSS)"

It seems like we atleast also need to pass --target-os=linux, otherwise
configure fails:

Configuring included Libav instance with args --prefix=/usr
--disable-ffserver --disable-ffplay --disable-ffmpeg --disable-ffprobe
--enable-static --enable-pic --disable-encoder=flac
--disable-decoder=cavs --disable-protocols --disable-devices
--disable-network --disable-hwaccels --disable-filters --disable-doc
--enable-optimizations --enable-postproc --enable-gpl
--enable-cross-compile --target-os=linux-uclibcgnueabi --arch=arm
--cross-prefix=arm-buildroot-linux-uclibcgnueabi-
--cross-prefix=/home/peko/source/buildroot/output/host/usr/bin/arm-linux-
Unknown OS 'linux-uclibcgnueabi'.

If you think configure made a mistake, make sure you are using the latest
version from Git.  If the latest version fails, report the problem to the
libav-user at libav.org mailing list or IRC #libav on irc.freenode.net.
Include the log file "config.log" produced by configure as this will help
solving the problem.
config.status: error: Failed to configure embedded Libav tree

But what about all the CPU optimization flags we have in ffmpeg? Don't
we need to reproduce those as well here?

-- 
Bye, Peter Korsgaard
