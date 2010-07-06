From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 08:01:00 +0200
Subject: [Buildroot] [git commit master 1/1] external-toolchain: handle
	libstdc++/libgcc_s for BR toolchains
Message-ID: <20100706060218.CDDF6825FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2bf32a3307b8d184396a02056b454ec98beeda4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most toolchains have their libraries either in /lib or /usr/lib
relative to their ARCH_SYSROOT_DIR. Buildroot toolchains, however,
have basic libraries in /lib, and libstdc++/libgcc_s in
/usr/<target-name>/lib(64).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/external-toolchain/ext-tool.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 3996184..1c84893 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -42,6 +42,11 @@
 # directory to the target directory. Also optionaly strips the
 # library.
 #
+# Most toolchains have their libraries either in /lib or /usr/lib
+# relative to their ARCH_SYSROOT_DIR. Buildroot toolchains, however,
+# have basic libraries in /lib, and libstdc++/libgcc_s in
+# /usr/<target-name>/lib(64).
+#
 # $1: arch specific sysroot directory
 # $2: library name
 # $3: destination directory
@@ -52,7 +57,11 @@ copy_toolchain_lib_root = \
 	LIB="$(strip $2)"; \
 	STRIP="$(strip $4)"; \
  \
-	LIBS=`(cd $${ARCH_SYSROOT_DIR}; find . -path "./lib/$${LIB}.*" -o -path "./usr/lib/$${LIB}.*")` ; \
+	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
+		find -L . -path "./lib/$${LIB}.*"     -o \
+			  -path "./usr/lib/$${LIB}.*" -o \
+			  -path "./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
+		)` ; \
 	for FILE in $${LIBS} ; do \
 		LIB=`basename $${FILE}`; \
 		LIBDIR=`dirname $${FILE}` ; \
-- 
1.7.1
