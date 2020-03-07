From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:49:35 +0100
Subject: [Buildroot] [PATCH v3 4/4] package/connman: add option to
 enable/disable WireGuard
In-Reply-To: <20200227232955.16610-4-petr.vorel@gmail.com>
References: <20200227232955.16610-1-petr.vorel@gmail.com>
 <20200227232955.16610-4-petr.vorel@gmail.com>
Message-ID: <20200307224935.38dd7a7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Feb 2020 00:29:55 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v2->v3:
> * New commit (each logical change should be in a separate commit).
> 
>  package/connman/Config.in  | 7 +++++++
>  package/connman/connman.mk | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index 68ea037b90..801957968a 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -42,6 +42,13 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
>  	bool "enable Ethernet support"
>  	default y
>  
> +config BR2_PACKAGE_CONNMAN_WIREGUARD
> +	bool "enable WireGuard support"
> +	select BR2_PACKAGE_LIBMNL
> +	select BR2_PACKAGE_WIREGUARD_TOOLS

You forgot to propagate the dependencies of wireguard-tools, i.e:

	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10

> +ifeq ($(BR2_PACKAGE_CONNMAN_WIREGUARD),y)
> +CONNMAN_CONF_OPTS += --enable-wireguard
> +CONNMAN_DEPENDENCIES += libmnl

You don't depend on wireguard-tools here. Is it because wireguard-tools
are only a runtime dependency? If so, there should be a comment in the
Config.in, like this:

	select BR2_PACKAGE_WIREGUARD_TOOLS # runtime

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
