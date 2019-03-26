From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 20:16:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/bird: add optional protocols
In-Reply-To: <20190320210943.21377-1-adrien@gallouet.fr>
References: <20190320210943.21377-1-adrien@gallouet.fr>
Message-ID: <20190326201636.13216e35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Mar 2019 21:09:44 +0000
Adrien Gallou?t <adrien@gallouet.fr> wrote:

> Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
> ---
>  package/bird/Config.in | 46 ++++++++++++++++++++++++++++++++++++++++++
>  package/bird/bird.mk   | 16 +++++++++++++++
>  2 files changed, 62 insertions(+)

I've applied, but I had to fix a number of things, see below.

> 
> diff --git a/package/bird/Config.in b/package/bird/Config.in
> index a69551f94e..298348d098 100644
> --- a/package/bird/Config.in
> +++ b/package/bird/Config.in
> @@ -20,4 +20,50 @@ config BR2_PACKAGE_BIRD_CLIENT
>  	help
>  	  Enable the BIRD client

I added a Config.in comment here to make it clear the below options are
for configuring the list of supported protocols.

> +# BUG: RIP is needed for now
> +BR2_PACKAGE_BIRD_RIP=y

BR2_PACKAGE_* is reserved for config options. Variables in a package
should be prefixed by the package name.

> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_BFD),bfd,)
> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_BABEL),babel,)
> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_BGP),bgp,)
> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_MRT),mrt,)
> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_OSPF),ospf,)
> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_PERF),perf,)
> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_PIPE),pipe,)
> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_RADV),radv,)
> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_RIP),rip,)
> +BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_STATIC),static,)
> +
> +BIRD_CONF_OPTS += --with-protocols=$(subst $(space),$(comma),$(strip $(BR2_PACKAGE_BIRD_PROTOCOLS)))

So I've changed all of this by:

# BUG: RIP is mandatory for now
BIRD_PROTOCOLS = \
        rip \
        $(if $(BR2_PACKAGE_BIRD_BFD),bfd) \
        $(if $(BR2_PACKAGE_BIRD_BABEL),babel) \
        $(if $(BR2_PACKAGE_BIRD_BGP),bgp) \
        $(if $(BR2_PACKAGE_BIRD_MRT),mrt) \
        $(if $(BR2_PACKAGE_BIRD_OSPF),ospf) \
        $(if $(BR2_PACKAGE_BIRD_PERF),perf) \
        $(if $(BR2_PACKAGE_BIRD_PIPE),pipe) \
        $(if $(BR2_PACKAGE_BIRD_RADV),radv) \
        $(if $(BR2_PACKAGE_BIRD_RIP),rip) \
        $(if $(BR2_PACKAGE_BIRD_STATIC),static)

BIRD_CONF_OPTS += --with-protocols=$(subst $(space),$(comma),$(strip $(BIRD_PROTOCOLS)))

and applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
