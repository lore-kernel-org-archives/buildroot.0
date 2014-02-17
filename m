From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 17 Feb 2014 15:33:13 +0100
Subject: [Buildroot] [PATCH 1/2] udev: update udev to new virtual
 package infra.
In-Reply-To: <20140217114906.5b6aab4a@skate>
References: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1392632536-16714-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140217114906.5b6aab4a@skate>
Message-ID: <20140217143311.GA4920@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, Feb 17, 2014 at 11:49:06AM +0100, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Mon, 17 Feb 2014 11:22:15 +0100, Eric Le Bihan wrote:
>
> > -ifeq ($(BR2_PACKAGE_EUDEV),y)
> > -UDEV_DEPENDENCIES += eudev
> > -endif
> > -
> > -ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > -UDEV_DEPENDENCIES += systemd
> > -endif
> > +UDEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_UDEV))
> >
> >  ifeq ($(UDEV_DEPENDENCIES),)
> >  define UDEV_CONFIGURE_CMDS
> > -	echo "No Udev implementation selected. Configuration error."
> > +	$(error No Udev implementation selected. Configuration error)
> >  	exit 1
> >  endef
> >  endif
>
> Why are we doing this check in UDEV_CONFIGURE_CMDS ? I believe we can
> simply do:
>
> ifeq ($(<foo>_DEPENDENCIES),)
> $(error No <foo> implementation selected)
> endif
I followed the example in package/opengl/libegl/libegl.mk, but I mixed the
Makefile control function $(error text...) and some Shell script without
thinking...

I will revert it to the pure shell version to be coherent.

With the <foo>_CONFIGURE_CMDS method, we go through all the dummy steps, and
this is very verbose:

  >>> udev undefined Extracting
  >>> udev undefined Patching
  >>> udev undefined Configuring
  echo "No Udev implementation selected. Configuration error."
  No Udev implementation selected. Configuration error.
  exit 1
  make: *** [/home/eric/build/elebihan/demo-systemd/arm/build/udev-undefined/.stamp_configured] Erreur 1

With the pure Makefile version, the error message is clearer:

  package/udev/udev.mk:11: *** No Udev implementation selected. Configuration error. Stop.

I find it better. If it suits everyone, I can propose a patch to convert all
the virtual packages to it and re-send my tutorial patch about virtual
package.

Best regards,
ELB
