From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 May 2020 23:30:15 +0200
Subject: [Buildroot] [PATCH for-master] boot/arm-trusted-firmware:
 ignore licencing check for user defined official version
In-Reply-To: <20200530170705.562604-1-romain.naour@gmail.com>
References: <20200530170705.562604-1-romain.naour@gmail.com>
Message-ID: <20200530213015.GV8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

romain, All,

On 2020-05-30 19:07 +0200, Romain Naour spake thusly:
> The commit [1] "licensing info is only valid for v1.4" fixed the legal-info
> issues when a custom ATF tarball or a version from git is used.
> But we need to ignore licencing for a used defined official ATF version.
> 
> Althougt the ATF version are licensed under BSD-3-Clause, the license
> file can be updated between version (for example between v1.4 and v2.0).
> 
> Ignore the licencing check if the user provide a custom official version.
> 
> [1] d1a61703f728340ec894c367398d2a3a394a3360
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

But see below...

> ---
> This can be reproduced by loading qemu_arm_vexpress_tz_defconfig followed by
> make legal-info.
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 2e8a7c1a23..9c06ea7722 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -19,9 +19,11 @@ else
>  ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
>  # The licensing of custom or from-git versions is unknown.
>  # This is valid only for the official v1.4.
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION),)

I've switched to using positive logic, with the _LATEST _variable, which
makese the condition even more explicit, too:

    ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)

Regards,
Yann E. MORIN.

>  ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
>  ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
>  endif
> +endif
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
>  BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
> -- 
> 2.25.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
