From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 20:50:12 +0200
Subject: [Buildroot] [PATCH 08/10] linux: adjust kernel config according to
	the Buildroot configuration
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <655e8a3a75bc2f73712ebabca64e83805dd8b87d.1276454802.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We only adjust the configuration or ARM EABI and IPv6. The (more
complicated) initramfs case is handled in a separate commit. The user
is expected to take care of all other configuration details (like
having Netfilter enabled to make iptables work, etc.)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d3a583e..4cdc304 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -90,6 +90,18 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM),y)
 	cp $(BR2_LINUX_KERNEL_CUSTOM_FILE) $(@D)/.config
 	yes "" | $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
 endif
+ifeq ($(BR2_ARM_EABI),y)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_OABI_COMPAT,$(@D)/.config)
+else
+	$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config)
+endif
+ifeq ($(BR2_INET_IPV6),y)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6,$(@D)/.config)
+else
+	$(call KCONFIG_DISABLE_OPT,CONFIG_IPV6,$(@D)/.config)
+endif
+	yes "" | $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig 2>&1 >/dev/null
 	$(Q)touch $@
 
 # Compilation
-- 
1.7.0.4
