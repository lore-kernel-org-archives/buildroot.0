From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Mar 2016 17:03:58 +0100
Subject: [Buildroot] [git commit] busybox: tweak IPv6/largefile handling
Message-ID: <20160304160920.2A761817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a5be2a042f3c1d55c5599ad819333a2150955ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #8736

When IPv6 and largefile options were removed from Buildroot, the code to
force these options in busybox were still left in.

There's no strong reason to forcefully enable these options (only to disable
options if the system cannot support it like we do for nommu), so instead
enable the options in our default defconfig, allowing people to override
this if they use a custom config.

While we're at it, enable the prefer-ipv4 option so network applets like
ntpd doesn't fail when dual stacked hosts are resolved from a system without
IPv6 support enabled in the kernel.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.config |  8 ++++----
 package/busybox/busybox.mk     | 12 ------------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index bb138f9..2cf989d 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -63,7 +63,7 @@ CONFIG_FEATURE_SYSLOG=y
 # CONFIG_BUILD_LIBBUSYBOX is not set
 # CONFIG_FEATURE_INDIVIDUAL is not set
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
-# CONFIG_LFS is not set
+CONFIG_LFS=y
 CONFIG_CROSS_COMPILER_PREFIX=""
 CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
@@ -764,9 +764,9 @@ CONFIG_PING=y
 # CONFIG_PING6 is not set
 CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_WHOIS is not set
-# CONFIG_FEATURE_IPV6 is not set
+CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
-# CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
+CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
 CONFIG_ARP=y
 CONFIG_ARPING=y
@@ -810,7 +810,7 @@ CONFIG_FEATURE_IFUPDOWN_IP=y
 # CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
 # CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
 CONFIG_FEATURE_IFUPDOWN_IPV4=y
-# CONFIG_FEATURE_IFUPDOWN_IPV6 is not set
+CONFIG_FEATURE_IFUPDOWN_IPV6=y
 CONFIG_FEATURE_IFUPDOWN_MAPPING=y
 # CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
 CONFIG_INETD=y
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7f6dbd6..7c904c8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -107,16 +107,6 @@ define BUSYBOX_SET_MMU
 endef
 endif
 
-define BUSYBOX_SET_LARGEFILE
-	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_ENABLE_OPT,CONFIG_FDISK_SUPPORT_LARGE_DISKS,$(BUSYBOX_BUILD_CONFIG))
-endef
-
-define BUSYBOX_SET_IPV6
-	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IPV6,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IFUPDOWN_IPV6,$(BUSYBOX_BUILD_CONFIG))
-endef
-
 # If we're using static libs do the same for busybox
 ifeq ($(BR2_STATIC_LIBS),y)
 define BUSYBOX_PREFER_STATIC
@@ -219,8 +209,6 @@ endef
 
 define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_MMU)
-	$(BUSYBOX_SET_LARGEFILE)
-	$(BUSYBOX_SET_IPV6)
 	$(BUSYBOX_PREFER_STATIC)
 	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_SET_CRYPT_SHA)
