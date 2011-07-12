From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Wed, 13 Jul 2011 00:07:41 +0700
Subject: [Buildroot] [PATCH] pcsc-lite and ccid support
In-Reply-To: <20110712173853.7ff2d5ce@skate>
References: <1310465437-30946-1-git-send-email-ruckuus@gmail.com>
 <20110712173853.7ff2d5ce@skate>
Message-ID: <CAG7bwAJD8xUyuALJ-_zm5O4WBP7O1u=Z1vhMhw=NH5XRG=eCxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 12, 2011 at 10:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Tue, 12 Jul 2011 17:10:37 +0700,
> ruckuus at gmail.com a ?crit :
>
>> +config BR2_PACKAGE_CCID
>> + ? ? bool "ccid"
>> + ? ? select BR2_PACKAGE_PKG_CONFIG
>
> No, I don't think you need pkg-config on the target.
>
>> +CCID_DEPENDENCIES = pkg-config libusb pcsc-lite
>
> Are you really sure you need pkg-config on the target ? Usually,
> pkg-config is needed in the host. In this case, add "host-pkg-config"
> to the DEPENDENCIES variable, and do not "select" anything related to
> BR2_PACKAGE_PKG_CONFIG in the Config.in file.
>

Ok. Actually no need pkg-config on the target, you are right, I need
host-pkg-config instead.

>> +$(eval $(call AUTOTARGETS, package, ccid))
>
> No space after the commas:
>
> $(eval $(call AUTOTARGETS,package,ccid))
>
>> diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
>> new file mode 100644
>> index 0000000..55ac6d3
>> --- /dev/null
>> +++ b/package/pcsc-lite/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_PCSC_LITE
>> + ? ? bool "pcsc-lite"
>> + ? ? select BR2_PACKAGE_LIBUSB
>> + ? ? help
>> + ? ? ? Middleware to access a smart card using SCard API (PC/SC).
>> + ? ? ? For more information, please visit:
>> + ? ? ? http://pcsclite.alioth.debian.org/pcsclite.html
>> +
>> diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
>> new file mode 100644
>> index 0000000..2fdda5f
>> --- /dev/null
>> +++ b/package/pcsc-lite/pcsc-lite.mk
>> @@ -0,0 +1,13 @@
>> +##########################################################
>> +#
>> +# PCSC-Lite
>> +#
>> +# ########################################################
>> +PCSC_LITE_VERSION = 1.7.4
>> +PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
>> +PCSC_LITE_SITE = https://alioth.debian.org/frs/download.php/3598
>> +PCSC_LITE_INSTALL_STAGING = YES
>> +PCSC_LITE_INSTALL_TARGET = YES
>> +PCSC_LITE_CONF_OPT = --disable-libudev --enable-libusb --enable-embedded
>
> According to your Config.in, this package depends on LIBUSB. If it is
> indeed the case, then libusb should be in the DEPENDENCIES variable of
> this package.
>

Yes, I forgot this. Now it is corrected.

>> +$(eval $(call AUTOTARGETS, package, pcsc-lite))
>
> No spaces after commas.
>
> $(eval $(call AUTOTARGETS,package,pcsc-lite))
>

Thanks for your patience reviewing my patch.

The updated version is already submitted.

Best regards,


-- 
Dwi Sasongko S
