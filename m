From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 May 2014 18:47:23 +0200
Subject: [Buildroot] [RFC/PATCH] linux: add external initramfs options
In-Reply-To: <1401138097-11024-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1401138097-11024-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <5386131B.6090809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Guido,

 Thanks for your patch. However, I don't think it is appropriate. See my
comments below.

On 26/05/14 23:01, Guido Mart?nez wrote:
> This patch allows building the kernel with an external initramfs. This
> is useful in cases where one wants to generate the kernel and rootfs
> with BR, and the kernel needs to contain an initramfs different to the
> rootfs.

 In that case, don't you typically want to copy part of the rootfs in the
initramfs? Of course, it's possible to do that with a post-build script, but if
we add a feature like this to buildroot, I think the copying part should be
included.

> 
> The path specified can be a cpio archive or a directory, just like
> the kernel config. The path is specified w.r.t. BRs topdir, and made
> absolute since the kernel builds in another directory.

 This patch does nothing more than update the kernel config. Since you can
already supply a custom kernel config, I don't think there is much added value
to moving these options to the buildroot config.

 The only feature you add is that the patch can be relative to the buildroot
directory. Not enough to be relevant, IMHO, especially since the patch adds
non-negligible complexity.

> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
> Hi,
> 
> I'm marking this as RFC because I don't particularly like what I wrote
> to detect if the path is relative, but I found no other way.

 There is a very easy way:
$(abspath $(call qstrip,$(BR2_LINUX_KERNEL_INITRAMFS_SOURCE)))

this will evaluate the path relative to the buildroot directly. It will also
expand ~ I think (but I'm not sure, possibly you need to use wildcard for that).

[snip]
>  define LINUX_CONFIGURE_CMDS
>  	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>  	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
> +	$(if $(BR2_LINUX_KERNEL_EXTERNAL_INITRAMFS),
> +		$(call LINUX_CONFIGURE_INITRAMFS))

 You don't need a $(call ...) here.


 Regards,
 Arnout


>  	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>  	$(if $(BR2_arm)$(BR2_armeb),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
