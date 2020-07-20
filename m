From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 20 Jul 2020 18:47:20 +0200
Subject: [Buildroot] [PATCH 1/4] package/glibc: move version string to
 Kconfig
Message-ID: <20200720164723.359198-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, the libc version is shared by glibc and localedef. Syncing is
usually not strictly mandatory, but we had breakage in the past, when
glibc 2.27 changed locale handling, so that a localedef from 2.26 or
earlier would generate locale definitions unsuitable for glibc 2.27. So,
the safe bet is to keep both in sync.

Keeping them in sync is currently done manually, with hints as comments
in glibc.mk and localedef.mk, and this is error-prone.

By moving the version string to Kconfig, we can ensure the version is
always defined before we scan the packages, and thus it will be easier
to share between glibc and localedef, at which point we'll no longer
need the manual sync.

However, the matter is made a little bit more complex by the fact that
some architectures require a forked version of glibc. For those, in
theory, we should also be using a localedef that is in sync with them.
However, that would require that we also carry a patch so we can build
only localedef for those versions as well.

In practice, those versions are close-enough to upstream that the
localedef from upstream is compatible with those versions. Besides, the
current behaviour is that we are using upstream localedef for those
versions already, so we keep doing that.

So we do not move the site to Kconfig.

So, we will always need to know the upstream version string, even when
usign one of the forked trees. We use a Kconfig trick: a default for a
symbol can be another symbol. We define the upstream version in its own
symbol, which we use as fallback default for the generic version symbol,
when not specific fork is needed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/glibc/Config.in | 17 +++++++++++++++++
 package/glibc/glibc.mk  |  8 +-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 5ecd058145..1c5b33a0dd 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -17,3 +17,20 @@ config BR2_PACKAGE_GLIBC_UTILS
 	  ldconfig, ldd and locale glibc utilities for the target.
 
 endif # BR2_TOOLCHAIN_BUILDROOT_GLIBC
+
+# Keep version string outside of the conditional and keep the upstream
+# version last and unconditional.
+
+# Generate upstream version string using:
+#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
+# When updating the version, please also update localedef
+config BR2_GLIBC_VERSION_UPSTREAM
+	string
+	default "2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427"
+
+config BR2_GLIBC_VERSION
+	string
+	default "arc-2020.03-release"                               if BR2_arc
+	default "7630ed2fa60caea98f500e4a7a51b88f9bf1e176"          if BR2_csky
+	default "06983fe52cfe8e4779035c27e8cc5d2caab31531"          if BR2_RISCV_32
+	default BR2_GLIBC_VERSION_UPSTREAM
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 1881cf0cdc..1801ac7744 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,20 +4,14 @@
 #
 ################################################################################
 
+GLIBC_VERSION = $(call qstrip,$(BR2_GLIBC_VERSION))
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2020.03-release
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
-GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
 GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_csky),y)
-GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
 GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
-# Generate version string using:
-#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-# When updating the version, please also update localedef
-GLIBC_VERSION = 2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.25.4
