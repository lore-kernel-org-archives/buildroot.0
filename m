From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:59:13 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/meson: fix cpu_family format
In-Reply-To: <1544948097-2389-1-git-send-email-james.hilliard1@gmail.com>
References: <1544948097-2389-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181216215913.741c549f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

I would really like to have some feedback/Acked-by from Eric on a patch
like this. Some comments below.

On Sun, 16 Dec 2018 16:14:57 +0800, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> Meson expects the cpu_family to be in a specific format for
> cross compilation, otherwise packages that use cpu_family
> detection may fail to build.
> 
> We also need to set needs_exe_wrapper = true to ensure that
> meson won't try and execute test binaries.

This needs_exe_wrapper change seems unrelated, it should be part of a
separate patch.

> +# https://mesonbuild.com/Reference-tables.html#cpu-families
> +ifeq ($(BR2_arcle),y)
> +HOST_MESON_TARGET_CPU_FAMILY = arc
> +else ifeq ($(BR2_arceb),y)
> +HOST_MESON_TARGET_CPU_FAMILY = arc

This can be written like this:

ifeq ($(BR2_arcle)$(BR2_arceb),y)
HOST_MESON_TARGET_CPU_FAMILY = arc


> +else ifeq ($(BR2_arm),y)
> +HOST_MESON_TARGET_CPU_FAMILY = arm
> +else ifeq ($(BR2_armeb),y)
> +HOST_MESON_TARGET_CPU_FAMILY = arm

Ditto for arm/armeb

> +else ifeq ($(BR2_aarch64),y)
> +HOST_MESON_TARGET_CPU_FAMILY = aarch64
> +else ifeq ($(BR2_aarch64_be),y)
> +HOST_MESON_TARGET_CPU_FAMILY = aarch64

Ditto.

> +else ifeq ($(BR2_i386),y)
> +HOST_MESON_TARGET_CPU_FAMILY = x86
> +else ifeq ($(BR2_mips),y)
> +HOST_MESON_TARGET_CPU_FAMILY = mips
> +else ifeq ($(BR2_mipsel),y)
> +HOST_MESON_TARGET_CPU_FAMILY = mips

Ditto.

> +else ifeq ($(BR2_mips64),y)
> +HOST_MESON_TARGET_CPU_FAMILY = mips64
> +else ifeq ($(BR2_mips64el),y)
> +HOST_MESON_TARGET_CPU_FAMILY = mips64
> +else ifeq ($(BR2_powerpc),y)
> +HOST_MESON_TARGET_CPU_FAMILY = ppc
> +else ifeq ($(BR2_powerpc64),y)
> +HOST_MESON_TARGET_CPU_FAMILY = ppc64
> +else ifeq ($(BR2_powerpc64le),y)
> +HOST_MESON_TARGET_CPU_FAMILY = ppc64

Ditto.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
