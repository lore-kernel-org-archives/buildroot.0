From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 7 Jan 2021 23:58:41 +0100
Subject: [Buildroot] [git commit] package/balena-engine: new package
Message-ID: <20210107224034.E83588690E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb0d87004c824dc6bb421fe8316428d51e1335bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Christian Stewart <christian@paral.in>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                        |   1 +
 package/balena-engine/Config.in          |  26 ++++++++
 package/balena-engine/balena-engine.hash |   3 +
 package/balena-engine/balena-engine.mk   | 109 +++++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 056d419ac2..9ed02ec890 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2398,6 +2398,7 @@ menu "System tools"
 	source "package/atop/Config.in"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
+	source "package/balena-engine/Config.in"
 	source "package/bubblewrap/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
new file mode 100644
index 0000000000..f48f361dc2
--- /dev/null
+++ b/package/balena-engine/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_BALENA_ENGINE
+	bool "balena-engine"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_USE_MMU # util-linux
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
+	select BR2_PACKAGE_IPTABLES # runtime
+	select BR2_PACKAGE_SQLITE # runtime
+	select BR2_PACKAGE_UTIL_LINUX # runtime
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # runtime
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT # runtime
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT # runtime
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT # runtime
+	help
+	  balenaEngine is a new container engine purpose-built for
+	  embedded and IoT use cases and compatible with Docker
+	  containers.
+
+	  https://github.com/balena-os/balena-engine
+
+comment "balena-engine needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
new file mode 100644
index 0000000000..3f632ef381
--- /dev/null
+++ b/package/balena-engine/balena-engine.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  389282706562118608b6ac580e7beacd6a43f0bb3481c69fb1856bed9ac49b85  balena-engine-19.03.14.tar.gz
+sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
new file mode 100644
index 0000000000..b3eb2ca75b
--- /dev/null
+++ b/package/balena-engine/balena-engine.mk
@@ -0,0 +1,109 @@
+################################################################################
+#
+# balena-engine
+#
+################################################################################
+
+BALENA_ENGINE_VERSION = 19.03.14
+BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
+
+BALENA_ENGINE_LICENSE = Apache-2.0
+BALENA_ENGINE_LICENSE_FILES = LICENSE
+
+BALENA_ENGINE_DEPENDENCIES = host-pkgconf
+BALENA_ENGINE_GOMOD = github.com/docker/docker
+
+BALENA_ENGINE_LDFLAGS = \
+	-X github.com/docker/cli/cli/version.Version=N/A \
+	-X github.com/docker/cli/cli/version.GitCommit= \
+	-X github.com/docker/cli/cli/version.BuildTime= \
+	-X github.com/containerd/containerd/version.Version=N/A \
+	-X github.com/opencontainers/runc.version=N/A
+
+BALENA_ENGINE_TAGS = \
+	cgo \
+	exclude_graphdriver_zfs \
+	autogen \
+	no_buildkit \
+	no_btrfs \
+	no_cri \
+	no_devmapper \
+	no_zfs \
+	exclude_disk_quota \
+	exclude_graphdriver_btrfs \
+	exclude_graphdriver_devicemapper
+
+BALENA_ENGINE_BUILD_TARGETS = cmd/balena-engine
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+BALENA_ENGINE_DEPENDENCIES += systemd
+BALENA_ENGINE_TAGS += journald
+endif
+
+define BALENA_ENGINE_RUN_AUTOGEN
+	cd $(@D) && \
+		VERSION=$(BALENA_ENGINE_VERSION) \
+		PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY) \
+		$(TARGET_MAKE_ENV) \
+		$(SHELL) hack/make/.go-autogen
+endef
+
+BALENA_ENGINE_POST_CONFIGURE_HOOKS += BALENA_ENGINE_RUN_AUTOGEN
+
+define BALENA_ENGINE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/contrib/init/systemd/balena-engine.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/balena-engine.service
+	$(INSTALL) -D -m 644 $(@D)/contrib/init/systemd/balena-engine.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/balena-engine.socket
+endef
+
+define BALENA_ENGINE_USERS
+	- - balena-engine -1 * - - - balenaEngine daemon
+endef
+
+define BALENA_ENGINE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DUMMY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MACVLAN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VXLAN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
+endef
+
+define BALENA_ENGINE_INSTALL_SYMLINK
+	ln -f -s balena-engine $(TARGET_DIR)/usr/bin/balena-engine-daemon
+	ln -f -s balena-engine $(TARGET_DIR)/usr/bin/balena-engine-containerd
+	ln -f -s balena-engine $(TARGET_DIR)/usr/bin/balena-engine-containerd-shim
+	ln -f -s balena-engine $(TARGET_DIR)/usr/bin/balena-engine-containerd-ctr
+	ln -f -s balena-engine $(TARGET_DIR)/usr/bin/balena-engine-runc
+	ln -f -s balena-engine $(TARGET_DIR)/usr/bin/balena-engine-proxy
+	$(if $(BR2_PACKAGE_TINI),ln -f -s tini $(TARGET_DIR)/usr/bin/balena-engine-init)
+endef
+BALENA_ENGINE_POST_INSTALL_TARGET_HOOKS += BALENA_ENGINE_INSTALL_SYMLINK
+
+$(eval $(golang-package))
