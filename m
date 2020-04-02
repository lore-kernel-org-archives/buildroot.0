From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 02 Apr 2020 09:09:05 +0300
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Wilocity 6210
 11ad firmware
In-Reply-To: <20200331200332.GS22325@scaer>
References: <6c1b188c2a00e62ee950fd9987acfc0121afd39f.1585578701.git.baruch@tkos.co.il>
 <20200331200332.GS22325@scaer>
Message-ID: <87r1x6beri.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Mar 31 2020, Yann E. MORIN wrote:
> On 2020-03-30 17:31 +0300, Baruch Siach spake thusly:
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> Cc: Yegor Yefremov <yegorslists@googlemail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  package/linux-firmware/Config.in         | 5 +++++
>>  package/linux-firmware/linux-firmware.mk | 5 +++++
>>  2 files changed, 10 insertions(+)
>> 
>> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
>> index fb884842d66b..914b514f80bd 100644
>> --- a/package/linux-firmware/Config.in
>> +++ b/package/linux-firmware/Config.in
>> @@ -345,6 +345,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX
>>  	help
>>  	  Firmware files for WLAN and Bluetooth modules wl18xx
>>  
>> +config BR2_PACKAGE_LINUX_FIRMWARE_WILOCITY_WIL6210
>> +	bool "Wilocity 6210"
>
> I've been reminded recently that the options are all prefixed with the
> vendor, followed by the model name/number, so in this case, it should
> be:
>
>     config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOM_WIL6210
>         bool "Qualcom Atheros wil6210"

Wilocity is arguably also the vendor name.

> So I was about to rename and apply, but then I noticed something weird
> with the exiosting Atheros and Qualcom firmwares. We have:
>
>     config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174
>         bool "Atheros 10k (QCA6174)"
>         help
>           Firmware files for the Atheros QCA6174 module
>
> And:
>
>     config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
>         bool "Qualcomm Atheros 6174"
>         help
>           Firmware files for the Qualcomm Atheros QCA6174 chip
>
> And indeed they both installs files from ath10k/QCA6174: the former
> installs a selected set of files by name, while the latter installs
> the whole directory (using _FILES instaed of DIRS, at that).
>
> Would wyou want to have a look amd fix that, then fix your patch and
> resummit, please?

How would you like to fix that? Should we drop
BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174 option since it installs
less files?

How is that related to this patch?

baruch

>> +	help
>> +	  Firmware files for Qualcomm Atheros 11ad family of chips
>> +
>>  endmenu
>>  
>>  menu "Ethernet firmware"
>> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
>> index 21300ddc72de..e553a2a06383 100644
>> --- a/package/linux-firmware/linux-firmware.mk
>> +++ b/package/linux-firmware/linux-firmware.mk
>> @@ -373,6 +373,11 @@ LINUX_FIRMWARE_FILES += \
>>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
>>  endif
>>  
>> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_WILOCITY_WIL6210),y)
>> +LINUX_FIRMWARE_FILES += wil6210.*
>> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
>> +endif
>> +
>>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
>>  LINUX_FIRMWARE_FILES += iwlwifi-3160-*.ucode
>>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
