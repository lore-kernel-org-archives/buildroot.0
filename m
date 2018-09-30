From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Sep 2018 20:34:08 +0200
Subject: [Buildroot] [PATCH 1/1] brltty: fix build on mips64el
Message-ID: <20180930183408.4248-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
version 5.5.

Indeed, third patch was merged upstream but it was then reverted:
https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416

Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
was renamed into MKREL. So, instead of patching again brltty, overwrite
LD to set the correct emulation depending on MIPS architecture as
already done in linux-tool-perf.mk.in.
Indeed, it seems that by default ld wants to link a 32 bits binary on
mips64el:
mips64el-linux-ld: Attempt to do relocatable link with elf64-tradlittlemips input and elf32-ntradlittlemips output

Fixes:
 - http://autobuild.buildroot.org/results/31f682838b3d3b2c7103b5c51f2aba0b89d4f630

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brltty/brltty.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 21f6877bb8..8e1d934899 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -15,6 +15,27 @@ BRLTTY_LICENSE_FILES = LICENSE-LGPL README
 BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf \
 	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
 
+# We need to pass an argument to ld for setting the emulation when
+# building for MIPS architecture, otherwise the default one will always
+# be used and the compilation for most variants will fail.
+ifeq ($(BR2_mips),y)
+BRLTTY_CONF_ENV += LD="$(TARGET_LD) -m elf32btsmip"
+else ifeq ($(BR2_mipsel),y)
+BRLTTY_CONF_ENV += LD="$(TARGET_LD) -m elf32ltsmip"
+else ifeq ($(BR2_mips64),y)
+ifeq ($(BR2_MIPS_NABI32),y)
+BRLTTY_CONF_ENV += LD="$(TARGET_LD) -m elf32btsmipn32"
+else
+BRLTTY_CONF_ENV += LD="$(TARGET_LD) -m elf64btsmip"
+endif
+else ifeq ($(BR2_mips64el),y)
+ifeq ($(BR2_MIPS_NABI32),y)
+BRLTTY_CONF_ENV += LD="$(TARGET_LD) -m elf32ltsmipn32"
+else
+BRLTTY_CONF_ENV += LD="$(TARGET_LD) -m elf64ltsmip"
+endif
+endif
+
 BRLTTY_CONF_OPTS = \
 	--disable-java-bindings \
 	--disable-lisp-bindings \
-- 
2.17.1
