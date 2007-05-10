From: David Claffey <david.claffey@rcn.com>
Date: Thu, 10 May 2007 11:34:17 -0400
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <46432A7D.6050808@rcn.com>
References: <46432A7D.6050808@rcn.com>
Message-ID: <46433B79.50101@rcn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This actually causes an override of the .patched target in
toolchain/kernel-headers/kernel-headers-new.makefile.

Suggestions?

David Claffey wrote:
> I have a custom kernel patch I want applied when building the 2.6 kernel.  I
> created a device under target/devices with a directory kernel-patches and
> BR2_BOARD_PATH set correctly.  However, the patch is never applied apparently
> because all patches are assumed to be minor kernel version patches.
> 
> In the case when DOWNLOAD_LINUX26_VERSION equals LINUX26_VERSION no patches,
> including custom kernel patches, are applied. My current fix below will change
> the directory name if minor kernel patches are applied, but still allow patches
> in $(BR2_BOARD_PATH)/kernel-patches to be applied.
> 
> Could this cause problem elsewhere in the build?
> 
> Index: target/linux26.mk
> ===================================================================
> --- target/linux26.mk     (revision 18593)
> +++ target/linux26.mk     (working copy)
> @@ -74,11 +74,11 @@
>         mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
>  endif
>         touch $@
> +endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
> 
>  $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
>         toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
>         touch $@
> -endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
> 
>  $(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG)
>         cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
