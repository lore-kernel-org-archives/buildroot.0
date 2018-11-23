From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 22 Nov 2018 20:30:21 -0600
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <20181122171252.GN2601@scaer>
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
 <87y39lm6e8.fsf@dell.be.48ers.dk> <20181122174417.7e101a15@windsurf>
 <20181122171252.GN2601@scaer>
Message-ID: <CANQCQpYaqKY+tT6E8S0VHDKdGmiAg9nDg2N6oGk32kkcQz=dZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Thu, Nov 22, 2018 at 11:13 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Peter, Thomas, All,
>
> On 2018-11-22 17:44 +0100, Thomas Petazzoni spake thusly:
> > On Thu, 22 Nov 2018 17:19:43 +0100, Peter Korsgaard wrote:
> >
> > >  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > >  > Cc: Waldemar Brodkorb <wbx@openadk.org>
> > >  > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > >  > Cc: Peter Korsgaard <peter@korsgaard.com>
> > >
> > > So this has been broken since end of June? How come we don't have any
> > > autobuilder failures?
> >
> > Yes, this is really weird. Even with the issue fixed
> > https://git.buildroot.org/buildroot/commit/utils/genrandconfig?id=3eb49f59d6804c452e784759d9b3869215a8098f,
> > we should have had some systemd/uclibc configurations. I'll try to do
> > some research in the DB, but my SQL is rusty and gives requests that
> > are very slow to execute :/
>
> Yeah, that's strange... But it sure as hell does not build at all.
>
> Besides the prlimit() issue, it also unconditionally #include <gshadow.h>
> which does not exist in uclibc-ng either. That one has been fixed upstream
> now:
>     https://github.com/systemd/systemd/commit/66a5b5ce9b991327d594f7b635de16999ca54093
>
> (we don't need to backport it, now that we can't build on uClibc).
>
> I may be looking into making a workaround by providing a missing.h
> wrapper to prlimit() as they suggested, but that is definitely not
> release material for us.
>

It looks like the utils/genrandconfig is generating the right cfg
combinations for uclibc and systemd.  It did however look like the way
the random selection of init options +"BR2_STATIC_LIBS" selection
(systemd depends on !BR2_STATIC_LIBS),  may lower the number of builds
considerably.  (guessing ~0.15% chance of a build if my math is
correct --> 100% / 2 / 16 / 20)

    if randint(0, 1) == 0:
        configlines.append("BR2_INIT_BUSYBOX=y\n")
    elif randint(0, 15) == 0:
        configlines.append("BR2_INIT_SYSTEMD=y\n")
    elif randint(0, 10) == 0:
        configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
    if randint(0, 20) == 0:
        configlines.append("BR2_STATIC_LIBS=y\n")

Additionally, it looks like at least one (maybe more) of our prebuilt
uclibc toolchains don't include  BR2_USE_WCHAR which is required for
systemd.

Maybe we should move the conditionals for BR2_STATIC_LIBS and
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV inside the busybox condition.
Plus toolchain updates for BR2_USE_WCHAR (if that matters now that
uclibc is gone).....

Matt
