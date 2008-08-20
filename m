From: Tomasz Chmielewski <mangoo@wpkg.org>
Date: Wed, 20 Aug 2008 12:00:51 +0200
Subject: [Buildroot] ARM EABI toolchain - anyone build it successfully?
In-Reply-To: <48ABE3DE.80908@wpkg.org>
References: <48AAE812.4020706@wpkg.org>
	<20080819154955.GA15608@mx.loc>	<48AAECB6.6020309@wpkg.org>
	<20080819162809.GA15851@mx.loc> <48ABE3DE.80908@wpkg.org>
Message-ID: <48ABEB53.4030104@wpkg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tomasz Chmielewski schrieb:
> Bernhard Reutner-Fischer schrieb:
>> On Tue, Aug 19, 2008 at 05:54:30PM +0200, Tomasz Chmielewski wrote:
>>> Bernhard Reutner-Fischer schrieb:
>>>> On Tue, Aug 19, 2008 at 05:34:42PM +0200, Tomasz Chmielewski wrote:
>>>>
>>>>> So my question - did anyone manage to build ARM EABI toolchain with  
>>>>> buildroot (GCC 4.3.1 + uClibc; I also need busybox)?
>>>> Built fine for me last time i tried.
>>> Do you still have it anywhere?
>> Unfortunately i've lost the disk that contained the configs, but going
>> off a minimal config should work fine.
> 
> OK, it builds (I had a custom uClibc config, which perhaps made some 
> problems), but even then, lots of Busybox things don't work.

BTW, I know why it initially failed for me - I removed networking support in uClibc configuration, which resulted in:


  CC libpthread/linuxthreads.old/pthread.oS
  STRIP -x -R .note -R .comment libpthread/linuxthreads.old/libpthread_so.a
  AR cr libpthread/linuxthreads.old/libpthread_so.a
  LD libpthread-0.9.29.so
libpthread/linuxthreads.old/libpthread_so.a(wrapsyscall.os): In function `sendto':
wrapsyscall.c:(.text+0x44): undefined reference to `__libc_sendto'
libpthread/linuxthreads.old/libpthread_so.a(wrapsyscall.os): In function `sendmsg':
wrapsyscall.c:(.text+0x90): undefined reference to `__libc_sendmsg'
libpthread/linuxthreads.old/libpthread_so.a(wrapsyscall.os): In function `send':
wrapsyscall.c:(.text+0xe4): undefined reference to `__libc_send'
libpthread/linuxthreads.old/libpthread_so.a(wrapsyscall.os): In function `recvmsg':
wrapsyscall.c:(.text+0x130): undefined reference to `__libc_recvmsg'
libpthread/linuxthreads.old/libpthread_so.a(wrapsyscall.os): In function `recvfrom':
wrapsyscall.c:(.text+0x194): undefined reference to `__libc_recvfrom'
libpthread/linuxthreads.old/libpthread_so.a(wrapsyscall.os): In function `recv':
wrapsyscall.c:(.text+0x1e8): undefined reference to `__libc_recv'
libpthread/linuxthreads.old/libpthread_so.a(wrapsyscall.os): In function `connect':
wrapsyscall.c:(.text+0x234): undefined reference to `__libc_connect'
libpthread/linuxthreads.old/libpthread_so.a(wrapsyscall.os): In function `accept':
wrapsyscall.c:(.text+0x280): undefined reference to `__libc_accept'
collect2: ld returned 1 exit status
make[1]: *** [lib/libpthread.so] Error 1
make[1]: Leaving directory `/home/build/buildroot/buildroot-arm-gcc-4.3.1-EABI/toolchain_build_arm/uClibc'
make: *** [/home/build/buildroot/buildroot-arm-gcc-4.3.1-EABI/toolchain_build_arm/uClibc/lib/libc.a] Error 2



-- 
Tomasz Chmielewski
http://wpkg.org
