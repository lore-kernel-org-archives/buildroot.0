From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Jun 2018 23:49:22 +0200
Subject: [Buildroot] [PATCH v2] package/dhcp: copy dhcpctl and omapi
 libraries and headers into staging
In-Reply-To: <20180626191941.7941-1-daniel@0x0f.com>
References: <20180626191941.7941-1-daniel@0x0f.com>
Message-ID: <1e46d919-d896-cd13-f07e-f2dbb6649649@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-06-18 21:19, Daniel Palmer wrote:
> These libraries/headers are used to control dhclient/dhcpd via omapi
> (https://www.isc.org/wp-content/uploads/2017/08/dhcp41omapi.html) from
> another applications and thus a potentially useful in situations where
> you need to interact with dhclient/dhcpd and need something more reliable
> than parsing their output.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  package/dhcp/dhcp.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index a1285184d3..dac7235f08 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -118,4 +118,25 @@ define DHCP_INSTALL_TARGET_CMDS
>  	$(DHCP_INSTALL_CLIENT)
>  endef
>  
> +define DHCP_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 644 $(@D)/dhcpctl/dhcpctl.h \
> +		$(HOST_DIR)/usr/include/dhcpctl/dhcpctl.h

 I'm afraid you're doing something terribly wrong here, installing headers for
the target in HOST_DIR...

> +	$(INSTALL) -D -m 644 $(@D)/includes/isc-dhcp/dst.h \
> +		$(HOST_DIR)/usr/include/isc-dhcp/dst.h
> +	$(INSTALL) -D -m 644 -t $(HOST_DIR)/usr/include/omapip/ \
> +		$(@D)/includes/omapip/alloc.h \
> +		$(@D)/includes/omapip/buffer.h \
> +		$(@D)/includes/omapip/convert.h \
> +		$(@D)/includes/omapip/hash.h \
> +		$(@D)/includes/omapip/isclib.h \
> +		$(@D)/includes/omapip/omapip.h \
> +		$(@D)/includes/omapip/omapip_p.h \
> +		$(@D)/includes/omapip/result.h \
> +		$(@D)/includes/omapip/trace.h
> +	$(INSTALL) -D -m 644 $(@D)/dhcpctl/libdhcpctl.a \
> +		$(HOST_DIR)/usr/lib/libdhcpctl.a

 And this is particularly wrong, it will not even link correctly...

 What exactly are you trying to do here?

 Regards,
 Arnout

> +	$(INSTALL) -D -m 644 $(@D)/omapip/libomapi.a \
> +		$(HOST_DIR)/usr/lib/libomapi.a
> +endef
> +
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
