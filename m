From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 25 Sep 2014 19:47:49 +0200
Subject: [Buildroot] [PATCH] Fix selection of bootloaders from
	$(BR2_EXTERNAL)
Message-ID: <1411667269-8347-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a package is based on "generic-package", pkg-generic.mk will compute
the name of the Kconfig variable to use for checking if this package has
been selected by the user.

Unfortunately, this mechanism does not take into account the case where
a bootloader is declared in a $(BR2_EXTERNAL)/boot directory.

So, even if the bootloader has been selected, it will not be added to
$(TARGETS) and will not be built.

This patch fixes this issue.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d04fd36..064d736 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -616,6 +616,8 @@ ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
 else ifneq ($$(filter boot/%,$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
+else ifneq ($$(filter $(BR2_EXTERNAL)/boot/%,$(pkgdir)),)
+$(2)_KCONFIG_VAR = BR2_TARGET_$(2)
 else ifneq ($$(filter toolchain/%,$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_$(2)
 else
-- 
1.9.1
