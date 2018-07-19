From: =?gb2312?B?tdTV2dD5?= <zhaizhaoxuan@xiaomi.com>
Date: Thu, 19 Jul 2018 09:47:09 +0000
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: build host-ccache before
 kconfig
Message-ID: <20180719094658.26826-1-zhaizhaoxuan@xiaomi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the ccache is enabled, the HOSTCC variable refers to the ccache binary.

But the host-ccache is not a dependency of the kconfig's .config. Some targets
such as `busybox-menuconfig` may calls Kconfig before the host-ccache is ready.
If the host-ccache is not ready yet, the Kconfig will fail. Because it can not
use $HOSTCC to build its utilities without ccache.

This issue can be reproduce with the following commands:
 1. make clean defconfig
 2. echo "BR2_CCACHE=y" >> .config
 3. make olddefconfig busybox-menuconfig

This patch fixes this issue by add host-ccache to the dependencies of .config.
So that the Kconfig can use $HOSTCC.

Signed-off-by: Zhai Zhaoxuan <zhaizhaoxuan@xiaomi.com>
---
 package/pkg-kconfig.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 81bba5220c..44bcda4cd2 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -54,6 +54,10 @@ $(2)_KCONFIG_FIXUP_CMDS ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
 $(2)_KCONFIG_DOTCONFIG ?= .config
 
+ifeq ($(BR2_CCACHE),y)
+$(2)_KCONFIG_DEPENDENCIES += host-ccache
+endif
+
 # The config file as well as the fragments could be in-tree, so before
 # depending on them the package should be extracted (and patched) first.
 #
@@ -108,7 +112,7 @@ endef
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first.
-$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES) $$($(2)_KCONFIG_DEPENDENCIES)
 	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
 		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
-- 
2.18.0
