From: <bogus@does.not.exist.com>
Date: Wed, 23 Apr 2008 14:39:25 -0000
Subject: No subject
Message-ID: <mailman.0.1209651073.1342.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0x40000930  0x40003f50  Yes
/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib/ld-uClibc.so.0
0x40011dd0  0x40018380  Yes
/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib/libpthread.so.0
0x40033800  0x40071e60  Yes
/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib/libc.so.0
(gdb) q
~$

When the thread has been created, it is not visible from the debugger.
It runs, but I can't put a breakpoint.
A few notes:

- I do not like the message "warning: Remote failure reply: E01", it
might mean that gdb host and gdbserver are not in sync for whatever
reason.

- If I put a breakpoint on the thread function, before 'cont', the
program terminates as soon the thread is created.

- the shared library 'thread_db' is not loaded (I think it should):
# cat /proc/2298/maps
00008000-00009000 r-xp 00000000 00:0c 4339       /tmp/test
00010000-00011000 rw-p 00000000 00:0c 4339       /tmp/test
00011000-00012000 rwxp 00011000 00:00 0          [heap]
40000000-40005000 r-xp 00000000 00:01 398        /lib/ld-uClibc-0.9.29.so
40005000-40006000 rw-p 40005000 00:00 0
4000c000-4000d000 r--p 00004000 00:01 398        /lib/ld-uClibc-0.9.29.so
4000d000-4000e000 rw-p 00005000 00:01 398        /lib/ld-uClibc-0.9.29.so
4000e000-40019000 r-xp 00000000 00:01 406        /lib/libpthread-0.9.29.so
40019000-40020000 ---p 40019000 00:00 0
40020000-40021000 r--p 0000a000 00:01 406        /lib/libpthread-0.9.29.so
40021000-40026000 rw-p 0000b000 00:01 406        /lib/libpthread-0.9.29.so
40026000-40028000 rw-p 40026000 00:00 0
40028000-400b5000 r-xp 00000000 00:01 414        /lib/libuClibc-0.9.29.so
400b5000-400bc000 ---p 400b5000 00:00 0
400bc000-400bd000 r--p 0008c000 00:01 414        /lib/libuClibc-0.9.29.so
400bd000-400be000 rw-p 0008d000 00:01 414        /lib/libuClibc-0.9.29.so
400be000-400c3000 rw-p 400be000 00:00 0
bebde000-bebf3000 rwxp befeb000 00:00 0          [stack]

I used linuxthreads (stable/old), and I checked 'pthreads debugging
support ' within uclibc menuconfig.

Any idea what I am missing?

TIA,
~Olivier
