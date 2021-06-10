From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jun 2021 16:10:21 +0200
Subject: [Buildroot] [PATCH v2 01/28] boot/arm-trusted-firmware: option
 to disable stack protection
In-Reply-To: <YME6zLv85ivVOkpi@curiosity>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
 <20210609200003.2866122-2-geomatsi@gmail.com>
 <20210609234015.1de2583f@windsurf> <YME6zLv85ivVOkpi@curiosity>
Message-ID: <20210610161021.3fd9db8a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Jun 2021 01:03:56 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> > It's a bit annoying that we have to tell TF-A about this. If TF-A
> > doesn't implement plat_get_stack_protector_canary() for a certain
> > platform, why does it try to enable SSP ? It feels like something that
> > should be fixed in TF-A.  
> 
> TF-A does not attempt to enable those protection checks. This is
> controlled by its ENABLE_STACK_PROTECTOR build flag, which default
> value is 'none'. This is Buildroot who tries to enable TF-A stack
> protection checks depending on BR2_SSP_* toolchain features only:
> see arm-trusted-firmware.mk.

I think:

ifeq ($(BR2_SSP_REGULAR),y)
ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
else ifeq ($(BR2_SSP_STRONG),y)
ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
else ifeq ($(BR2_SSP_ALL),y)
ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
endif

is probably not great. BR2_SSP_* should really only affect user-space
code, IMO. For bare-metal/bootloader code, handling SSP really requires
special support, so we should probably not force it.

That being said, it's a bit weird for TF-A to provide that
ENABLE_STACK_PROTECTOR option in a way that doesn't build/work on all
platforms.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
