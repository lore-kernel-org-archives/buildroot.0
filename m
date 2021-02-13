From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Feb 2021 11:05:00 +0100
Subject: [Buildroot] [PATCH-NEXT 2/4] package/linux-firmware.mk: get rid
 of temporary tarball for file installation
In-Reply-To: <87a6s8e1w7.fsf@dell.be.48ers.dk>
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-3-peter@korsgaard.com>
 <20210212203939.GK1679218@scaer> <20210212210725.GL1679218@scaer>
 <20210213083538.GN1679218@scaer> <87a6s8e1w7.fsf@dell.be.48ers.dk>
Message-ID: <20210213100500.GQ1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-13 10:46 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > I whipped up something quick during my morning coffee:
>  > https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/linux-fw-rework&id=8dd299681fdf80c284680833175387ac6a428a11
> Ok, that looks good. I see that you dropped the installation macros, so
> how do you suggest to handle the installation to $BINARIES_DIR? Copy the
> entire installation logic?

Ah, this patch is juste a cleanup. It replaces your patch 2.

The idea was that, after this cleanup, you'd adapt your patch 1 n top of
it, with something like:

    diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
    index 9bc59435ef..8defedd309 100644
    --- a/package/linux-firmware/linux-firmware.mk
    +++ b/package/linux-firmware/linux-firmware.mk
    @@ -674,10 +674,10 @@ endif
     # sure we canonicalize the pointed-to file, to cover the symlinks of the form
     # a/foo -> ../b/foo  where a/ (the directory where to put the symlink) does
     # not yet exist.
    -define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
    -	mkdir -p $(TARGET_DIR)/lib/firmware
    -	$(TAR) xf $(@D)/br-firmware.tar -C $(TARGET_DIR)/lib/firmware/
    -	cd $(TARGET_DIR)/lib/firmware/ ; \
    +define LINUX_FIRMWARE_INSTALL_FW
    +	mkdir -p $(1)
    +	$(TAR) xf $(@D)/br-firmware.tar -C $(1)
    +	cd $(1) ; \
     	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
     	while read f d; do \
     		if test -f $$(readlink -m $$(dirname $$f)/$$d); then \
    @@ -687,4 +687,8 @@ define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
     	done
     endef
     
    +define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
    +	$(call LINUX_FIRMWARE_INSTALL_FW, $(TARGET_DIR)/lib/firmware)
    +endef
    +
     $(eval $(generic-package))

And then your patch 3 look like:

    diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
    index 9bc59435ef..8defedd309 100644
    --- a/package/linux-firmware/linux-firmware.mk
    +++ b/package/linux-firmware/linux-firmware.mk
    @@ -691,4 +691,8 @@ define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
     	$(call LINUX_FIRMWARE_INSTALL_FW, $(TARGET_DIR)/lib/firmware)
     endef
     
    +define LINUX_FIRMWARE_INSTALL_IMAGES_CMDS
    +	$(call LINUX_FIRMWARE_INSTALL_FW, $(BINARIES_DIR)/linux-firmware)
    +endef
    +
     $(eval $(generic-package))

And then your final patch 4.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
