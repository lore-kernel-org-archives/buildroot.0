From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Mon, 16 Dec 2019 10:08:55 +0000
Subject: [Buildroot] [PATCH v3] configs/atmel: update u-boot-at91 and
 bootstrap to tarballs
In-Reply-To: <20191216104701.0f3af055@windsurf.home>
References: <1575459437-7302-1-git-send-email-eugen.hristev@microchip.com>
 <20191216104701.0f3af055@windsurf.home>
Message-ID: <d849cb07-7c68-2b63-d44e-4a93c45e3d88@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16.12.2019 11:47, Thomas Petazzoni wrote:

> Hello Eugen,
> 
> On Wed, 4 Dec 2019 11:37:47 +0000
> <Eugen.Hristev@microchip.com> wrote:
> 
>> diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
>> index 1d16708..0653ae8 100644
>> --- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
>> +++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
>> @@ -70,15 +70,13 @@ BR2_TARGET_ROOTFS_EXT2=y
>>   BR2_TARGET_ROOTFS_EXT2_4=y
>>   BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>>   BR2_TARGET_AT91BOOTSTRAP3=y
>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"
> 
> In fact, there is no option BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL,
> so this simply doesn't work.
> 
> I see two options:
> 
>   (1) Revert back to downloading from Git
> 
>   (2) Add support for the custom tarball option in
>       at91bootstrap3/Config.in and at91bootstrap3/at91bootstrap3.mk.
> 
> I think option (2) is the most appropriate, since we have this custom
> tarball option for Linux, U-Boot, etc. already.
> 
> Could you take care of implementing this option, or should we do it ?

Hi Thomas,

I can help doing it. Here is a quick work , is it okay? send a patch ? 
or there is more to do this than simply what I did below:

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk 
b/boot/at91bootstrap3/at91bootstrap3.mk
index 685be5b..a491aaf 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -6,7 +6,12 @@

  AT91BOOTSTRAP3_VERSION = $(call 
qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))

-ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
+ifeq ($(AT91BOOTSTRAP_VERSION),custom)
+# Handle custom AT91Bootstrap tarballs as specified by the configuration
+AT91BOOTSTRAP_TARBALL = $(call 
qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL_LOCATION))
+AT91BOOTSTRAP_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP_TARBALL)))
+AT91BOOTSTRAP_SOURCE = $(notdir $(AT91BOOTSTRAP_TARBALL))
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
  AT91BOOTSTRAP3_SITE = $(call 
qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
  AT91BOOTSTRAP3_SITE_METHOD = git
  BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
@@ -54,6 +59,15 @@ AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
  # Must be before we call to kconfig-package
  ifeq ($(BR_BUILDING),y)

+#
+# Check custom tarball option
+#
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL_LOCATION)),)
+$(error No custom AT91Bootstrap tarball specified. Check your 
BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL_LOCATION setting)
+endif # qstrip BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL_LOCATION
+endif # BR2_TARGET_AT91BOOTSTAP_CUSTOM_TARBALL
+


> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
