From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 23:13:13 +0100
Subject: [Buildroot] [PATCH] linux: Support multiple device tree build
In-Reply-To: <1355742312-25258-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1355742312-25258-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <50CF98F9.8030602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 12:05, Maxime Ripard wrote:
> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
> ---
>   linux/linux.mk |    6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c4bdf90..c7d0099 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -187,10 +187,12 @@ endef
>   ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
>   ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
>   define LINUX_BUILD_DTB
> -	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) \
> +		$(foreach dtbfile, $(call qstrip, $(KERNEL_DTS_NAME)), $(dtbfile).dtb)

  I would personally prefer
$(addsuffix .dtb,$(call qstrip,$(KERNEL_DTS_NAME)))

>   endef
>   define LINUX_INSTALL_DTB
> -	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
> +	$(foreach dtbfile, $(call qstrip, $(KERNEL_DTS_NAME)),
> +		cp $(KERNEL_ARCH_PATH)/boot/$(dtbfile).dtb $(BINARIES_DIR)/)

  Does this work? I would expect you need a $(sep) or ; between the cp 
statements...

  But since it's a cp (not an install), you can put the foreach inside 
the cp.


  Regards,
  Arnout

>   endef
>   endif
>   endif


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
