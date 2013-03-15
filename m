From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Fri, 15 Mar 2013 11:08:19 +1100
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: do not depend on
	the top-level Buildroot's .config
References: <1363286650-11208-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A62@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Fri, 15 Mar 2013 at 05:44:10, Yann E. MORIN wrote:

> Previously, the crosstool-NG backend did depend on the top-level
> Buildroot's .config to detect changes in the toolchain options, using
a
> tentatively-clever heuristic, which also included the full Buildroot's
> version string to push down to set the components' versions strings.
>
> (...)
>
> -
> -$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(BUILDROOT_CONFIG)
> +$(CTNG_DIR)/.config:
>  	$(Q)if [ ! -f $@ ]; then
\
>  	        mkdir -p "$(CTNG_DIR)";
\
>  	        libc="$$(awk -F '"' '$$1=="CT_LIBC=" { print $$2; }'
"$<")";            \
> @@ -383,11 +380,8 @@ $(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE)
> $(BUILDROOT_CONFIG)
>  	        fi;

>            \ 	        cp -f $< $@;

>                        \ 	    fi -	$(Q)cp -a $@
$@.timestamp 	$(call
>  ctng-oldconfig,$@) 	$(call ctng-oldconfig,$@)
> -	$(call ctng-check-config-changed,$@,$@.timestamp)
> -	$(Q)rm -f $@.timestamp
> 
>  # Manual configuration
>  ctng-menuconfig: $(CTNG_DIR)/.config

I think you'll need to replace $< with a direct reference to
$(CTNG_CONFIG_FILE) to make that work.

Cheers,
Przemyslaw Wrzos
