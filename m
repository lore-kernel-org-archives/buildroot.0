From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 18:45:23 +0100
Subject: [Buildroot] [git commit] xtables-addons: enable necessary kernel
	options
Message-ID: <20150110175417.4B03B803E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5d715dda5b42e15ae3526c111d26307c9f13638
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the required conntrack/netfilter options, otherwise
xtables-addons will fail to build.
The basic iptables options are already covered by the iptables package
which is a required dependency anyway.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a3efbb2..680521c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -217,6 +217,9 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES,$(@D)/.config))
+	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
