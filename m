From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  7 Oct 2014 15:01:32 +0200
Subject: [Buildroot] [Patch v2 1/1] Fix selection of bootloaders from
	$(BR2_EXTERNAL)
Message-ID: <1412686892-29394-1-git-send-email-eric.le.bihan.dev@free.fr>
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

This patch fixes this issue, as well as handle toolchains.

Changes v1 -> v2:

  - use multiple patterns in filter (suggested by ThomasDS).
  - handle toolchains.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d04fd36..e201803 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -614,9 +614,9 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 # kernel case, the bootloaders case, and the normal packages case.
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
-else ifneq ($$(filter boot/%,$(pkgdir)),)
+else ifneq ($$(filter boot/% $(BR2_EXTERNAL)/boot/%,$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
-else ifneq ($$(filter toolchain/%,$(pkgdir)),)
+else ifneq ($$(filter toolchain/% $(BR2_EXTERNAL)/toolchain/%,$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_$(2)
 else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
--
1.9.1
