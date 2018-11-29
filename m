From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:34:01 +0100
Subject: [Buildroot] [PATCH] package/wolfssl: enable ARMv8 hardware
 acceleration
In-Reply-To: <20181125092027.5824-1-sergio.prado@e-labworks.com>
References: <20181125092027.5824-1-sergio.prado@e-labworks.com>
Message-ID: <20181129223401.77beba29@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Nov 2018 07:20:27 -0200, Sergio Prado wrote:

> -# build fails when ARMv8 hardware acceleration is enabled
> +# enable ARMv8 hardware acceleration (the flag -mstrict-align is
> +# needed to prevent build errors caused by some inline assembly
> +# in parts of the AES structure using the "m" constraint)
> +ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> +WOLFSSL_CONF_OPTS += --enable-armasm
> +WOLFSSL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -mstrict-align"

Actually, this doesn't work well when doing an ARM 32 bit configuration
targeting Cortex-A53. Cortex-A53 is an ARMv8-A core, so
BR2_ARM_CPU_ARMV8A=y, but the gcc for ARM 32 bits doesn't support
-mstrict-align, causing a build failure.

However, the ARM optimization of wolfssl applies to both ARMv8 in 32 and
64 bits mode. So I've added another condition on BR2_aarch64=y around
the -mstrict-align workaround.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
