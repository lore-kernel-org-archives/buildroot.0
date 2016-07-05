From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 11:08:49 +0200
Subject: [Buildroot] [PATCH v7 2/3] docker-containerd: new package
In-Reply-To: <1467671433-18113-2-git-send-email-christian@paral.in>
References: <1467671433-18113-1-git-send-email-christian@paral.in>
 <1467671433-18113-2-git-send-email-christian@paral.in>
Message-ID: <20160705110849.56206495@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I applied your patch, after doing some changes. See below.

On Mon,  4 Jul 2016 15:30:32 -0700, Christian Stewart wrote:

> diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
> new file mode 100644
> index 0000000..b2f2983
> --- /dev/null
> +++ b/package/docker-containerd/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_DOCKER_CONTAINERD
> +	bool "docker-containerd"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # util-linux
> +	depends on BR2_USE_WCHAR # util-linux
> +	select BR2_PACKAGE_RUNC # runc: runtime dependency

No need to indicate "runc: runtime dependency", "runtime dependency" is
enough.

> +	select BR2_PACKAGE_UTIL_LINUX # util-linux: runtime dependency

Ditto.

> +	select BR2_PACKAGE_UTIL_LINUX_BINARIES # util-linux: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT # util-linux: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT # util-linux: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNT # util-linux: runtime dependency

For those selects, the "runtime dependency" comment is useless, so I
removed it.

> +	help
> +	  containerd is a daemon to control runC.
> +
> +	  https://github.com/docker/containerd
> +
> +comment "docker-containerd needs a toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

You forgot the wchar dependency here, and also the BR2_USE_MMU
dependency.


> +define DOCKER_CONTAINERD_BUILD_CMDS
> +	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/ctr -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./ctr
> +	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd
> +	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd-shim -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd-shim

These lines were a bit too long, and also repetitive. So I refactored
this with a foreach loop.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
