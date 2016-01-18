From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Jan 2016 18:53:49 +0100
Subject: [Buildroot] [PATCH v3 1/4] package/dhcp: bump version to
	4.3.3-P1
In-Reply-To: <1453131741-1613-2-git-send-email-rdkehn@yahoo.com>
References: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
 <1453131741-1613-2-git-send-email-rdkehn@yahoo.com>
Message-ID: <569D26AD.40000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Doug,

Generic feedback on this series: it should be a single patch. The package will
not build for some configurations that currently work if you apply just patch 1,
so we would end up with a non-bisectable situation. We want patches to be split
up into single-function pieces, but at the same time we want to maintain
"correctness" after each individual patch.


On 18-01-16 16:42, Doug Kehn wrote:
> Parallel builds are not supported because the bind libraries must be
> built first.

 That could maybe be worked around by building the bind libraries explicitly in
a PRE_BUILD_HOOK. But that's something that can be done in a follow-up patch.

> 
> The embedded bind configure is called as part of dhcp make instead of
> dhcp configure. dhcp make environment is expanded to ensure bind
> configure has the proper information.

 You wrote earlier that it also worked if we explicitly configure in a
POST_CONFIGURE_HOOK, didn't you? That would be better because then we can
control the bind configure as well, see my comments in 0001-bind-configure.patch


> 
> The embedded bind tar-ball is extracted after the source so patches can
> be applied to dhcp and bind before the package is built.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v2 -> v3
>   - removed RFC tag
>   - updated version from 4.3.3 to 4.3.3-P1 (suggested by Richardo)
>   - external toolchain support (suggested by Richardo)
> Changes v1 -> v2
>   - removed DHCP_PRE_BUILD_HOOKS in favor of patch (suggested by Arnout)
> ---
>  package/dhcp/dhcp.hash |  4 ++--
>  package/dhcp/dhcp.mk   | 17 ++++++++++++++++-
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
> index 84e3c63..e2bb6d9 100644
> --- a/package/dhcp/dhcp.hash
> +++ b/package/dhcp/dhcp.hash
> @@ -1,2 +1,2 @@
> -# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R12/dhcp-4.1-ESV-R12.tar.gz.sha256.asc
> -sha256	53265d1bf5e2073379df03c73a1a34d38a904307609c0f9cb77223912e753e5f	dhcp-4.1-ESV-R12.tar.gz
> +# Verified from ftp://ftp.isc.org/isc/dhcp/4.3-3-P1/dhcp-4.3.3-P1.tar.gz.sha256.asc
> +sha256 c11e896dffa1bfbc49462965d3f6dec45534e34068603546d9a236f2aa669921 dhcp-4.3.3-P1.tar.gz
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index c05e694..1bc088e 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DHCP_VERSION = 4.1-ESV-R12
> +DHCP_VERSION = 4.3.3-P1
>  DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>  DHCP_INSTALL_STAGING = YES
>  DHCP_LICENSE = ISC
> @@ -25,6 +25,21 @@ DHCP_CONF_OPTS = \
>  	--with-relay-pid-file=/var/run/dhcrelay.pid \
>  	--with-relay6-pid-file=/var/run/dhcrelay6.pid
>  
> +DHCP_MAKE=$(MAKE1)
> +
> +# Embedded bind configure is called as part of dhcp make instead of dhcp
> +# configure. Pass configure env to make so bind configure has what it needs.

 So this wouldn't be needed with a POST_CONFIGURE_HOOK, right?


 Regards,
 Arnout

> +DHCP_MAKE_ENV = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	GNU_TARGET_NAME=$(GNU_TARGET_NAME) \
> +	GNU_HOST_NAME=$(GNU_HOST_NAME) \
> +	BUILD_CC="$(HOSTCC)"
> +
> +define DHCP_EXTRACT_BIND
> +	cd $(@D)/bind; tar -xvf bind.tar.gz
> +endef
> +DHCP_POST_EXTRACT_HOOKS += DHCP_EXTRACT_BIND
> +
>  ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
>  DHCP_CONF_OPTS += --enable-delayed-ack
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
