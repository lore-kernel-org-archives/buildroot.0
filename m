From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 18:43:05 +0100
Subject: [Buildroot] [PATCH 1/1] lockdev: Fix TARGET_DIR link
In-Reply-To: <BLU0-SMTP1038BCF760A4FE2F4B22DA2D9CF0@phx.gbl>
References: <BLU0-SMTP1038BCF760A4FE2F4B22DA2D9CF0@phx.gbl>
Message-ID: <20131229174305.GI3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2013-12-29 18:31 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>

> ---
>  package/lockdev/lockdev.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
> index 004b637..0c10341 100644
> --- a/package/lockdev/lockdev.mk
> +++ b/package/lockdev/lockdev.mk
> @@ -34,7 +34,7 @@ endef
>  
>  define LOCKDEV_INSTALL_TARGET_CMDS
>  	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install_run
> -	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
> +	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1

The .so symlink is not required at runtime, so we do not even have to
install it in the first place. All we need is a library which filename
is the same as its SONAME.

So, if the SONAME is liblockdev.so.1, just rename the library to .so.1.
If the SONAME is liblockdev.so, just rename the library to .so. If the
library is already installed with the correct filename, no need to
rename it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
