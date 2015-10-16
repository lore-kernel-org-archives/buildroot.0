From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 16 Oct 2015 08:46:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/wavpack: bump to version 4.75.2
Message-ID: <1444978001-8473-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autoreconf is not necessary anymore.

WavPack "autodetects" CPU type to enable ASM code. However, the assembly code
for ARM is written for ARMv7 only and building WavPack for an ARM-non-v7
architecture will fail. We explicitly enable ASM for the supported
architectures x86, x64 and ARMv7 and disable it for all others.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/wavpack/wavpack.hash |  2 +-
 package/wavpack/wavpack.mk   | 14 +++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index 18dcfbc..f15afc2 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 2cade379b0aba99fbc4e442ccc6dac6c609f6212e46516a083e24c8c364430a4 wavpack-4.70.0.tar.bz2
+sha256 7d31b34166c33c3109b45c6e4579b472fd05e3ee8ec6d728352961c5cdd1d6b0  wavpack-4.75.2.tar.bz2
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index c9bae47..02184e3 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,14 +4,22 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 4.70.0
+WAVPACK_VERSION = 4.75.2
 WAVPACK_SITE = http://www.wavpack.com
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
 WAVPACK_INSTALL_STAGING = YES
-# configure not up to date
-WAVPACK_AUTORECONF = YES
 WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 WAVPACK_LICENSE = BSD-3c
 WAVPACK_LICENSE_FILES = COPYING
 
+# WavPack "autodetects" CPU type to enable ASM code. However, the assembly code
+# for ARM is written for ARMv7 only and building WavPack for an ARM-non-v7
+# architecture will fail. We explicitly enable ASM for the supported
+# architectures x86, x64 and ARMv7 and disable it for all others.
+ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_ARM_CPU_ARMV7A),y)
+WAVPACK_CONF_OPTS += --enable-asm
+else
+WAVPACK_CONF_OPTS += --disable-asm
+endif
+
 $(eval $(autotools-package))
-- 
2.6.1
