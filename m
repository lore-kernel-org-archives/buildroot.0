From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 18:56:36 +0200
Subject: [Buildroot] [PATCH v2] package/systemd: create /etc/resolv.conf
 only if resolvd is selected
In-Reply-To: <20191026161702.8159-1-unixmania@gmail.com>
References: <20191026161702.8159-1-unixmania@gmail.com>
Message-ID: <20191026165636.GC5052@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-10-26 13:17 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Or else it becomes a dangling link to /run/systemd/resolve/resolv.conf,
> which is never created. Even worst, it also prevents NewtorkManager from
> updating resolv.conf.
> 
> Fixes:
>   https://bugs.busybox.net/show_bug.cgi?id=9881
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> CC: Michael Nosthoff <posted@heine.so>
> ---
> Changes v1->v2:
>   - Rebase after bump to version 243
> ---
>  package/systemd/systemd.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 5961d98b22..df40961fee 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -354,10 +354,6 @@ define SYSTEMD_INSTALL_SERVICE_NETWORKD
>  	ln -sf ../../../../lib/systemd/system/systemd-network-generator.service \
>  		$(TARGET_DIR)/etc/systemd/system/network-pre.target.wants/systemd-network-generator.service
>  endef
> -define SYSTEMD_INSTALL_RESOLVCONF_HOOK
> -	ln -sf ../run/systemd/resolve/resolv.conf \
> -		$(TARGET_DIR)/etc/resolv.conf
> -endef
>  SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
>  ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
>  define SYSTEMD_INSTALL_NETWORK_CONFS
> @@ -371,6 +367,10 @@ SYSTEMD_CONF_OPTS += -Dnetworkd=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
> +define SYSTEMD_INSTALL_RESOLVCONF_HOOK
> +	ln -sf ../run/systemd/resolve/resolv.conf \
> +		$(TARGET_DIR)/etc/resolv.conf
> +endef
>  SYSTEMD_CONF_OPTS += -Dresolve=true
>  SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
>  define SYSTEMD_INSTALL_SERVICE_RESOLVED
> -- 
> 2.18.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
