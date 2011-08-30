From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 30 Aug 2011 19:50:37 +0200
Subject: [Buildroot] [PATCH v2 3/3] netsnmp: allow not to install MIB
	files
In-Reply-To: <1308238033-20127-4-git-send-email-luca@lucaceresoli.net>
References: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
 <1308238033-20127-1-git-send-email-luca@lucaceresoli.net>
 <1308238033-20127-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <201108301950.37244.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On Thursday 16 June 2011 17:27:13 Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> Changes in v2:
>  - MIB installation is forcibly enabled with the MIB loading code; otherwise
>    net-snmp would loudly flood the console for missing MIBs.
> 
>  package/netsnmp/Config.in  |    8 ++++++++
>  package/netsnmp/netsnmp.mk |    4 ++++
>  2 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
> index 6f88b03..a6a768c 100644
> --- a/package/netsnmp/Config.in
> +++ b/package/netsnmp/Config.in
> @@ -10,6 +10,14 @@ config BR2_PACKAGE_NETSNMP_ENABLE_MIB_LOADING
>  	bool "Enable MIB loading code"
>  	default y
>  	depends on BR2_PACKAGE_NETSNMP
> +	select BR2_PACKAGE_NETSNMP_INSTALL_MIBS

Well, I'd do the other way around: if MIB files are to be installed, then
we need to be able to load them, so I'd do either:

    config BR2_PACKAGE_NETSNMP_INSTALL_MIBS
        depends on BR2_PACKAGE_NETSNMP_ENABLE_MIB_LOADING

Or:

    config BR2_PACKAGE_NETSNMP_INSTALL_MIBS
        depends on BR2_PACKAGE_NETSNMP
        select BR2_PACKAGE_NETSNMP_ENABLE_MIB_LOADING

After all, maybe the user wants to be able to load MIBs, but will provide
its own set, and not the bundled ones, so we should have the possibility
to enable MIB loading, and not install the bundled ones. But if we install
those, we need to be able to load them.

>  	help
>  	  Include code that parses and manipulates the mib files.
>  
> +config BR2_PACKAGE_NETSNMP_INSTALL_MIBS
> +	bool "Install MIB files on target"
> +	default y
> +	depends on BR2_PACKAGE_NETSNMP
> +	help
> +	  The net-snmp package contains a selection of MIB files.
> +	  Say yes if you want those MIB files installed on the target.
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index c0e631b..09111bf 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -47,6 +47,10 @@ ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIB_LOADING),y)
>  	NETSNMP_CONF_OPT += --disable-mib-loading
>  endif
>  
> +ifneq ($(BR2_PACKAGE_NETSNMP_INSTALL_MIBS),y)
> +	NETSNMP_CONF_OPT += --disable-mibs
> +endif
> +
>  # Remove IPv6 MIBs if there's no IPv6
>  ifneq ($(BR2_INET_IPV6),y)
>  define NETSNMP_REMOVE_MIBS_IPV6
> 

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
