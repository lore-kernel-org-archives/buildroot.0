From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 30 Sep 2011 11:06:46 +0200
Subject: [Buildroot] Segmentation faults after gcc update
In-Reply-To: <1317221262.8481.4.camel@sven>
References: <1317110841.20688.12.camel@sven> <20110927233506.55cb52a2@skate>
 <1317221262.8481.4.camel@sven>
Message-ID: <1317373796.20520.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2011-09-28 at 16:44 +0200, Sven Neumann wrote:

> On Tue, 2011-09-27 at 23:35 +0200, Thomas Petazzoni wrote:
> 
> >  * What does a gdb session says for the execution of one of those
> >    binaries ?
> 
> OK, so I had to compile a gdb for the target first. Here's the result:
> 
> # gdb dbus-daemon 
> GNU gdb (GDB) 7.1
> Copyright (C) 2010 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
> and "show warranty" for details.
> This GDB was configured as "arm-unknown-linux-uclibcgnueabi".
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>...
> Reading symbols from /usr/bin/dbus-daemon...(no debugging symbols found)...done.
> (gdb) r
> Starting program: /usr/bin/dbus-daemon 
> warning: Unable to find libthread_db matching inferior's thread library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread library, thread debugging will not be available.
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x40086254 in _dl_get_tls_static_info () from /lib/ld-uClibc.so.0
> (gdb) bt
> #0  0x40086254 in _dl_get_tls_static_info () from /lib/ld-uClibc.so.0
> #1  0x40087064 in _dl_update_slotinfo () from /lib/ld-uClibc.so.0
> #2  0x401584a0 in sched_get_priority_max () from /lib/libc.so.0
> #3  0x4015f040 in hasmntopt () from /lib/libc.so.0
> #4  0x4015f040 in hasmntopt () from /lib/libc.so.0
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
> (gdb) 
> 
> 
> I don't quite understand why libthread_db is not found as I did enable
> BR2_PTHREAD_DEBUG for this build and recompiled everything. Anyway, I
> tried gdb on a different (crashing) binary and it crashes in
> _dl_get_tls_static_info() as well.

I have now added some debug output to _dl_get_tls_static_info() and
related functions and from that I can tell that gdb is wrong here. The
code does definitely not crash in _dl_get_tls_static_info() and not in
_dl_update_slotinfo() either.

Now I am somewhat stuck. Any further ideas on how I could tackle this
problem?


Thanks,
Sven
