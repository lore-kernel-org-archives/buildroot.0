From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 07:25:20 +0200
Subject: [Buildroot] [PATCH v4 1/3] runc: new package
In-Reply-To: <1464324777-5364-2-git-send-email-christian@paral.in>
References: <1464324777-5364-1-git-send-email-christian@paral.in>
 <1464324777-5364-2-git-send-email-christian@paral.in>
Message-ID: <20160527072520.63f30cf8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 21:52:55 -0700, Christian Stewart wrote:

> diff --git a/package/runc/Config.in b/package/runc/Config.in
> new file mode 100644
> index 0000000..7d0c951
> --- /dev/null
> +++ b/package/runc/Config.in
> @@ -0,0 +1,12 @@
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
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

The comment also needs the dependency on
BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS in order to not show the comment on
architectures on which Go support is anyway not available.

> +RUNC_GOPATH = "$(@D)/Godeps/_workspace"
> +RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
> +	CGO_ENABLED=1 \
> +	GOBIN="$(@D)/bin" \
> +	GOPATH="$(RUNC_GOPATH)"
> +
> +RUNC_GLDFLAGS = \
> +	-X main.gitCommit=$(RUNC_VERSION_COMMIT) \

As asked in my review of the previous version, what about using
RUNC_VERSION here?

Other than that, looks good to me.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
