From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jun 2015 11:17:57 +0200
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <CAHkwnC_J+7jXL7RT=7-HDhg3S-0ketM3p4VZs9cC0BUA6_qNpg@mail.gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150612221456.44a97ad5@free-electrons.com>
 <CAHkwnC_J+7jXL7RT=7-HDhg3S-0ketM3p4VZs9cC0BUA6_qNpg@mail.gmail.com>
Message-ID: <20150615111757.03ec0b48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon, 15 Jun 2015 11:06:40 +0200, Fabio Porcedda wrote:

> > I am not entirely happy with this solution, for the following reasons:
> >
> >  * We no longer have a single staging directory that has all the
> >    libraries installed. This is needed for the toolchain to be a
> >    proper SDK usable by application developers outside of Buildroot.
> >
> >    To solve this, either we install everything to both the real
> >    STAGING_DIR and a per-package staging directory, or we create a
> >    final build step that consolidates all the per-package staging
> >    directories into a global one. The advantage of this second option
> >    is that we don't have any parallel installation going on in the
> >    global staging directory.
> 
> I personally prefer too the second solution.

Ok.

> >  * I am not super happy with the idea of having the toolchain sysroot
> >    left in the global staging directory and referenced by the compiler
> >    --sysroot option on one side, and all other libraries found by
> >    using -L, -I and pkg-config tricks.
> >
> >    I would actually prefer if a real complete sysroot was used when
> >    building each package, and the compiler --sysroot option used to
> >    adjust the compiler sysroot. This has however one significant
> >    drawback: the toolchain sysroot must be copied for each and every
> >    package, which can become quite time and space consuming. So on
> >    this aspect, I'd like to have some input from other Buildroot
> >    developers.
> 
> I've already rewritten the patch set using the --sysroot option in the
> toolchain wrapper. I just need to clean it up and send it, i hope to
> be able to send it tomorrow so we can choose the best solution for
> buildroot.

Good. We'll see how it looks. So now the per-package sysroot also
contains the C library and kernel headers as well? It's really a
complete sysroot?

> >  * Your patch uses $($(2)_ADD_TOOLCHAIN_DEPENDENCY) to decide whether
> >    the per-package sysroot mechanism must be used or not. Which means
> >    it will only be used for target packages, and not for host
> >    packages. However, I'm wondering if we should not also apply the
> >    principle to host packages: to get reproducible builds, I believe
> >    we should also have separate sysroots when building host
> >    packages. Opinions from other Buildroot developers?
> >
> >  * Your approach only takes care of make the sysroot handled in a
> >    per-package fashion. But what about HOST_DIR ? We could have the
> >    same inconsistencies as the ones we discussed about STAGING_DIR, but
> >    this time caused by the presence/absence of host utilities. One
> >    build may give a given result because host tool "foo" is present (it
> >    happened to be built before), and the next build may give a
> >    different result because host tool "foo" is absent (it's going to be
> >    build after).
> 
> You are right, but if possible i just want to handle the host
> utilities matter as a next step after this step is done.

I'm indeed fine with solving this part as a next step, however, I'd
like to at least have some basic ideas of how it will be solved, to see
the big picture and see if solving the big picture is doable.

Also, and while this is definitely reaching much further than doing
top-level parallel build, I'm wondering if we shouldn't do the
Buildroot builds within a well-controlled chroot. This would allow us
to control the host environment, and ultimately cache the build results
and re-use them across builds. This is clearly not simple, as we need
to capture all the dependencies that have been built, their version,
their configuration, etc. I have no idea if it is reasonable to do that
in Buildroot, or if it is really too complicated to be compatible with
the "keep it simple" principle of Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
