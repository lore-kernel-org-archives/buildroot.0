From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 17:13:08 +0200
Subject: [Buildroot] [PATCH v4 8/8] package/docker-proxy: convert to
 golang infrastructure
In-Reply-To: <20180331132736.21105-9-thomas.petazzoni@bootlin.com>
References: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
 <20180331132736.21105-9-thomas.petazzoni@bootlin.com>
Message-ID: <20180331151308.GL25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Angelo, All,

On 2018-03-31 15:27 +0200, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/docker-proxy/docker-proxy.mk | 31 ++++---------------------------
>  1 file changed, 4 insertions(+), 27 deletions(-)
> 
> diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
> index 3bf6546d26..46cbcc3b91 100644
> --- a/package/docker-proxy/docker-proxy.mk
> +++ b/package/docker-proxy/docker-proxy.mk
> @@ -12,35 +12,12 @@ DOCKER_PROXY_LICENSE_FILES = LICENSE
>  
>  DOCKER_PROXY_DEPENDENCIES = host-go host-pkgconf
>  
> -DOCKER_PROXY_GOPATH = "$(@D)/gopath"
> -DOCKER_PROXY_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
> -	CGO_ENABLED=1 \
> -	CGO_NO_EMULATION=1 \
> -	GOBIN="$(@D)/bin" \
> -	GOPATH="$(DOCKER_PROXY_GOPATH)" \
> -	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> -	$(TARGET_MAKE_ENV)
> +DOCKER_PROXY_WORKSPACE = gopath
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -DOCKER_PROXY_GLDFLAGS += -extldflags '-static'
> -endif
> -
> -define DOCKER_PROXY_CONFIGURE_CMDS
> -	mkdir -p $(DOCKER_PROXY_GOPATH)/src/github.com/docker
> -	ln -fs $(@D) $(DOCKER_PROXY_GOPATH)/src/github.com/docker/libnetwork
> -endef
> -
> -define DOCKER_PROXY_BUILD_CMDS
> -	cd $(@D)/gopath/src/github.com/docker/libnetwork; \
> -	$(DOCKER_PROXY_MAKE_ENV) \
> -	$(HOST_DIR)/usr/bin/go build -v \
> -		-o $(@D)/bin/docker-proxy \
> -		-ldflags "$(DOCKER_PROXY_GLDFLAGS)" \
> -		github.com/docker/libnetwork/cmd/proxy
> -endef
> +DOCKER_PROXY_BUILD_TARGETS = cmd/proxy
>  
>  define DOCKER_PROXY_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/bin/docker-proxy $(TARGET_DIR)/usr/bin/docker-proxy
> +	$(INSTALL) -D -m 0755 $(@D)/$(DOCKER_PROXY_BINDIR)/proxy $(TARGET_DIR)/usr/bin/docker-proxy
>  endef
>  
> -$(eval $(generic-package))
> +$(eval $(golang-package))
> -- 
> 2.14.3
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
