From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2011 22:25:02 +0200
Subject: [Buildroot] [PATCH] Add x-loader bootloader
In-Reply-To: <1302730208-17584-1-git-send-email-tremyfr@yahoo.fr>
References: <y>
	<1302730208-17584-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <20110419222502.5ae9dc71@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Philippe,

Great to see such a patch. I really like the fact that you leveraged
the package infrastructure to add support for x-loader. Actually, I
think we should use the package infrastructure for all bootloaders and
for the kernel as well, so that we can easily benefits from
improvements made at the package infrastructure level.

On Wed, 13 Apr 2011 23:30:08 +0200
Philippe Reynes <tremyfr@yahoo.fr> wrote:

> +define XLOADER_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/MLO $(BINARIES_DIR)/
> +endef

In order to properly support the kernel and bootloaders as packages, we
probably need to implement a <pkg>_INSTALL_IMAGES_CMDS thing, which
gets enabled on a per-package basis via a <pkg>_IMAGES_INSTALL = YES
value.

The kernel could for examples do :

 LINUX_IMAGES_INSTALL = YES

in order to tell that it wants to install the kernel image in
$(BINARIES_DIR), and it could also do :

 LINUX_TARGET_INSTALL = YES

in order to tell that it wants to install its kernel modules to the
target root filesystem. Same thing for U-Boot, which can build the
bootloader image, but also some target utilities like
fw_printenv/fw_setenv.

> +ifeq ($(BR2_TARGET_XLOADER),y)
> +TARGETS+=xloader

That should typically be done by the package infrastructure, but at the
moment, the package infrastructure assumes that the option is named
BR2_PACKAGE_<something>. We need to figure out to make this a little
bit more generic maybe.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
