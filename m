From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Sep 2009 17:14:31 +0200
Subject: [Buildroot] [git commit master] mpfr: use patch-kernel to apply
	downloaded patch
Message-ID: <20090924151918.6B4BF7758F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bdccd7b2e67cc9bfa5a95cb74693bce662293549
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Emmanuel Riou <riou.emmanuel@googlemail.com>.

With the recent change to use $(TOPDIR)/dl as default for $(DL_DIR)
(416323e93), DL_DIR is now a relative path (./dl), which breaks the
mpfr patch handling as it changes dir.

Fix is by using patch-kernel instead of calling patch, which does
the right thing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mpfr/mpfr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 4bd100c..b0a3cf8 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -34,7 +34,7 @@ $(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE) $(MPFR_PATCH_SOURCE)
 	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
 	$(CONFIG_UPDATE) $(@D)
 ifneq ($(MPFR_PATCH),)
-	( cd $(MPFR_DIR); patch -p1 -N -Z < $(MPFR_PATCH_SOURCE); )
+	toolchain/patch-kernel.sh $(MPFR_DIR) $(DL_DIR)/ $(MPFR_PATCH_FILE)
 endif
 	touch $@
 
-- 
1.6.3.3
