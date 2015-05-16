From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 23:31:07 +0200
Subject: [Buildroot] [git commit] package/heirloom-mailx: fix link issue
	with getopt
Message-ID: <20150516213338.582817FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4171c5192e44f2733ccd217222680e597e6397d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With NIOS2 toolchain, heirloom-mailx fail to build
due to missing -fPIC when linking with its own getopt.

Since static build for heirloom-mailx is disabled,
always pass -fPIC in CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/333/33346f4555ed403bab7b739dd5d47814efa8eb4c

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heirloom-mailx/heirloom-mailx.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
