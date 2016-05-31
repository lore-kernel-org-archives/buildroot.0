From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 31 May 2016 14:33:09 -0300 (BRT)
Subject: [Buildroot] [PATCH v3] uboot-tools: fix FIT support and make it
 optional
In-Reply-To: <20160528150755.78888529@free-electrons.com>
References: <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-2-git-send-email-casantos@datacom.ind.br>
 <20160528150755.78888529@free-electrons.com>
Message-ID: <468666808.273843.1464715989675.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
[...]
> I was about to apply this, but spotted a few minor issues. In addition,
> another concern is that this patch is doing many different things.
> Those things are related, but could be done in separate patches:
> 
> 1/ Pass TARGET_STRIP should be one patch
> 
> 2/ Improving the help text of existing options should be one patch

OK. I noticed that I would need to rebase the changes, anyway, because uboot-tools was upgraded to use version 2016.05.

> 3/ Improving FIT support for the host variant
> 
> 4/ Improving FIT support for the target variant

Tasks 3 and 4 can not be separated because both depend on the new patch that makes FIT support really optional.

>> +From 1c0040aeed5d4dc17a549ad8a1a1c3e889f74e98 Mon Sep 17 00:00:00 2001
>> +From: Carlos Santos <casantos@datacom.ind.br>
>> +Date: Sun, 8 May 2016 11:11:39 -0300
>> +Subject: [PATCH 4/4] Make FIT support really optional
> 
> Please generate the patch with "git format-patch -N" so that there is
> no "4/4" in the patch title.

OK

[...]
>> +
>> +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> Has this patch been submitted upstream?

Yes (http://patchwork.ozlabs.org/patch/619683/).
> 
>> diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
>> index aca310b..eddc39f 100644
[...]
>> +	  Flattened Image Tree.  FIT is formally a FDT, which can include
> 
> Please, only one space after "." (fix globally).

OK

>> -config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
> 
> So essentially, this option gets renamed from
> BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT to
> BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT. You therefore need to
> add BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT to the
> Config.in.legacy file.

OK

>> +config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
>> +	bool "dumpimage"
>> +	help
>> +	  Install the dumpimage tool on the target system
>> +
>> +	  The dumpimage tool from Das U-Boot bootloader, which allows
>> +	  extraction of data from U-Boot images.
> 
> It's not clear why this option is moved around. Any reason for this?

Probably because I pasted the block at the wrong place when was editting the file. I will move it to the original position.

>> -config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
>> -	bool "dumpimage"
>> -	help
>> -	  The dumpimage tool from Das U-Boot bootloader, which allows
>> -	  extraction of data from U-Boot images.
>> -
>>  endif
[...]
>> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
>> +UBOOT_TOOLS_CONFIG_FIT = CONFIG_FIT=$(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT)
> 
> I think we should instead have a UBOOT_TOOLS_MAKE_OPTS, and replace
> this with:
> 
>	UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y

OK

>> +UBOOT_TOOLS_DEPENDENCIES += dtc
>> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
>> +UBOOT_TOOLS_CONFIG_FIT_SIGNATURE =
>> CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT)
> 
>	UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y

OK

>> +UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
>> +endif # BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
>> +endif # BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
>> +
>>  define UBOOT_TOOLS_BUILD_CMDS
>>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) 	\
>>  		CROSS_COMPILE="$(TARGET_CROSS)"	\
>>  		CFLAGS="$(TARGET_CFLAGS)"	\
>>  		LDFLAGS="$(TARGET_LDFLAGS)"	\
>> +		STRIP=$(TARGET_STRIP)		\
>>  		CROSS_BUILD_TOOLS=y		\
>> -		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT)
>> \
>> +		$(UBOOT_TOOLS_CONFIG_FIT)	\
>> +		$(UBOOT_TOOLS_CONFIG_FIT_SIGNATURE) \
> 
> And here:
> 
>		$(UBOOT_TOOLS_MAKE_OPTS)

OK

> and you can probably move into UBOOT_TOOLS_MAKE_OPTS a few other
> variables.
[...]
>> +ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)>> +HOST_UBOOT_TOOLS_CONFIG_FIT =
>> CONFIG_FIT=$(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT)
>> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
>> +ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
>> +HOST_UBOOT_TOOLS_CONFIG_FIT_SIGNATURE =
>> CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT)
>> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
>> +endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
>> +endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
> 
> Ditto here.

OK, I will make these changes. I'd like to emphasize, however, that currently uboot-tools is broken. FIT support is always compiled, so run-time dependence on "dtc" persists but dtc is not selected in Config.in{.host,}. This is the problem that my initial patch intended to fix.

Carlos Santos (Casantos)
DATACOM, P&D
