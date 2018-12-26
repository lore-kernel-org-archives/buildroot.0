From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 14:30:03 +0100
Subject: [Buildroot] [EXT] Re: [PATCH] boot/mv-ddr-marvell: support
 custom GIT settings
In-Reply-To: <20181226112502.GE14286@scaer>
References: <20181224131814.20804-1-kostap@marvell.com>
 <20181224185742.GF2703@scaer>
 <SN2PR18MB07361F184E2286FF9C3EB1B0CAB40@SN2PR18MB0736.namprd18.prod.outlook.com>
 <20181226113153.696dc370@windsurf.home>
 <SN2PR18MB0736CDC273B172000ABF67B7CAB50@SN2PR18MB0736.namprd18.prod.outlook.com>
 <20181226112502.GE14286@scaer>
Message-ID: <20181226143003.551c63b5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 12:25:02 +0100, Yann E. MORIN wrote:

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
>         ${CI_JOB_NAME_UPPER}_OVERRIDE_SRCDIR = /path/to/temp/git/clone/${CI_JOB_NAME}

Not ${CI_JOB_NAME_UPPER}_OVERRIDE_SRCDIR, but <pkg>_OVERRIDE_SRCDIR.

> As you also said eralier, you plan on using Buildroot as your "SDK" (not
> sure I grok all you said).

Marvell doesn't use the term "SDK" in the same sense as we do in the
upstream Buildroot:

 - In upstream Buildroot, what we call the "SDK" is what is generated
   by "make sdk", i.e the cross-compilation toolchain + all the
   libraries and headers that are needed to build code for the target,
   matching a given Buildroot configuration.

 - In Marvell-speak, the "SDK" is basically an entire build system +
   set of source code tarballs that will allow you to build a Linux
   system for your target. Basically, Marvell SDK is a customized
   Buildroot + external trees + source code tarballs.


> This is a kind of justification that would make us accept a version
> choice, though. If there are reasons that people have to have a local
> modified tree because they are porting it to their own devices, then it
> makes sense we allow them to use a custom git tree, as Thomas said.
> 
> So, before reposting a new version:
> 
>   - I'd like Thomas to confirm we want to use a choice, like for the
>     others where we allow using a custom VCS tree,

I'm still unsure whether people making custom Marvell boards generally
need to change mv-ddr-marvell code. However, it is true that the
mv-ddr-marvell code version needs to be in sync with the ATF version in
use (last time I updated the Macchiatobin defconfigs in upstream
Buildroot, I had to update both ATF and mv-ddr-marvell at the same
time). It is also highly HW-related low-level code, so I think it is OK
to have a version selection.

>   - update your commit log to use the per-device customisation
>     requirement as a justification for this change, not the CI
>     testing. ;-)
> 
> Thomas, is that OK with you, in the end?

Yes, provided the code is changed to use a version selection more
similar to what we use in other packages *and* the commit log is
adjusted, I'm fine with merging something like this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
