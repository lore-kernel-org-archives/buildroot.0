From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 21 Oct 2014 21:32:36 +0200
Subject: [Buildroot] [PATCH] util-linux: use configure option instead of
	patching makefile
Message-ID: <1413919956-31413-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use --disable-all-programs configure option instead of sed base
patching of Makefile.am in case no util-linux binaries are selected.

Suggested by Thomas Petazzoni ([1]).

With this patch applied the following libs are no longer build by default:

util-linux-2.25.1/.libs/libfdisk.a
util-linux-2.25.1/.libs/libsmartcols.a
util-linux-2.25.1/.libs/libsmartcols.so.1.1.0

[1] http://lists.busybox.net/pipermail/buildroot/2014-October/109818.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/util-linux/util-linux.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ebbab61..ec4158e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -100,13 +100,7 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 # Avoid building the tools if they are disabled since we can't install on
 # a per-directory basis.
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
-define UTIL_LINUX_DISABLE_TOOLS
-	$(SED) '/schedutils/d' -e '/text-utils/d' -e '/term-utils/d' \
-		-e '/login-utils/d' -e '/mount-deprecated/d' \
-		-e '/sys-utils/d' -e '/misc-utils/d' -e '/disk-utils/d' \
-		-e '/fdisks/d' $(@D)/Makefile.am
-endef
-UTIL_LINUX_PRE_PATCH_HOOKS += UTIL_LINUX_DISABLE_TOOLS
+UTIL_LINUX_CONF_OPTS += --disable-all-programs 
 endif
 
 # Install PAM configuration files
-- 
1.8.1.4
