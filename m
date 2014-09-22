From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Sep 2014 14:56:57 +0200
Subject: [Buildroot] [PATCH v3] Add support for Flattened Image Trees
In-Reply-To: <20140918224443.63a559eb@free-electrons.com>
References: <1411071224-5386-1-git-send-email-yegorslists@googlemail.com>
 <20140918224443.63a559eb@free-electrons.com>
Message-ID: <CAGm1_kuKoNW7Gg9pc-gSB65=uNZ3HnGeF+SyLtidGKehHj68aA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 18, 2014 at 10:44 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Thu, 18 Sep 2014 22:13:44 +0200, Yegor Yefremov wrote:
>
>> +config BR2_FIT_PATH
>> +     string "Flattened Image Tree source file path"
>> +     help
>> +       Path to the image tree source files.
>
> Which files will typically be listed here? Apparently your code assumes
> those files must all be located in $(BINARIES_DIR), right? If that's
> the case, it should be mentioned here.

*.its files can be anywhere, but will be copied to $(BINARIES_DIR) to
overcome mkimage/dtb compiler path issues (mkimage invokes dtb
compiler at *.its location, so working directory changes).

> Also, I'm worried about ordering: there is no ordering guarantee
> between filesystem image types. So if your FIT filesystem image logic
> depends on another filesystem image to be generated, this might be an
> issue.

This is the crucial moment. For me there are basically following cases:

1.  create an image consisting of zImage + DTB and install it to boot
- in this case FIT must be invoked before file system packaging
2. create an image having cpio inside - in this case FIT must be the
last action taken in fs stuff or at least after cpio archive is
packaged
3. create an image with appended cpio as initramfs - in this case FIT
must be invoked after cpio is embedded into kernel

What would be the best strategy to implement these cases?

> Also you say "files" in the description, but your code doesn't seem to
> handle multiple "files". Can you explain?

See v4

>> +ifeq ($(BR2_FIT_INSTALL_TARGET),y)
>> +define ROOTFS_FIT_CMD
>> +     cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
>> +     $(HOST_DIR)/usr/bin/mkimage -f $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_FIT_PATH))) $(BINARIES_DIR)/$(basename $(notdir $(call qstrip,$(BR2_FIT_PATH)))).itb && \
>> +     mkdir -p $(TARGET_DIR)/boot/ && \
>> +     cp $(BINARIES_DIR)/$(basename $(notdir $(call qstrip,$(BR2_FIT_PATH)))).itb $(TARGET_DIR)/boot/
>> +endef
>> +else
>> +define ROOTFS_FIT_CMD
>> +     cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
>> +     $(HOST_DIR)/usr/bin/mkimage -f $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_FIT_PATH))) $(BINARIES_DIR)/$(basename $(notdir $(call qstrip,$(BR2_FIT_PATH)))).itb
>> +endef
>> +endif
>
> Avoid duplication:
>
> ROOTFS_FIT_FILE = $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_FIT_PATH)))
> ROOTFS_FIT_ITB_PATH = $(ROOTFS_FIT_FILE).itb
>
> ifeq ($(BR2_FIT_INSTALL_TARGET),y)
> define ROOTFS_FIT_INSTALL_TARGET
>         mkdir -p $(TARGET_DIR)/boot && cp $(ROOTFS_FIT_ITB_PATH) $(TARGET_DIR)/boot
> endef
> else
> define ROOTFS_FIT_INSTALL_TARGET
>         true
> endef
> endif
>
> define ROOTFS_FIT_CMD
>         cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
>         $(HOST_DIR)/usr/bin/mkimage -f $(ROOTFS_FILE_FILE) $(ROOTFS_FIT_ITB_PATH) && \
>         $(ROOTFS_FIT_INSTALL_TARGET)
> endef

Fixed so far in v4.

> But maybe we should change the ROOTFS_TARGET infrastructure to support
> multiple commands. There's also maybe the ROOTFS_xyz_POST_TARGETS
> mechanism that could be used (I haven't looked whether it applies
> properly here).
>
> Can you give an example for the various Config.in options, so that
> others could test this and understand better how it's typically used?

I think now the approach is straight forward: you specify one or more
*.its files and you get *.itb files. The only option so far is to
install *.itbs into /boot/ or not.

Yegor
