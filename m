From: Rodrigo Rebello <rprebello@gmail.com>
Date: Mon, 16 Nov 2015 23:48:00 -0200
Subject: [Buildroot] [PATCH 1/1] toolchain-wrapper: prevent use of
	unsupported -fstack-protector*
Message-ID: <1447724880-5020-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In cases where, for example, the compiler accepts -fstack-protector*
options, but the C library does not provide the necessary
__stack_chk_*() functions, many configure scripts incorrectly assume SSP
is supported by the toolchain. This is because either no link test is
performed by them, or the test code used does not actually trigger stack
protection code emission, producing false positives.

Forcing toolchain-wrapper to error out on stack protection options when
SSP is known to be unsupported works as a way to prevent these false
positives. At the same time, it renders package-specific workarounds,
like disabling SSP detection by force, unnecessary.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
This was suggested by Arnout Vandecappelle while we were discussing a
patch to solve a qemu-specific SSP detection issue:

https://patchwork.ozlabs.org/patch/543115/
---
 toolchain/toolchain-wrapper.c  | 17 +++++++++++++++++
 toolchain/toolchain-wrapper.mk |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 887058f..cc6da9e 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -193,6 +193,23 @@ int main(int argc, char **argv)
 		*cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
 #endif
 
+#ifndef BR_TOOLCHAIN_HAS_SSP
+	/* Abort in the presence of any stack-protector options if SSP
+	 * is unsupported by the toolchain. This helps prevent false
+	 * positives in tests performed by configure scripts.
+	 */
+	for (i = 1; i < argc; i++) {
+		if (!strncmp(argv[i], "-fstack-protector", strlen("-fstack-protector"))) {
+			fprintf(stderr,
+			    "%s: error: invalid command line option '%s' "
+			    "(SSP unsupported by the toolchain)\n",
+			    program_invocation_short_name,
+			    argv[i]);
+			exit(1);
+		}
+	}
+#endif
+
 #if defined(BR_ARCH) || \
     defined(BR_CPU)
 	/* Add our -march/cpu flags, but only if none of
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index af39071..a936d7b 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -30,6 +30,10 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_TOOLCHAIN_HAS_SSP
+endif
+
 # For simplicity, build directly into the install location
 define TOOLCHAIN_BUILD_WRAPPER
 	$(Q)mkdir -p $(HOST_DIR)/usr/bin
-- 
2.1.4
