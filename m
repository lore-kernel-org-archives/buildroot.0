From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Apr 2010 10:40:30 +0200
Subject: [Buildroot] [git commit master] external-toolchain: support
	libraries outside of /lib
Message-ID: <20100421084101.3CD5F20E96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ea2505ee567f716f6b2aeae45ccfe2555c0bcb97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The copy_toolchain_lib_root function was making the assumption that
all libraries were stored inside the /lib directory of the sysroot
directory. However, this isn't true for certain toolchains,
particularly for the libstdc++ library.

The function is therefore reworked to find the library and its related
symlink either in /lib or /usr/lib in the sysroot, and copies it at
the same location in the target directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |   23 +++++++++++++----------
 1 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 4493281..29a5cca 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -1,3 +1,4 @@
+
 #
 # This file implements the support for external toolchains, i.e
 # toolchains that have not been produced by Buildroot itself and that
@@ -45,27 +46,29 @@ copy_toolchain_lib_root = \
 	DST="$(strip $3)"; \
 	STRIP="$(strip $4)"; \
  \
-	LIB_DIR="$${SYSROOT_DIR}/lib" ; \
-	for FILE in `find $${LIB_DIR} -maxdepth 1 -name "$${LIB}.*"`; do \
+	LIBS=`(cd $${SYSROOT_DIR}; find . -path "./lib/$${LIB}.*" -o -path "./usr/lib/$${LIB}.*")` ; \
+	for FILE in $${LIBS} ; do \
 		LIB=`basename $${FILE}`; \
+		LIBDIR=`dirname $${FILE}` ; \
 		while test \! -z "$${LIB}"; do \
-			rm -fr $(TARGET_DIR)$${DST}/$${LIB}; \
-			mkdir -p $(TARGET_DIR)$${DST}; \
-			if test -h $${LIB_DIR}/$${LIB}; then \
-				cp -d $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/; \
-			elif test -f $${LIB_DIR}/$${LIB}; then \
-				$(INSTALL) -D -m0755 $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/$${LIB}; \
+			FULLPATH="$${SYSROOT_DIR}/$${LIBDIR}/$${LIB}" ; \
+			rm -fr $(TARGET_DIR)/$${LIBDIR}/$${LIB}; \
+			mkdir -p $(TARGET_DIR)/$${LIBDIR}; \
+			if test -h $${FULLPATH} ; then \
+				cp -d $${FULLPATH} $(TARGET_DIR)/$${LIBDIR}/; \
+			elif test -f $${FULLPATH}; then \
+				$(INSTALL) -D -m0755 $${FULLPATH} $(TARGET_DIR)/$${LIBDIR}/$${LIB}; \
 				case "$${STRIP}" in \
 				(0 | n | no) \
 ;; \
 				(*) \
-					$(TARGET_CROSS)strip "$(TARGET_DIR)$${DST}/$${LIB}"; \
+					$(TARGET_CROSS)strip "$(TARGET_DIR)/$${LIBDIR}/$${LIB}"; \
 ;; \
 				esac; \
 			else \
 				exit -1; \
 			fi; \
-			LIB="`readlink $${LIB_DIR}/$${LIB}`"; \
+			LIB="`readlink $${FULLPATH}`"; \
 		done; \
 	done; \
  \
-- 
1.6.3.3
