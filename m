From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jan 2020 21:17:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/olsr: use make foreach loops
In-Reply-To: <20200113180856.787063-1-fontaine.fabrice@gmail.com>
References: <20200113180856.787063-1-fontaine.fabrice@gmail.com>
Message-ID: <20200113211754.02aff2c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jan 2020 19:08:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace shell for loops by make foreach loops
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/olsr/olsr.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
> index e643a0cfb3..3533e2a1fd 100644
> --- a/package/olsr/olsr.mk
> +++ b/package/olsr/olsr.mk
> @@ -18,19 +18,19 @@ OLSR_DEPENDENCIES = host-flex host-bison
>  
>  define OLSR_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd
> -	for p in $(OLSR_PLUGINS) ; do \
> -		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D)/lib/$$p ; \
> -	done
> +	$(foreach p,$(OLSR_PLUGINS),

Did you test this? To me, it seems like a backslash is missing at the end of this line.

> +		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D)/lib/$(p)
> +	)
>  endef
>  
>  define OLSR_INSTALL_TARGET_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
>  		prefix="/usr" install_bin
> -	for p in $(OLSR_PLUGINS) ; do \
> -		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/$$p \
> +	$(foreach p,$(OLSR_PLUGINS),

Same here.

> +		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/$(p) \
>  			LDCONFIG=/bin/true DESTDIR=$(TARGET_DIR) \
> -			prefix="/usr" install ; \
> -	done
> +			prefix="/usr" install
> +	)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
