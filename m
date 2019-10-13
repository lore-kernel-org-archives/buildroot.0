From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Oct 2019 09:00:48 +0200
Subject: [Buildroot] [PATCH v4 2/2] support/dependencies: set cmake
 version min to 3.10
In-Reply-To: <CADvTj4ovF-z_ZMe-1m_ek2WhWMq_HsdgftdqYW6rVe3aGXnJaQ@mail.gmail.com>
References: <20191012152643.67744-1-james.hilliard1@gmail.com>
 <20191012152643.67744-2-james.hilliard1@gmail.com>
 <20191012165207.GA14656@scaer>
 <CADvTj4r-Z3U6cru8wy3APa=qdxFOxnkU979FM2GtV73r0FxoCQ@mail.gmail.com>
 <20191012181643.GB14656@scaer>
 <CADvTj4ovF-z_ZMe-1m_ek2WhWMq_HsdgftdqYW6rVe3aGXnJaQ@mail.gmail.com>
Message-ID: <20191013070048.GC14656@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2019-10-12 21:15 +0200, James Hilliard spake thusly:
> On Sat, Oct 12, 2019 at 8:16 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2019-10-12 19:18 +0200, James Hilliard spake thusly:
> > > > > +ifeq ($(BR2_HOST_GCC_AT_LEAST_4_8),y)
> > > > > +BR2_CMAKE_VERSION_MIN = 3.10
> > > > > +else
> > > > >  BR2_CMAKE_VERSION_MIN = 3.8
> > > > > +endif
[--SNIP--]
> > Sorry, but maybe I am missing on something here. The problem is not that
> > host-cmake-3.15 is built only with BR2_HOST_GCC_AT_LEAST_4_8.
> >
> > The problem is the following:
> >
> > 1. the host machine does not have cmake installed, so we have to build
> >     our own. With your two patches, we will build host-cmake-3.15. But
> >     that requires a host that has gcc >= 4.8, which we currently do not
> >     require.
> >
> >     So, with your two patches, it means that *all* our cmake-based
> >     packages will have to depend on BR2_HOST_GCC_AT_LEAST_4_8. This is
> >     not acceptable.
> It should build host-cmake-3.15 only if we have BR2_HOST_GCC_AT_LEAST_4_8,
> otherwise we build host-cmake-3.8 as the fallback, this avoids
> requiring all cmake
> packages depending on BR2_HOST_GCC_AT_LEAST_4_8.

Ah, you also made the version bump comnditional too. That is not good at
all either (see below).

> > 2. The host has a cmake < 3.10. We are back in the situation above,
> >     where we will have to build our own host-cmake-3.15, and we still
> >     have the same issue. This is still not accpetable.
> All cmake packages that require cmake >=3.10 already depend on
> BR2_HOST_GCC_AT_LEAST_4_8 so at least this isn't an immediate issue.

They do so because they need it for themselves already, no?

> > 3. The host has cmake >= 3.10 installed, then we don't care.
> >
> > So, in conclusion, the conditional version in this patch is useless,
> > since it always implies we need to build cmake 3.15.
> The purpose of the conditional version is so that we fallback to 3.8 if we can't
> build the newer version.

I hadn't noticed the condition around the version bump. This is not
nice, because if the host compiler is too old, you even restrict the
version we will build for the target too, even though the cross compiler
would be apt.

> > So, no, history has taught us that major version bumps are not simple,
> > and especially here, sine we'd got from 3.8 to 3.15, which is not a bump,
> > not even a leap, but a really long jump...
> Well my assumption is mostly since we only build cmake in buildroot if
> it's older
> than 3.8 this already should be tested due to many cmake versions on the
> build system right?

Sorry, I did not understand what you meant here...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
