From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 29 Jul 2009 15:42:34 +0200
Subject: [Buildroot] linux .config : override: reassigning to	symbolAEABI
In-Reply-To: <F81DF98CADE6064F81A746D7C8323593782CAC@fr-ex009.groupinfra.com>
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
	<20090729132515.GM19257@buzzloop.caiaq.de>
	<F81DF98CADE6064F81A746D7C8323593782CAC@fr-ex009.groupinfra.com>
Message-ID: <20090729134234.GY13236@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(please keep the mailing list copied - I'm not your personal supporter,
and others might be interested in that, too.)

On Wed, Jul 29, 2009 at 03:32:52PM +0200, Courousse, Damien wrote:
> > Building an OABI toolchain for an EABI kernel doesn't make sense, hence
> > the configs are brought in sync by buildroot.
> > target/linux/Makefile.in.advanced is where it happens, and it AEABI
> > should not be set in the kernel config unless BR2_ARM_EABI is set. Could
> > you double check?
> [Damien Courouss?] 
> 
> target/linux/Makefile.in.advanced contains the following: 
> $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.config
> 	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
> ifeq ($(BR2_ARM_EABI),y)
> 	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
> 	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
> 	echo "# CONFIG_OABI_COMPAT is not set" >> $(LINUX26_DIR)/.config
> else

Could you check that this condition is met by adding an echo debug in
there?

> ... and my configuration files look fine to me:
> $ make saveconfig
> (...)
> $ cd local/logica_demo/
> $ grep ABI *
> linux-2.6.28.config:CONFIG_SLABINFO=y
> linux-2.6.28.config:# CONFIG_AEABI is not set
> linux-2.6.28.config:# CONFIG_SECURITY_FILE_CAPABILITIES is not set
> logica_demo.config:BR2_ARM_OABI=y
> logica_demo.config:# BR2_ARM_EABI is not set
> logica_demo.config:BR2_GCC_TARGET_ABI="apcs-gnu"
> uclibc-0.9.30.1.config:CONFIG_ARM_OABI=y
> uclibc-0.9.30.1.config:# CONFIG_ARM_EABI is not set

And what does your $(LINUX26_DIR)/.config look like afterwards? Is EABI
set in there? If so, we'll need to find out why. Could be that there
have been changes in the Linux kernel config which cause EABI to be set,
depending on other config flags, but I don't have a solution at hand
currently. Shouldn't be too hard to figure out, though.

Daniel
