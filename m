From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2012 18:35:03 +0100
Subject: [Buildroot] [PATCH] Add support for dtb file in /boot directory
 on target
In-Reply-To: <CAEnpE0x7wD8R4WSyt_Sk7fSFb8Z2vq2G+te1pdLe+=ihbi3rQA@mail.gmail.com>
References: <CAEnpE0x7wD8R4WSyt_Sk7fSFb8Z2vq2G+te1pdLe+=ihbi3rQA@mail.gmail.com>
Message-ID: <50D0A947.5090107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/12 22:43, Gary Coulbourne wrote:
> Howdy!
>
> I'm using u-boot, and loading both the kernel image and the dtb from
> /boot on my target.  I added support for this, and am
> submitting the patch should it be useful to anyone else.

  Hi Gary,

  Could you also resend this patch with git send-email? (See its man page 
for how to configure it for gmail.)


> ---
>   linux/Config.in |    6 ++++++
>   linux/linux.mk <http://linux.mk>  |    7 +++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index f408ad5..d5ffa57 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -283,6 +283,12 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
>            /boot in the target root filesystem, as is typically done on
>            x86/x86_64 systems.
> +config BR2_LINUX_DEVICE_TREE_INSTALL_TARGET
> +        bool "Install Device Tree to /boot in target"

  Perhaps the whitespace is correct and gmail ate it, but just to be sure:
indentation should be one tab.

  However, does it make sense to have this as a separate config option? 
Isn't it better to do this automatically when 
BR2_LINUX_KERNEL_INSTALL_TARGET is set? (Unless 
BR2_LINUX_KERNEL_APPENDED_DTB is set as well, of course.)

  Or are there use cases where you want the DTB in /boot, but not the 
kernel image?

> +        depends on BR2_LINUX_KERNEL_DTS_SUPPORT
> +       help
> +         Select this option to have the device tree installed to
> +          /boot in the target root filesystem.
>   # Linux extensions
>   source "linux/Config.ext.in <http://Config.ext.in>"
> diff --git a/linux/linux.mk <http://linux.mk> b/linux/linux.mk
> <http://linux.mk>
> index c4bdf90..8778c35 100644
> --- a/linux/linux.mk <http://linux.mk>
> +++ b/linux/linux.mk <http://linux.mk>
> @@ -208,6 +208,12 @@ define LINUX_APPEND_DTB
>   endef
>   endif
> +ifeq ($(BR2_LINUX_DEVICE_TREE_INSTALL_TARGET),y)
> +define LINUX_DEVICE_TREE_INSTALL_TARGET
> +       install -m 0644 -D
> $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb
> $(TARGET_DIR)/boot/$(KERNEL_DTS_NAME).dtb
> +endef
> +endif
> +
>   # Compilation. We make sure the kernel gets rebuilt when the
>   # configuration has changed.
>   define LINUX_BUILD_CMDS
> @@ -244,6 +250,7 @@ endef
>   define LINUX_INSTALL_TARGET_CMDS
>          $(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
>          $(LINUX_INSTALL_DTB)
> +       $(LINUX_DEVICE_TREE_INSTALL_TARGET)

  I would call it LINUX_INSTALL_DTB_TO_TARGET, parallel to the 
LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET.


  Regards,
  Arnout

>          # Install modules and remove symbolic links pointing to build
>          # directories, not relevant on the target
>          @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then      \


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
