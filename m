From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Oct 2014 18:10:52 -0300
Subject: [Buildroot] [PATCH 3/3] xtables-addons: enable necessary kernel
	options
In-Reply-To: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413925852-12765-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable the required conntrack/netfilter options, otherwise
xtables-addons will fail to build.
The basic iptables options are already covered by the iptables package
which is a required dependency anyway.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index b9d3c8e..ee8c6a0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -215,6 +215,9 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES,$(@D)/.config))
+	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
-- 
2.0.4
