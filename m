From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 04 Sep 2007 11:55:03 +0100
Subject: [Buildroot] debugging threads
In-Reply-To: <46DC165D.3000407@carallon.com>
References: <46DC165D.3000407@carallon.com>
Message-ID: <46DD3987.6090300@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I solved this, it was a problem with gdb & gdbserver not being rebuilt 
when you change the uClibc option to allow thread debugging. A rebuild 
from scratch fixed the problem.

Will.

Will Wagner wrote:
> Hello,
> 
> I am trying to debug a multithreaded app and am having some problems. 
> I've hunted around how to do this and have done the following:
> 
> Built uClibc with debug threads on so have a libthread_db.so
> Built gdbserver for target
> 
> I then execute gdbserver with:
> gdbserver 192.168.42.15:2345 /usr/sbin/threaded_test
> 
> On the host machine I run:
> ~/buildroot/build_i686/staging_dir/usr/bin/i686-linux-gdb ~/threaded_test
> 
> Once gdb starts I point it to the shared libs with:
> set solib-absolute-prefix ~/buildroot/project_build_i686/uclibc/root
> 
> Then connect to gdbserver with
> target remote 192.168.42.101:2345
> 
> I am able to debug the application until a call to create a thread 
> (pthread_create) when I get the following error:
> 
> Program received signal SIG32, Real-time event 32.
> 0xb7ef0175 in sigsuspend ()
>     from
> /home/willw/buildroot/project_build_i686/uclibc/root/lib/libc.so.0
> (gdb) bt
> #0  0xb7ef0175 in sigsuspend ()
>     from
> /home/willw/buildroot/project_build_i686/uclibc/root/lib/libc.so.0
> #1  0xb7faf6a4 in __pthread_wait_for_restart_signal ()
>     from
> /home/willw/buildroot/project_build_i686/uclibc/root/lib/libpthread.so.0
> #2  0xb7faf6cc in ?? ()
>     from
> /home/willw/buildroot/project_build_i686/uclibc/root/lib/libpthread.so.0
> #3  0xb7fb6040 in ?? ()
>     from
> /home/willw/buildroot/project_build_i686/uclibc/root/lib/libpthread.so.0
> #4  0xb7fb1de8 in ?? ()
>     from
> /home/willw/buildroot/project_build_i686/uclibc/root/lib/libpthread.so.0
> #5  0xbf871718 in ?? ()
> #6  0xb7fafda8 in pthread_create ()
>     from
> /home/willw/buildroot/project_build_i686/uclibc/root/lib/libpthread.so.0
> Backtrace stopped: frame did not save the PC
> 
> 
> Can anyone tell me what step I am missing to get thread debugging 
> working? From searching on the net it seems the libthread_db is needed 
> but it doesn't seem to be loaded by gdb.
> 
> Many thanks,
> 
> Will.
> 

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
