From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 23:13:23 +0100
Subject: [Buildroot] [PATCH] xl2tp: fix static build
In-Reply-To: <83364a11d5a70fa1d3e52a9d44ea5c118dc3a4fe.1416738599.git.baruch@tkos.co.il>
References: <83364a11d5a70fa1d3e52a9d44ea5c118dc3a4fe.1416738599.git.baruch@tkos.co.il>
Message-ID: <20141123221323.GL11143@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-11-23 12:29 +0200, Baruch Siach spake thusly:
> Use pcap-config to list dependencies of libpcap.
> 
> Fixes:
> http://autobuild.buildroot.net/results/87f/87ff92831d265d437aa0dfcfb99e954f76597761/
> http://autobuild.buildroot.net/results/cd5/cd5487e76259752cbe58b171f9a58970916f7bb8/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I was working on a similar fix, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xl2tp/xl2tp.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
> index 0b2f7f1758f5..abed7e851fa2 100644
> --- a/package/xl2tp/xl2tp.mk
> +++ b/package/xl2tp/xl2tp.mk
> @@ -10,9 +10,13 @@ XL2TP_DEPENDENCIES = libpcap openssl
>  XL2TP_LICENSE = GPLv2
>  XL2TP_LICENSE_FILES = LICENSE
>  
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +XL2TP_LDLIBS = LDLIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
> +endif
> +
>  define XL2TP_BUILD_CMDS
>  	$(SED) 's/ -O2 //' $(@D)/Makefile
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(XL2TP_LDLIBS) -C $(@D)
>  endef
>  
>  define XL2TP_INSTALL_TARGET_CMDS
> -- 
> 2.1.3
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
