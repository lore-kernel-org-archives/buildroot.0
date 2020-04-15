From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Wed, 15 Apr 2020 17:00:31 -0500
Subject: [Buildroot] [PATCH 1/2] toolchain/toolchain-wrapper: Handle debug
 info paths in gcc7 or below for reproducibility
Message-ID: <20200415220032.140083-1-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In GCC8 the flag -ffile-prefix-map handles cleaning up both the __FILE__
macros and the debug info paths. In GCC7 or below we are manually
handling the __FILE__ macros, but not debug info paths. Use
-fdebug-prefix-map to clean them up.

See for more detail: https://reproducible-builds.org/docs/build-path/

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 toolchain/toolchain-wrapper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 09dda17890..7d55050135 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -26,6 +26,7 @@ TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
 TOOLCHAIN_WRAPPER_OPTS += -ffile-prefix-map=$(BASE_DIR)=buildroot
 else
+TOOLCHAIN_WRAPPER_OPTS += -fdebug-prefix-map=$(BASE_DIR)=buildroot
 TOOLCHAIN_WRAPPER_OPTS += -D__FILE__=\"\" -D__BASE_FILE__=\"\" -Wno-builtin-macro-redefined
 endif
 endif
-- 
2.25.1
