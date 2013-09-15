From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 15 Sep 2013 15:08:28 -0400
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <20130915205310.06f8af50@skate>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
 <20130915200014.5543b2a1@skate>
 <CANxTyt4GZNTtACwf4W8OCKUBZLf7YfZ=pBM-6KGmgeaf8UCPLg@mail.gmail.com>
 <20130915205310.06f8af50@skate>
Message-ID: <CANxTyt6uuGy0aYis_SG49KjXjoC=sMWMgTEytTMrhGXifimjYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 15, 2013 at 2:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> and Buildroot replaces BR2_ROOTFS_UBIFS_PATH by the proper
> $(O)/images/ubifs.img.
>
> Note that this could also be used in the fs/ubifs/ubinize.cfg file,
> therefore making the default and custom cases more similar:
>
> ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
> UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE))
> else
> UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
> endef
>
> define ROOTFS_UBI_CMD
>         cp $(UBINIZE_CONFIG_FILE_PATH) $(BUILD_DIR)/ubinize.cfg
>         $(SED) 's/BR2_ROOTFS_UBIFS_PATH/$@fs/' $(BUILD_DIR)/ubinize.cfg
>         $(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
>         rm $(BUILD_DIR)/ubinize.cfg
> endef

That does appeal to me; I think that we can combine the cp and the sed
lines as well ...

         $(SED) 's/BR2_ROOTFS_UBIFS_PATH/$@fs/'
$(UBINIZE_CONFIG_FILE_PATH)  >  $(BUILD_DIR)/ubinize.cfg

Cleaner all the way around.  I'll look into it tonight.

Thanks,
Danomi -
