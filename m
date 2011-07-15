From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 15 Jul 2011 20:57:59 +0200
Subject: [Buildroot] [git commit] Makefile: unbreak source-check
Message-ID: <20110715185941.45B578A5A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7c2974596971e20a7d8d606d88bfd1b682472edb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'source-check' breaks because the *_DEFCONFIG options are empty strings.
There is an explicit check to avoid erroring-out when doing 'source', but
not when doing 'source-check'.

This patch set DL_MODE right from the first sub-make call.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 2f3802c..ffe6343 100644
--- a/Makefile
+++ b/Makefile
@@ -488,9 +488,6 @@ endif
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
-_source-check:
-	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
-
 external-deps:
 	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
 
@@ -595,7 +592,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 # check if download URLs are outdated
 source-check: allyesconfig
-	$(MAKE) $(EXTRAMAKEARGS) _source-check
+	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
 
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
-- 
1.7.3.4
