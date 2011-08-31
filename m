From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 31 Aug 2011 22:38:10 +0200
Subject: [Buildroot] [PATCH v3 2/2] netsnmp: allow to disable MIB files
	installation and MIB loading code
In-Reply-To: <1314819999-9099-2-git-send-email-luca@lucaceresoli.net>
References: <1308238033-20127-1-git-send-email-luca@lucaceresoli.net>
 <1314819999-9099-1-git-send-email-luca@lucaceresoli.net>
 <1314819999-9099-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <201108312238.10282.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 31 August 2011 21:46:39 Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

> ---
> Changes in v2:
>  - MIB installation is forcibly enabled with the MIB loading code; otherwise
>    net-snmp would loudly flood the console for missing MIBs.
> 
> Changes in v3:
>  - Join in a unique option the choice of not installing MIB files and not
>    enabling MIB loading code. The mixed cases were either problematical or
>    unlikely to be useful. This is per the discussion in
>    http://lists.busybox.net/pipermail/buildroot/2011-August/045256.html
> 
>  package/netsnmp/Config.in  |    8 ++++++++
>  package/netsnmp/netsnmp.mk |    5 +++++
>  2 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
> index 5a3e9aa..431be2d 100644
> --- a/package/netsnmp/Config.in
> +++ b/package/netsnmp/Config.in
> @@ -6,3 +6,11 @@ config BR2_PACKAGE_NETSNMP
>  
>  	  http://net-snmp.sourceforge.net/
>  
> +config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
> +	bool "Install MIB files on target and enable MIB loading code"
> +	default y
> +	depends on BR2_PACKAGE_NETSNMP
> +	help
> +	  The net-snmp package contains a selection of MIB files.
> +	  Say yes if you want those MIB files installed on the target
> +	  and enable the code that parses the MIB files.
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index 5704327..cef6583 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -43,6 +43,11 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
>  	NETSNMP_CONF_OPT += --disable-manuals
>  endif
>  
> +ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
> +	NETSNMP_CONF_OPT += --disable-mib-loading
> +	NETSNMP_CONF_OPT += --disable-mibs
> +endif
> +
>  # Remove IPv6 MIBs if there's no IPv6
>  ifneq ($(BR2_INET_IPV6),y)
>  define NETSNMP_REMOVE_MIBS_IPV6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
