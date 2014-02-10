From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 10 Feb 2014 14:44:15 +0100
Subject: [Buildroot] [PATCH v7 0/4] udev is now provided by systemd or
 eudev
In-Reply-To: <52F5435A.3080700@mind.be>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <52F5435A.3080700@mind.be>
Message-ID: <20140210134415.GD22843@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Fri, Feb 07, 2014 at 09:34:34PM +0100, Arnout Vandecappelle wrote:
>
>  I have one more remark about the way the udev virtual package is
> implemented. We found out for the opengl packages that there is a better
> way to do it, something like:
>
> udev/Config.in:
>
> config BR2_PACKAGE_HAS_UDEV
>         bool
>
> config BR2_PACKAGE_PROVIDES_UDEV
>         depends on BR2_PACKAGE_HAS_UDEV
>         string
>
>
> udev/udev.mk:
>
> UDEV_SRC =
> UDEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_UDEV))
>
> ifeq ($(UDEV_DEPENDENCIES),)
> define UDEV_CONFIGURE_CMDS
>         echo "No Udev implementation selected. Configuration error."
>         exit 1
> endef
> endif
>
>
> eudev/Config.in:
>
> ...
> if BR2_PACKAGE_EUDEV
> config BR2_PACKAGE_PROVIDES_UDEV
> 	default "eudev"
> endif
>
>
>
>  That moves all the provider logic to the provider itself, which for
> instance makes it possible for BR2_EXTERNAL to provide an alternative
> udev implementation (e.g. a different udev version, which could be _very_
> relevant).
>
>
>  I repeat, though: this can be done as a follow-up patch.
Yes, the word 'provides' is more explicit. I'll put this in a follow-up patch.
If this is the definitive way of implementing a virtual package, shouldn't it
be added to docs/manual/adding-packages-tips.txt?

Thanks for the review.

Best regards,
ELB
