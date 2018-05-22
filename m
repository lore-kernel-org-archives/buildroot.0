From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 May 2018 00:21:05 +0200
Subject: [Buildroot] [PATCH v2 1/6] libtirpc: add host package
In-Reply-To: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
References: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
Message-ID: <e1a18302-1cb8-40f7-f7b3-b5bcfa389075@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-05-18 12:30, Baruch Siach wrote:
> The libtirpc host package is only for two headers that the host rpcgen
> utility from the nfs-utils package needs to build. glibc used to provide
> these headers. In version 2.26 glibc deprecated them with its bundled
> Sun RPC. Recently Fedora stopped enabling Sun RPC in glibc. So we can no
> longer rely on these headers being present on the host.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: New patch in this series
> ---
>  package/libtirpc/libtirpc.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> index d9bf22b83eda..703a87725394 100644
> --- a/package/libtirpc/libtirpc.mk
> +++ b/package/libtirpc/libtirpc.mk
> @@ -18,4 +18,14 @@ LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
>  
>  LIBTIRPC_CONF_OPTS = --disable-gssapi
>  
> +# Don't build anything for host; we only need the headers
> +HOST_LIBTIRPC_CONFIGURE_CMDS = true
> +HOST_LIBTIRPC_BUILD_CMDS = true

 Since we're not actually using any of the autotools (and since we can't,
because rpcgen is missing), I'd make it a host-generic-package instead of
host-autotools-package. There is at least one other package (can't remember
which one) where we do this.

 Regards,
 Arnout

> +
> +define HOST_LIBTIRPC_INSTALL_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
> +	$(INSTALL) -D -m 0644 $(@D)/tirpc/netconfig.h $(HOST_DIR)/include/netconfig.h
> +endef
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
