From: Abhimanyu V <abhimanyu.v@imgtec.com>
Date: Fri, 17 Feb 2017 12:14:45 +0530
Subject: [Buildroot] [PATCH v2 1/2] uccp420wlan: new package
In-Reply-To: <dd619e68-7b48-716c-e492-37220a51f9c9@mind.be>
References: <1487144021-27808-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <dd619e68-7b48-716c-e492-37220a51f9c9@mind.be>
Message-ID: <bbd11de9-60da-b5ef-603b-5d4c150298ff@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Arnout!


On Friday 17 February 2017 03:04 AM, Arnout Vandecappelle wrote:
>
> On 15-02-17 08:33, Abhimanyu V wrote:
>> From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
>>
>> Wifi kernel module and firmware for Imagination explorer RPU
>>
>> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
>> Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
> [snip]
>
>> diff --git a/package/uccp420wlan/0001-fix-compilation-error-with-kernel-4.4.patch b/package/uccp420wlan/0001-fix-compilation-error-with-kernel-4.4.patch
>> new file mode 100644
>> index 0000000..43026b8
>> --- /dev/null
>> +++ b/package/uccp420wlan/0001-fix-compilation-error-with-kernel-4.4.patch
>> @@ -0,0 +1,90 @@
>> +commit b5f449a2c48d2fe7c9341b32fea5a62dd6699e38
>> +Author: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
>> +Date:   Mon Jan 2 16:15:22 2017 +0530
>> +
>> +    Fix compilation error with kernel 4.4
>> +
>> +    Revert "Fix errors/warnings while compiling against kmod-mac80211"
>> +
>> +    This reverts commit e62baef655898526c69250bc63723241f3f4c46d.
>   Is this patch submitted upstream? Or if it is not for upstream, please specify
> why not.
I have been speaking to team maintaining the repo and they agreed that 
this patch should not be part of this repo, i have posted pull request 
for the same.
This repo was mostly used with openwrt till now so the reason for this 
patch.
>> +
>> +    Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> [snip]
>> diff --git a/package/uccp420wlan/Config.in b/package/uccp420wlan/Config.in
>> new file mode 100644
>> index 0000000..8f0df12
>> --- /dev/null
>> +++ b/package/uccp420wlan/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_UCCP420WLAN
>> +	bool "uccp420wlan"
>> +	depends on BR2_LINUX_KERNEL
>> +	help
>> +	  SoftMAC (mac80211) based WiFi driver for Imagination's Explorer RPU uccp420.
>> +	  This supports Dual Band WiFi with 2.4GHz - 2x2 b/g/n 40MHz, 5GHz - 2x2 a/n/11ac 80MHz modes
>   Help text should be indented at 72 columns, where the tab counts as 8 (so 62
> actual characters).
Will fix it.
>
>> +
>> +	  Used in creator ci40 board.
>> +
>> +	  https://github.com/CreatorDev/uccp420wlan
>> +
>> +comment "uccp420wlan needs a Linux kernel to be built"
>> +	depends on !BR2_LINUX_KERNEL
>> diff --git a/package/uccp420wlan/uccp420wlan.hash b/package/uccp420wlan/uccp420wlan.hash
>> new file mode 100644
>> index 0000000..9e54f21
>> --- /dev/null
>> +++ b/package/uccp420wlan/uccp420wlan.hash
>> @@ -0,0 +1,2 @@
>> +# locally computed hash
>> +sha256 c5b1194cb9fae049169b261548eaf18d87afce1c7388f7a0366bb5dd2a56cdb2  uccp420wlan-v6.9.tar.gz
>> diff --git a/package/uccp420wlan/uccp420wlan.mk b/package/uccp420wlan/uccp420wlan.mk
>> new file mode 100644
>> index 0000000..f3c8064
>> --- /dev/null
>> +++ b/package/uccp420wlan/uccp420wlan.mk
>> @@ -0,0 +1,20 @@
>> +################################################################################
>> +#
>> +# uccp420wlan
>> +#
>> +################################################################################
>> +
>> +UCCP420WLAN_VERSION = v6.9
>> +UCCP420WLAN_SITE = $(call github,CreatorDev,uccp420wlan,$(UCCP420WLAN_VERSION))
>> +UCCP420WLAN_LICENSE = GPLv2 (kernel module), proprietary (firmware blob)
>   This is annoying. Proprietary means that no license is given here. So basically
> we're not allowed to use it. I suppose you're fairly close to upstream, is there
> a chance to get an actual license text for the firmware blob so people can
> determine if they're allowed to use it or not?
>
>> +UCCP420WLAN_LICENSE_FILES = COPYING
>   For the record: the COPYING file only has GPLv2 + Linus explanation. There is
> no license text for the firmware blob.
Yes firmware blob license text got missed when we moved this repo from 
internal to github. I have raised PR for the same.
>
>   Regards,
>   Arnout
>
>> +
>> +define UCCP420WLAN_INSTALL_FIRMWARE
>> +	mkdir -p $(TARGET_DIR)/lib/firmware/img/uccp420wlan
>> +	cp $(@D)/firmware/*.ldr $(TARGET_DIR)/lib/firmware/img/uccp420wlan
>> +endef
>> +
>> +UCCP420WLAN_POST_INSTALL_TARGET_HOOKS += UCCP420WLAN_INSTALL_FIRMWARE
>> +
>> +$(eval $(kernel-module))
>> +$(eval $(generic-package))
>>
I will wait for new release with the above fixes to post new version of 
this patch.

Thanks and Regards,
Abhimanyu V
