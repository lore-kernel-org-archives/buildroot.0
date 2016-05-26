From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:12:07 +0200
Subject: [Buildroot] [PATCH v3 1/3] runc: new package
In-Reply-To: <1464219082-3818-2-git-send-email-christian@paral.in>
References: <1464219082-3818-1-git-send-email-christian@paral.in>
 <1464219082-3818-2-git-send-email-christian@paral.in>
Message-ID: <20160526211207.06e27be6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 May 2016 16:31:20 -0700, Christian Stewart wrote:

> diff --git a/package/runc/Config.in b/package/runc/Config.in
> new file mode 100644
> index 0000000..99d55d0
> --- /dev/null
> +++ b/package/runc/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_RUNC
> +	bool "runc"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS

It seems like it uses cgo, so you need a dependency on
BR2_TOOLCHAIN_HAS_THREADS here + the corresponding Config.in comment.

> +	help
> +    runC is a CLI tool for spawning and running containers
> +    according to the OCP specification.

Indentation for the help text is one tab + two spaces.

> +
> +	  https://github.com/opencontainers/runc
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> new file mode 100644
> index 0000000..5032fa4
> --- /dev/null
> +++ b/package/runc/runc.mk
> @@ -0,0 +1,49 @@
> +################################################################################
> +#
> +# runc
> +#
> +################################################################################
> +
> +RUNC_VERSION = v0.1.1
> +RUNC_VERSION_COMMIT = baf6536d6259209c3edfa2b22237af82942d3dfa

Why is this thing needed? I see you use it below, but it seems weird.

> +RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
> +
> +RUNC_LICENSE = Apache-2.0
> +RUNC_LICENSE_FILES = LICENSE
> +
> +RUNC_DEPENDENCIES = host-go
> +
> +RUNC_MAKE_ENV = \
> +	GOBIN="$(@D)/bin" \
> +	GOPATH="$(@D)/Godeps/_workspace" \
> +	GOARCH=$(GO_GOARCH) \
> +	CGO_ENABLED=1

I guess you should use HOST_GO_TARGET_ENV, as in
http://patchwork.ozlabs.org/patch/626824/.

> +RUNC_GLDFLAGS = \
> +	-X main.gitCommit=$(RUNC_VERSION_COMMIT) \
> +	-extldflags '-static'
> +
> +RUNC_GOTAGS = cgo static_build
> +
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +RUNC_GOTAGS += seccomp
> +RUNC_DEPENDENCIES += libseccomp
> +endif
> +
> +define RUNC_CONFIGURE_CMDS
> +	# Put sources at prescribed GOPATH location.
> +	export $(RUNC_MAKE_ENV) && \

What is the export doing here?

> +		mkdir -p $$GOPATH/src/github.com/opencontainers && \
> +		ln -s $(@D) $$GOPATH/src/github.com/opencontainers/runc

There is no need for a && between those lines.

And why is this needed at all? What is this "prescribed GOPATH" thing ?

> +endef
> +
> +define RUNC_BUILD_CMDS
> +	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/usr/bin/go \
> +		build -v -o $(@D)/bin/runc -tags "$(RUNC_GOTAGS)" -ldflags "$(RUNC_GLDFLAGS)" .
> +endef
> +
> +define RUNC_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/runc $(TARGET_DIR)/usr/bin/runc
> +endef

Other than that, looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
