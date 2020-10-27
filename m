From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2020 10:18:55 +0100
Subject: [Buildroot] [PATCH] package/lzma-alone: new package
In-Reply-To: <20201026213433.4309-1-zajec5@gmail.com>
References: <20201026213433.4309-1-zajec5@gmail.com>
Message-ID: <20201027101855.6e23b1ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rafa?,

On Mon, 26 Oct 2020 22:34:33 +0100
Rafa? Mi?ecki <zajec5@gmail.com> wrote:

> From: Rafa? Mi?ecki <rafal@milecki.pl>
> 
> This new package provides "lzma_alone" host binary based on the original
> LZMA SDK. It provides few extra options when compared to the LZMA Utils
> project "lzma" binary (already packaged as the "lzma").
> 
> This tool is required for preparing firmware images for some home
> routers with picky bootloaders. It's main advantage is support for
> specifying dictionary size and lc/lp/pb LZMA values.
> 
> Broadcom CFE bootloader for MIPS BCM47xx devices is known to fail to
> boot images using LZMA compression with dictionary.
> Broadcom cferam bootloader for ARM64 BCM4908 devices is known to fail to
> boot images without uncompressed size specified.
> Broadcom CFE for BCM63xx DSL devices has even different requirements.
> 
> Packaging LZMA SDK "lzma" as "lzma_alone" is how it's handled in the
> Arch, Debian and Ubuntu.
> 
> Signed-off-by: Rafa? Mi?ecki <rafal@milecki.pl>

I am a bit confused by all the different lzma projects out there.

The Debian source package lzma (https://tracker.debian.org/pkg/lzma)
produces the lzma, lzma-alone and lzma-dev packages, and its source
package is apparently referring to what you suggest to use here.

The Buildroot package lzma points to https://tukaani.org/lzma/, which
says "Users of LZMA Utils should move to XZ Utils." and where the
latest release is from 2008.

And then, there is the LZMA SDK at https://www.7-zip.org/sdk.html,
where the latest release is 19.00, from 2019, at
https://www.7-zip.org/a/lzma1900.7z. This seems to be the same files
provided at
https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/, but you're
using the lzma922 version.

Do you have some clarifications about this (apparent) mess ?

>  package/lzma-alone/lzma-alone.hash |  1 +
>  package/lzma-alone/lzma-alone.mk   | 23 +++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 package/lzma-alone/lzma-alone.hash
>  create mode 100644 package/lzma-alone/lzma-alone.mk

We probably want a Config.in.host entry to this package.

> +define HOST_LZMA_ALONE_INSTALL_CMDS
> +	$(INSTALL) -d -m 0755 $(HOST_DIR)/bin

Not needed, the following $(INSTALL) -D will create the destination
folder for you.

> +	$(INSTALL) -D -m 0755 $(@D)/CPP/7zip/Bundles/LzmaCon/lzma $(HOST_DIR)/bin/lzma_alone
> +endef
> +
> +$(eval $(host-generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
