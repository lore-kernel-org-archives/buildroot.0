From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 07 Jun 2017 09:08:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-06-05
In-Reply-To: <87y3t4c1gw.fsf@dell.be.48ers.dk>
References: <20170606063119.BBACB21D14@mail.free-electrons.com>
 <1496776591.3962.3.camel@embedded.rocks> <87y3t4c1gw.fsf@dell.be.48ers.dk>
Message-ID: <1496819294.26252.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, 2017-06-06 at 22:20 +0200, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
>  > On Tue, 2017-06-06 at 08:31 +0200, Thomas Petazzoni wrote:
>  >> Hello,
> 
>  > Build statistics for 2017-06-05
>  > ================================
> 
>  >      powerpc |                libupnpp-0.15.2 | NOK | http://autob
> uild.buildroot.net/results/0bf84f61a72a65a75c5fd0a787680f483cfead26
> |     
>  >      powerpc |                libupnpp-0.15.2 | NOK | http://autob
> uild.buildroot.net/results/2569d7b5049d0bd1da8316d8ac5997d4e68c08ae
> |     
>  >      powerpc |                libupnpp-0.15.2 | NOK | http://autob
> uild.buildroot.net/results/ff512f5532011a513b5551428152e600b04a007d
> |     
> 
>  > """
>  > error: 'yield' is not a member of 'std::this_thread'
>  > """
> 
>  > Before version 0.15.2 libupnpp used sched_yield() which was
> replaced by
>  > std::this_thread::yield(). Looking at the thread header file for
> the
>  > PowerPC toolchain shows that yield() is only enabled if
>  > `_GLIBCXX_USE_SCHED_YIELD` is defined. This macro is only defined
> if
>  > GCC was built with `--enable-libstdcxx-time`. For GCC 4.7 and
> below
>  > this option defaults to no, which means sched_yield() is not
> enabled
>  > though it is available.
> 
>  > """
>  > #ifdef _GLIBCXX_USE_SCHED_YIELD
>  >     /// yield
>  >     inline void
>  >     yield() noexcept
>  >     { __gthread_yield(); }
>  > #endif
>  > """
> 
>  > """
>  > static inline int
>  > __gthread_yield (void)
>  > {
>  >   return __gthrw_(sched_yield) ();
>  > }
>  > """
> 
>  > This issue was discussed on stackoverflow [1]. The issue is
> resolved in
>  > GCC 4.9 which automatically enables sched_yield() on platforms
> that are
>  > known to support them.
> 
>  > Therefore, I would suggest to add a dependency on GCC 4.9 for this
>  > package.
> 
> Thanks for investigating and sounds sensible to me. Will you send a
> patch?

Yes, I will!

J?rg
