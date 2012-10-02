From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 02 Oct 2012 18:41:08 +0200
Subject: [Buildroot] [PATCH v2] Add package raspberrypi-firmware.
In-Reply-To: <1348173466-10956-1-git-send-email-marek.belisko@open-nandra.com>
References: <1348173466-10956-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <506B1924.2090208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/09/12 22:37, Marek Belisko wrote:
> Add support for raspberrypi bootloader and VideoCore.
>
> Signed-off-by: Marek Belisko<marek.belisko@open-nandra.com>
>

  Still some comments, but these can be fixed while committing, so:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(untested).


  There should be a
---
(three dashes on a line by itself) between the SOB and the changelog,
otherwise the changelog becomes part of the commit message, which is
not what we want.

> Changes from V1:
> - fix names in Config.in (BR2_PACKAGE_BOOTLOADER_ARM192 to
>   BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM192)
> - remove unnecessary SOURCE in mk file
> - fix installing VideoCore libraries and include
> - copy bootloader files directly to images directory
> - rework handling selection of GPU&  ARM memory split
>   (inspired by Yann patch)
> - bump to latest "turbo mode" firmware version
>   (http://www.raspberrypi.org/archives/2008)
>
[snip]
> +if BR2_PACKAGE_RASPBERRYPI_BOOTLOADER
> +choice
> +
> +prompt "Memory&  GPU split"

  prompt should come immediately below choice (no empty line) and should be
indented with 1 tab.

> +	default BR2_PACKAGE_RASPBERRYPI_BOOTLOADER_ARM192
> +	help
> +	  Select how much memory use for system and
> +	  how much for GPU.
[snip]
> +ifeq ($(BR2_PACKAGE_RASPBERRYPI_VIDEOCORE),y)
> +RASPBERRYPI_FIRMWARE_INSTALL_STAGING = YES
> +
> +define RASPBERRYPI_FIRMWARE_INSTALL_STAGING_CMDS
> +	cp -r -T $(@D)/hardfp/opt/vc/include $(STAGING_DIR)/usr/include
> +	cp -r -T $(@D)/hardfp/opt/vc/lib $(STAGING_DIR)/usr/lib

  I would prefer to use
	rsync -a $(@D)/hardfp/opt/vc/include/ $(STAGING_DIR)/usr/include
but that's probably just personal preference.

[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
