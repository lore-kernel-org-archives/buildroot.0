From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Mon, 8 Aug 2011 16:46:18 -0400
Subject: [Buildroot] e500v2 SPE toolchain tuple confuses BR
Message-ID: <CAAa76NTTmdsj_gAofPUyMheShbakm-diO4mK2PAenE=LMYbYsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN <yann.morin.1998@...> writes:

>
> Dwayne, All,
>
> On Saturday 30 April 2011 00:16:52 Dwayne Fontenot <dwayne.fontenot@...> wrote:
> > I'm having an issue with buildroot (git HEAD as of 20110428) and a powerpc
> > e500v2 toolchain built using the BR crosstool-ng integration.
> >
> > The built toolchain has a prefix of powerpc-unknown-linux-gnuspe- yet BR
> > assumes it is powerpc-unknown-linux-gnu-
>
> I've add an idea about this. It all boils down to buildroot computing
> its own tuple, when it should delegate that to the backend responsible
> for building the toolchain.
>
> Indeed, even with a purely external toolchain (ge it from CodeSourcey,
> built with crosstool-NG, or any other kind), the tuple can have specifics
> that buildroot has no idea about.
>
> In this case, buildroot has no knowledge of the ABI in use by the toolchain
> (here the SPE ABI). For ARM, buildroot handles the EABI stuff, but that's
> a side effect of buildroot having an internal backend that handles ARM EABI.
>
> So, what I would suggest is that computing the tuple be the responsibility
> of the toolchain backend.
>
> For the internal backend, I would be a matter of moving the code along,
> out from the package infrastructure. Probably nothing very complex...
>
> For the crosstool-NG backend, that should be fairly trivial; there is
> provision for this on crostool-NG, just call ct-ng show-tuple, et voila!
>
> For the external backend, it should not much more complex. gcc is able
> to dump the tuple for which it has been built, just call gcc -dumpmachine
>
> Of course, a quick hack to add PPC SPE would be fairly trivial as well,
> but it would not scale, doing work that should not ever be done at all.
>
> Regards,
> Yann E. MORIN.
>

I am using the latest daily snapshots at 08/08/2011 and this problem is still
there. I actually use crosstool-ng as the tool chain builder (well, inside the
buildroot though). The somehow in output/host/usr/bin there are some shortcuts
named powerpc-linux-* which link to powerpc-unknow-linux-gnuspe-*. But, when BR
try to build other packages, for instance, gdb in target, it try to use
powerpc-unknown-linux-gnu-*, which of cause doesn't exist. If I manually rename
the shortcuts to match the name (powerpc-unknown-linux-gnu-*), BR will
works fine.
My questions is: Is there any solution for this issue? at least for
crosstools-ng if not all the external tool chain?
thanks,
Raymond
