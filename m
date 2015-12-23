From: Paul Enman <paul.enman@gmail.com>
Date: Wed, 23 Dec 2015 10:16:52 -0600
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable compile in thumb
 mode configuration option
In-Reply-To: <20151215230351.5dc6e91d@free-electrons.com>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
 <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
 <20151215230351.5dc6e91d@free-electrons.com>
Message-ID: <CAEp4hJ3RWcyOxFk9FD33HquYM-MTqOQWPrNEdk1uazT3e5vL0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

On Tue, Dec 15, 2015 at 4:03 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Paul,
>
> On Sun, 13 Dec 2015 19:28:40 -0600, Paul Enman wrote:
> > From: penman <paul.enman@gmail.com>
>
> This is still not good, it should be your full name here as well.
>
Ok


>
> >
> > Signed-off-by: Paul Enman <paul.enman@gmail.com>
> > ---
> >
> > When buildroot is configured to build uClibc with thumb, it uses a
> workaround
> >  for that relies on interworking between arm and thumb instructions and
> does
> >  not set the config file to enable compile in thumb mode.
> >
> > This patch enables buildroot to configure and compile uClibc in thumb
> mode.
>
> Why do you put all these explanations after the "---" sign? They should
> really be part of the commit log.
>

The docs/manual/contribute.txt, Line 252 indicate this; I'll add to the
commit log.


>
> >
> >  arch/Config.in.arm       | 18 +++++++++---------
> >  package/uclibc/uclibc.mk | 12 ++++++++++++
> >  2 files changed, 21 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> > index 67ff384..2d318f2 100644
> > --- a/arch/Config.in.arm
> > +++ b/arch/Config.in.arm
> > @@ -374,6 +374,15 @@ config BR2_ARM_INSTRUCTIONS_ARM
> >         This option instructs the compiler to generate regular ARM
> >         instructions, that are all 32 bits wide.
> >
> > +config BR2_ARM_INSTRUCTIONS_THUMB2
> > +     bool "Thumb2"
> > +     depends on BR2_ARM_CPU_HAS_THUMB2
> > +     help
> > +       This option instructions the compiler to generate Thumb2
> > +       instructions, which allows to mix 16 bits instructions and
> > +       32 bits instructions. This generally provides a much smaller
> > +       compiled binary size.
> > +
> >  config BR2_ARM_INSTRUCTIONS_THUMB
> >       bool "Thumb"
> >       depends on BR2_ARM_CPU_HAS_THUMB
> > @@ -389,15 +398,6 @@ comment "Thumb1 is not compatible with VFP"
> >       depends on BR2_ARM_CPU_HAS_THUMB
> >       depends on !BR2_ARM_SOFT_FLOAT
> >
> > -config BR2_ARM_INSTRUCTIONS_THUMB2
> > -     bool "Thumb2"
> > -     depends on BR2_ARM_CPU_HAS_THUMB2
> > -     help
> > -       This option instructions the compiler to generate Thumb2
> > -       instructions, which allows to mix 16 bits instructions and
> > -       32 bits instructions. This generally provides a much smaller
> > -       compiled binary size.
>
> I don't understand why you are re-ordering the options here. Why are
> you doing this?
>

I observed the default order of precedence for targets that support both
Thumb and Thumb2 (currently only Cortex-M3) is to default to Thumb(1), by
reordering, the default order would be ARM->Thumb2->Thumb as available.
This reordering is not necessary.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151223/bd849ee7/attachment.html>
