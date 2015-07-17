From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 17 Jul 2015 12:20:35 +0200
Subject: [Buildroot] [PATCH 1/1] release: remove manual build files from
	release tarballs
Message-ID: <1437128435-17331-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The Buildroot release tarballs inadvertently contain a build/docs directory,
containing the manual sources, the generated lists, and manual.text and
manual.pdf (but excluding manual.html).

This directory is populated as $(BUILD_DIR) (==$(O)/build), while O is
set explicitly from the release target to a subdirectory
buildroot-xxxx.yy-git/ which was populated with 'git archive'.

Since the generated manuals are available in docs/manual, which is
also referred to from the README, the build directory is not needed and
should be removed from the release tarball.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 531ac5d..168d62a 100644
--- a/Makefile
+++ b/Makefile
@@ -936,6 +936,7 @@ release: OUT = buildroot-$(BR2_VERSION)
 release:
 	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
+	$(MAKE) O=$(OUT) manual-clean
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
 	bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
-- 
1.8.5.1
