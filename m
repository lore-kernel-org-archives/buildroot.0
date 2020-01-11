From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:26:34 +0100
Subject: [Buildroot] [PATCH] package/supertuxkart: bump to version v1.1
In-Reply-To: <20200106205652.16205-1-romain.naour@gmail.com>
References: <20200106205652.16205-1-romain.naour@gmail.com>
Message-ID: <20200111152634.48722e0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jan 2020 21:56:52 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> - Add harfbuzz and fribifi dependencies for text handling in STK [1].
> - Fribidi is now mandatory.
> - Add optional support for sqlite3 (manage server stats and ban list) [2].
> - Add an option to use openssl instead of nettle for cryptography [3].
> - Use bundled libmcpp library since there is no such package in Buildroot.
> - Add license file hash.
> 
> [1] https://github.com/supertuxkart/stk-code/commit/43d322c6341fcd999cbd14a903ff2e56b88abc5b
> [2] https://github.com/supertuxkart/stk-code/commit/bcc3aef4c87d8326bcb4206dd4887a38064cc57a
> [3] https://github.com/supertuxkart/stk-code/commit/173e3907556070f07e1c77ad5ae20d56dad757c2
> 
> See:
> https://github.com/supertuxkart/stk-code/blob/1.1/CHANGELOG.md
> http://blog.supertuxkart.net/2020/01/supertuxkart-11-released.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Thanks, I've applied, with just one change, see below.

>  ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
>  SUPERTUXKART_DEPENDENCIES += bluez5_utils
> @@ -55,4 +50,21 @@ else
>  SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
>  endif
>  
> +# Prefer openssl (the default) over nettle.
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +SUPERTUXKART_DEPENDENCIES += openssl
> +SUPERTUXKART_CONF_OPTS += -DUSE_CRYPTO_OPENSSL=ON
> +else
> +SUPERTUXKART_DEPENDENCIES += nettle
> +SUPERTUXKART_CONF_OPTS += -DUSE_CRYPTO_OPENSSL=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQLITE),y)
> +SUPERTUXKART_DEPENDENCIES += sqlite
> +SUPERTUXKART_CONF_OPTS += -DUSE_SQLITE3=ON
> +else
> +# Wiimote support relies on bluez5.

This comment was not really relevant here, and was apparently there
because of a copy/paste :-)

> +SUPERTUXKART_CONF_OPTS += -DUSE_SQLITE3=OFF
> +endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
