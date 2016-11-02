From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 22:45:02 +0100
Subject: [Buildroot] [PATCH] linux/linux-ext-fbtft: remove unnecessary ;
 \
In-Reply-To: <1478121182-17011-1-git-send-email-david@lechnology.com>
References: <1478121182-17011-1-git-send-email-david@lechnology.com>
Message-ID: <20161102224502.4e5c3d3b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Nov 2016 16:13:02 -0500, David Lechner wrote:
> The makefile has some unnecessary instances of ; \ at the end of the lines,
> so remove them to make code a bit more readable.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  linux/linux-ext-fbtft.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
> index 5eb3d94..64e65a1 100644
> --- a/linux/linux-ext-fbtft.mk
> +++ b/linux/linux-ext-fbtft.mk
> @@ -13,10 +13,10 @@ define FBTFT_PREPARE_KERNEL
>  		dest=drivers/video/fbdev ; \
>  	else \
>  		dest=drivers/video ; \
> -	fi ; \
> -	mkdir -p $(LINUX_DIR)/$${dest}/fbtft; \
> -	cp -dpfr $(FBTFT_DIR)/* $(LINUX_DIR)/$${dest}/fbtft/ ; \
> +	fi
> +	mkdir -p $(LINUX_DIR)/$${dest}/fbtft
> +	cp -dpfr $(FBTFT_DIR)/* $(LINUX_DIR)/$${dest}/fbtft/
>  	echo "source \"$${dest}/fbtft/Kconfig\"" \
> -		>> $(LINUX_DIR)/$${dest}/Kconfig ; \  
> +		>> $(LINUX_DIR)/$${dest}/Kconfig

Did you test this? It won't work. Indeed in this case, you are sharing
a shell variable between multiple commands, so they must be a single
shell command.

It can however probably be rewritten in make like this:

define FBTFT_PREPARE_KERNEL_INNER
	mkdir -p $(LINUX_DIR)/$(1)/fbtft
	cp -dpfr $(FBTFT_DIR)/* $(LINUX_DIR)/$(1)/fbtft/
	echo "source \"$(1)/fbtft/Kconfig\"" \
		>> $(LINUX_DIR)/$(1)/Kconfig
	echo 'obj-y += fbtft/' >> $(LINUX_DIR)/$(1)/Makefile
endef

define FBTFT_PREPARE_KERNEL
	$(if $(wildcard $(LINUX_DIR)/drivers/video/fbdev), \
		$(call FBTFT_PREPARE_KERNEL_INNER,drivers/video/fbdev), \
		$(call FBTFT_PREPARE_KERNEL_INNER,drivers/video/) \
	)
endef

However, I am not sure it is really more readable.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
