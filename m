From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Nov 2011 12:40:52 +0100
Subject: [Buildroot] [git commit] busybox: only install S01logging if
 syslogd applet is enabled
In-Reply-To: <20110704191002.1D1B48A31E@busybox.osuosl.org>
References: <20110704191002.1D1B48A31E@busybox.osuosl.org>
Message-ID: <4ECCDBC4.8030805@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Looking at the init scripts installation stuff, I found this, which is
confusing to me.

There seems to be a glitch here.

AFAIK, when I proposed that name, we renamed all the init scripts for
logging daemons to S01logging.

But this combined with this commit leads to erasing the init scripts for
other daemons when logging is not enabled in busybox.

While it shouldn't happen in the common use-case, because of the
dependency we set on busybox in all the logger packages, if the user put
his init script for another logger in the skeleton, it will always
remove it, and install the default one.

Maybe the common name was not such a good idea, and that we should have
a distinct name for each init scripts. Or we revert this commit. I don't
know.

On 04/07/2011 21:03, Peter Korsgaard wrote:
> 
> commit: http://git.buildroot.net/buildroot/commit/?id=abf7af17e95855e9fe2535729f7d83fce603463f
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/busybox/busybox.mk |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 4931b07..509c3bb 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -123,8 +123,10 @@ endef
>  endif
>  
>  define BUSYBOX_INSTALL_LOGGING_SCRIPT
> -	$(INSTALL) -m 0755 -D package/busybox/S01logging \
> -		$(TARGET_DIR)/etc/init.d/S01logging
> +	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
> +		$(INSTALL) -m 0755 -D package/busybox/S01logging \
> +			$(TARGET_DIR)/etc/init.d/S01logging; \
> +	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
>  endef
>  
>  # We do this here to avoid busting a modified .config in configure


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
