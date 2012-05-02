From: Shawn Ferris <shawn.ferris@gmail.com>
Date: Tue, 1 May 2012 19:19:40 -0600
Subject: [Buildroot] Enabling debugging symbols in packages..
Message-ID: <CAC2kKA8s_8d=u2BDz4Ai0GA_QEru6+76dY3=0_3=s75jjK=QxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Guys --

I'm trying to get help to debug pulseaudio on my pandaboard and I'm
trying to enable debugging symbols to grab a backtrace. I see -g2
added to the CFLAGS, but when I gdb pulseaudio, it can't find them:

To show that pulseaudio at least adds it:

$ pulseaudio --log-level=debug
I: [pulseaudio] main.c: setrlimit(RLIMIT_NICE, (31, 31)) failed:
Operation not permitted
I: [pulseaudio] main.c: setrlimit(RLIMIT_RTPRIO, (9, 9)) failed:
Operation not permitted
D: [pulseaudio] core-rtclock.c: Timer slack is set to 50 us.
I: [pulseaudio] core-util.c: Failed to acquire high-priority
scheduling: No such file or directory
I: [pulseaudio] main.c: This is PulseAudio 1.99.2
D: [pulseaudio] main.c: Compilation host: arm-unknown-linux-gnu
D: [pulseaudio] main.c: Compilation CFLAGS:  -pipe -Os -g2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall
-W -Wextra -Wno-long-long -Wvla -Wno-overlength-strings
-Wunsafe-loop-optimizations -Wundef -Wformat=2 -Wlogical-op
-Wsign-compare -Wformat-security -Wmissing-include-dirs
-Wformat-nonliteral -Wpointer-arith -Winit-self
-Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes
-Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow
-Wendif-labels -Wcast-align -Wstrict-aliasing -Wwrite-strings
-Wno-unused-parameter -ffast-math -Wp,-D_FORTIFY_SOURCE=2 -fno-common
-fdiagnostics-show-option

And gdb:

$ gdb pulseaudio
GNU gdb (GDB) 7.4
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "arm-unknown-linux-gnueabi".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/bin/pulseaudio...(no debugging symbols found)...done.
(gdb) run
Starting program: /usr/bin/pulseaudio
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
process 1645 is executing new program: /usr/bin/pulseaudio
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
W: [pulseaudio] pid.c: Stale PID file, overwriting.

Program received signal SIGSEGV, Segmentation fault.
0x00001bf8 in ?? ()
(gdb) bt
#0  0x00001bf8 in ?? ()
#1  0xb2acaa14 in module_alsa_card_LTX_pa__init ()
   from /usr/lib/pulse-1.99/modules/module-alsa-card.so
#2  0xb6f8fc02 in pa_module_load () from /usr/lib/libpulsecore-1.99.so
#3  0xb6f87a34 in ?? () from /usr/lib/libpulsecore-1.99.so
#4  0xb6f87a34 in ?? () from /usr/lib/libpulsecore-1.99.so
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

I'd appreciate any help!

Thanks
Shawn
