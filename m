From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 16:54:14 +0100
Subject: [Buildroot] [PATCH 1/1] jimtcl: change the way of define
 JIMTCL_INSTALL_LIB variable
In-Reply-To: <1421342294-11952-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1421342294-11952-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20150118155414.GN4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy, All,

On 2015-01-15 18:18 +0100, Jerzy Grzegorek spake thusly:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, there is something really fishy in _INSTALL_STAGING_CMDS:

    define JIMTCL_INSTALL_STAGING_CMDS
        for i in $(JIMTCL_HEADERS_TO_INSTALL); do \
                cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ || exit 1 ; \
        done; \
        $(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.$(JIMTCL_LIB);
        ln -s libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.so
    endef

In case we're static-only, JIMTCL_LIB=a , so we're linking the static
library to the shared one. Surely this is just busted. no?

While you're at touching jimctl, would you care having a look, please?

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/jimtcl/jimtcl.mk |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
> index 75c0382..c2e04ff 100644
> --- a/package/jimtcl/jimtcl.mk
> +++ b/package/jimtcl/jimtcl.mk
> @@ -32,10 +32,11 @@ JIMTCL_INSTALL_LIB =
>  else
>  JIMTCL_SHARED = --shared
>  JIMTCL_LIB = so.$(JIMTCL_VERSION)
> -JIMTCL_INSTALL_LIB = \
> +define JIMTCL_INSTALL_LIB
>  	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) \
> -	$(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB); \
> +		$(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB)
>  	ln -s libjim.$(JIMTCL_LIB) $(TARGET_DIR)/usr/lib/libjim.so
> +endef
>  endif
>  
>  define JIMTCL_CONFIGURE_CMDS
> -- 
> 1.7.9.5
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
