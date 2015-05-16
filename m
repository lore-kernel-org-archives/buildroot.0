From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 16 May 2015 23:22:22 +0200
Subject: [Buildroot] [PATCH] package/heirloom-mailx: fix link issue with
	getopt
Message-ID: <1431811342-22781-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With NIOS2 toolchain, heirloom-mailx fail to build
due to missing -fPIC when linking with its own getopt.

Since static build for heirloom-mailx is disabled,
always pass -fPIC in CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/333/33346f4555ed403bab7b739dd5d47814efa8eb4c

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/heirloom-mailx/heirloom-mailx.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index 7343479..044cd8c 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -18,8 +18,11 @@ define HEIRLOOM_MAILX_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SHELL) ./makeconfig)
 endef
 
+# -fPIC is needed to build with NIOS2 toolchains.
 define HEIRLOOM_MAILX_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+		-C $(@D)
 endef
 
 define HEIRLOOM_MAILX_INSTALL_TARGET_CMDS
-- 
1.9.3
