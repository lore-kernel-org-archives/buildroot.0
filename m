From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 14 Oct 2015 23:05:54 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: use '.br_real' instead of '.real' for
	the wrapped toolchain
In-Reply-To: <20151011120859.7e786a73@free-electrons.com>
References: <20151011120859.7e786a73@free-electrons.com>
Message-ID: <1444856755-2011-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If an externally built toolchain also wraps the toolchain executables,
there is a risk that it will also use the '.real' extension. To
minimise this risk, use a more buildroot-specific extension instead:
'.br_real'.

For the time being, this is not yet a problem since the internal
toolchain never has such a wrapper. However, in a later commit we
will bypass the buildroot wrapper for external toolchains, so we
have to avoid doing that when it's not buildroot that wrapped it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note: I didn't check if any of our external toolchains actually has
such a .real thingy, but better safe than sorry.
---
 package/gcc/gcc.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 1b30e6d..ef606c4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -236,7 +236,7 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".real"'
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 
 ifeq ($(BR2_CCACHE),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
@@ -272,23 +272,23 @@ endif # BR2_CCACHE
 # used. However, we should not add the toolchain wrapper for them, and they
 # match the *cc-* pattern. Therefore, an additional case is added for *-ar,
 # *-ranlib and *-nm.
-# Avoid that a .real is symlinked a second time.
+# Avoid that a .br_real is symlinked a second time.
 # Also create <arch>-linux-<tool> symlinks.
 define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 	$(Q)cd $(HOST_DIR)/usr/bin; \
 	for i in $(GNU_TARGET_NAME)-*; do \
 		case "$$i" in \
-		*.real) \
+		*.br_real) \
 			;; \
 		*-ar|*-ranlib|*-nm) \
 			ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
 			;; \
 		*cc|*cc-*|*++|*++-*|*cpp) \
-			rm -f $$i.real; \
-			mv $$i $$i.real; \
+			rm -f $$i.br_real; \
+			mv $$i $$i.br_real; \
 			ln -sf toolchain-wrapper $$i; \
 			ln -sf toolchain-wrapper $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
-			ln -snf $$i.real $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}.real; \
+			ln -snf $$i.br_real $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}.br_real; \
 			;; \
 		*) \
 			ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
-- 
2.5.3
