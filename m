From: Kostya Porotchkin <kostap@marvell.com>
Date: Wed, 26 Dec 2018 12:33:56 +0000
Subject: [Buildroot] [EXT] Re: [PATCH] boot/mv-ddr-marvell: support
 custom GIT settings
In-Reply-To: <20181226112502.GE14286@scaer>
References: <20181224131814.20804-1-kostap@marvell.com>
 <20181224185742.GF2703@scaer>
 <SN2PR18MB07361F184E2286FF9C3EB1B0CAB40@SN2PR18MB0736.namprd18.prod.outlook.com>
 <20181226113153.696dc370@windsurf.home>
 <SN2PR18MB0736CDC273B172000ABF67B7CAB50@SN2PR18MB0736.namprd18.prod.outlook.com>
 <20181226112502.GE14286@scaer>
Message-ID: <SN2PR18MB0736322D295DB7F9C1D8DA35CAB50@SN2PR18MB0736.namprd18.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@gmail.com> On Behalf Of Yann E.
> MORIN
> Sent: Wednesday, December 26, 2018 13:25
> To: Kostya Porotchkin <kostap@marvell.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>;
> buildroot at buildroot.org
> Subject: Re: [Buildroot] [EXT] Re: [PATCH] boot/mv-ddr-marvell: support
> custom GIT settings
> 
> Kostya, All,
> 
> Thomas, questions for you at the end. ;-)
> 
> On 2018-12-26 10:59 +0000, Kostya Porotchkin spake thusly:
> > > -----Original Message-----
> > > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > > Sent: Wednesday, December 26, 2018 12:32
> > > To: Kostya Porotchkin <kostap@marvell.com>
> > > Cc: Yann E. MORIN <yann.morin.1998@free.fr>; buildroot at buildroot.org
> > > Subject: Re: [Buildroot] [EXT] Re: [PATCH] boot/mv-ddr-marvell:
> > > support custom GIT settings
> > >
> > > Hello Kostya,
> > >
> > > On Tue, 25 Dec 2018 09:09:26 +0000, Kostya Porotchkin wrote:
> > >
> > > > > As I see you're an @marvell.com, do you need that to use an
> > > > > internal repository during development? If so, then why can't
> > > > > you just use the OVERRIDE_SRCDIR mechanism instead?
> > > > [KP] It is more than just a local repository. I have to allow CI
> > > > server to
> > > automatically build test and release images from the current
> > > internal GIT trees.
> > >
> > > Sorry, but this is not a valid justification. With this
> > > justification, we would have to add version selection to *all* Buildroot
> packages.
> > > Indeed, one might want to do CI testing on any random user-space
> > > library or application. So if your use-case for wanting version
> > > selection in mv-ddr- marvell is CI testing, then we won't accept this patch.
> > [KP] Understand. We can keep this change private if you think others will
> not benefit from it.
> 
> If one wants a CI job to test a specific commit of a package, then this CI job
> has to be able to update the .config file and/or the defconfig file to point to
> the new commit to test anyway, so this already means there is a bit of
> "scripting" around to prepare for the test.
> 
> What we recommend in this case, is that said "scripting":
> 
>   - does a git-clone (or whatvere VCS one is using) to a temporary
>     location (and since those CI jobs more often than not, use a
>     docker or docker-like container to run the job, this is by nature
>     ephemeral and temporary), e.g. something not unlike:
>         git clone ${CI_JOB_URL} /path/to/temp/git/clone/${CI_JOB_NAME}
> 
>   - create a local.mk file in the Buildroot build directory, that
>     contains the definition for a package override-srcdir, like:
>         ${CI_JOB_NAME_UPPER}_OVERRIDE_SRCDIR =
> /path/to/temp/git/clone/${CI_JOB_NAME}
> 
> Which is a generic way to tell buildroot to use a specific local tree.
> It is true that we usually advertise this override-srcdir mechanism for
> development purposes, but it is also applicable for the CI testing stuff as well.
> 
> As you also said eralier, you plan on using Buildroot as your "SDK" (not sure I
> grok all you said).
[KP] Our intension to add vendor-specific (non-mainlined) components as external packages, which will be based on buildroot build system.
At some moment they will be public, but will remain vendor-specific and maintained out of the buildroot tree.

> I thus understand that it will be public in the end, so when
> you actually release a version of your "SDK", it would point to a released and
> plublic commit of the official mv-dd-rmarvell git tree on Github, so that
> means at some point someone will internaly prepare that and submit a
> version update in Buildroot. ;-)
[KP] Actually I can already update the mv-ddr-marvell package version - we released the 18.12 drop to Guthub yesterday.
> 
> > > However, if people porting ATF/U-Boot to new Marvell-based platforms
> > > need to have their own custom version of mv-ddr-marvell, then having
> > > version selection can be accepted because it puts this package in
> > > the same situation as uboot, linux or atf, where we do offer version
> selection.
> > [KP] I am trying to find a reason for customer to use different mv-ddr
> releases.
> > It may happen if a customer wants to use older ATF base, for instance v1.3
> instead of v1.5 or v2.0.
> > In such case the DDR API in latest mv-ddr release will not be compatible
> with it and the build will fail.
> > Another reason is a customer willing to use latest fixes in mv-ddr GIT prior
> to the official release drop.
> > For instance, the new V7 Espressobin boards were released with DDR4
> chips, while our official SW only supported DDR3.
> > So the new board customers were forced to use outdated SW from vendor
> builds that supported such memory type.
> 
> This is a kind of justification that would make us accept a version choice,
> though. If there are reasons that people have to have a local modified tree
> because they are porting it to their own devices, then it makes sense we
> allow them to use a custom git tree, as Thomas said.
> 
> So, before reposting a new version:
> 
>   - I'd like Thomas to confirm we want to use a choice, like for the
>     others where we allow using a custom VCS tree,
> 
>   - update your commit log to use the per-device customisation
>     requirement as a justification for this change, not the CI
>     testing. ;-)
> 
> Thomas, is that OK with you, in the end?
> 
> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> | conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
