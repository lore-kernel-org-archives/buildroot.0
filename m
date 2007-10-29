From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 29 Oct 2007 04:37:29 -0700
Subject: [Buildroot] [buildroot 0001559]: mplayer uses llrint which is
	unavailable on uClibc
Message-ID: <c1636a3e582fcf1fd16c2baf25710695@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1559 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1559
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2007 11:49 PDT
Last Modified:              10-29-2007 04:37 PDT
====================================================================== 
Summary:                    mplayer uses llrint which is unavailable on uClibc
Description: 
The mplayer-1.0rc1-atmel.3.patch already solves this issue, but does so
only for AVR32 targets (for no good reason, since the patch itself admits
it's a uClibc issue).

The attached patch changes this portion of the Atmel patch to apply for
all uClibc cases.
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 10-28-07 14:34  
---------------------------------------------------------------------- 
"mplayer uses llrint which is unavailable on uClibc"

What make you think so? I have it defined in libm-0.9.29.so 
and Mplayer build OK for arm target, which is not AVR32 one.

regards,
Ivan 

---------------------------------------------------------------------- 
 ikonst - 10-29-07 01:23  
---------------------------------------------------------------------- 
objdump -T libm-0.9.29.so  | grep llrint
gives me nothing.

It might because I'm using a specific uClibc revision (something between
0.9.28 and 0.9.29, the specific version to which the NPTL patch applies).

Perhaps the fix should be more specific and only applied for older uClibc
versions. Does uClibc indicate its version through some define? 

---------------------------------------------------------------------- 
 thomasez - 10-29-07 04:37  
---------------------------------------------------------------------- 
Anyway;

lib$ objdump -T libm-0.9.29.so | grep llrint
00007ab4 g    DF .text  000001a1 llrint
0000814c g    DF .text  00000013 llrintf

And with the patch applied:

/store/src/Buildroot/buildroot.bugzilla/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
  -DHAVE_AV_CONFIG_H -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-D_ISOC9X_SOURCE -I.. -I.. -I../libavutil -Wdeclaration-after-statement
-fno-PIC -Os -pipe 
-I/store/src/Buildroot/buildroot.bugzilla/build_i386/staging_dir/usr/include
-I/store/src/Buildroot/buildroot.bugzilla/build_i386/staging_dir/include
--sysroot=/store/src/Buildroot/buildroot.bugzilla/build_i386/staging_dir/
-isysroot /store/src/Buildroot/buildroot.bugzilla/build_i386/staging_dir
-mtune=i386 -march=i386 -D_REENTRANT
-I/store/src/Buildroot/buildroot.bugzilla/build_i386/staging_dir/usr/include
   -c -o h264.o h264.c
h264.c: In function 'decode_cabac_residual':
h264.c:6158: warning: passing argument 4 of 'decode_significance_8x8_x86'
discards qualifiers from pointer target type
cabac.h: In function 'get_cabac_noinline':
cabac.h:513: error: can't find a register in class 'GENERAL_REGS' while
reloading 'asm'
cabac.h:513: error: 'asm' operand has impossible constraints
make[2]: *** [h264.o] Error 1
make[2]: Leaving directory
`/store/src/Buildroot/buildroot.bugzilla/build_i386/MPlayer-1.0rc1/libavcodec'
make[1]: *** [libavcodec/libavcodec.a] Error 2
make[1]: Leaving directory
`/store/src/Buildroot/buildroot.bugzilla/build_i386/MPlayer-1.0rc1'

This was the default i396 config, just added mplayer package. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-07 11:49  ikonst         New Issue                                    
10-28-07 11:49  ikonst         Status                   new => assigned     
10-28-07 11:49  ikonst         Assigned To               => buildroot       
10-28-07 11:49  ikonst         File Added: mplayer-llrint-not-only-atmel.patch  
                 
10-28-07 14:34  vanokuten      Note Added: 0002865                          
10-29-07 01:23  ikonst         Note Added: 0002866                          
10-29-07 04:37  thomasez       Note Added: 0002867                          
======================================================================
