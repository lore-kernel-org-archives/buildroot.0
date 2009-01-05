From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 05 Jan 2009 19:12:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <20090105161237.034D977404@busybox.osuosl.org>
References: <20090105161237.034D977404@busybox.osuosl.org>
Message-ID: <1231179121.8886.225.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-05 klockan 16:12 +0000 skrev jacmet at uclibc.org:
> Author: jacmet
> Date: 2009-01-05 16:12:34 +0000 (Mon, 05 Jan 2009)
> New Revision: 24693
> 
> Log:
> u-boot: revert U_BOOT_TARGET part of r24646
> 
> More u-boot build unbreaking. r24646 added U_BOOT_TARGET which uses the
> nonexisting BOARDNAME variable, which means that the filename expands
> to -u-boot-*, confusing ln.
> 
> There's limited point in having that symlink in the first please, so simply
> revert that hunk.
>

If you have a script that needs the filename u-boot.bin
then it make sense.

> Modified:
>    trunk/buildroot/target/u-boot/Makefile.in
> 
> 

The "complex" file name is needed, unless you only
work with a single board.

We obviously need to find  a way that does not break the build of
course.

Many targets define BR2_BOARD_NAME in their Config.in's
and it may make sense to have a common BR2_BOARD_NAME
Then it will be always be defined.
Default to "uclibc" is probably OK.


> Changeset:
> Modified: trunk/buildroot/target/u-boot/Makefile.in
> ===================================================================
> --- trunk/buildroot/target/u-boot/Makefile.in	2009-01-05 15:52:44 UTC (rev 24692)
> +++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-05 16:12:34 UTC (rev 24693)
> @@ -14,7 +14,6 @@
>  U_BOOT_PATCH_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
>  U_BOOT_CAT:=$(BZCAT)
>  U_BOOT_BIN:=u-boot.bin
> -U_BOOT_TARGET:=$(BOARD_NAME)-u-boot-$(U_BOOT_VERSION)-$(DATE).bin
>  U_BOOT_TOOLS_BIN:=mkimage
>  U_BOOT_TOOLS:=$(STAGING_DIR)/usr/bin/$(U_BOOT_TOOLS_BIN)
>  MKIMAGE:=$(U_BOOT_TOOLS)
> @@ -179,10 +178,8 @@
>  		 -C $(U_BOOT_DIR)
>  
>  $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
> -	rm -f $(BINARIES_DIR)/$(U_BOOT_TARGET)
>  	rm -f $(BINARIES_DIR)/$(U_BOOT_BIN)
> -	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/$(U_BOOT_TARGET)
> -	(cd $(BINARIES_DIR); ln -s $(U_BOOT_TARGET) $(U_BOOT_BIN)) 
> +	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)
>  
>  $(U_BOOT_TOOLS):	$(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN)
>  	cp -dpf $(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN) $(STAGING_DIR)/usr/bin/
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
