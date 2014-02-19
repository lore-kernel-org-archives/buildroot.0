From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2014 20:06:39 +0100
Subject: [Buildroot] [PATCH v2 2/5] gnu-efi: new package
In-Reply-To: <20140219195755.1425c532@skate>
References: <1392766441-2160-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392766441-2160-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140219175338.GA3400@free.fr> <20140219195755.1425c532@skate>
Message-ID: <20140219190639.GC3400@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-19 19:57 +0100, Thomas Petazzoni spake thusly:
> On Wed, 19 Feb 2014 18:53:38 +0100, Yann E. MORIN wrote:
> > > +ifeq ($(BR2_i386),y)
> > > +GNU_EFI_PLATFORM=ia32
> > > +else ifeq ($(BR2_x86_64),y)
> > > +GNU_EFI_PLATFORM=x86_64
> > > +endif
> > 
> > Shouldn't we do like for grub: some EFI-BIOS on x86-64 machines might be
> > a 32-bit EFI-BIOS, in which case we'd want to build the 32-bit version
> > even if the target is 64-bit?
> 
> No, because it doesn't work. Building gnu-efi 32 bits with a 64 bits
> toolchain fails.

OK.

Since we have such a selection in grub2, maybe we could add a little
comment in gnu-eif's Config.in saying building a 32-bit gnu-eif for a
64-bit target is not supported?

> > > +define GNU_EFI_BUILD_CMDS
> > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> > > +		$(TARGET_CONFIGURE_OPTS) \
> > > +		ARCH=$(GNU_EFI_PLATFORM)
> > > +endef
> > > +
> > > +define GNU_EFI_INSTALL_TARGET_CMDS
> > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> > > +		$(TARGET_CONFIGURE_OPTS) \
> > > +		INSTALLROOT=$(TARGET_DIR) \
> > > +		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
> > > +endef
> > > +
> > > +define GNU_EFI_INSTALL_STAGING_CMDS
> > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> > > +		$(TARGET_CONFIGURE_OPTS) \
> > > +		INSTALLROOT=$(STAGING_DIR) \
> > > +		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
> > > +endef
> > 
> > Why install in target/ and staging/, and not in images/ ?
> 
> Because gnu-efi is not a bootloader. gnu-efi is a set of header files
> and a small library to be linked into an EFI application. So installing
> it in images/ doesn't make any sense.

OK, now I understand. Thanks for the explanations.

> However, I agree that the installation to the target is useless, so I
> will remove it.
> 
> > Also, this is used to build EFI applications, so I'd expect some host
> > tools to be built and isntalled, too. What am I missing?
> 
> There are no host tools. As far as I understand, gnu-efi only contains
> runtime code, to be linked into an EFI application that will be
> executed on the target.

I asked because I did not find the help text (or even the text on
gnu-efi's website mainpage very helpful either).

Thanks for the clarifications. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
