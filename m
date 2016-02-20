From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 20 Feb 2016 12:28:50 +0100
Subject: [Buildroot] [PATCH] sysklogd: override SKFLAGS with TARGET_CFLAGS
Message-ID: <1455967730-10332-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TARGET_CFLAGS is not taken into account since SKFLAGS is used as CFLAGS.
We need to override SKFLAGS with TARGET_CFLAGS but keep -DSYSV which was
present in SKFLAGS.

Improve the previous fix introduced by
8e3a5c13546451c0c6ceb8bc64e4397ceed14aca.

Fixes:
http://autobuild.buildroot.net/results/2fb/2fb94ecfdc32761a09da35e6fcbdd512847ec911

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Reported-by: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/sysklogd.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 9e315bc..49997d4 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -14,16 +14,10 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSKLOGD_DEPENDENCIES = busybox
 endif
 
-# CS PowerPC 2012.03 triggers compiler bug.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2),y)
-define SYSKLOGD_WORKAROUND_COMPILER_BUG
-	$(SED) 's/-O3/-O2/' $(@D)/Makefile
-endef
-SYSKLOGD_POST_PATCH_HOOKS = SYSKLOGD_WORKAROUND_COMPILER_BUG
-endif
-
+# Override SKFLAGS which is used as CFLAGS.
 define SYSKLOGD_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) SKFLAGS="$(TARGET_CFLAGS) -DSYSV" \
+		-C $(@D)
 endef
 
 define SYSKLOGD_INSTALL_TARGET_CMDS
-- 
2.5.0
