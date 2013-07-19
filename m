From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 23:46:56 +0200
Subject: [Buildroot] [git commit] uclibc/arm: doesn't build in thumb(1) mode
	with threads
Message-ID: <20130719220803.1D14899CD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d244782caadd17849910451e707366fcbec68cca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It runs out of registers, it fails even in official form
(COMPILE_IN_THUMB_MODE=y) so just build it in ARM mode since EABI
mandates interworking.
Tested in an arm920t board.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uclibc/Config.in |    2 +-
 package/uclibc/uclibc.mk |    7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 8d16e8c..90aae90 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -185,7 +185,7 @@ config BR2_UCLIBC_ARM_TYPE
 config BR2_UCLIBC_ARM_BX
 	bool
 	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
-	default y if !BR2_fa265 && !BR2_strongarm
+	default y if (BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2)
 
 config BR2_UCLIBC_MIPS_ABI
 	string
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index d5ea7a4..044de21 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -74,6 +74,11 @@ define UCLIBC_ARM_ABI_CONFIG
 	$(call UCLIBC_OPT_SET,CONFIG_ARM_EABI,y,$(@D))
 endef
 
+# Thumb build is broken with threads, build in ARM mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+UCLIBC_EXTRA_CFLAGS += -marm
+endif
+
 ifeq ($(BR2_UCLIBC_ARM_BX),y)
 define UCLIBC_ARM_BX_CONFIG
 	$(call UCLIBC_OPT_SET,USE_BX,y,$(@D))
@@ -348,7 +353,7 @@ endif
 UCLIBC_MAKE_FLAGS = \
 	ARCH="$(UCLIBC_TARGET_ARCH)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
 	HOSTCC="$(HOSTCC)"
 
 define UCLIBC_SETUP_DOT_CONFIG
