From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Oct 2015 10:50:35 +0200
Subject: [Buildroot] [git commit] toolchain-external: bypass buildroot
	wrapper
Message-ID: <20151017085309.AAFD07FA49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ce73dca5238d30b0cbfe64c1ecbaec777c6a8fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   14 +++++++++++---
 toolchain/toolchain-wrapper.c                      |    6 +++---
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
