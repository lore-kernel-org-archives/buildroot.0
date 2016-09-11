From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 23:09:51 +0200
Subject: [Buildroot] [PATCH] systemd: let getty instead of serial-getty
 handle /dev/console
In-Reply-To: <1473437418-27792-1-git-send-email-bos@je-eigen-domein.nl>
References: <1473437418-27792-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20160911210951.GP5740@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2016-09-09 18:10 +0200, Floris Bos spake thusly:
> The serial-getty unit depends on dev-%i.device which does not
> seem to be created for /dev/console
> Workaround this by letting normal getty unit handle things
> if BR2_TARGET_GENERIC_GETTY_PORT is set to 'console'
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

I haven't tested that, but I think this is OK just on principle.

I just wonder if that behaves correctly when console is a serial line or
anything else (e.g. a VT on HDMI, or through a debug channel...)

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index fb07819..975bfb6 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -357,7 +357,7 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # systemd needs getty.service for VTs and serial-getty.service for serial ttys
>  # also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
>  define SYSTEMD_INSTALL_SERVICE_TTY
> -	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
> +	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'console|tty[0-9]*$$'; \
>  	then \
>  		SERVICE="getty"; \
>  	else \
> -- 
> 2.7.4
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
