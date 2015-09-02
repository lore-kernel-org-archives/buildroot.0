From: Doug Kehn <rdkehn@yahoo.com>
Date: Tue,  1 Sep 2015 20:37:53 -0500
Subject: [Buildroot] [PATCH 1/1] package/pkg-kernel-module.mk: module build
	fails
Message-ID: <1441157873-12285-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Observed the following when building cryptodev-linux:
>>> cryptodev-linux 1.7 Building kernel module(s)
grep: /.config: No such file or directory
ERROR: Kernel does not support loadable modules

Fix LINUX_DIR reference when determining if kernel configuration
supports loadable modules.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/pkg-kernel-module.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index 6fb7704..7628352 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -60,7 +60,7 @@ $(2)_MODULE_SUBDIRS ?= .
 # includes and other support files (Booo!)
 define $(2)_KERNEL_MODULES_BUILD
 	@$$(call MESSAGE,"Building kernel module(s)")
-	@if ! grep -Fqx 'CONFIG_MODULES=y' $(LINUX_DIR)/.config; then \
+	@if ! grep -Fqx 'CONFIG_MODULES=y' $$(LINUX_DIR)/.config; then \
 		echo "ERROR: Kernel does not support loadable modules"; \
 		exit 1; \
 	fi
-- 
2.5.0
