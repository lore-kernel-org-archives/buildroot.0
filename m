From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 12 Jul 2021 23:07:21 +0200
Subject: [Buildroot] [PATCH] boot/uboot: fix uboot build failure with
 UBOOT_CUSTOM_DTS_PATH on uboot version >= 2020.x
In-Reply-To: <ad1b10c3-b36f-78fe-624d-4f1bb6068944@benettiengineering.com>
References: <ad1b10c3-b36f-78fe-624d-4f1bb6068944@benettiengineering.com>
Message-ID: <0B9D01C4-2FB5-42EC-B4F1-087B2BD6A93A@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping again

Giulio

> Il giorno 27 mar 2021, alle ore 23:34, Giulio Benetti <giulio.benetti@benettiengineering.com> ha scritto:
> 
> ?Hi All,
> 
>> On 2/9/21 9:13 PM, Giulio Benetti wrote:
>> Starting from version 2020.x uboot can't build .dts files not listed in
>> dts/Makefile leading to a build failure when trying to pass a .dts file to
>> UBOOT_CUSTOM_DTS_PATH. So let's prepend that file(s) to dts/Makefile if
>> UBOOT_CUSTOM_DTS_PATH is used.
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>  boot/uboot/uboot.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>> index 2478a2a1e9..a5ad101d68 100644
>> --- a/boot/uboot/uboot.mk
>> +++ b/boot/uboot/uboot.mk
>> @@ -303,6 +303,11 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>>  UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
>>    define UBOOT_BUILD_CMDS
>> +    $(if $(UBOOT_CUSTOM_DTS_PATH),
>> +        $(Q)$(SED) \
>> +        '1s;^;dtb-y += $(subst .dts,.dtb,$(call notdir,$(UBOOT_CUSTOM_DTS_PATH)))\n;' \
>> +        $(@D)/arch/$(UBOOT_ARCH)/dts/Makefile
>> +    )
>>      $(if $(UBOOT_CUSTOM_DTS_PATH),
>>          cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
>>      )
> 
> Any new about this patch? It's essential to build an external u-boot dts after u-boot 2020.x
> 
> Kind regards
> -- 
> Giulio Benetti
> Benetti Engineering sas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
