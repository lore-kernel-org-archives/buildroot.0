From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 17:43:56 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-06-28
In-Reply-To: <1436194278.3246.42.camel@synopsys.com>
References: <20150629063017.4326F10013E@stock.ovh.net>
 <1436194278.3246.42.camel@synopsys.com>
Message-ID: <20150706174356.6d6471c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

I don't know if your mailer allows that, but if you could avoid
wrapping the text you are replying to, it would be great. Because
you're wrapping the quoted text, all URLs to build reports are broken.

On Mon, 6 Jul 2015 14:51:18 +0000, Alexey Brodkin wrote:


> >          arc |              berkeleydb-5.3.28 | NOK | http://autobuil
> > d.buildroot.net/results/717f3b37600a56262badc6f7cb64d7949fdacb67/
> >          arc |              berkeleydb-5.3.28 | NOK | 
> > http://autobuild.buildroot.net/results/80ebf0382992b277fd94743815bbf0
> > c7426a3654/

[...]

> Fixed with http://patchwork.ozlabs.org/patch/491656/

ACK, applied.

> >          arc |       binutils-arc-2015.06-rc1 | NOK | 
> > http://autobuild.buildroot.net/results/53d333850a82f71c4e708926d35190
> > 93282a6cdf/
> 
> I was not able to reproduce that one and from build log I may assume
> build process was terminated from outside ("ld terminated with signal 6
> [Aborted]"). Is there a chance that build server was shut down or
> something?

Probably not: that build server has an uptime of 215 days. And if a
sudden shutdown happens, the build result is simply lost and never
reported.

However, this machine does have quite a few scary messages in "dmesg",
so if the problem hasn't reproduced another time, I'd say just forget
about it.

> >          arc |                  empty-0.6.19b | NOK | 
> > http://autobuild.buildroot.net/results/53db871fe076ad96cdb7aecd3930a8
> > 6092b9833f/
> >          arc |                  empty-0.6.19b | NOK | http://autobuil
> > d.buildroot.net/results/943876e5c65707de11cc5890f1ef62537b92b631/
> 
> --------------------->8--------------------
> empty.c: In function 'main':
> empty.c:202:14: error: storage size of 'semu' isn't known
>   union semun semu;
>               ^
> --------------------->8--------------------
> 
> This is because toolchain was built without threads and in case of
> uClibc that lead to __UCLIBC_HAS_THREADS__ being undefined, which in
> its turn undefines _POSIX_SEMAPHORES which is used in "empty.c":
> --------------------->8--------------------
> /* semaphores */
> #ifdef _POSIX_SEMAPHORES
> 	#if defined(__linux__) && defined(__GNU_LIBRARY__) &&
> !defined(_SEM_SEMUN_UNDEFINED)
> 		/* union semun is defined by including <sys/sem.h> */
> 	#else
> 		union semun {
> 			int val;
> 			struct semid_ds *buf;
> 		#ifdef __SVR4
> 			ushort_t	*array;
> 		#endif
> 		#ifdef __hpux__
> 			ushort		*array;
> 		#endif
> 		#ifdef __linux__
> 			unsigned short *array;
> 			struct seminfo *__buf;		/* buffer for
> IPC_INFO */
> 		#endif
> 		};
>   	#endif
> #endif
> 	union semun semu;
> --------------------->8--------------------
> 
> I'm not quite sure what's the correct solution here. Probably we may
> just remove "#ifdef _POSIX_SEMAPHORES". That allowed me to compile that
> package.
> 
> Any thoughts?

You could make the package just depend on thread support. *But* it does
build fine with the toolchain at
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config.
So it is a little bit weird.

Can you investigate by testing with this prebuilt ARM nothread
toolchain?

Thanks for the analysis of all those ARC build reports!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
