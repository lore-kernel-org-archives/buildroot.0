From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 23:43:49 +0100
Subject: [Buildroot] [PATCH 1/4] Add package go-bootstrap
In-Reply-To: <a316e4d5ff70594e8f4cccbb819ebf6d9a32e958.1456946494.git.geoff@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
 <a316e4d5ff70594e8f4cccbb819ebf6d9a32e958.1456946494.git.geoff@infradead.org>
Message-ID: <20160302234349.7448884e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Geoff,

The commit title should be:

	go-bootstrap: new host package

On Wed, 02 Mar 2016 19:23:33 +0000, Geoff Levand wrote:

> diff --git a/package/Config.in.host b/package/Config.in.host
> index 1c691a3..7cacef9 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -13,6 +13,7 @@ menu "Host utilities"
>  	source "package/genext2fs/Config.in.host"
>  	source "package/genimage/Config.in.host"
>  	source "package/genpart/Config.in.host"
> +	source "package/go-bootstrap/Config.in.host"

There is no need for a Config.in.host file for this package, it is
just a build dependency for the go compiler, it doesn't need to be
exposed in menuconfig.

> diff --git a/package/go-bootstrap/Config.in.host b/package/go-bootstrap/Config.in.host
> new file mode 100644
> index 0000000..99cca79
> --- /dev/null
> +++ b/package/go-bootstrap/Config.in.host
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_GO_BOOTSTRAP
> +	bool
> +	help
> +	  Bootstrap compiler needed to build go1.5 and later versions.
> +
> +	  https://golang.org

So, this is not needed.

> diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
> new file mode 100644
> index 0000000..464f95e
> --- /dev/null
> +++ b/package/go-bootstrap/go-bootstrap.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# go-bootstrap
> +#
> +################################################################################
> +
> +GO_BOOTSTRAP_VERSION = 1.4.2
> +GO_BOOTSTRAP_SITE = https://storage.googleapis.com/golang
> +GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).src.tar.gz

Will Go 1.4.x always be capable of building newer Go compilers ?

> +
> +GO_BOOTSTRAP_LICENSE = BSD-3c
> +GO_BOOTSTRAP_LICENSE_FILES = LICENSE
> +
> +GO_BOOTSTRAP_FINAL = $(HOST_DIR)/usr/lib/go-$(GO_BOOTSTRAP_VERSION)
> +
> +GO_BOOTSTRAP_MAKE_ENV = \
> +	GOOS=linux \
> +	GOROOT_FINAL="$(GO_BOOTSTRAP_FINAL)" \
> +	GOROOT="$(@D)" \
> +	GOBIN="$(@D)/bin"
> +
> +define HOST_GO_BOOTSTRAP_BUILD_CMDS
> +	cd $(@D)/src && $(GO_BOOTSTRAP_MAKE_ENV) ./make.bash
> +endef
> +
> +define HOST_GO_BOOTSTRAP_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/go $(GO_BOOTSTRAP_FINAL)/bin/go
> +	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(GO_BOOTSTRAP_FINAL)/bin/gofmt
> +
> +	cp -a $(@D)/lib $(GO_BOOTSTRAP_FINAL)/
> +	cp -a $(@D)/src $(GO_BOOTSTRAP_FINAL)/

Is it normal to copy source code to HOST_DIR ?

> +	cp -a $(@D)/pkg $(GO_BOOTSTRAP_FINAL)/
> +	chmod -R +x $(GO_BOOTSTRAP_FINAL)/pkg/tool

Why aren't those tools already installed +x by the build process ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
