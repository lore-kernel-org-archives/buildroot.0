From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:34:50 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] release: don't include
 temp files
Message-ID: <20200510193314.02F12913A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61f5bceb52fbbd48c5debeb9b4bce86a68b18fea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
(cherry picked from commit bee47598aa1f853df14f7edb51d8a7cadcfa9939)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ddc1265d0b..a72ce19865 100644
--- a/Makefile
+++ b/Makefile
@@ -1189,7 +1189,7 @@ release: OUT = buildroot-$(BR2_VERSION)
 release:
 	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
-	$(MAKE) O=$(OUT) clean
+	$(MAKE) O=$(OUT) distclean
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
 	bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
