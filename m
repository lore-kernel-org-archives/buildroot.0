From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 09:15:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add missing
 symlinks
In-Reply-To: <20200227154354.98663-1-james.hilliard1@gmail.com>
References: <20200227154354.98663-1-james.hilliard1@gmail.com>
Message-ID: <20200301081526.GE8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-27 08:43 -0700, James Hilliard spake thusly:
> As of upstream commit 9cfefbd7fbdaa5ae769e3061c463f8345d146fb7
> we must manually create symlinks as they are no longer present
> in the archive but created at installation.

So, as I said, I've applied this to master, for the imminent release.

However, long term, I think we should switch to using the WHENCE file as
source for the symlinks. Something like:

    LINUX_FIRMWARE_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY)

    define LINUX_FIRMWARE_INSTALL_SYMLINKS
        $(foreach file,$(LINUX_FIRMWARE_FILES),\
            sed -r -e '/^Link: $(file) -> (.+)$/!d; s//\1/' $(@D)/WHENCE \
            |while read link; do \
                ln -sf --relative $(TARGET_DIR)/lib/firmware/$(file) \
                    $(TARGET_DIR)/lib/firmware/$(dir $(file))/$${link} || exit 1; \
            done$(sep))
    endef


Note: totally untested, and known to break when the link has a sub-dir
component, like:

    Link: netronome/nic_AMDA0096-0001_2x10.nffw -> nic/nic_AMDA0096-0001_2x10.nffw).

Care to have a look, please?

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/linux-firmware/linux-firmware.mk | 57 ++++++++++++++++++------
>  1 file changed, 43 insertions(+), 14 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index fd90f261fa..3ced155e69 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -71,9 +71,13 @@ endif
>  
>  # rt2xx
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX),y)
> -# rt3090.bin is a symlink to rt2860.bin
> -# rt3070.bin is a symlink to rt2870.bin
> -LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin
> +define LINUX_FIRMWARE_INSTALL_RALINK_RT2XX_SYMLINKS
> +	ln -sf rt2860.bin \
> +		$(TARGET_DIR)/lib/firmware/rt3090.bin
> +	ln -sf rt2870.bin \
> +		$(TARGET_DIR)/lib/firmware/rt3070.bin
> +endef
> +LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt3071.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
>  endif
>  
> @@ -214,8 +218,13 @@ endif
>  
>  # sd8688
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688),y)
> -LINUX_FIRMWARE_FILES += libertas/sd8688.bin libertas/sd8688_helper.bin
> -# The two files above are but symlinks to those two ones:
> +define LINUX_FIRMWARE_INSTALL_LIBERTAS_SD8688_SYMLINKS
> +	mkdir -p $(TARGET_DIR)/lib/firmware/libertas
> +	ln -sf ../mrvl/sd8688.bin \
> +		$(TARGET_DIR)/lib/firmware/libertas/sd8688.bin
> +	ln -sf ../mrvl/sd8688_helper.bin \
> +		$(TARGET_DIR)/lib/firmware/libertas/sd8688_helper.bin
> +endef
>  LINUX_FIRMWARE_FILES += mrvl/sd8688.bin mrvl/sd8688_helper.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
>  endif
> @@ -320,12 +329,14 @@ endif
>  
>  # wl127x
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
> -# wl1271-nvs.bin is a symlink to wl127x-nvs.bin
> +define LINUX_FIRMWARE_INSTALL_TI_WL127X_SYMLINKS
> +	ln -sf wl127x-nvs.bin \
> +		$(TARGET_DIR)/lib/firmware/ti-connectivity/wl1271-nvs.bin
> +endef
>  LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl1271-fw-2.bin \
>  	ti-connectivity/wl1271-fw-ap.bin \
>  	ti-connectivity/wl1271-fw.bin \
> -	ti-connectivity/wl1271-nvs.bin \
>  	ti-connectivity/wl127x-fw-3.bin \
>  	ti-connectivity/wl127x-fw-plt-3.bin \
>  	ti-connectivity/wl127x-nvs.bin \
> @@ -341,15 +352,18 @@ endif
>  
>  # wl128x
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X),y)
> -# wl1271-nvs.bin and wl12xx-nvs.bin are symlinks to wl127x-nvs.bin
> +define LINUX_FIRMWARE_INSTALL_TI_WL128X_SYMLINKS
> +	ln -sf wl127x-nvs.bin \
> +		$(TARGET_DIR)/lib/firmware/ti-connectivity/wl1271-nvs.bin
> +	ln -sf wl127x-nvs.bin \
> +		$(TARGET_DIR)/lib/firmware/ti-connectivity/wl12xx-nvs.bin
> +endef
>  LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl128x-fw-3.bin \
>  	ti-connectivity/wl128x-fw-ap.bin \
>  	ti-connectivity/wl128x-fw-plt-3.bin \
>  	ti-connectivity/wl128x-fw.bin \
> -	ti-connectivity/wl1271-nvs.bin \
>  	ti-connectivity/wl128x-nvs.bin \
> -	ti-connectivity/wl12xx-nvs.bin \
>  	ti-connectivity/wl127x-nvs.bin \
>  	ti-connectivity/wl128x-fw-4-mr.bin \
>  	ti-connectivity/wl128x-fw-4-plt.bin \
> @@ -363,13 +377,15 @@ endif
>  
>  # wl18xx
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX),y)
> -# wl1271-nvs.bin is a symlink to wl127x-nvs.bin
> +define LINUX_FIRMWARE_INSTALL_TI_WL18XX_SYMLINKS
> +	ln -sf wl127x-nvs.bin \
> +		$(TARGET_DIR)/lib/firmware/ti-connectivity/wl1271-nvs.bin
> +endef
>  LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl18xx-fw.bin \
>  	ti-connectivity/wl18xx-fw-2.bin \
>  	ti-connectivity/wl18xx-fw-3.bin \
>  	ti-connectivity/wl18xx-fw-4.bin \
> -	ti-connectivity/wl1271-nvs.bin \
>  	ti-connectivity/wl127x-nvs.bin \
>  	ti-connectivity/TIInit_7.2.31.bts
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
> @@ -563,8 +579,11 @@ LINUX_FIRMWARE_FILES += \
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC),y)
> -# qat_mmp.bin is a symlink to qat_895xcc_mmp.bin
> -LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin qat_mmp.bin
> +define LINUX_FIRMWARE_INSTALL_QAT_DH895XCC_SYMLINKS
> +	ln -sf qat_895xcc_mmp.bin \
> +		$(TARGET_DIR)/lib/firmware/qat_mmp.bin
> +endef
> +LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
>  endif
>  
> @@ -597,6 +616,15 @@ define LINUX_FIRMWARE_INSTALL_DIRS
>  endef
>  endif
>  
> +define LINUX_FIRMWARE_INSTALL_SYMLINKS
> +	$(LINUX_FIRMWARE_INSTALL_RALINK_RT2XX_SYMLINKS)
> +	$(LINUX_FIRMWARE_INSTALL_LIBERTAS_SD8688_SYMLINKS)
> +	$(LINUX_FIRMWARE_INSTALL_TI_WL127X_SYMLINKS)
> +	$(LINUX_FIRMWARE_INSTALL_TI_WL128X_SYMLINKS)
> +	$(LINUX_FIRMWARE_INSTALL_TI_WL18XX_SYMLINKS)
> +	$(LINUX_FIRMWARE_INSTALL_QAT_DH895XCC_SYMLINKS)
> +endef
> +
>  ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
>  
>  # Most firmware files are under a proprietary license, so no need to
> @@ -619,6 +647,7 @@ define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/lib/firmware
>  	$(LINUX_FIRMWARE_INSTALL_FILES)
>  	$(LINUX_FIRMWARE_INSTALL_DIRS)
> +	$(LINUX_FIRMWARE_INSTALL_SYMLINKS)
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
