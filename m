From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 13 Mar 2019 00:01:55 +0100
Subject: [Buildroot] [git commit] toolchain: set the ssp gcc option in
 kconfig
Message-ID: <20190312230909.085927FDC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8ec113eb18b3699369e1c08e05baaac36383e42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we repeat all the SSP level selection deep down to the
toolchain wrapper itself, where we eventually translate it to the
actual SSP option to use. This is a bit redundant.

Additionally, we will want to check that the toolchain actually
supports that option (for those toolchain where it was backported).

So, move the translation into kconfig, and add the qstrip'ed value
to the additional flags passed to the wrapper. Add it before
user-supplied opitons, to keep the previous behaviour (and allow
anyone crazy-enough to override it with BR2_TARGET_OPTIMIZATION).

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in                      | 6 ++++++
 toolchain/toolchain-wrapper.c  | 9 ---------
 toolchain/toolchain-wrapper.mk | 9 +--------
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/Config.in b/Config.in
index d58d8dc04a..757ad1ca40 100644
--- a/Config.in
+++ b/Config.in
@@ -764,6 +764,12 @@ config BR2_SSP_ALL
 
 endchoice
 
+config BR2_SSP_OPTION
+	string
+	default "-fstack-protector"        if BR2_SSP_REGULAR
+	default "-fstack-protector-strong" if BR2_SSP_STRONG
+	default "-fstack-protector-all"    if BR2_SSP_ALL
+
 comment "Stack Smashing Protection needs a toolchain w/ SSP"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index e9c5cd9d32..c73a0cc079 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -98,15 +98,6 @@ static char *predef_args[] = {
 #if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
 	"-EB",
 #endif
-#ifdef BR_SSP_REGULAR
-	"-fstack-protector",
-#endif
-#ifdef BR_SSP_STRONG
-	"-fstack-protector-strong",
-#endif
-#ifdef BR_SSP_ALL
-	"-fstack-protector-all",
-#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index c9e6fd3f3d..ca66fa7ba4 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -17,6 +17,7 @@ TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
 TOOLCHAIN_WRAPPER_OPTS = \
+	$(call qstrip,$(BR2_SSP_OPTION)) \
 	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
@@ -53,14 +54,6 @@ else ifeq ($(BR2_RELRO_FULL),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_FULL
 endif
 
-ifeq ($(BR2_SSP_REGULAR),y)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_REGULAR
-else ifeq ($(BR2_SSP_STRONG),y)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_STRONG
-else ifeq ($(BR2_SSP_ALL),y)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_ALL
-endif
-
 define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
