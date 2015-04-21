From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 00:02:28 +0200
Subject: [Buildroot] [PATCH] rtai: remove option
 BR2_LINUX_KERNEL_EXT_RTAI_PATCH
In-Reply-To: <1429652188-11586-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429652188-11586-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150421220228.GE4262@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-21 23:36 +0200, Thomas Petazzoni spake thusly:
> This commit removes BR2_LINUX_KERNEL_EXT_RTAI_PATCH because this
> option never worked. It was added in commit
> 8797a9cd1fe6723db34b0c125d0d9d04e3483e8d, which added package/rtai/
> and RTAI as a Linux extension.
> 
> The option prompt says "Path for RTAI patch file", so let's say you
> specify /home/foo/bar/myrtai.patch as the value for
> BR2_LINUX_KERNEL_EXT_RTAI_PATCH.
> 
> Then the code does:
> 
> RTAI_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_RTAI_PATCH))
> 
> and we have a package called 'rtai', so the normal logic of
> <pkg>_PATCH applies. Since the <pkg>_PATCH value does not contain
> ftp://, http:// or https://, the package infrastructure will try to
> download $(RTAI_SITE)/$(RTAI_PATCH), i.e:
> 
>    https://www.rtai.org/userfiles/downloads/RTAI/home/foo/bar/myrtai.patch
> 
> Pretty clear that it has no chance of working.
> 
> Now, let's assume an URL is used as the value of
> BR2_LINUX_KERNEL_EXT_RTAI_PATCH, such as
> http://foo.com/bar/myrtai.patch. In this case, it will be properly
> downloaded by the package infrastructure. But then, the following code
> kicks in:
> 
> define RTAI_PREPARE_KERNEL
>        $(APPLY_PATCHES)                        \
>                $(LINUX_DIR)                    \
>                $(dir $(RTAI_PATCH))            \
>                $(notdir $(RTAI_PATCH))
> endef
> 
> The value of $(dir $(RTAI_PATCH)) will be http://foo.com/bar/. How
> can $(APPLY_PATCHES) make use of such a stupid patch location?
> 
> Bottom line is that this feature has never worked, so there is not
> even a point in adding Config.in.legacy support for it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  linux/Config.ext.in     |  6 ------
>  linux/linux-ext-rtai.mk | 11 -----------
>  2 files changed, 17 deletions(-)
> 
> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index c909254..ea79aa1 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -44,12 +44,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
>  	help
>  	  RTAI Kernel part.
>  
> -config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
> -	depends on BR2_LINUX_KERNEL_EXT_RTAI
> -	string "Path for RTAI patch file"
> -	help
> -	  Optionally, explicitly specify the RTAI patch to use.
> -
>  # fbtft
>  config BR2_LINUX_KERNEL_EXT_FBTFT
>  	bool "FB TFT drivers"
> diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
> index 07e7a19..0cc1232 100644
> --- a/linux/linux-ext-rtai.mk
> +++ b/linux/linux-ext-rtai.mk
> @@ -6,8 +6,6 @@
>  
>  LINUX_EXTENSIONS += rtai
>  
> -RTAI_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_RTAI_PATCH))
> -
>  ifeq ($(KERNEL_ARCH),i386)
>  RTAI_ARCH = x86
>  else ifeq ($(KERNEL_ARCH),x86_64)
> @@ -19,7 +17,6 @@ RTAI_ARCH = $(KERNEL_ARCH)
>  endif
>  
>  # Prepare kernel patch
> -ifeq ($(RTAI_PATCH),)
>  define RTAI_PREPARE_KERNEL
>  	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
>  	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
> @@ -31,11 +28,3 @@ define RTAI_PREPARE_KERNEL
>  		exit 1 ; \
>  	fi
>  endef
> -else
> -define RTAI_PREPARE_KERNEL
> -	$(APPLY_PATCHES) 			\
> -		$(LINUX_DIR)			\
> -		$(dir $(RTAI_PATCH))		\
> -		$(notdir $(RTAI_PATCH))
> -endef
> -endif
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
