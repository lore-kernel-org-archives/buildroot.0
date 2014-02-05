From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2014 12:10:10 +0100
Subject: [Buildroot] [git commit] infra: remove usage of 4th parameter to
	inner-generic-package
Message-ID: <20140205123039.9E3039C783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac57c640c6e2d605f25d150bdede17f6f94edd76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation of the removal of the 4th parameter to inner-generic-package
and the pkgparentdir helper function, this patch removes the direct usage of
this 4th parameter. The remaining usage
ifeq ($(4),boot/)
can become
$(filter boot/%,$(pkgdir))
instead (and similar for toolchain).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e04a93e..5778c5c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -516,9 +516,9 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
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
