From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 16:56:25 +0200
Subject: [Buildroot] [PATCH v4 5/8] package/runc: convert to golang
 infrastructure
In-Reply-To: <20180331132736.21105-6-thomas.petazzoni@bootlin.com>
References: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
 <20180331132736.21105-6-thomas.petazzoni@bootlin.com>
Message-ID: <20180331145625.GI25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Angelo, All,

On 2018-03-31 15:27 +0200, Thomas Petazzoni spake thusly:
> From: Angelo Compagnucci <angelo@amarulasolutions.com>
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/runc/runc.mk | 37 +++++--------------------------------
>  1 file changed, 5 insertions(+), 32 deletions(-)
> 
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index fb3fec20f5..f1586f32b2 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -9,42 +9,15 @@ RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
>  RUNC_LICENSE = Apache-2.0
>  RUNC_LICENSE_FILES = LICENSE
>  
> -RUNC_DEPENDENCIES = host-go
> +RUNC_WORKSPACE = Godeps/_workspace
>  
> -RUNC_GOPATH = "$(@D)/Godeps/_workspace"
> -RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
> -	CGO_ENABLED=1 \
> -	GOBIN="$(@D)/bin" \
> -	GOPATH="$(RUNC_GOPATH)" \
> -	PATH=$(BR_PATH)
> +RUNC_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
>  
> -RUNC_GLDFLAGS = \
> -	-X main.gitCommit=$(RUNC_VERSION)
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -RUNC_GLDFLAGS += -extldflags '-static'
> -endif
> -
> -RUNC_GOTAGS = cgo static_build
> +RUNC_TAGS = cgo static_build
>  
>  ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> -RUNC_GOTAGS += seccomp
> +RUNC_TAGS += seccomp
>  RUNC_DEPENDENCIES += libseccomp host-pkgconf
>  endif
>  
> -define RUNC_CONFIGURE_CMDS
> -	mkdir -p $(RUNC_GOPATH)/src/github.com/opencontainers
> -	ln -s $(@D) $(RUNC_GOPATH)/src/github.com/opencontainers/runc
> -endef
> -
> -define RUNC_BUILD_CMDS
> -	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
> -		build -v -o $(@D)/bin/runc \
> -		-tags "$(RUNC_GOTAGS)" -ldflags "$(RUNC_GLDFLAGS)" .
> -endef
> -
> -define RUNC_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/bin/runc $(TARGET_DIR)/usr/bin/runc
> -endef
> -
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
