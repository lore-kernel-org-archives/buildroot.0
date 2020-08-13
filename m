From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:01:31 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/docker-engine:
 needs some kernel options
Message-ID: <20200813175624.2796281D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a69b5411c26345cf113adeb12689811afa7717d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

according to https://wiki.gentoo.org/wiki/Docker#Kernel /
docker-engine/contrib/check-config.sh.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Peter: synchronize with contrib/check-config.sh, only enforce DM options if
 device mapper driver is enabled]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0390777bfaff6c63acf02160a9b97e2a2066b573)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.mk | 55 ++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2f622014ba..6bb382f5a7 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -79,4 +79,59 @@ define DOCKER_ENGINE_USERS
 	- - docker -1 * - - - Docker Application Container Framework
 endef
 
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
+define DOCKER_ENGINE_DRIVER_BTRFS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BTRFS_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BTRFS_FS_POSIX_ACL)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER),y)
+define DOCKER_ENGINE_DRIVER_DM_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_DM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MD_THIN_PROVISIONING)
+endef
+endif
+
+# based on contrib/check-config.sh
+define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
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
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DUMMY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MACVLAN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPVLAN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VXLAN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
+	$(DOCKER_ENGINE_DRIVER_BTRFS_LINUX_CONFIG_FIXUPS)
+	$(DOCKER_ENGINE_DRIVER_DM_LINUX_CONFIG_FIXUPS)
+endef
+
 $(eval $(golang-package))
