From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Dec 2012 09:21:23 +0100
Subject: [Buildroot] [PATCH] dtb: provide option to install dtb to boot
	directory
In-Reply-To: <1356042147-1532-1-git-send-email-bear@bears.org> (Gary
 Coulbourne's message of "Thu, 20 Dec 2012 17:22:27 -0500")
References: <1356042147-1532-1-git-send-email-bear@bears.org>
Message-ID: <87623vyfwc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Coulbourne <bear@bears.org> writes:

 Gary> Signed-off-by: Gary Coulbourne <bear@bears.org>
 Gary> ---
 Gary>  linux/Config.in |    6 ++++++
 Gary>  linux/linux.mk  |    7 +++++++
 Gary>  2 files changed, 13 insertions(+)

 Gary> diff --git a/linux/Config.in b/linux/Config.in
 Gary> index 9ebe0c9..8918297 100644
 Gary> --- a/linux/Config.in
 Gary> +++ b/linux/Config.in
 Gary> @@ -284,6 +284,12 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 Gary>  	  /boot in the target root filesystem, as is typically done on
 Gary>  	  x86/x86_64 systems.
 
 Gary> +config BR2_LINUX_DEVICE_TREE_INSTALL_TARGET
 Gary> +	bool "Install Device Tree to /boot in target"
 Gary> +	depends on BR2_LINUX_KERNEL_DTS_SUPPORT
 Gary> +	help
 Gary> +	  Select this option to have the device tree installed to
 Gary> +	  /boot in the target root filesystem.
 
 Gary>  # Linux extensions
 Gary>  source "linux/Config.ext.in"
 Gary> diff --git a/linux/linux.mk b/linux/linux.mk
 Gary> index 3321d80..6d8c752 100644
 Gary> --- a/linux/linux.mk
 Gary> +++ b/linux/linux.mk
 Gary> @@ -211,6 +211,12 @@ define LINUX_APPEND_DTB
 Gary>  endef
 Gary>  endif
 
 Gary> +ifeq ($(BR2_LINUX_DEVICE_TREE_INSTALL_TARGET),y)
 Gary> +define LINUX_INSTALL_DTB_TO_TARGET
 Gary> +	install -m 0644 -D $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(TARGET_DIR)/boot/$(KERNEL_DTS_NAME).dtb

I've just pushed two changes to support the new dtb location since
3.8-rc1, and I committed Maxime's 'Support multiple device tree build'
patch yesterday, care to rebase against that and update the logic so it
can handle multiple .dtb files?

Thanks.

-- 
Bye, Peter Korsgaard
