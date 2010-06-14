From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 13:54:20 +0200
Subject: [Buildroot] [PATCH 09/10] external-toolchain: handle
	libstdc++/libgcc_s for BR toolchains
In-Reply-To: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7f171a1f7afd261b182f77379e81b8e7ea0a6b1d.1276516273.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most toolchains have their libraries either in /lib or /usr/lib
relative to their ARCH_SYSROOT_DIR. Buildroot toolchains, however,
have basic libraries in /lib, and libstdc++/libgcc_s in
/usr/<target-name>/lib(64).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
