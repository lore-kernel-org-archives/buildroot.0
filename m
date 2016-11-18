From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 10:10:11 +0100
Subject: [Buildroot] [PATCH v2 02/15] reproducible: fix DATE/TIME macros in
	toolchain-wrapper
In-Reply-To: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479460224-6119-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The use __DATE__ and __TIME__ are one of most common sources of
non-reproducible binaries. We take advantage of toolchain-wrapper to fix
these macros.

Notice this workaround will be useless this next gcc versions since it will
include suport for SOURCE_DATE_EPOCH variable.

Note: quoting of $(TOOLCHAIN_WRAPPER_ARGS) is a mess, but I did not find easier
way to do (without involving `$(shell ...)')

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 toolchain/toolchain-wrapper.c  | 9 +++++++++
 toolchain/toolchain-wrapper.mk | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 925d013..28709ec 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -75,6 +75,15 @@ static char *predef_args[] = {
 #if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
 	"-EB",
 #endif
+#if defined(BR_REPRODUCIBLE_TIME) || defined(BR_REPRODUCIBLE_DATE)
+	"-Wno-builtin-macro-redefined",
+#endif
+#ifdef BR_REPRODUCIBLE_TIME
+	"-D__TIME__=" BR_REPRODUCIBLE_TIME,
+#endif
+#ifdef BR_REPRODUCIBLE_DATE
+	"-D__DATE__=" BR_REPRODUCIBLE_DATE,
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index e7aa5fb..7067134 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -30,6 +30,11 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_REPRODUCIBLE_TIME="\"\\\"`date -d @$(SOURCE_DATE_EPOCH) "+%T"`\\\"\""
+TOOLCHAIN_WRAPPER_ARGS += -DBR_REPRODUCIBLE_DATE="\"\\\"`date -d @$(SOURCE_DATE_EPOCH) "+%b %e %Y"`\\\"\""
+endif
+
 define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
-- 
1.9.1
