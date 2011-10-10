From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Oct 2011 09:47:23 +0200
Subject: [Buildroot] [git commit] toolchain: speed up sysroot lib copying
Message-ID: <20111010075225.47DB08E1E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da6353c9e7e6e6accfe72ee4cb5165bdf580b18a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The copy_toolchain_lib_root helper searches the entire sysroot, but is
only interested in files in certain subdirs.  So rather than waste time
in walking the entire tree, walk the few subdirs at the depth level we
are actually going to be poaching files from.

Some simplification suggested by Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> and Arnout Vandecappelle
<arnout@mind.be>, added by Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 7f3efaa..5585f45 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -22,9 +22,8 @@ copy_toolchain_lib_root = \
 	DESTDIR="$(strip $3)" ; \
  \
 	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
-		find -L . -path "./lib/$${LIB}.*"     -o \
-			  -path "./usr/lib/$${LIB}.*" -o \
-			  -path "./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
+		find -L lib* usr/lib* usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib* \
+			-maxdepth 1 -name "$${LIB}.*" 2>/dev/null \
 		)` ; \
 	for FILE in $${LIBS} ; do \
 		LIB=`basename $${FILE}`; \
