From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 14 Oct 2015 23:05:55 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: bypass buildroot wrapper
In-Reply-To: <1444856755-2011-1-git-send-email-arnout@mind.be>
References: <20151011120859.7e786a73@free-electrons.com>
 <1444856755-2011-1-git-send-email-arnout@mind.be>
Message-ID: <1444856755-2011-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The buildroot internal toolchain now adds a wrapper. When we use a
buildroot toolchain as an external toolchain, we want to bypass this
wrapper and call the compiler directly, for two reasons:

1. The options added by the wrapper are not necessarily appropriate
   when it is reused as an external toolchain. For instance, ccache
   may have been enabled while building the toolchain but not when
   using it as an external toolchain.

2. Currently, the wrapper expects to reside in .../usr/bin, but when
   used as an external toolchain it will be in .../ext-toolchain/bin.
   Therefore, the wrapper can't find the real binary and sysroot
   anymore.

To bypass the wrapper, we check for the existence of *.br_real files in
the external toolchain directory. If any such file exists, the wrapper
will add the .br_real suffix for all the wrapped files. Note that the
wrapper doesn't check if the *.br_real exists for each individual
wrapped file, it just assumes that all wrapped files have a
corresponding .br_real. This is currently true but that may change in
the future of course.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Peter, you requested the check to be in the .mk file rather than in
the wrapper. However, since we have only one wrapper for all wrapped
files, that means that either all of them or none of them should have
the .br_real suffix. Therefore, if we later wrap additional files
(e.g. ld), existing external buildroot toolchains will fail again. So
to fix that, there should be a check in the wrapper.c file itself. But
if we have a check in the wrapper.c, there's no point having a check in
the wrapper.mk as well... So Peter, please tell me if I should instead
drop the check in the .mk file and add one in the .c file. Note that
that can be done as a follow-up so it shouldn't block this patch.

Lightly tested with an internal toolchain, an external Sourcery
toolchain, an external downloaded buildroot toolchain, and an external
pre-installed buildroot toolchain.
---
 toolchain/toolchain-external/toolchain-external.mk | 14 +++++++++++---
 toolchain/toolchain-wrapper.c                      |  6 +++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3fb165c..4e12a1c 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -149,10 +149,18 @@ TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
 endif
 endif
 
+# If this is a buildroot toolchain, it already has a wrapper which we want to
+# bypass. Since this is only evaluated after it has been extracted, we can use
+# $(wildcard ...) here.
+TOOLCHAIN_EXTERNAL_SUFFIX = \
+	$(if $(wildcard $(TOOLCHAIN_EXTERNAL_BIN)/*.br_real),.br_real)
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
+	-DBR_CROSS_PATH_SUFFIX='"$(TOOLCHAIN_EXTERNAL_SUFFIX)"'
+
 TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
-TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc
-TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++
-TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf
+TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf$(TOOLCHAIN_EXTERNAL_SUFFIX)
 
 ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
 # TOOLCHAIN_EXTERNAL_BIN points outside HOST_DIR => absolute path
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 632696c..16a3d78 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -143,10 +143,10 @@ int main(int argc, char **argv)
 
 	/* Fill in the relative paths */
 #ifdef BR_CROSS_PATH_REL
-	ret = snprintf(path, sizeof(path), "%s/" BR_CROSS_PATH_REL "/%s", absbasedir, basename);
+	ret = snprintf(path, sizeof(path), "%s/" BR_CROSS_PATH_REL "/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
 #elif defined(BR_CROSS_PATH_ABS)
-	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s", basename);
-#else /* BR_CROSS_PATH_SUFFIX */
+	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s" BR_CROSS_PATH_SUFFIX, basename);
+#else
 	ret = snprintf(path, sizeof(path), "%s/usr/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
 #endif
 	if (ret >= sizeof(path)) {
-- 
2.5.3
