From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Sep 2013 07:08:11 +0200
Subject: [Buildroot] [PATCH 1/1] u-boot: allow to pass a custom
 configuration file
In-Reply-To: <0AF585C7-2CB6-443B-8F22-0EC2889259A3@armadeus.org>
References: <1379589006-28682-1-git-send-email-eric.jarrige@armadeus.org>
 <20130919174336.537e265e@skate>
 <0AF585C7-2CB6-443B-8F22-0EC2889259A3@armadeus.org>
Message-ID: <20130920070811.584e83bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Jarrige,

On Thu, 19 Sep 2013 22:07:22 +0200, Eric Jarrige wrote:

> > I don't think using the word 'defconfig' for U-Boot is appropriate,
> > since 'defconfig' really refers to a kconfig terminology and U-Boot,
> > sadly, doesn't use kconfig.
> 
> Does the alternate terminology DEFAULT_CONFIG could be more
> appropriate or acceptable ?

I don't think "default" is really meaningful. Just "Path to the board
configuration file" would be sufficient.

> >> define UBOOT_CONFIGURE_CMDS
> >> +	$(if $(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),
> >> +		cp -pf $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)) \
> >> +			$(@D)/include/configs/$(UBOOT_BOARD_NAME).h)
> >> 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
> >> 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
> >> 		$(UBOOT_BOARD_NAME)_config
> > 
> > I am a bit hesitant on the overall feature. The fact that a
> > include/configs/<something>.h file is really a configuration file is
> > pretty fuzzy in U-Boot, especially since now boards are supposed to
> > also be listed in the main boards.cfg file.
> > 
> > Therefore, I'm tempted to say that users who need to do that should
> > instead use patches against U-Boot (to add their own board, including
> > the include/configs/<something>.h file).
> > 
> > But on this one, I believe I can be convinced if there are good
> > arguments :)
> 
> The file boards.cfg is a source of confusion for me. This file provides
> the list of boards with some extra information like status of the board and
> maintainer email address.
> Nevertheless the concrete config files are the <BOARD>.h files located in
> include/config even if U-Boot a C syntax with a list of #define instead of
> the common kconfig syntax.

Right, but it looks like nowadays that adding a board
configuration requires both adding a include/configs/<BOARD>.h file and
an entry in boards.cfg (though I agree that was the 'mkconfig' script
is doing is quite obscure).

> You are right, a customization of the U-Boot config  file can be done
> through the use of patches as it could be done for some other packages
> like Barebox, Busybox or the linux kernel but the BuildRoot feature to
> support custom config files for the main packages is more than
> convenient. So the purpose of this patch is to add this feature to the U
> Boot option as well.
> IMHO such a feature could be useful for some other BuildRoot/U-Boot
> user but may be I wrong. Please let me know.

Well again, the problem I see is that the "board configuration" in
U-Boot is not something that is as well isolated as it is in the kernel
or Barebox. In the kernel or Barebox, the configuration file is only
here to describe *how* you would like the support for a particular
board to be built (with network, without, with this or that other
driver).

While in U-Boot, the <BOARD>.h file is an *integral* part of the board
support itself: it not only defines the configuration you want for this
particular build, but also describes the hardware itself. In U-Boot,
whether you want the network support or not is mixed with the
information of which network device your board has, and how it is
connected on the board. So a <BOARD>.h file is typically not
standalone, it comes with a new board/<something>/<boardname>/
directory.

That's the reason I'm skeptical that this is useful in practice.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
