From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 May 2017 09:03:49 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-18
In-Reply-To: <20170519203958.GA3259@scaer>
References: <20170519063157.2654320766@mail.free-electrons.com>
 <20170519214454.08c259df@free-electrons.com>
 <20170519203958.GA3259@scaer>
Message-ID: <20170520090349.3491d95a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 May 2017 22:39:58 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
Hello Yann,

> Thomas, Peter (S), All,
> 
> On 2017-05-19 21:44 +0200, Thomas Petazzoni spake thusly:
> > >        sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/995656a6f9fff594af6b10297253788683a0098f |     
> > This would be fixed by:
> >   https://patchwork.ozlabs.org/patch/763762/
> >   https://patchwork.ozlabs.org/patch/763763/
> > I was hoping to get some review/feedback from Peter Seiderer on this.
> > Peter, could you have a look?
> 
> I am afraid that I may have to withdraw my patches.
> 
> I was looking again at this build failure, and we can see that, prior to
> checking for atomicfptr, it already tests for libatomic:
> 
>     Checking for 64 bit atomics... 
>     [...]
>     > atomic64.cpp:(.text+0x28): undefined reference to `__atomic_exchange_8'
>     > atomic64.cpp:(.text+0x48): undefined reference to `__atomic_compare_exchange_8'
>     [...]
>     test config.corelib.tests.atomic64 FAILED
>     Checking for 64 bit atomics in libatomic... 
>     [...]
>     [...]/sparc-linux-g++ [...] -Wl,-O1 -o atomic64 atomic64.o -lrt -lpthread -ldl -latomic
>      => source accepted.
>     test config.corelib.libraries.libatomic succeeded
> 
> But then it forgets to link with it when it looks for atomicfptr:
> 
>     [...]/sparc-linux-g++ [...] -Wl,-O1 -o atomicfptr atomicfptr.o -lrt -lpthread -ldl
>     > atomicfptr.o: In function `test(std::atomic<void (*)(int)> volatile&)':
>     > atomicfptr.cpp:(.text+0x4c): undefined reference to `__atomic_compare_exchange_4'
> 
> So, in my opinion, the real and correct fix would be to have the
> atomicfptr test actually use the result of the previous libatomic test.
> 

Yes, this would be the 'perfect' solution, but...

> I've had a (rather quick) look, and I have no idea on how to do this...
> Peter (Seiderer), we'd need some help on this...

Did play around a little bit hacking src/corelib/configure.json and
config.tests/common/atomicfptr/atomicfptr.pro but no success so far...

So I think your patches look like the best workaround so far...

Regards,
Peter

> 
> Regards,
> Yann E. MORIN.
> 
