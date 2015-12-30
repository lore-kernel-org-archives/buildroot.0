From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 30 Dec 2015 15:30:15 +0100
Subject: [Buildroot] [RFC PATCH v2 1/2] toolchain/helper: check for symlink
	from lib to lib64
Message-ID: <1451485816-17554-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot picks up libc/lib64 and all its contents, but does not
pickup libc/lib to populate the staging and target directories.

With the CodeSourcery AArch64 2014.05 toolchain the extracted sources
contains a single symlink in the aarch64-linux-gnu/libc/lib directory
which is lost during Buildroot staging import.

aarch64-linux-gnu/libc/lib/ld-linux-aarch64.so.1 -> ../lib64/ld-2.18.so

So, if we use a 64 bits toolchain we also look at "lib" directory to
see if there are some symlink to libraries belonging to "lib64".
If yes, we create the corresponding symlink in STAGING_DIR in
copy_toolchain_sysroot()

The same kind of change should be done in copy_toolchain_lib_root()
to copy the dynamic loader.
In the common case, we expect that it match this pattern: ld*.so.*
But it's not the case here because the symlink to the dynamic loader
is in another directory (lib) and we are looking for it in (lib64).
So the LIB_EXTERNAL_LIBS += ld*.so.* doesn't match any library during
the copy to TARGET_DIR.
That's why the system doesn't boot at runtime.

If the path to the dynamic loader is found in lib directory, it's
appended to LIBSPATH.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/helpers.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1452ec6..8f537cd 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -61,6 +61,17 @@ copy_toolchain_lib_root = \
 		fi \
 	done ; \
 	mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
+	if [ $${ARCH_LIB_DIR} = "lib64" ] ; then \
+		if [ -d $${ARCH_SYSROOT_DIR}/lib ] ; then \
+			SYMLINKS=`find $${ARCH_SYSROOT_DIR}/lib -maxdepth 1 -type l 2>/dev/null` ; \
+			for i in $${SYMLINKS} ; do \
+				relpath=`readlink -f $${i}` ; \
+				if [ "`dirname $${relpath}`" = "$${ARCH_SYSROOT_DIR}lib64" ] ; then \
+					LIBSPATH="$${LIBSPATH} $${i}" ; \
+				fi ; \
+			done ; \
+		fi ; \
+	fi ; \
 	for LIBPATH in $${LIBSPATH} ; do \
 		while true ; do \
 			LIBNAME=`basename $${LIBPATH}`; \
@@ -142,6 +153,18 @@ copy_toolchain_sysroot = \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
+	if [ $${ARCH_LIB_DIR} = "lib64" ] ; then \
+		if [ -d $${ARCH_SYSROOT_DIR}/lib ] ; then \
+			mkdir -p `dirname $(STAGING_DIR)/lib` ; \
+			SYMLINKS=`find $${ARCH_SYSROOT_DIR}/lib -maxdepth 1 -type l 2>/dev/null` ; \
+			for i in $${SYMLINKS} ; do \
+				relpath=`readlink -f $${i}` ; \
+				if [ "`dirname $${relpath}`" = "$${ARCH_SYSROOT_DIR}lib64" ] ; then \
+					ln -sf `basename $${relpath}` $(STAGING_DIR)/lib/`basename $${i}` ; \
+				fi ; \
+			done ; \
+		fi ; \
+	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
 			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
-- 
2.4.3
