From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Dec 2020 10:39:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/erlang-jiffy: needs -fPIC
In-Reply-To: <20201228225325.4f973ae1@windsurf.home>
References: <20201224101440.3427472-1-fontaine.fabrice@gmail.com>
 <20201228225325.4f973ae1@windsurf.home>
Message-ID: <CAPi7W81Un5M_bA7_EqbZeFPdiKKP7+v1pjzheAa-FKGVHvu3ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le lun. 28 d?c. 2020 ? 22:53, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Thu, 24 Dec 2020 11:14:40 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/9ac6e1bf9eaf922c0b7f869416ec33f40ed3543c
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Thanks for the patch. As usual, I'm kind of interested to understand
> since when this is happening, why suddenly we need a fix like this. Is
> this following a version bump of this package ?
>
> > +     {"(linux|solaris|freebsd|netbsd|openbsd|dragonfly|darwin|gnu)",
> > +-        "LDFLAGS", "$LDFLAGS $FLTO_FLAG -lstdc++"},
> > ++        "LDFLAGS", "$LDFLAGS $FLTO_FLAG -lstdc++ -fPIC"},
>
> It is surprising that only LDFLAGS need to be changed. Indeed, -fPIC is
> also needed at *compile* time when compiling each individual object
> file, so typically in CFLAGS/CXXFLAGS. Why isn't it needed in CXXFLAGS
> here ? Because it's already passed at compile time, but forgotten at
> link time ? Or because LDFLAGS are also used by rebar at compile time ?
This build failure is raised because of the -flto flag which is added
since version 1.0.0 and
https://github.com/davisp/jiffy/commit/feaf10f2d50e454f55a9d6b20c289031b0980503
It seems that -flto can't be used without -fPIC.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
