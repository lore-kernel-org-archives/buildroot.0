From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 19 Feb 2014 15:19:52 +0100
Subject: [Buildroot] [PATCH v2 1/1] manual: add virtual package tutorial.
In-Reply-To: <CAHXCMMJuED9xj9wVS0d0d+USa=-7_MdD6ZwoKQNj3zyg2+1vpQ@mail.gmail.com>
References: <1392390673-30343-1-git-send-email-eric.le.bihan.dev@free.fr>
 <CAHXCMMJuED9xj9wVS0d0d+USa=-7_MdD6ZwoKQNj3zyg2+1vpQ@mail.gmail.com>
Message-ID: <20140219141950.GA25812@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Tue, Feb 18, 2014 at 09:34:41PM +0100, Samuel Martin wrote:
[...]
> > +[[virtual-package-tutorial]]
> > +How to add a virtual package
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +In Buildroot, a virtual package is a package whose functionalities are
> > +provided by one or more packages, referred to as 'providers'.
> > +
> > +For example, 'OpenGL ES' is an API for 2D and 3D graphics on embedded systems.
> > +The implementation of this API is different for the 'Allwinner Tech Sunxi' and
> > +the 'Texas Instruments OMAP35xx' plaftorms. So +libgles+ will be a virtual
> > +package and +sunxi-mali+ and +ti-gfx+ will be the providers.
>
> The generic way of presenting the virtual/provider "infra" in Buildroot is:
> we want to use the virtual/provider infrastructure when there is one
> API, but several packages implementing this API, so we want an
> extensible mechanism allowing to choose what implementation we want in
> the target rootfs.
I will update the text in order to put emphasis on this idea.

> > +07: FOO_SOURCE =
> > +08: FOO_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_FOO))
> > +09:
> > +10: ifeq ($(FOO_DEPENDENCIES),)
> > +11: define FOO_CONFIGURE_CMDS
> > +12:    $(error No Foo implementation selected. Configuration error)
> > +13:    exit 1
>
> I think the "exit 1" here is not needed, "$(error ...)" will stop make anyway.
> Someone can confirm?
I performed a stupid substitution, which ended up with a mash-up of shell
script and make control functions (D'Oh!). $(error ...) will indeed stop, so
the exit is not needed.

But, following suggestions from ThomasP, I chose a pure 'make' version, which
gets rid of <foo>_CONFIGURE_CMDS:

  ifeq ($(BR2_PACKAGE_HAS_FOO),y)
  ifeq ($(FOO_DEPENDENCIES),)
  $(error No foo implementation selected. Configuration error.)
  endif
  endif

With this method, the user gets the error message earlier, with less cruft.
I will provide a patch to update all the virtual packages.

[...]
> > +No modifications to +package/libbaz/libbaz.mk+ are required.
>
> I would move this line at the beginning of the "Provider" section,
> telling that (and emphasizing that) only the Config.in of the provider
> needs  few changes, the *.mk follows the buildroot infrastructure with
> no change at all.
Good idea.

Thanks for your comments!

Best regards,
ELB
