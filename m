From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 14 Dec 2010 15:59:38 -0500
Subject: [Buildroot] [PATCH v2] toolchain: speed up sysroot lib copying
In-Reply-To: <1292171120-32512-1-git-send-email-vapier@gentoo.org>
References: <1292171120-32512-1-git-send-email-vapier@gentoo.org>
Message-ID: <1292360378-9887-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The copy_toolchain_lib_root helper searches the entire sysroot, but is
only interested in files in certain subdirs.  So rather than waste time
in walking the entire tree, walk the few subdirs at the depth level we
are actually going to be poaching files from.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- unify -path's too

 toolchain/helpers.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index d4caf48..3ea9075 100644
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
1.7.3.3
