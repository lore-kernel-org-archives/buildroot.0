From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Jan 2019 13:49:21 +0100
Subject: [Buildroot] linux-firmware package : files not copied to
 TARGET_DIR
In-Reply-To: <c5319275-53e0-f7df-3fdb-a9699160bd1f@gmx.com>
References: <c5319275-53e0-f7df-3fdb-a9699160bd1f@gmx.com>
Message-ID: <20190108134921.26e793a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Tue, 8 Jan 2019 10:43:05 +0100, David Picard wrote:

> The linux-firmware package builds OK. But I have to manually copy the 
> binary blob required by the driver to $TARGET/lib/firmware.

The linux-firmware package is definitely installing files to
$(TARGET_DIR):

ifneq ($(LINUX_FIRMWARE_FILES),)
define LINUX_FIRMWARE_INSTALL_FILES
        cd $(@D) && \
                $(TAR) cf install.tar $(sort $(LINUX_FIRMWARE_FILES)) && \
                $(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware
endef
endif

ifneq ($(LINUX_FIRMWARE_DIRS),)
# We need to rm-rf the destination directory to avoid copying
# into it in itself, should we re-install the package.
define LINUX_FIRMWARE_INSTALL_DIRS
        $(foreach d,$(LINUX_FIRMWARE_DIRS), \
                rm -rf $(TARGET_DIR)/lib/firmware/$(d); \
                mkdir -p $(dir $(TARGET_DIR)/lib/firmware/$(d)); \
                cp -a $(@D)/$(d) $(TARGET_DIR)/lib/firmware/$(d)$(sep))
endef
endif

Could you describe in more details what you are seeing ? Which
configuration are you using ? Could you post the build log of the
linux-firmware package in your situation ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
