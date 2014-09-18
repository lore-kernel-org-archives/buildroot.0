From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Sep 2014 22:44:43 +0200
Subject: [Buildroot] [PATCH v3] Add support for Flattened Image Trees
In-Reply-To: <1411071224-5386-1-git-send-email-yegorslists@googlemail.com>
References: <1411071224-5386-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20140918224443.63a559eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Thu, 18 Sep 2014 22:13:44 +0200, Yegor Yefremov wrote:

> +config BR2_FIT_PATH
> +	string "Flattened Image Tree source file path"
> +	help
> +	  Path to the image tree source files.

Which files will typically be listed here? Apparently your code assumes
those files must all be located in $(BINARIES_DIR), right? If that's
the case, it should be mentioned here.

Also, I'm worried about ordering: there is no ordering guarantee
between filesystem image types. So if your FIT filesystem image logic
depends on another filesystem image to be generated, this might be an
issue.

Also you say "files" in the description, but your code doesn't seem to
handle multiple "files". Can you explain?

> +ifeq ($(BR2_FIT_INSTALL_TARGET),y)
> +define ROOTFS_FIT_CMD
> +	cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
> +	$(HOST_DIR)/usr/bin/mkimage -f $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_FIT_PATH))) $(BINARIES_DIR)/$(basename $(notdir $(call qstrip,$(BR2_FIT_PATH)))).itb && \
> +	mkdir -p $(TARGET_DIR)/boot/ && \
> +	cp $(BINARIES_DIR)/$(basename $(notdir $(call qstrip,$(BR2_FIT_PATH)))).itb $(TARGET_DIR)/boot/
> +endef
> +else
> +define ROOTFS_FIT_CMD
> +	cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
> +	$(HOST_DIR)/usr/bin/mkimage -f $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_FIT_PATH))) $(BINARIES_DIR)/$(basename $(notdir $(call qstrip,$(BR2_FIT_PATH)))).itb
> +endef
> +endif

Avoid duplication:

ROOTFS_FIT_FILE = $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_FIT_PATH)))
ROOTFS_FIT_ITB_PATH = $(ROOTFS_FIT_FILE).itb

ifeq ($(BR2_FIT_INSTALL_TARGET),y)
define ROOTFS_FIT_INSTALL_TARGET
	mkdir -p $(TARGET_DIR)/boot && cp $(ROOTFS_FIT_ITB_PATH) $(TARGET_DIR)/boot
endef
else
define ROOTFS_FIT_INSTALL_TARGET
	true
endef
endif

define ROOTFS_FIT_CMD
	cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
	$(HOST_DIR)/usr/bin/mkimage -f $(ROOTFS_FILE_FILE) $(ROOTFS_FIT_ITB_PATH) && \
	$(ROOTFS_FIT_INSTALL_TARGET)
endef

But maybe we should change the ROOTFS_TARGET infrastructure to support
multiple commands. There's also maybe the ROOTFS_xyz_POST_TARGETS
mechanism that could be used (I haven't looked whether it applies
properly here).

Can you give an example for the various Config.in options, so that
others could test this and understand better how it's typically used?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
