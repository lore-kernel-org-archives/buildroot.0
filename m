From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 21:53:00 +0200
Subject: [Buildroot] [git commit] Fix selection of bootloaders from
	$(BR2_EXTERNAL)
Message-ID: <20150712195304.E4486818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=470cd0dcada5c2df8c84d89dba1077ad74d1e599
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a package is based on "generic-package", pkg-generic.mk will compute
the name of the Kconfig variable to use for checking if this package has
been selected by the user.

Unfortunately, this mechanism does not take into account the case where
a bootloader is declared in a $(BR2_EXTERNAL)/boot directory.

So, even if the bootloader has been selected, it will not be added to
$(TARGETS) and will not be built.

This patch fixes this issue.

[Arnout: use single filter line, also apply this to toolchain]

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 82376df..e85b4bf 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -642,9 +642,9 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
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
