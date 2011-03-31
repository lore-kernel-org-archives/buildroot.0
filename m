From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Mar 2011 20:24:35 +0000 (UTC)
Subject: [Buildroot] [Bug 3535] New: mplayer build fails against ARM on
	2011.02
Message-ID: <bug-3535-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3535

           Summary: mplayer build fails against ARM on 2011.02
           Product: buildroot
           Version: 2011.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mjhammel at graphics-muse.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Building Buildroot 2011.02 with Crosstool-NG 1.10.0, using gcc 4.5.2 and uClibc
0.9.31, I get this error:

AS arm/simple_idct_neon.o
arm/mpegvideo_arm.c:33:1: error: size of array 'x_H263_AIC' is negative
make[3]: *** [arm/mpegvideo_arm.o] Error 1
make[3]: *** Waiting for unfinished jobs....
CC matroska.o
CC matroskadec.o
CC md5proto.o
make[3]: Leaving directory
`/home/mjhammel/src/ximba/bb/bld/buildroot-2011.02/output/build/mplayer-32726/ffmpeg/libavcodec'

Doing some googling it appears that there is a problem with a defined value:
http://comments.gmane.org/gmane.comp.video.mplayer.user/64844
http://permalink.gmane.org/gmane.comp.video.mplayer.user/64851 - this is the
most telling post
http://code.google.com/p/chromium/issues/detail?id=59123

Chromium has patches that might apply and appear to be generic (not ARM
specific):
http://src.chromium.org/viewvc/chrome/trunk/deps/third_party/ffmpeg/source/patched-ffmpeg-mt/libavcodec/arm/asm-offsets.h?r1=62568&r2=62567&pathrev=62568&diff_format=s
http://src.chromium.org/viewvc/chrome/trunk/deps/third_party/ffmpeg/README.chromium?r1=62568&r2=62567&pathrev=62568&diff_format=c
http://src.chromium.org/viewvc/chrome/trunk/deps/third_party/ffmpeg/source/patched-ffmpeg-mt/libavcodec/arm/asm-offsets.h?r1=62568&r2=62567&pathrev=62568&diff_format=c

I have not tried these because it turns out I don't need mplayer after all
since this patch only makes mplayer use NEON with the processor but does not
utilize the DSP on the BeagleBoard.  So I just disabled mplayer from the build.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
