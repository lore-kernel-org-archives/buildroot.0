From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Mar 2019 21:48:42 +0100
Subject: [Buildroot] [PATCH v10 1/6] binutils: install libiberty for
 host build
In-Reply-To: <ab8fc5b3-e0b7-6594-cf7f-dd03ae8de643@mind.be>
References: <20190206091531.104591-1-aduskett@gmail.com>
 <20190318220340.GK14237@scaer>
 <ab8fc5b3-e0b7-6594-cf7f-dd03ae8de643@mind.be>
Message-ID: <20190319204842.GE2702@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-19 19:08 +0100, Arnout Vandecappelle spake thusly:
> On 18/03/2019 23:03, Yann E. MORIN wrote:
> > First, with this very patch: it breaks hiost-gdb, which fails to build
> > because there is an inconsistency with how ti tries to link with
> > libiberty:
> > 
> >     http://autobuild.buildroot.org/results/109/1098d6380f12f5bbd6dbc69edb06bd953d1edc3d/build-end.log
> > 
> >     /usr/bin/ld: /home/buildroot/autobuild/instance-0/output/host/lib/libiberty.a(cplus-dem.o):
> >     relocation R_X86_64_PC32 against symbol `_sch_istable' can not be used when making a shared object; recompile with -fPIC
> >     /usr/bin/ld: final link failed: Bad value
> 
>  Maybe this is due to building host-binutils with --disable-shared
> --enable-static? Maybe the solution is to just add --enable-shared, i.e. build
> both shared and static?
> 
>  That does mean that ld etc. may now link dynamically with the various
> libraries, but host tools should now be relocatable thinks to our rpath fixup,
> so that shouldn't be a problem.

Except wqe can't use binutils when we use an external toolchain, at
least not in the current state anyway.

So we have to find an anleternative.

I was thinking of two solutions:

  - change the existing host-binutils package to only install libiberty
    (and maybe a few others?) when using an external toolchain, or

  - introduce a new virtual package, host-binutils-libs, which package
    would select when they need binutils libs; that virtual package
    would then depend on host-binutils for the internal toolchain, or
    would depend on host-bnutils-libs-for-real-this-time that just
    builds the libs.

TBH, I'm more inclined to look at the first solution, but it may make
the package less maintainable over time. The second solution is maybe
cleaner, but as you can seee, finding good neams is still not trivial.

Finally, maybe we can find a middles ground, with host-binutils-libs a
real package for external toolchains, and an empty package that just
depends on binutils for internal toolchains.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
