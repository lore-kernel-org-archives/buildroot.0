From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 6 Jul 2015 14:51:18 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-06-28
In-Reply-To: <20150629063017.4326F10013E@stock.ovh.net>
References: <20150629063017.4326F10013E@stock.ovh.net>
Message-ID: <1436194278.3246.42.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2015-06-29 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-06-28
> ===============================
> 
>         success : 10 
>        failures : 9  
>        timeouts : 0  
>           TOTAL : 19 
> 
Classification of failures by reason
> ====================================
> 
>              berkeleydb-5.3.28 | 2 
>                  empty-0.6.19b | 2 
>                    tor-0.2.6.9 | 1 
>                    eudev-3.1.1 | 1 
>       binutils-arc-2015.06-rc1 | 1 
>                   zeromq-4.0.5 | 1 
>                  lvm2-2.02.121 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |              berkeleydb-5.3.28 | NOK | http://autobuil
> d.buildroot.net/results/717f3b37600a56262badc6f7cb64d7949fdacb67/
>          arc |              berkeleydb-5.3.28 | NOK | 
> http://autobuild.buildroot.net/results/80ebf0382992b277fd94743815bbf0
> c7426a3654/

That's a failure if toolchain is configured without threads.
This is what I see in config.log:
--------------------->8--------------------
configure:20510: checking for mutexes
configure:20603:
/home/abrodkin/Outputs/buildroot/test2/host/usr/bin/arc-buildroot-linux
-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -matomic  -Os -g2  -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_REENTRANT
  conftest.c  -lpthread >&5
In file included from
/home/abrodkin/Outputs/buildroot/test2/host/usr/arc-buildroot-linux
-uclibc/sysroot/usr/include/stdlib.h:24:0,
                 from conftest.c:43:
/home/abrodkin/Outputs/buildroot/test2/host/usr/arc-buildroot-linux
-uclibc/sysroot/usr/include/features.h:208:5: warning: #warning
requested reentrant code, but thread support was disabled [-Wcpp]
 #   warning requested reentrant code, but thread support was disabled
     ^
conftest.c:44:21: fatal error: pthread.h: No such file or directory
 #include <pthread.h>
                     ^
compilation terminated.
--------------------->8--------------------

Fixed with http://patchwork.ozlabs.org/patch/491656/

>          arc |       binutils-arc-2015.06-rc1 | NOK | 
> http://autobuild.buildroot.net/results/53d333850a82f71c4e708926d35190
> 93282a6cdf/

I was not able to reproduce that one and from build log I may assume
build process was terminated from outside ("ld terminated with signal 6
[Aborted]"). Is there a chance that build server was shut down or
something?
--------------------->8--------------------
libtool: link: /home/peko/autobuild/instance-0/output/host/usr/bin/arc
-buildroot-linux-uclibc-gcc -shared  .libs/dis-buf.o
.libs/disassemble.o .libs/dis-init.o .libs/arc-asm.o .libs/arcompact
-dis.o .libs/arc-ext.o .libs/arc-desc.o .libs/arc-dis-old.o .libs/arc
-dis.o .libs/arc-ibld.o .libs/arc-opc-old.o .libs/arc-opc.o .libs/arc
-opinst.o .libs/cgen-opc.o .libs/cgen-asm.o .libs/cgen-dis.o .libs/cgen
-bitset.o   -L/home/peko/autobuild/instance-0/output/build/binutils-arc
-2015.06-rc1/opcodes/../libiberty/pic -liberty  -matomic 
-Wl,/home/peko/autobuild/instance-0/output/build/binutils-arc-2015.06
-rc1/opcodes/../bfd/.libs/libbfd.so -Wl,-lc -Wl,--as-needed -Wl,-lm 
-Wl,--no-as-needed   -Wl,-soname -Wl,libopcodes-2.23.2.so -o
.libs/libopcodes-2.23.2.so
collect2: error: ld terminated with signal 6 [Aborted]
make[5]: *** [libopcodes.la] Error 1
--------------------->8--------------------

>          arc |                  empty-0.6.19b | NOK | 
> http://autobuild.buildroot.net/results/53db871fe076ad96cdb7aecd3930a8
> 6092b9833f/
>          arc |                  empty-0.6.19b | NOK | http://autobuil
> d.buildroot.net/results/943876e5c65707de11cc5890f1ef62537b92b631/

--------------------->8--------------------
empty.c: In function 'main':
empty.c:202:14: error: storage size of 'semu' isn't known
  union semun semu;
              ^
--------------------->8--------------------

This is because toolchain was built without threads and in case of
uClibc that lead to __UCLIBC_HAS_THREADS__ being undefined, which in
its turn undefines _POSIX_SEMAPHORES which is used in "empty.c":
--------------------->8--------------------
/* semaphores */
#ifdef _POSIX_SEMAPHORES
	#if defined(__linux__) && defined(__GNU_LIBRARY__) &&
!defined(_SEM_SEMUN_UNDEFINED)
		/* union semun is defined by including <sys/sem.h> */
	#else
		union semun {
			int val;
			struct semid_ds *buf;
		#ifdef __SVR4
			ushort_t	*array;
		#endif
		#ifdef __hpux__
			ushort		*array;
		#endif
		#ifdef __linux__
			unsigned short *array;
			struct seminfo *__buf;		/* buffer for
IPC_INFO */
		#endif
		};
  	#endif
#endif
	union semun semu;
--------------------->8--------------------

I'm not quite sure what's the correct solution here. Probably we may
just remove "#ifdef _POSIX_SEMAPHORES". That allowed me to compile that
package.

Any thoughts?

>          arc |                    eudev-3.1.1 | NOK | 
> http://autobuild.buildroot.net/results/76ea39dfd70329e2da1e8dcc288f2e
> b3f6715b7b/

--------------------->8--------------------
/home/buildroot/build/instance-0/output/build/eudev
-3.1.1/src/shared/util.c:84: undefined reference to '.tdata'
--------------------->8--------------------

Looks like an issue in our tools, filed internal STAR 9000922620
against it.

>          arc |                  lvm2-2.02.121 | NOK | 
> http://autobuild.buildroot.net/results/0fbf372e874e41162f5d6dc6974478
> 46b51c26c1/

Fixed with http://git.buildroot.net/buildroot/commit/?id=5c51fed1ff2e7a
b66900fa26732ea63dbf148462

>          arc |                    tor-0.2.6.9 | NOK | 
> http://autobuild.buildroot.net/results/ea08eeae05f79598809692a4f9a4ec
> fdd64a63af/

Fixed with http://git.buildroot.net/buildroot/commit/package/tor?id=495
65a282ad6a9f6f04a184407ce04f9c4772e9c

But with mentioned patch I see another build failure:
--------------------->8--------------------
src/common/address.c: In function 'tor_addr_parse_PTR_name':
src/common/address.c:502:5: error: 'for' loop initial declarations are
only allowed in C99 mode
     for (int i = 0; i < 16; ++i) {
     ^
src/common/address.c:502:5: note: use option -std=c99 or -std=gnu99 to
compile your code
--------------------->8--------------------

Fixed with http://git.buildroot.net/buildroot/commit/?id=5cf5b390385fb6
325485e37dc9d38e1e3ac1f091

>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/ff2144e21abb048b0c86ac382b0883
> 0b96999122/

Known "cfi row mismatch [-Werror]". Will be fixed in RC2.

-Alexey
