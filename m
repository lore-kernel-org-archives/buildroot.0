From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 10 Oct 2018 09:02:02 +0200
Subject: [Buildroot] [PATCH v2] poco: disable fpenvironment for MIPS
 without FPU
In-Reply-To: <20181010084502.04f1cf7e@windsurf>
References: <20181009132152.24383-1-yegorslists@googlemail.com>
 <51cdb909-89fd-6832-0988-f29ab95dbf74@mind.be>
 <20181010084502.04f1cf7e@windsurf>
Message-ID: <CAGm1_kuA7Pp7gKP+1O_K0enyAf=OTFdcK-rhvTOrJYqiUMeWFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 10, 2018 at 8:45 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 9 Oct 2018 22:13:10 +0200, Arnout Vandecappelle wrote:
>
> >  The commit message is still very vague. I think I understand it though,
> > something like:
>
> Yes, I agree the commit log was still too vague.
>
> > > +# MIPS without FPU
> > > +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el):$(BR2_MIPS_SOFT_FLOAT),y:y)
> >
> >  BR2_MIPS_SOFT_FLOAT is only defined on MIPS, so it is sufficient to do
> >
> > ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
> >
> >  However, since this is about a glibc bug, shouldn't it check for a glibc
> > toolchain as well?
>
> Isn't the glibc bug that it allowed to use fpenv in situations where it
> shouldn't have allowed it ? If that's the case, perhaps the other
> libcs didn't had this bug, and fpenv really shouldn't be used with MIPS
> soft-float, regardless of the C library in use ?

I've made a compile test with musl and it fails too. So I'll just
disable fpenv if BR2_MIPS_SOFT_FLOAT is selected. So ne need to
mention glibc.

Strange, that it didn't show up in the build tests ...

Yegor
