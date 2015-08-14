From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Fri, 14 Aug 2015 11:58:42 +0200
Subject: [Buildroot] [PATCH] pkg-kernel-module: Die when kernel modules are
	disabled
Message-ID: <1439546322-21504-1-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test the config of the kernel to see if loadable module support is
enabled, and error out otherwise. This makes the build failure less
confusing.

Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
---
 package/pkg-kernel-module.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index 5fb19be..e7dc33e 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -60,6 +60,10 @@ $(2)_MODULE_SUBDIRS ?= .
 # includes and other support files (Booo!)
 define $(2)_KERNEL_MODULES_BUILD
 	@$$(call MESSAGE,"Building kernel module(s)")
+	@if ! grep -Fqx 'CONFIG_MODULES=y' $(LINUX_DIR)/.config; then \
+		echo ERROR: Kernel does not support loadable modules; \
+		false; \
+	fi
 	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
 		$$(LINUX_MAKE_ENV) $$($$(PKG)_MAKE) \
 			-C $$(LINUX_DIR) \
-- 
2.1.4
