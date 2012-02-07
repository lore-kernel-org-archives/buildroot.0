From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Feb 2012 11:39:41 +0100
Subject: [Buildroot] [git commit] make release: add html/text/pdf manual and
	create .tar.bz2 format as well
Message-ID: <20120207104119.ED9F7909FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=134ab1ce4f34837587d68e7b4f9fabd5cfc4a537
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 7aeee96..e1621f9 100644
--- a/Makefile
+++ b/Makefile
@@ -695,8 +695,15 @@ endif
 
 release: OUT=buildroot-$(BR2_VERSION)
 
+# Create release tarballs. We need to fiddle a bit to add the generated
+# documentation to the git output
 release:
-	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
+	git archive --format=tar --prefix=$(OUT)/ master > $(OUT).tar
+	$(MAKE) O=$(OUT) manual-html manual-txt manual-pdf
+	tar rf $(OUT).tar $(OUT)
+	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
+	bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
+	rm -rf $(OUT) $(OUT).tar
 
 ################################################################################
 # GENDOC -- generates the make targets needed to build a specific type of
