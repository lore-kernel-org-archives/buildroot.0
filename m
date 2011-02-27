From: Malte Starostik <m-starostik@versanet.de>
Date: Sun, 27 Feb 2011 18:24:24 +0100
Subject: [Buildroot] [PATCH] Cope with unusual (?) toolchain library
	locations
Message-ID: <1298827464-19093-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchain libraries can be outside the toolchain's sysroot.  This
happens e.g. with toolchains built by Gentoo's crossdev utility:
$ i686-pc-linux-uclibc-gcc -print-sysroot
/usr/i686-pc-linux-uclibc
BUT:
$ i686-pc-linux-uclibc-gcc -print-file-name=libgcc_s.so
/usr/lib/gcc/i686-pc-linux-uclibc/4.4.5/libgcc_s.so
$ i686-pc-linux-uclibc-gcc -print-file-name=libstdc++.so
/usr/lib/gcc/i686-pc-linux-uclibc/4.4.5/libstdc++.so

This patch tries to cope with this gracefully: iff the usual library
locations do not contain the library we're looking for, the target
compiler is consulted for its idea of where to look.  In theory this
output could always be used instead of find(1)ing the libs oneself, but
a test with such an approach led to other problems like cross-directory
symlinks as in $(SYSROOT)/usr/lib/libfoo.so -> ../../lib/libfoo.so.0
which breaks how toolchain/helpers.mk uses cp -d while coercing all libs
to either $(TARGET_DIR)/lib or $(TARGET_DIR)/usr/lib.  Also, there might
be some .so files in $(SYSROOT)/usr/lib dir that are actually ld scripts.

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 toolchain/helpers.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index db7c7f1..1f19aba 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -26,11 +26,16 @@ copy_toolchain_lib_root = \
 			  -path "./usr/lib/$${LIB}.*" -o \
 			  -path "./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
 		)` ; \
+	test -z "$${LIBS}" && LIBS=`$(TARGET_CC_NO_SYSROOT) $(TARGET_CFLAGS) -print-file-name=$${LIB} | sed -n '/^\\//p'`; \
 	for FILE in $${LIBS} ; do \
 		LIB=`basename $${FILE}`; \
 		LIBDIR=`dirname $${FILE}` ; \
 		while test \! -z "$${LIB}"; do \
-			FULLPATH="$${ARCH_SYSROOT_DIR}/$${LIBDIR}/$${LIB}" ; \
+			case "$${LIBDIR}" in \
+			    /*) FULLPATH="$${LIBDIR}/$${LIB}";; \
+			    *) FULLPATH="$${ARCH_SYSROOT_DIR}/$${LIBDIR}/$${LIB}" ; \
+			esac; \
+			echo "$${FULLPATH}"; \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIB}; \
 			mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 			if test -h $${FULLPATH} ; then \
-- 
1.7.3.4
