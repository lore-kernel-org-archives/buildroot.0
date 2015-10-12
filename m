From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Oct 2015 23:16:18 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
In-Reply-To: <20151012224411.472a9d10@free-electrons.com>
References: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
 <20151010150457.GD3640@free.fr>
 <20151012224411.472a9d10@free-electrons.com>
Message-ID: <20151012211618.GG3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-12 22:44 +0200, Thomas Petazzoni spake thusly:
> On Sat, 10 Oct 2015 17:04:57 +0200, Yann E. MORIN wrote:
[--SNIP--]
> > > +ifeq ($(BR2_PACKAGE_IQVLINUX),y)
> > > +define IQVLINUX_PCI_CHECK
> > > +	@if ! grep -Fqx 'CONFIG_PCI=y' $(LINUX_DIR)/.config; then \
> > > +		echo "ERROR: Enable CONFIG_PCI in the linux kernel config." 1>&2 ; \
> > > +		exit 1; \
> > > +	fi
> > > +endef
> > > +
> > > +# Check if PCI is enabled in the Linux kernel build by Buildroot.
> > > +LINUX_POST_CONFIGURE_HOOKS += IQVLINUX_PCI_CHECK
> > > +endif
> > 
> > I really do not like that a package meddles in the affairs of another
> > package, like setting hooks for it.
> > 
> > I'd rather we add a variable that packages could set to require specific
> > kernel config options, something like:
> > 
> >     IQVLINUX_LINUX_NEEDS_CONFIG_OPTS = CONFIG_PCI
> > 
> > Then in package/pkg-generic, in the inner-generic-package macro:
> > 
> >     LINUX_NEEDS_CONFIG_OPTS += $$($(2)_NEEDS_LINUX_CONFIG)
> > 
> > And finally in linux/linux.mk:
> > 
> >     define LINUX_CHECK_CONFIG_OPTS
> >         $(foreach cfg,$(strip $(LINUX_NEEDS_CONFIG_OPTS)),\
> >             if ! grep -E '^$(cfg)=y$$' $(@D)/.config >/dev/null; then \
> >                 printf "ERROR: Enable %s in your linux kernel config." "$(cfg)"; \
> >                 exit 1; \
> >             fi;)
> >     endef
> >     LINUX_POST_CONFIGURE_HOOKS += LINUX_CHECK_CONFIG_OPTS
> 
> I agree on the principle, but I think we should rather handle that like
> we do for other options: enable automatically the needed option.

Except for PCI it does not really makes sense, see Arnout's explanations:
    http://lists.busybox.net/pipermail/buildroot/2015-October/141178.html

> Remember how someone proposed to check for CONFIG_MODULES=y and error
> out if not available? Instead, you implemented
> b7c32c98bc810b88e0391117f225658f82b44995.

Meh... ;-)

> So a little bit in the direction of what you proposed, what about
> refactoring the LINUX_NEEDS_MODULES mechanism into a more generic
> mechanism that allows package to express which kernel option(s) they
> need, and automatically enable such options in linux/linux.mk when
> configuring the kernel.

I'm not totally oposed to this idea.

However, there are cases, like PCI, for which it does not make sense to
just enable it (as Arnout explained).

Unless we don't care about runtime consistency, and just care about the
buildability of the configuration...

However, I like doing such little tiny bit of infra, so I can append that
to my todo-list. What do you prefer: setting the option (like for
modules), or checking the option?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
