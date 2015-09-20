From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Sep 2015 20:41:30 +0200
Subject: [Buildroot] [PATCH 04/18] infra: move ccache handling to the
	toolchain wrapper
In-Reply-To: <1442774504-22799-1-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
Message-ID: <1442774504-22799-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we always have a toolchain wrapper now, we can move the ccache
call to the toolchain wrapper.

The hostcc ccache handling obviously stays.

The global addition of ccache to TARGET_CC/CXX is removed, but many
individual packages and infras still add it. This means we have a
chain like this: ccache -> toolchain-wrapper -> ccache -> gcc
However, this is fairly harmless: for cache misses, the inner ccache
just adds overhead and for cache hits, the inner ccache is never
called. Later patches will remove these redundant ccache calls.

As a side effect, perl now supports ccache as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Cc: K?roly Kasza <kaszak@gmail.com>
---
 package/Makefile.in            | 5 -----
 toolchain/toolchain-wrapper.c  | 5 ++++-
 toolchain/toolchain-wrapper.mk | 4 ++++
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 545694f..4b1ce7f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -189,11 +189,6 @@ TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 TARGET_CC_NOCCACHE  := $(TARGET_CC)
 TARGET_CXX_NOCCACHE := $(TARGET_CXX)
 
-ifeq ($(BR2_CCACHE),y)
-TARGET_CC  := $(CCACHE) $(TARGET_CC)
-TARGET_CXX := $(CCACHE) $(TARGET_CXX)
-endif
-
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
 STRIP_STRIP_UNNEEDED := --strip-unneeded
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index f3ff04f..4774692 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -40,6 +40,9 @@ static char sysroot[PATH_MAX];
 #define EXCLUSIVE_ARGS	3
 
 static char *predef_args[] = {
+#ifdef BR_CCACHE
+	BR_CCACHE,
+#endif
 	path,
 	"--sysroot", sysroot,
 #ifdef BR_ABI
@@ -251,7 +254,7 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (execv(path, args))
+	if (execv(args[0], args))
 		perror(path);
 
 	free(args);
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 8e8a445..ab8215d 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -17,6 +17,10 @@ TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 # toolchain wrapper.
 TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'
 
+ifeq ($(BR2_CCACHE),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE='"$(CCACHE)"'
+endif
+
 # For simplicity, build directly into the install location
 define TOOLCHAIN_BUILD_WRAPPER
 	$(Q)mkdir -p $(HOST_DIR)/usr/bin
-- 
2.5.3
