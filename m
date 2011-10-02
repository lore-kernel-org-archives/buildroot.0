From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Oct 2011 21:20:17 +0200
Subject: [Buildroot] [PATCH 9/9] toolchain: speed up sysroot lib copying
In-Reply-To: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2627a069c9566d25191f4cb179cb66af1526d0bc.1317583191.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mike Frysinger <vapier@gentoo.org>

The copy_toolchain_lib_root helper searches the entire sysroot, but is
only interested in files in certain subdirs.  So rather than waste time
in walking the entire tree, walk the few subdirs at the depth level we
are actually going to be poaching files from.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 toolchain/helpers.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 7f3efaa..1a72ae5 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -22,9 +22,9 @@ copy_toolchain_lib_root = \
 	DESTDIR="$(strip $3)" ; \
  \
 	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
-		find -L . -path "./lib/$${LIB}.*"     -o \
-			  -path "./usr/lib/$${LIB}.*" -o \
-			  -path "./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
+		find -L \
+			$(for d in lib* usr/lib* usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*; do test -e "$d" && echo $d) \
+			-maxdepth 1 -name "$${LIB}.*" \
 		)` ; \
 	for FILE in $${LIBS} ; do \
 		LIB=`basename $${FILE}`; \
-- 
1.7.4.1
