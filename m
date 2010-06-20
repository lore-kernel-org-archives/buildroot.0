From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jun 2010 21:22:19 +0200
Subject: [Buildroot] [PATCH 01/10] New, simpler,
 infrastructure for building the Linux kernel
In-Reply-To: <878w69a8ys.fsf@macbook.be.48ers.dk>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<851a84fbbe113196adb69e1a241e18a958cd77c2.1276454802.git.thomas.petazzoni@free-electrons.com>
	<87bpb8b0ld.fsf@macbook.be.48ers.dk> <20100619161327.3748f49c@surf>
	<87hbkyajnf.fsf@macbook.be.48ers.dk> <20100620153508.4e7e2a28@surf>
	<878w69a8ys.fsf@macbook.be.48ers.dk>
Message-ID: <20100620212219.63498179@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Jun 2010 19:51:23 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Ok - Notice that there isn't anything stopping people from using a -rc
> version (and there shouldn't be) - E.G.
> 
> http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.35-rc3.tar.bz2

Nothing prevents people from doing this, but in that case they have to
use the "Custom tarball" option and give the full URL.

The "Custom version" only works with versions that are available
directly in http://www.kernel.org/pub/linux/kernel/v2.6/.

>  Thomas> Isn't this what I'm doing already ?
> 
> No, you were doing:
> 
> +# Compilation
> +$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured
> +	@$(call MESSAGE,"Compiling kernel")
> +	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D)
> +ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
> +	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) uImage
> +endif
> +	$(Q)touch $@
> 
> E.G. just make (followed by make uImage if uImage is selected).
> 
> I guess we should do:
> 
> make <format>
> if modules:
>    make modules
>    make modules-install

I have separate build and install steps. Would something like the
following be OK for you ?

 * build step
	make <format>
	if modules:
		make modules

 * install step
	cp .... $(BINARIES_DIR)
	if modules:
		make modules_install

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
