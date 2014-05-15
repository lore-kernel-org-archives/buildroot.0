From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 May 2014 23:34:33 +0200
Subject: [Buildroot] [PATCH v2 1/1] netsnmp: Remove ldconfig calls
In-Reply-To: <1400043072-22885-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400043072-22885-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140515213433.GF3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-14 06:51 +0200, Bernd Kuhls spake thusly:
> ldconfig breaks links created by gpu-viv-bin-mx6q.
> 
> fixes
> http://autobuild.buildroot.net/results/ab5/ab57dd3729d529366808cbfc802f49360b2ec2b9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: rework the fix to not need a separate patch file
> 
>  package/netsnmp/netsnmp.mk |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index 63ec97a..665b564 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -67,9 +67,14 @@ ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
>  	NETSNMP_CONF_OPT += --disable-debugging
>  endif
>  
> +define NETSNMP_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
> +endef
> +
>  define NETSNMP_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -		DESTDIR=$(TARGET_DIR) install
> +		DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
>  	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
>  		$(TARGET_DIR)/etc/init.d/S59snmpd
>  	for mib in $(NETSNMP_BLOAT_MIBS); do \
> -- 
> 1.7.10.4
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
