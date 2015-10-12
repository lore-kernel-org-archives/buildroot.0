From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 22:44:11 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
In-Reply-To: <20151010150457.GD3640@free.fr>
References: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
 <20151010150457.GD3640@free.fr>
Message-ID: <20151012224411.472a9d10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Oct 2015 17:04:57 +0200, Yann E. MORIN wrote:

> > diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
> > new file mode 100644
> > index 0000000..275c67e
> > --- /dev/null
> > +++ b/package/iqvlinux/Config.in
> > @@ -0,0 +1,18 @@
> > +config BR2_PACKAGE_IQVLINUX
> > +	bool "iqvlinux"
> > +	depends on BR2_LINUX_KERNEL
> > +	help
> > +	  Intel Ethernet Adapter Debug Driver for Linux (iqvlinux),
> > +	  which supports kernel versions 2.6.x up through 4.0.x.
> 
> What about 4.1+ ?
> 
> Should we do a version-check at configure time, or is there such a check
> already done by the package itself?

I think we don't really care. There are lots of other kernel modules
or Linux kernel extensions (Xenomai, RTAI) for which we don't do such
version checks.

> > +IQVLINUX_MODULE_SUBDIRS = src/linux/driver
> > +
> > +ifeq ($(BR2_PACKAGE_IQVLINUX),y)
> > +define IQVLINUX_PCI_CHECK
> > +	@if ! grep -Fqx 'CONFIG_PCI=y' $(LINUX_DIR)/.config; then \
> > +		echo "ERROR: Enable CONFIG_PCI in the linux kernel config." 1>&2 ; \
> > +		exit 1; \
> > +	fi
> > +endef
> > +
> > +# Check if PCI is enabled in the Linux kernel build by Buildroot.
> > +LINUX_POST_CONFIGURE_HOOKS += IQVLINUX_PCI_CHECK
> > +endif
> 
> I really do not like that a package meddles in the affairs of another
> package, like setting hooks for it.
> 
> I'd rather we add a variable that packages could set to require specific
> kernel config options, something like:
> 
>     IQVLINUX_LINUX_NEEDS_CONFIG_OPTS = CONFIG_PCI
> 
> Then in package/pkg-generic, in the inner-generic-package macro:
> 
>     LINUX_NEEDS_CONFIG_OPTS += $$($(2)_NEEDS_LINUX_CONFIG)
> 
> And finally in linux/linux.mk:
> 
>     define LINUX_CHECK_CONFIG_OPTS
>         $(foreach cfg,$(strip $(LINUX_NEEDS_CONFIG_OPTS)),\
>             if ! grep -E '^$(cfg)=y$$' $(@D)/.config >/dev/null; then \
>                 printf "ERROR: Enable %s in your linux kernel config." "$(cfg)"; \
>                 exit 1; \
>             fi;)
>     endef
>     LINUX_POST_CONFIGURE_HOOKS += LINUX_CHECK_CONFIG_OPTS

I agree on the principle, but I think we should rather handle that like
we do for other options: enable automatically the needed option.

Remember how someone proposed to check for CONFIG_MODULES=y and error
out if not available? Instead, you implemented
b7c32c98bc810b88e0391117f225658f82b44995.

So a little bit in the direction of what you proposed, what about
refactoring the LINUX_NEEDS_MODULES mechanism into a more generic
mechanism that allows package to express which kernel option(s) they
need, and automatically enable such options in linux/linux.mk when
configuring the kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
