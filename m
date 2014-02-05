From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 10:44:02 +0100
Subject: [Buildroot] [PATCH 3 of 5 v3] infra: remove usage of 4th parameter
 to inner-generic-package
In-Reply-To: <patchbomb.1391593439@argentina>
References: <patchbomb.1391593439@argentina>
Message-ID: <572693f56c93cd8f68ce.1391593442@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation of the removal of the 4th parameter to inner-generic-package
and the pkgparentdir helper function, this patch removes the direct usage of
this 4th parameter. The remaining usage
ifeq ($(4),boot/)
can become
$(filter boot/%,$(pkgdir))
instead (and similar for toolchain).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: don't use call on pkgdir (Arnout)

 package/pkg-generic.mk |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -516,9 +516,9 @@ endif
 # kernel case, the bootloaders case, and the normal packages case.
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
-else ifeq ($(4),boot/)
+else ifneq ($(filter boot/%,$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
-else ifeq ($(4),toolchain/)
+else ifneq ($(filter toolchain/%,$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_$(2)
 else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
