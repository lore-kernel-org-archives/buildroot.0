From: Stephan Hoffmann <sho@relinux.de>
Date: Mon,  4 Feb 2013 14:12:02 +0100
Subject: [Buildroot] [PATCH] lttng-tools: Fix compilation
Message-ID: <1359983522-20044-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compiling lttng-tools fails when lttng-libust is enabled bacause of a missing
-lurcu-bp in the linker command line, at least for linaro 2012.12 toolchain.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/lttng-tools/lttng-tools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 5be3abb..288e351 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -21,6 +21,8 @@ LTTNG_AUTORECONF = YES
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LTTNG_TOOLS_CONF_OPT += --enable-lttng-ust
 LTTNG_TOOLS_DEPENDENCIES += lttng-libust
+# Build fails without this, at least with Linuaro 2012.12 toolchain
+LTTNG_TOOLS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lurcu-bp"
 else
 LTTNG_TOOLS_CONF_OPT += --disable-lttng-ust
 endif
-- 
1.7.0.4
