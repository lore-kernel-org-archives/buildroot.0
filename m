From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 13:49:28 +0100
Subject: [Buildroot] [git commit] Makefile: don't use parallel make when
	calling back into buildroot
Message-ID: <20131216150820.EC4D99C0AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=879058a16ea326fcdb7e96e3995a09112e193edc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The source-check / external-deps make targets ends up calling recursively
into buildroot's Makefile, causing make to display a warning:

make[2]: warning: -jN forced in submake: disabling jobserver mode.

We don't support toplevel parallel make, so get rid of the warning using
MAKE1 instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d52182e..925c1d2 100644
--- a/Makefile
+++ b/Makefile
@@ -418,7 +418,7 @@ dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
-	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
+	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
@@ -603,7 +603,7 @@ toolchain-eclipse-register:
 source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 external-deps:
-	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
+	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
 
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
@@ -753,7 +753,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 # check if download URLs are outdated
 source-check:
-	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
+	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
 
 .PHONY: defconfig savedefconfig
 
