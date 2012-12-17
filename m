From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 17 Dec 2012 13:12:22 +0200
Subject: [Buildroot] [PATCH] linux: Support multiple device tree build
In-Reply-To: <1355742312-25258-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1355742312-25258-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20121217111221.GC32494@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Mon, Dec 17, 2012 at 12:05:12PM +0100, Maxime Ripard wrote:
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  linux/linux.mk |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c4bdf90..c7d0099 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -187,10 +187,12 @@ endef
>  ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
>  ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
>  define LINUX_BUILD_DTB
> -	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) \
> +		$(foreach dtbfile, $(call qstrip, $(KERNEL_DTS_NAME)), $(dtbfile).dtb)
>  endef
>  define LINUX_INSTALL_DTB
> -	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
> +	$(foreach dtbfile, $(call qstrip, $(KERNEL_DTS_NAME)),
> +		cp $(KERNEL_ARCH_PATH)/boot/$(dtbfile).dtb $(BINARIES_DIR)/)
>  endef
>  endif
>  endif

Please update the comment and help text in the 
BR2_LINUX_KERNEL_INTREE_DTS_NAME config option as well.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
