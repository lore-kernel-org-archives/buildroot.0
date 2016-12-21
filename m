From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 21 Dec 2016 12:55:08 -0600
Subject: [Buildroot] [PATCH] valgrind: Force -fno-stack-protector in CFLAGS
Message-ID: <1482346508-28809-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Brandon Maier <brandon.maier@rockwellcollins.com>

Valgrind must be compiled with no stack protection. Valgrind defaults
CFLAGS to -fno-stack-protector, but Buildroot's CFLAGS may override
if SSP is enabled.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---

v1 -> v2
[Thomas P
  - Update language to state Buildroot may enable SSP
  - Use a local temp VALGRIND_CFLAGS to build out CFLAGS used
    in VALGRIND_CONF_ENV

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/valgrind/valgrind.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 087a381..652432f 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -17,6 +17,13 @@ VALGRIND_INSTALL_STAGING = YES
 # patch 0004-Fixes-for-musl-libc.patch touching configure.ac
 VALGRIND_AUTORECONF = YES
 
+# Valgrind must be compiled with no stack protection, so forcefully
+# pass -fno-stack-protector to override what Buildroot may have in
+# TARGET_CFLAGS if BR2_SSP_* support is enabled.
+VALGRIND_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	-fno-stack-protector
+
 # When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
 # -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture,
 # it forcibly adds -march=mips64. This causes Valgrind to be built
@@ -27,9 +34,11 @@ VALGRIND_AUTORECONF = YES
 # and pass the right -march option, so they take precedence over
 # Valgrind's wrongfully detected value.
 ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
-VALGRIND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -march=$(BR2_GCC_TARGET_ARCH)"
+VALGRIND_CFLAGS += -march=$(BR2_GCC_TARGET_ARCH)
 endif
 
+VALGRIND_CONF_ENV = CFLAGS="$(VALGRIND_CFLAGS)"
+
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
 # host tuple to determine whether it's being built for ARMv7 or
 # not. Therefore, we adjust the host tuple to specify we're on
-- 
1.9.1
