From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 23:26:41 +0100
Subject: [Buildroot] [PATCH 3/7] package/dash: add /etc/dash to
 /etc/shells
In-Reply-To: <1515963815-5843-4-git-send-email-romain.naour@smile.fr>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
 <1515963815-5843-4-git-send-email-romain.naour@smile.fr>
Message-ID: <20180114222641.GC16760@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-14 22:03 +0100, Romain Naour spake thusly:
> When dash is selected, /bin/dash is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connexions for users using dash as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/dash/dash.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index c8b4164..391c06e 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -9,8 +9,12 @@ DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
>  DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
>  DASH_LICENSE_FILES = COPYING
>  
> +# Add /bin/dash to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connexion. See man shells.
>  define DASH_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
> +	grep -qsE '^/bin/dash' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/dash" >> $(TARGET_DIR)/etc/shells

Very unlikely, but what if there already is a shell named /bin/dashfoo ?
You should make sure to also match the end of the line (double-dollar
because of make...):

    grep -qsE '^/bin/dash$$'

Note: comment valid for all the patches in the series, of course...

And now that I re-read your bash patch, I missed it during the review.
Or I did suggest you do, but you missed it, and then I missed it in the
second review...
    http://lists.busybox.net/pipermail/buildroot/2018-January/211338.html

Regards,
Yann E. MORIN.

>  endef
>  
>  $(eval $(autotools-package))
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
