From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 22:39:59 +0200
Subject: [Buildroot] [PATCH V2 1/9] arch/csky: Add VDSP and FLOAT_ABI
 compiler options.
In-Reply-To: <1557305915-11247-1-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
Message-ID: <20190526223959.5b471fc7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 May 2019 16:58:27 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> We never use BR2_CSKY_DSP in buildroot

This is not true, BR2_CSKY_DSP is used:

arch/Config.in.csky:    default "ck610"         if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
arch/Config.in.csky:    default "ck807"         if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
arch/Config.in.csky:    default "ck807e"        if (BR2_ck807 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
arch/Config.in.csky:    default "ck807f"        if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
arch/Config.in.csky:    default "ck807ef"       if (BR2_ck807 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
arch/Config.in.csky:    default "ck810"         if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
arch/Config.in.csky:    default "ck810e"        if (BR2_ck810 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
arch/Config.in.csky:    default "ck810f"        if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
arch/Config.in.csky:    default "ck810ef"       if (BR2_ck810 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)

so as such, your patch is incorrect: you remove an option, but the
option is still being used.

If this option is not needed because in fact the DSP enhanced
instructions have never been used, then please have a patch that *ONLY*
removes the BR2_CSKY_DSP option (both its definition and where it is
used).

Then another patch that adds the BR2_CSKY_VDSP option.

And finally another that sets the BR2_GCC_TARGET_FLOAT_ABI value.

All of these topics are independent from each other, they should be in
separate patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
