From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 07:27:20 +0200
Subject: [Buildroot] [PATCH v4 2/3] docker-containerd: new package
In-Reply-To: <1464324777-5364-3-git-send-email-christian@paral.in>
References: <1464324777-5364-1-git-send-email-christian@paral.in>
 <1464324777-5364-3-git-send-email-christian@paral.in>
Message-ID: <20160527072720.4f3f9b21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 21:52:56 -0700, Christian Stewart wrote:

> diff --git a/package/docker-containerd/0001-arm64-fixes.patch b/package/docker-containerd/0001-arm64-fixes.patch
> new file mode 100644
> index 0000000..488822a
> --- /dev/null
> +++ b/package/docker-containerd/0001-arm64-fixes.patch
> @@ -0,0 +1,184 @@
> +From f6f54370d154b0ce5f35319d878048d7db8db89c Mon Sep 17 00:00:00 2001
> +From: Lei Jitang <leijitang@huawei.com>
> +Date: Tue, 5 Apr 2016 23:17:30 -0400
> +Subject: [PATCH] arm64 fixes
> +
> +This commit is a combination of a few cherry-picked commits from the
> +current master (0.3.0 candidate) of docker-containerd, which
> +specifically address issues under arm64.
> +
> +move epoll syscall to arch specific to enable containerd run on arm64
> +Rename epoll_amd64.go to epoll.go
> +Signed-off-by: Lei Jitang <leijitang@huawei.com>
> +
> +archutils: epoll_aarch64: fix C formatting
> +Signed-off-by: Aleksa Sarai <asarai@suse.de>
> +
> +archutils: fix build on aarch64
> +Signed-off-by: Aleksa Sarai <asarai@suse.de>
> +
> +Use flag for aarch64 EpollCreate1
> +Signed-off-by: Qiang Huang <h.huangqiang@huawei.com>
> +
> +Correct build flag for arm64
> +Signed-off-by: Qiang Huang <h.huangqiang@huawei.com>

Needs your Signed-off-by here.

> diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
> new file mode 100644
> index 0000000..5919347
> --- /dev/null
> +++ b/package/docker-containerd/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_DOCKER_CONTAINERD
> +	bool "docker-containerd"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_RUNC
> +	help
> +	  containerd is a daemon to control runC.
> +
> +	  https://github.com/docker/containerd
> +
> +comment "docker-containerd needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS dependency.

> +define DOCKER_CONTAINERD_CONFIGURE_CMDS
> +	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
> +	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
> +	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
> +	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
> +endef
> +
> +define DOCKER_CONTAINERD_BUILD_CMDS
> +	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/ctr -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./ctr
> +	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd
> +	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd-shim -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd-shim
> +endef
> +
> +define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
> +	ln -s $(TARGET_DIR)/usr/bin/runc $(TARGET_DIR)/usr/bin/docker-runc

Did you do a runtime test? Because this clearly cannot work: it means
that on the target you will have a link like:

	/usr/bin/docker-runc -> /home/christian/buildroot/output/target/usr/bin/runc

which obviously will not work. You instead want:

	ln -s runc $(TARGET_DIR)/usr/bin/docker-runc

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
