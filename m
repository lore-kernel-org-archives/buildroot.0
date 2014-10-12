From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sun, 12 Oct 2014 15:15:39 +0200
Subject: [Buildroot] [PATCH] uclibc: build uclibc unstripped by default
Message-ID: <1413119739-4977-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc could be build stripped (implemented as link-time option in uClibc).
This could be useful for those who build root fs manually.

In Buildroot there's it's own strip stage wich strips most of shared libs
in "target" folder (well except kernel modules known to not work properly being
stripped and libpthread required to be non-stripped for correct debugging with
gdb of multi-threaded apps).

So there're few problems with current implementation:
 1. uClibc is being stripped 2 times (first on its build stage, second on
    global Buildroot strip stage)
 2. uClibc libs in "staging" folder are also always stripped except if
    "no strip" (BR2_STRIP_none) is explicitly is selected in Buildroot config.
    That makes it possible to remote debug uClibc libs on target only if target
    rootfs was not stripped (which might not be possible due to huge libs
    like Qt)

This patch disables embedded strip in uClibc (still users may modify uClibc
config and explicitly set "DOSTRIP=yes" if really needed).

Interesting that DOSTRIP was not only selected in uClibc config but also was
force set with Buildroot on uClibc configuration step with UCLIBC_STRIP_CONFIG.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uClibc-0.9.31.config   |  2 +-
 package/uclibc/uClibc-0.9.33.config   |  2 +-
 package/uclibc/uClibc-snapshot.config |  2 +-
 package/uclibc/uclibc.mk              | 11 -----------
 4 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/package/uclibc/uClibc-0.9.31.config b/package/uclibc/uClibc-0.9.31.config
index e990178..b23ba73 100644
--- a/package/uclibc/uClibc-0.9.31.config
+++ b/package/uclibc/uClibc-0.9.31.config
@@ -228,7 +228,7 @@ CROSS_COMPILER_PREFIX=""
 UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
-DOSTRIP=y
+# DOSTRIP is not set
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
index eb39df6..0fbce19 100644
--- a/package/uclibc/uClibc-0.9.33.config
+++ b/package/uclibc/uClibc-0.9.33.config
@@ -266,7 +266,7 @@ CROSS_COMPILER_PREFIX=""
 UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
-DOSTRIP=y
+# DOSTRIP is not set
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index 4856287..11dde03 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -271,7 +271,7 @@ CROSS_COMPILER_PREFIX=""
 UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
-DOSTRIP=y
+# DOSTRIP is not set
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ffd1d89..4e09b31 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -395,16 +395,6 @@ UCLIBC_WCHAR_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_WCHAR,$(@D)/.config)
 endif
 
 #
-# strip
-#
-
-ifeq ($(BR2_STRIP_none),y)
-UCLIBC_STRIP_CONFIG = $(call KCONFIG_DISABLE_OPT,DOSTRIP,$(@D)/.config)
-else
-UCLIBC_STRIP_CONFIG = $(call KCONFIG_ENABLE_OPT,DOSTRIP,$(@D)/.config)
-endif
-
-#
 # Commands
 #
 
@@ -444,7 +434,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_THREAD_DEBUG_CONFIG)
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
-	$(UCLIBC_STRIP_CONFIG)
 endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
-- 
1.9.3
