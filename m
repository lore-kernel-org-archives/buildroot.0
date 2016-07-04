From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 4 Jul 2016 22:05:20 +0200
Subject: [Buildroot] [PATCH v6 1/5] runc: new package
In-Reply-To: <1467660382-6317-1-git-send-email-christian@paral.in>
References: <1467660382-6317-1-git-send-email-christian@paral.in>
Message-ID: <fc921f71-eeba-bb2c-1135-4a09d2a0218b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

Thanks for this new series.

Le 04/07/2016 ? 21:26, Christian Stewart a ?crit :
> runC is a CLI tool for spawning and running containers according to the
> OCP specification.
> 
> runC is used by the latest Docker engine versions, however, runc itself
> is standalone and has no other dependencies.
> 
> https://runc.io/
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---
> 
> Changes since v1:
>  - use call github to generate source url
> Changes since v3:
>  - fix indentation in Config.in
>  - add dep on threads in Config.in
>  - break gopath into separate variable
>  - use HOST_GO_TARGET_ENV
> Changes since v4:
>  - use RUNC_VERSION instead of commit hash
>  - only show comment when build is possible with threads enabled
> Changes since v5:
>  - bump to v1.0.0-rc1
> 
> ---
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in      |  1 +
>  package/runc/Config.in | 13 +++++++++++++
>  package/runc/runc.hash |  2 ++
>  package/runc/runc.mk   | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 62 insertions(+)
>  create mode 100644 package/runc/Config.in
>  create mode 100644 package/runc/runc.hash
>  create mode 100644 package/runc/runc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2c4c196..078436e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1665,6 +1665,7 @@ menu "System tools"
>  	source "package/pwgen/Config.in"
>  	source "package/quota/Config.in"
>  	source "package/rsyslog/Config.in"
> +	source "package/runc/Config.in"
>  	source "package/scrub/Config.in"
>  	source "package/scrypt/Config.in"
>  	source "package/smack/Config.in"
> diff --git a/package/runc/Config.in b/package/runc/Config.in
> new file mode 100644
> index 0000000..1802e59
> --- /dev/null
> +++ b/package/runc/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_RUNC
> +	bool "runc"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  runC is a CLI tool for spawning and running containers
> +	  according to the OCP specification.
> +
> +	  https://github.com/opencontainers/runc
> +
> +comment "runc needs a toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/runc/runc.hash b/package/runc/runc.hash
> new file mode 100644
> index 0000000..e6ec483
> --- /dev/null
> +++ b/package/runc/runc.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 77f9d4df1657fecc939be0261fcccccd34d5b22c02b8a49abad23fac33b4059a  runc-v1.0.0-rc1.tar.gz
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> new file mode 100644
> index 0000000..3f352bd
> --- /dev/null
> +++ b/package/runc/runc.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# runc
> +#
> +################################################################################
> +
> +RUNC_VERSION = v1.0.0-rc1

Usually we prefer a stable release but ok for this new package.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> +RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
> +
> +RUNC_LICENSE = Apache-2.0
> +RUNC_LICENSE_FILES = LICENSE
> +
> +RUNC_DEPENDENCIES = host-go
> +
> +RUNC_GOPATH = "$(@D)/Godeps/_workspace"
> +RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
> +	CGO_ENABLED=1 \
> +	GOBIN="$(@D)/bin" \
> +	GOPATH="$(RUNC_GOPATH)"
> +
> +RUNC_GLDFLAGS = \
> +	-X main.gitCommit=$(RUNC_VERSION) \
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
> +	mkdir -p $(RUNC_GOPATH)/src/github.com/opencontainers
> +	ln -s $(@D) $(RUNC_GOPATH)/src/github.com/opencontainers/runc
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
> +
> +$(eval $(generic-package))
> 
