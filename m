From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 2 Sep 2014 21:31:13 +0200
Subject: [Buildroot] [PATCH] Add support for Flattened Image Trees
In-Reply-To: <CAGm1_ktFrnQeNyVpmjHhhXkO8GKhOqij1SbKhexssiFtCj_utw@mail.gmail.com>
References: <1409604784-8156-1-git-send-email-yegorslists@googlemail.com>
 <CAAXf6LUDfWrxabCaGjFVq6mr8w3QbBxEawb5ugRreD6brHwSDA@mail.gmail.com>
 <CAGm1_ktFrnQeNyVpmjHhhXkO8GKhOqij1SbKhexssiFtCj_utw@mail.gmail.com>
Message-ID: <CAGm1_ktr5MGQcFUAys1VSA7MY9OOSANFmTVcosckAyy-i9K_SA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 2, 2014 at 10:35 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Tue, Sep 2, 2014 at 9:54 AM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> Hi Yegor,
>>
>> On Mon, Sep 1, 2014 at 10:53 PM, Yegor Yefremov
>> <yegorslists@googlemail.com> wrote:
>>> This patch provides an option to specify a FIT source
>>> file (*.its), that will usually be stored in a board directory,
>>> and the resulting blob file name (*.itb).
>>>
>>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>>> ---
>>>  linux/Config.in | 21 +++++++++++++++++++++
>>>  linux/linux.mk  | 12 ++++++++++++
>>>  2 files changed, 33 insertions(+)
>>>
>>> diff --git a/linux/Config.in b/linux/Config.in
>>> index 611dcf2..6f28bc0 100644
>>> --- a/linux/Config.in
>>> +++ b/linux/Config.in
>>> @@ -332,6 +332,27 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>>>
>>>  endif
>>>
>>> +config BR2_LINUX_KERNEL_FIT_SUPPORT
>>> +       bool "Flattened Image Tree support"
>>> +       help
>>> +         Compile a flattened image tree source into a lattened
>>
>> lattened -> flattened
>>
>>> +         image tree blob. Select the its file to compile in the
>>
>> To avoid confusion with the English word 'its' I would write it as .its
>>
>>> +         options below.
>>> +
>>> +if BR2_LINUX_KERNEL_FIT_SUPPORT
>>> +
>>> +config BR2_LINUX_KERNEL_FIT_PATH
>>> +       string "Flattened Image Tree Source file path"
>>
>> I would write Source with lower case just like for the blob below.
>>
>>> +       help
>>> +         Path to the image tree tree source files.
>>> +
>>> +config BR2_LINUX_KERNEL_FIT_BLOB_NAME
>>> +       string "Flattened Image Tree blob file name"
>>> +       help
>>> +         File name for the resulting FIT blob.
>>> +
>>> +endif
>>> +
>>>  config BR2_LINUX_KERNEL_INSTALL_TARGET
>>>         bool "Install kernel image to /boot in target"
>>>         depends on !BR2_TARGET_ROOTFS_INITRAMFS
>>> diff --git a/linux/linux.mk b/linux/linux.mk
>>> index 2fb7437..6f1031d 100644
>>> --- a/linux/linux.mk
>>> +++ b/linux/linux.mk
>>> @@ -260,6 +260,16 @@ LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
>>>  endif
>>>  endif
>>>
>>> +ifeq ($(BR2_LINUX_KERNEL_FIT_SUPPORT),y)
>>> +define LINUX_BUILD_ITB
>>> +       cp $(BR2_LINUX_KERNEL_FIT_PATH) $(BINARIES_DIR)
>>> +       mkimage -f $(BINARIES_DIR)/`basename $(BR2_LINUX_KERNEL_FIT_PATH)` $(BINARIES_DIR)/$(BR2_LINUX_KERNEL_FIT_BLOB_NAME)
>>> +endef
>>> +define LINUX_INSTALL_ITB_TARGET
>>> +       cp $(BINARIES_DIR)/$(BR2_LINUX_KERNEL_FIT_BLOB_NAME) $(TARGET_DIR)/boot/
>>> +endef
>>> +endif
>>> +
>>>  # Compilation. We make sure the kernel gets rebuilt when the
>>>  # configuration has changed.
>>>  define LINUX_BUILD_CMDS
>>> @@ -271,6 +281,7 @@ define LINUX_BUILD_CMDS
>>>         fi
>>>         $(LINUX_BUILD_DTB)
>>>         $(LINUX_APPEND_DTB)
>>> +       $(LINUX_BUILD_ITB)
>>>  endef
>>>
>>>
>>> @@ -278,6 +289,7 @@ ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
>>>  define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
>>>         install -m 0644 -D $(LINUX_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
>>>         $(LINUX_INSTALL_DTB_TARGET)
>>> +       $(LINUX_INSTALL_ITB_TARGET)
>>>  endef
>>>  endif
>>>
>>
>> Clearly the above comments are just some quick notices.
>> Overall, I agree with ThomasP that FIT support should not be in
>> linux/. In one of our projects the FIT images contain both the kernel,
>> u-boot, and some text file.
>
> Thanks for review. I will rework the patch and place this option to fs
> image configuration.

I want to cover following use cases:

1. simple FIT image lying in output/images
2. simple FIT image, that will be installed to /boot instead of kernel image
3. FIT image with embedded initramfs (referenced via *.its)
4. FIT image, where initrams is embedded into kernel directly

Any other use cases?

Yegor
