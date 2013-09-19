From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Thu, 19 Sep 2013 22:07:22 +0200
Subject: [Buildroot] [PATCH 1/1] u-boot: allow to pass a custom
	configuration file
In-Reply-To: <20130919174336.537e265e@skate>
References: <1379589006-28682-1-git-send-email-eric.jarrige@armadeus.org>
 <20130919174336.537e265e@skate>
Message-ID: <0AF585C7-2CB6-443B-8F22-0EC2889259A3@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 19 sept. 2013, at 17:43, Thomas Petazzoni wrote:

> Dear Eric Jarrige,
> 
> On Thu, 19 Sep 2013 13:10:06 +0200, Eric Jarrige wrote:
> 
>> choice
>> +	prompt "U-Boot configuration"
>> +	default BR2_TARGET_UBOOT_USE_DEFCONFIG
>> +
>> +config BR2_TARGET_UBOOT_USE_DEFCONFIG
>> +	bool "Using default configuration"
> 
> I don't think using the word 'defconfig' for U-Boot is appropriate,
> since 'defconfig' really refers to a kconfig terminology and U-Boot,
> sadly, doesn't use kconfig.

Does the alternate terminology DEFAULT_CONFIG could be more
appropriate or acceptable ?

> 
>> define UBOOT_CONFIGURE_CMDS
>> +	$(if $(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),
>> +		cp -pf $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)) \
>> +			$(@D)/include/configs/$(UBOOT_BOARD_NAME).h)
>> 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
>> 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
>> 		$(UBOOT_BOARD_NAME)_config
> 
> I am a bit hesitant on the overall feature. The fact that a
> include/configs/<something>.h file is really a configuration file is
> pretty fuzzy in U-Boot, especially since now boards are supposed to
> also be listed in the main boards.cfg file.
> 
> Therefore, I'm tempted to say that users who need to do that should
> instead use patches against U-Boot (to add their own board, including
> the include/configs/<something>.h file).
> 
> But on this one, I believe I can be convinced if there are good
> arguments :)

The file boards.cfg is a source of confusion for me. This file provides
the list of boards with some extra information like status of the board and
maintainer email address.
Nevertheless the concrete config files are the <BOARD>.h files located in
include/config even if U-Boot a C syntax with a list of #define instead of
the common kconfig syntax.

You are right, a customization of the U-Boot config  file can be done
through the use of patches as it could be done for some other packages
like Barebox, Busybox or the linux kernel but the BuildRoot feature to
support custom config files for the main packages is more than
convenient. So the purpose of this patch is to add this feature to the U
Boot option as well.
IMHO such a feature could be useful for some other BuildRoot/U-Boot
user but may be I wrong. Please let me know.

Best regards,
Eric





 
 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 203 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/a3b7e941/attachment-0001.asc>
