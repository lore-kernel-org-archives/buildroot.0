From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Mar 2016 23:01:46 +0100
Subject: [Buildroot] [PATCH 1/1] kbd: fix target install
In-Reply-To: <1457786638-13861-1-git-send-email-niels@tonebarker.dk>
References: <1457786638-13861-1-git-send-email-niels@tonebarker.dk>
Message-ID: <20160312220146.GA3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Niel, All,

On 2016-03-12 13:43 +0100, Niels Skou Olsen spake thusly:
> The package makefile fails to append to the KBD_INSTALL_TARGET_OPTS variable in
> autotools-package. This means that the DESTDIR and install target are lost, and
> so the package is never installed to target.
> 
> To fix it the append must happen after the eval of autotools-package.
> 
> Signed-off-by: Niels Skou Olsen <niels@tonebarker.dk>
> ---
>  package/kbd/kbd.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
> index 9dabce1..72519ff 100644
> --- a/package/kbd/kbd.mk
> +++ b/package/kbd/kbd.mk
> @@ -17,6 +17,7 @@ KBD_LICENSE = GPLv2+
>  KBD_LICENSE_FILES = COPYING
>  KBD_AUTORECONF = YES
>  
> -KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
> -
>  $(eval $(autotools-package))
> +
> +# must happen after the autotools-package eval, or else the append becomes an overwrite
> +KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs

We don;t usually do that.

Instead, when the package does not behave properly, we prefer to
override all of it, like, for example, in  the rpm package:

    KBD_INSTALL_TARGET_OPTS = \
        DESTDIR=$(TARGET_DIR)/usr \
        MKINSTALLDIRS=$(@D)/config/mkinstalldirs \
        install

    $(eval $(autotools-package))

I marked your patch as Changes Requested on outr Patchwork. Care to fix
and respi, please?

Regards,
Yann E. MORIN.

> -- 
> 2.5.0
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
