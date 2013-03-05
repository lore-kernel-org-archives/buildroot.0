From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Mar 2013 05:42:47 +0100
Subject: [Buildroot] [PATCH 2/2 V5] nodejs: new package
In-Reply-To: <CAKduhStxOLDPU_mMtiO1-gH2=DJgeyeO=CEEt6-2SXNsc1zxZQ@mail.gmail.com>
References: <1362102967-10236-1-git-send-email-daniel.price@gmail.com>
 <20130304221946.6c6d62cd@skate>
 <CAKduhStxOLDPU_mMtiO1-gH2=DJgeyeO=CEEt6-2SXNsc1zxZQ@mail.gmail.com>
Message-ID: <20130305054247.5f67d7bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Price,

On Mon, 4 Mar 2013 16:49:58 -0800, Daniel Price wrote:

> > In fact, using BR2_SOFT_FLOAT doesn't work very well: on ARM, with an
> > external toolchain, BR2_SOFT_FLOAT will always be 'y', and therefore,
> > when NodeJS is built with a hard-float toolchain like Linaro ARM
> > toolchains, it doesn't work at runtime.
> >
> > But that's not your fault, it's the Buildroot infrastructure that
> > doesn't handle this very well. So keep this as it is for now.
> 
> I will eventually be using an external toolchain (I think) for an
> Armada XP board... so I assume I'll want hard float there?  I'm happy
> to solve this some other way if there are any suggestions?
> 
> The other idea I had is to have a menuconfig item which just tells the
> user to specify what they want.  I thought that seemed bad, because I
> had a hard time understanding this setting, but maybe it's better
> since it would actually work?

I don't -yet- have a precise view on how to solve this. As you can see
in http://elinux.org/Buildroot:DeveloperDaysELCE2012, the topic of
floating point support has already been discussed in the past: 

  """
  FP stuff: we now have a single SOFT_FLOAT option, but actually
  there's a lot more variation: neon, vfpv3, softfp, .... To support
  this well, we can add a lot of extra config options to
  semi-automatically select the correct float options based on the
  subarchitecture. There is some cross-dependency with the external
  toolchains, but it's doable. There should still be an option to
  manually override the float options for exotic cases. ARM thumb adds
  another layer of complexity. Someone should take the lead on making
  this easier.
  """

So some work is needed to figure out the right way to handle this,
taking into account both the needs of internal/Crosstool-NG backends,
and the needs of the external backend.

> > When reviewing the previous version, I did suggest to use qstrip only
> > where needed, and to remove useless commas:
> >
> > NODEJS_MODULES_LIST = \
> >         $(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express) \
> >         $(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
> >         $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
> 
> I tried to clarify with the comment I added: the qstrip of everything
> is important when you mix in the shell.  Otherwise you wind up with
> something like:  if [[ -n "   " ]], and the -n test fails.  At least,
> that's what I saw.  That said, your other suggestion about using
> makefile defines should eliminate this problem, so I can switch over.

Aah, I see, ok. If it works with the make-based test on
NODEJS_MODULES_LIST rather than the shell-based test, then it would be
better.

> Thanks for your hard work in reviewing it, and making it easy for a
> new contributor.

Thanks to you! It's not common to see a new contributor going through 5
versions of a patch set and still being responsive and willing to fix
issues! :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
