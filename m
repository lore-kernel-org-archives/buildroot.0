From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 23:14:36 +0200
Subject: [Buildroot] [PATCH 1/1] RTAI updated to version 4.0.1 and bug
 fix so kernel gets patched cleanly
In-Reply-To: <1424790794-5707-1-git-send-email-Matthew.Bastian@nrc-cnrc.gc.ca>
References: <1424790794-5707-1-git-send-email-Matthew.Bastian@nrc-cnrc.gc.ca>
Message-ID: <20150421231436.40331fbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Bastian,

On Tue, 24 Feb 2015 10:13:14 -0500, Matthew Bastian wrote:
> From: Matthew Bastian <mbastian@zaphod.ds.nrc.ca>
> 
> Signed-off-by: Matthew Bastian <Matthew.Bastian@nrc-cnrc.gc.ca>

I've applied your patch, but did some additional changes to it, see
below.

> diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
> index bf998d5..2631535 100644
> --- a/linux/linux-ext-rtai.mk
> +++ b/linux/linux-ext-rtai.mk
> @@ -20,14 +20,15 @@ else
>  RTAI_ARCH = $(KERNEL_ARCH)
>  endif
>  
> +kver = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion`
> +
>  # Prepare kernel patch
>  ifeq ($(RTAI_PATCH),)
>  define RTAI_PREPARE_KERNEL
> -	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
> -	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
> +	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$(kver)-*patch ; then \
>  		$(APPLY_PATCHES) $(LINUX_DIR)		 		\
> -			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ 	\
> -			hal-linux-$${kver}-*patch ; \
> +			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches \
> +				hal-linux-$(kver)-*patch ; \
>  	else \
>  		echo "No RTAI patch for your kernel version" ; \
>  		exit 1 ; \

These changes seemed to not be necessary. The RTAI patch applied just
fine with the existing code. If you really think there is a problem
here, please give a more detailed description, but for now, I've
applied your patch without this part.

> diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
> index 6f94121..dfd8e0c 100644
> --- a/package/rtai/rtai.mk
> +++ b/package/rtai/rtai.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTAI_VERSION = 3.8.1
> +RTAI_VERSION = 4.0.1
>  RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
>  RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
>  RTAI_INSTALL_STAGING = YES
> @@ -22,6 +22,8 @@ RTAI_CONF_OPTS = \
>  	--includedir=/usr/include/rtai \
>  	--with-linux-dir=$(LINUX_DIR) 	\
>  	--disable-leds		      	\
> +	--enable-usi			\
> +	--enable-align-priority		\
>  	--disable-rtailab		\
>  	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/rtai

I've applied this part.

Also, there is a RTAI 4.1 version. Could you look at sending a patch to
use this version instead? It has some patches for much more recent
kernel versions on x86.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
