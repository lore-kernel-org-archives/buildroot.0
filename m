From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 11:33:31 +0200
Subject: [Buildroot] [git commit] release: don't include temp files
Message-ID: <20200508091917.38AF691046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bee47598aa1f853df14f7edb51d8a7cadcfa9939
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
