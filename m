From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Mon, 17 Aug 2015 09:10:44 +0200
Subject: [Buildroot] [PATCH v2] pkg-kernel-module: Die when kernel module
	are disabled
Message-ID: <1439795444-32337-1-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test the config of the kernel to see if loadable module support is
enabled, and error out otherwise. This makes the build failure less
confusing.

Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-kernel-module.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index 5fb19be..6fb7704 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -60,6 +60,10 @@ $(2)_MODULE_SUBDIRS ?= .
 # includes and other support files (Booo!)
 define $(2)_KERNEL_MODULES_BUILD
 	@$$(call MESSAGE,"Building kernel module(s)")
+	@if ! grep -Fqx 'CONFIG_MODULES=y' $(LINUX_DIR)/.config; then \
+		echo "ERROR: Kernel does not support loadable modules"; \
+		exit 1; \
+	fi
 	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
 		$$(LINUX_MAKE_ENV) $$($$(PKG)_MAKE) \
 			-C $$(LINUX_DIR) \
-- 
2.1.4
