From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 22:41:22 +0200
Subject: [Buildroot] [PATCH v10 1/1] docker-engine: new package
In-Reply-To: <1469391047-17228-1-git-send-email-christian@paral.in>
References: <1469391047-17228-1-git-send-email-christian@paral.in>
Message-ID: <20160724224122.4e911ff9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new version.

On Sun, 24 Jul 2016 13:10:47 -0700, Christian Stewart wrote:
> Docker is a platform to build, ship, and run applications in portable
> containers.
> 
> Signed-off-by: Andrew Webster <awebster@arcx.com>

The author is normally the first Signed-off-by line.

> Signed-off-by: Christian Stewart <christian@paral.in>


> diff --git a/package/Config.in b/package/Config.in
> index 04ca8cb..36f8b29 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1673,6 +1673,8 @@ menu "System tools"
>  	source "package/dcron/Config.in"
>  	source "package/debianutils/Config.in"
>  	source "package/docker-containerd/Config.in"
> +	source "package/docker-engine/Config.in"
> +	source "package/cgroupfs-mount/Config.in"

Still there.

>  	source "package/dsp-tools/Config.in"
>  	source "package/efibootmgr/Config.in"
>  	source "package/efivar/Config.in"
> diff --git a/package/docker-engine/0001-Fix-issues-with-tailing-rotated-jsonlog-file.patch b/package/docker-engine/0001-Fix-issues-with-tailing-rotated-jsonlog-file.patch
> new file mode 100644
> index 0000000..e85be61
> --- /dev/null
> +++ b/package/docker-engine/0001-Fix-issues-with-tailing-rotated-jsonlog-file.patch
> @@ -0,0 +1,290 @@
> +From 8d6f2e3fe8851b581309da25fc4c32f8be675932 Mon Sep 17 00:00:00 2001
> +From: Brian Goff <cpuguy83@gmail.com>
> +Date: Mon, 11 Jul 2016 16:31:42 -0400
> +Subject: [PATCH] Fix issues with tailing rotated jsonlog file
> +
> +Fixes a race where the log reader would get events for both an actual
> +rotation as we from fsnotify (`fsnotify.Rename`).
> +This issue becomes extremely apparent when rotations are fast, for
> +example:
> +
> +```
> +$ docker run -d --name test --log-opt max-size=1 --log-opt max-file=2
> +busybox sh -c 'while true; do echo hello; usleep 100000; done'
> +```
> +
> +With this change the log reader for jsonlogs can handle rotations that
> +happen as above.
> +
> +Instead of listening for both fs events AND rotation events
> +simultaneously, potentially meaning we see 2 rotations for only a single
> +rotation due to channel buffering, only listen for fs events (like
> +`Rename`) and then wait to be notified about rotation by the logger.
> +This makes sure that we don't see 2 rotations for 1, and that we don't
> +start trying to read until the logger is actually ready for us to.
> +
> +Signed-off-by: Brian Goff <cpuguy83@gmail.com>

Misses your Signed-off-by + an indication on whether this is upstream
or not.

> diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
> new file mode 100644
> index 0000000..1acf121
> --- /dev/null
> +++ b/package/docker-engine/Config.in
> @@ -0,0 +1,65 @@
> +config BR2_PACKAGE_DOCKER_ENGINE
> +	bool "docker-engine"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Docker is a platform to build, ship,
> +	  and run applications as lightweight containers.
> +
> +	  https://github.com/docker/docker
> +
> +if BR2_PACKAGE_DOCKER_ENGINE
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
> +	bool "docker daemon"
> +	depends on BR2_USE_MMU # docker-containerd
> +	depends on BR2_USE_WCHAR # docker-containerd

Why do you have the "depends on" of docker-containerd if you don't
select it ?

> +	select BR2_PACKAGE_SQLITE # runtime dependency
> +	default y
> +	help
> +	  Build the Docker system daemon.
> +	  If not selected, will build client only.
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL
> +	bool "build experimental features"
> +
> +if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
> +	bool "btrfs filesystem driver"
> +	depends on BR2_USE_WCHAR # btrfs-progs
> +	depends on BR2_USE_MMU # btrfs-progs
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
> +	select BR2_PACKAGE_BTRFS_PROGS
> +	help
> +	  Build the btrfs filesystem driver for Docker.
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
> +	bool "devicemapper filesystem driver"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
> +	depends on BR2_USE_MMU # lvm2
> +	depends on !BR2_STATIC_LIBS # lvm2
> +	select BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_LVM2_APP_LIBRARY
> +	help
> +	  Build the devicemapper filesystem driver for Docker.
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
> +	bool "vfs filesystem driver"
> +	depends on BR2_USE_WCHAR # gvfs
> +	depends on BR2_USE_MMU # gvfs
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
> +	select BR2_PACKAGE_GVFS
> +	help
> +	  Build the vfs filesystem driver for Docker.
> +
> +endif
> +
> +endif
> +
> +comment "docker-engine needs a toolchain w/ threads, wchar"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> +	depends on BR2_USE_MMU

There is no BR2_USE_MMU dependency on the top-level option to enable
docker-engine, so we do have this dependency here?

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR

There is no wchar dependency on the top-level option to enable
docker-engine, so why do you have a comment mentioning wchar here ?

> +DOCKER_ENGINE_GOPATH = "$(@D)/vendor"
> +DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
> +	CGO_ENABLED=1 \
> +	CGO_NO_EMULATION=1 \
> +	GOBIN="$(@D)/bin" \
> +	GOPATH="$(DOCKER_ENGINE_GOPATH)" \
> +	CPATH=$$CPATH:$(TARGET_DIR)/usr/include/ \
> +	LIBRARY_PATH=$$LIBRARY_PATH:$(TARGET_DIR)/usr/lib/

I'm still not happy with this TARGET_DIR/usr/include and
TARGET_DIR/usr/lib, and I'm wondering if they shouldn't be
STAGING_DIR/usr/include and STAGING_DIR/usr/lib. Have you tried this?


> +define DOCKER_ENGINE_BUILD_CMDS
> +	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
> +		cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) \
> +		$(HOST_DIR)/usr/bin/go build -v \

Indent this line and the followings with one more tab.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
