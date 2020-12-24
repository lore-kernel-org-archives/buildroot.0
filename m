From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 24 Dec 2020 13:30:00 +0100
Subject: [Buildroot] [RFC PATCH] boot/uboot: fix uboot build failure
 with UBOOT_CUSTOM_DTS_PATH on uboot version >= 2020.x
In-Reply-To: <20201224122708.588130-1-giulio.benetti@benettiengineering.com>
References: <20201224122708.588130-1-giulio.benetti@benettiengineering.com>
Message-ID: <fd80671d-f637-4a81-63c4-6dcfa6727de9@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

On 12/24/20 1:27 PM, Giulio Benetti wrote:
> Starting from version 2020.x uboot can't build .dts files not listed in
> dts/Makefile leading to a build failure when trying to pass a .dts file to
> UBOOT_CUSTOM_DTS_PATH. So let's prepend that file(s) to dts/Makefile if
> UBOOT_CUSTOM_DTS_PATH is used.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   boot/uboot/uboot.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index d2b4e8dc60..1f5ef4b9d2 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -296,6 +296,9 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>   UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
>   
>   define UBOOT_BUILD_CMDS
> +	$(if $(UBOOT_CUSTOM_DTS_PATH),
> +		$(Q)$(SED) '1s;^;dtb-y += $(subst .dts,.dtb,$(call notdir,$(UBOOT_CUSTOM_DTS_PATH)))\n;' $(@D)/arch/$(UBOOT_ARCH)/dts/Makefile
> +	)

This is only a proposal to understand if this is the best way to fix the 
problem.
The other way I see is to add a patch for uboot which does the same thing.
What do you all prefer?
I've got into this because I'm adding a board that is not mainlined and 
while in Linux it works correctly, in uboot doesn't.

The only board that uses UBOOT_CUSTOM_DTS_PATH I see is nanopi-r1 and it 
builds correctly because it's based on uboot v2019.01

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

>   	$(if $(UBOOT_CUSTOM_DTS_PATH),
>   		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
>   	)
> 
