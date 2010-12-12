From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 12 Dec 2010 11:25:20 -0500
Subject: [Buildroot] [PATCH] toolchain: speed up sysroot lib copying
Message-ID: <1292171120-32512-1-git-send-email-vapier@gentoo.org>
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
 toolchain/helpers.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 05d43e7..674e7b4 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -24,7 +24,10 @@ copy_toolchain_lib_root = \
 	STRIP="$(strip $4)"; \
  \
 	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
-		find -L . -path "./lib/$${LIB}.*"     -o \
+		find -L \
+			  ./lib/ ./usr/lib/ ./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/ \
+			  -maxdepth 1 \
+			  -path "./lib/$${LIB}.*"     -o \
 			  -path "./usr/lib/$${LIB}.*" -o \
 			  -path "./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
 		)` ; \
-- 
1.7.3.3
