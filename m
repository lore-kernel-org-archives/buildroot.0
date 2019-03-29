From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 22:19:35 +0100
Subject: [Buildroot] [PATCH] Makefile: release: really drop build/docs from
 release tarball
Message-ID: <20190329211935.22375-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 15cb98769e4 (release: remove manual build files from release
tarballs) tried to remove the temporary files from the manual build from the
release tarball, but manual-clean only removes build/docs/manual and leaves
build/docs in the tarball.

Instead use 'make clean' to completely remove the build directory from the
tarball.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 37bbc421ad..60bf7d7d08 100644
--- a/Makefile
+++ b/Makefile
@@ -1174,7 +1174,7 @@ release: OUT = buildroot-$(BR2_VERSION)
 release:
 	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
-	$(MAKE) O=$(OUT) manual-clean
+	$(MAKE) O=$(OUT) clean
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
 	bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
-- 
2.11.0
