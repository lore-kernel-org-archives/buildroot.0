From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] linux: adjust kernel config
	according to the Buildroot configuration
Message-ID: <20100623092836.D2D4D81886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=100c09a53b8806b2281a93ad21744d26f68bcc6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We only adjust the configuration or ARM EABI and IPv6. The (more
complicated) initramfs case is handled in a separate commit. The user
is expected to take care of all other configuration details (like
having Netfilter enabled to make iptables work, etc.)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8b83e30..71d9616 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -85,6 +85,16 @@ ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(@D)/.config
 endif
+ifeq ($(BR2_ARM_EABI),y)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config)
+else
+	$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config)
+endif
+ifeq ($(BR2_INET_IPV6),y)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6,$(@D)/.config)
+else
+	$(call KCONFIG_DISABLE_OPT,CONFIG_IPV6,$(@D)/.config)
+endif
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
 	$(Q)touch $@
 
-- 
1.7.1
