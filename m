From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:03 +0200
Subject: [Buildroot] [PATCH v2 16/30] valgrind: use the BR2_ARM_CPU_ARM*
	options
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using the exhaustive list of Cortex-A ARM cores, use
BR2_ARM_CPU_ARMV7A instead. We also fix a wrong comment that said the
Valgrind package could only be selected for Cortex-A8 and Cortex-A9,
which was true a long time ago, but was no longer true since it was
also enabled for all the other Cortex-A platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/valgrind/Config.in   | 7 +++----
 package/valgrind/valgrind.mk | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 253555b..b7521b0 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
-	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a5 || \
-		   BR2_cortex_a7 || BR2_cortex_a8 || BR2_cortex_a9 || \
-		   BR2_cortex_a12 || BR2_cortex_a15 || BR2_powerpc || \
-		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_i386 || BR2_x86_64 || BR2_ARM_CPU_ARMV7A || \
+		   BR2_powerpc || BR2_mips || BR2_mipsel || BR2_mips64 || \
+		   BR2_mips64el
 	help
 	  Tool for debugging and profiling Linux programs.
 
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 9b79941..b65e048 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -16,8 +16,8 @@ VALGRIND_AUTORECONF = YES
 # host tuple to determine whether it's being built for ARMv7 or
 # not. Therefore, we adjust the host tuple to specify we're on
 # ARMv7. The valgrind package is guaranteed, through Config.in, to
-# only be selected on Cortex A8 and Cortex A9 platforms.
-ifeq ($(BR2_cortex_a5)$(BR2_cortex_a7)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a12)$(BR2_cortex_a15),y)
+# only be selected on ARMv7-A platforms.
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 VALGRIND_CONF_OPTS += \
 	--host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
 endif
-- 
2.0.0
