From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 May 2020 10:32:20 +0200
Subject: [Buildroot] [PATCH] release: don't include temp files
Message-ID: <20200508083220.18927-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we prepare the release, we generate the manual in various formats,
so that it can be consulted locally without needing the miriads of tools
needed to generate it.

However, this creates the temporary .br2-external.* files in the output
directory, and those end up in the release tarball.

This is not a problem in practice, but is not clean.

Run 'distclean' in the output directory, to get rid of everything but
the generated documentation.

Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3aa4ba4532..2da34b5305 100644
--- a/Makefile
+++ b/Makefile
@@ -1190,7 +1190,7 @@ release: OUT = buildroot-$(BR2_VERSION)
 release:
 	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
-	$(MAKE) O=$(OUT) clean
+	$(MAKE) O=$(OUT) distclean
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
 	bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
-- 
2.20.1
