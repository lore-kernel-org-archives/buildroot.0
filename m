From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jul 2014 21:51:01 +0200
Subject: [Buildroot] [PATCH] dvb-apps: fix static only build
In-Reply-To: <1404848465-25296-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404848465-25296-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140708195101.GA4384@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-08 21:41 +0200, Thomas Petazzoni spake thusly:
> This commit makes dvb-apps behave properly in a static-only build. It
> passes the static=1 variable to the Makefile, and adds a patch that
> fixes the Makefile to not build .so libraries when static=1.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/3db/3dbfa7b692d4b123b3ba6b55c84df12818273554/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[--SNIP--]
> diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
> index 98ff7eb..edf88f3 100644
> --- a/package/dvb-apps/dvb-apps.mk
> +++ b/package/dvb-apps/dvb-apps.mk
> @@ -15,19 +15,26 @@ DVB_APPS_DEPENDENCIES = libiconv
>  DVB_APPS_LDLIBS += -liconv
>  endif
>  
> +DVB_APPS_MAKE_OPTS = V=1

I think we should just get rid of that, no?
It's my fault it is present; we should not use it.

Otherwise:
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +DVB_APPS_MAKE_OPTS += static=1
> +endif
> +
>  DVB_APPS_INSTALL_STAGING = YES
>  
>  define DVB_APPS_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) LDLIBS="$(DVB_APPS_LDLIBS)" \
> -		$(MAKE) -C $(@D) CROSS_ROOT=$(STAGING_DIR) V=1
> +		$(MAKE) -C $(@D) CROSS_ROOT=$(STAGING_DIR) \
> +		$(DVB_APPS_MAKE_OPTS)
>  endef
>  
>  define DVB_APPS_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) V=1 DESTDIR=$(STAGING_DIR) install
> +	$(MAKE) -C $(@D) $(DVB_APPS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
>  endef
>  
>  define DVB_APPS_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) V=1 DESTDIR=$(TARGET_DIR) install
> +	$(MAKE) -C $(@D) $(DVB_APPS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.0.0
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
