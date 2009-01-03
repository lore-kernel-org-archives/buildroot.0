From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 03 Jan 2009 21:37:20 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <87wsdcyw0d.fsf@macbook.be.48ers.dk>
References: <20090103000048.221A2769FA@busybox.osuosl.org>
	<87wsdcyw0d.fsf@macbook.be.48ers.dk>
Message-ID: <1231015040.8886.152.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-03 klockan 21:28 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-03 00:00:46 +0000 (Sat, 03 Jan 2009)
>  ulf> New Revision: 24652
> 
>  ulf> Log:
>  ulf> Add Memory configuration to U-Boot build, remove some debugging info
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/target/u-boot/Makefile.in
> 
> 
>  ulf> Changeset:
>  ulf> Modified: trunk/buildroot/target/u-boot/Makefile.in
>  ulf> ===================================================================
>  ulf> --- trunk/buildroot/target/u-boot/Makefile.in	2009-01-02 20:31:44 UTC (rev 24651)
>  ulf> +++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-03 00:00:46 UTC (rev 24652)
>  ulf> @@ -42,8 +42,9 @@
>  ulf>  @echo "#ifdef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
>  ulf>  @echo "#undef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
>  ulf>  @echo "#endif" >> $(U_BOOT_INC_CONF_FILE)
>  ulf> - at echo '#define $(strip $(1)) $(2)' >> $(U_BOOT_INC_CONF_FILE)
>  ulf> + at echo '#define $(strip $(1)) $(strip $(subst ",,$(2)))' >> $(U_BOOT_INC_CONF_FILE)
> 
> What is this for and why isn't it mentioned in the commit message?

It just removes the '"' characters around the config variable.

>  
>  ulf>  $(U_BOOT_DIR)/.header_modified: $(U_BOOT_DIR)/.configured
>  ulf>  	# Modify configuration header in $(U_BOOT_INC_CONF_FILE)
>  ulf> -	
>  ulf>  	@echo >> $(U_BOOT_INC_CONF_FILE)
>  ulf>  	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(U_BOOT_INC_CONF_FILE)
>  ulf>  	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
>  ulf>  	@echo "#define __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
>  ulf> +	$(call insert_define, DATE, $(DATE))	
>  ulf> +	$(call insert_define, CONFIG_LOAD_SCRIPTS, 1)
> 
> What is this? I don't find the string CONFIG_LOAD_SCRIPTS in U-boot.

It is used by the "factory" command which is available in one of the
patches.
By typing "factory" you setup your environment to the factory
default created by the configuration.

> 
>  ulf>  ifneq ($(strip $(BR2_PROJECT)),"")
>  ulf>  	$(call insert_define, CONFIG_HOSTNAME, $(BR2_PROJECT))
>  ulf>  endif
>  ulf> -ifneq ($(strip $(BR2_TARGET_UBOOT_SERVERIP)),"")
>  ulf> -	$(call insert_define, CONFIG_SERVERIP, $(BR2_TARGET_UBOOT_SERVERIP))
>  ulf> -endif
>  ulf> -
> 
> Why is this gone?

Just moved it.

> 
>  ulf>  ifneq ($(strip $(BR2_TARGET_UBOOT_IPADDR)),"")
>  ulf>  	$(call insert_define, CONFIG_IPADDR, $(BR2_TARGET_UBOOT_IPADDR))
>  ulf>  ifneq ($(strip $(BR2_TARGET_UBOOT_GATEWAY)),"")
>  ulf> @@ -101,22 +99,51 @@
>  ulf>  	$(call insert_define, CONFIG_NETMASK, $(BR2_TARGET_UBOOT_NETMASK))
>  ulf>  endif
>  ulf>  endif # end BR2_TARGET_U_BOOT_IPADDR
>  ulf> -
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_SERVERIP)),"")
>  ulf> +	$(call insert_define, CONFIG_SERVERIP, $(BR2_TARGET_UBOOT_SERVERIP))
>  ulf> +endif
> 
> Why the move?

I think the ip address should be before the server ip address
in the list.

> 
>  ulf>  ifneq ($(strip $(BR2_TARGET_UBOOT_ETHADDR)),"")
>  ulf>  	$(call insert_define, CONFIG_ETHADDR, $(BR2_TARGET_UBOOT_ETHADDR))
>  ulf>  endif
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_ETH1ADDR)),)
>  ulf>  ifneq ($(strip $(BR2_TARGET_UBOOT_ETH1ADDR)),"")
>  ulf> -	$(call insert_define, CONFIG_ETH2ADDR, $(BR2_TARGET_UBOOT_ETH1ADDR))
>  ulf> +	$(call insert_define, CONFIG_ETH1ADDR, $(BR2_TARGET_UBOOT_ETH1ADDR))
> 
> Huh? Why does the ETH1ADDR thingy depend on AVR32 in the first place?
> 

It is for the second Ethernet controller.
It should not be there for parts with a single ethernet controller.
Anyone can add support for other parts in Buildroot in the future, 
but it should be off by default.

>  ulf>  endif
>  ulf> +endif
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTARGS)),)
>  ulf>  ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTARGS)),"")
>  ulf>  	$(call insert_define, CONFIG_BOOTARGS, $(BR2_TARGET_UBOOT_BOOTARGS))
>  ulf>  endif
>  ulf> +endif
> 
> What is this BOOTARGS thing? It's not in Config.in
> 

I did not add them, I just make sure that if they are empty
they are not forwarded to U-Boot.
Anyone can of course add them in a board support package.

>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),)
>  ulf>  ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),"")
>  ulf>  	$(call insert_define, CONFIG_BOOTCOMMAND, $(BR2_TARGET_UBOOT_BOOTCMD))
>  ulf>  endif
>  ulf> +endif
> 
> Neither is this.
> 
>  ulf>  ifeq ($(BR2_TARGET_UBOOT_SILENT),y)
>  ulf>  	$(call insert_define, CONFIG_SILENT_CONSOLE,)
>  ulf>  endif
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_KERNEL_START)),"")
>  ulf> +	$(call insert_define, KERNEL_START, $(BR2_TARGET_UBOOT_KERNEL_START))
>  ulf> +endif
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_KERNEL_LOCATION)),"")
>  ulf> +	$(call insert_define, KERNEL_LOCATION, $(BR2_TARGET_UBOOT_KERNEL_LOCATION))
>  ulf> +endif
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_FILESYSTEM_START)),"")
>  ulf> +	$(call insert_define, FILESYSTEM_START, $(BR2_TARGET_UBOOT_FILESYSTEM_START))
>  ulf> +endif
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_FILESYSTEM_LOCATION)),"")
>  ulf> +	$(call insert_define, FILESYSTEM_LOCATION, $(BR2_TARGET_UBOOT_FILESYSTEM_LOCATION))
>  ulf> +endif
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_FILESYSTEM_SIZE)),"")
>  ulf> +	$(call insert_define, FILESYSTEM_SIZE, $(BR2_TARGET_UBOOT_FILESYSTEM_SIZE))
>  ulf> +endif
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_END_OF_FLASH)),"")
>  ulf> +	$(call insert_define, END_OF_FLASH, $(BR2_TARGET_UBOOT_END_OF_FLASH))
>  ulf> +endif
>  ulf> +ifneq ($(strip $(BR2_TARGET_UBOOT_MEMORY_SIZE)),"")
>  ulf> +	$(call insert_define, MEMORY_SIZE, $(BR2_TARGET_UBOOT_MEMORY_SIZE))
>  ulf> +endif
> 
> Huh, that sounds like a very target specific things - And you seem to
> have forgotten to add those config settings to Config.in

I do not think that they are target specific,
Anyone which will boot linux will have a location in SDRAM
where linux is loaded, and there will be a
location in flash where the kernel is stored.
Same for root fs.
They are automatically calculated based on the kernel size
so you do not configure them directly.
Currently this is only supported for dataflash in Config.in
but feel free to add for other memory technologies

> 
>  ulf> -	@echo BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD=$(BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD)
>  ulf> -	@echo BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM=$(BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM)
>  ulf>  	@echo UBOOT_BOARD_NAME=$(UBOOT_BOARD_NAME)
>  ulf>  	@echo TEST=$(TEST)
>  ulf>  	@exit 0
> 
> You still didn't get rid of that TEST thing.
> 
> Please clean up.
> 
