From: Cameron Hutchison <lists@xdna.net>
Date: Mon, 08 Feb 2010 05:38:15 -0000
Subject: [Buildroot] Copying extra libs into image using external
	toolchain
References: <39a5.4b68b030.ecb50@getafix.xdna.net> <hkaeil$bis$1@ger.gmane.org>
	<6267.4b69f4f6.222b@getafix.xdna.net>
	<1265241688.2045.48.camel@coalu.atr> <20100206170238.345e1bd8@surf>
Message-ID: <7931.4b6fa347.59f92@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>Lionel Landwerlin <llandwerlin@gmail.com> wrote:

>> We should rather fix the buildroot script that copies the libraries
>> than adding extra scripts outside of buildroot. It's in
>> toolchain/external-toolchain/ext-tool.mk

>This is something I already have a patch for in my
>codesourcery-toolchain-support branch:

> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=codesourcery-toolchain-support&id=e6eec872c5720be4438f1d0db28f69ed50620b58

>Unfortunately, the changes needed to get the libraries from either /lib
>or /usr/lib are mixed with other changes related to multilib support,
>and these latter changes are not ready for submission.

I've patched by buildroot (against 2009.11) with something similar to
your patch, but I did it a little differently.

I've added a couple of extra BR_* config items, one for extra libraries
to copy, one for extra directories to search in the sysroot for
libraries. I've also added defaults to ext-tools.mk such that if you
have an external uClibc toolchain, usr/$(ARCH)-$(BR2_GNU_TARGET_SUFFIX)/lib
is search, and usr/lib for libstdc++.so .

Similar to your patch, the directory in which the library is found in
the sysroot is maintained in the output target root. But I'm not sure
that this is right. That usr/$(ARCH)-$(BR2_GNU_TARGET_SUFFIX)/lib should
not exist in the target root, but that's where my libstdc++.so and
libgcc_s.so are. They should probably go into /usr/lib in the target
root, but I dont know how that should be derived from the source path
without an ugly heuristic. Alternatively, I could put all the libraries
in /lib and just forget about /usr/lib (I prefer to on embedded systems,
but that's probably not a commonly accepted idea).

Any comments on the best way to proceed?

Here's my unofficial patch so far:

[BTW. I'm not sold on the idea of the extra config variables. They are
not needed to get my initial problem solved (libstdc++.so and now
libgcc_s.so), but thought it might be useful. They should probably be
part 2 of the patch]

diff --git a/toolchain/external-toolchain/Config.in b/toolchain/external-toolchain/Config.in
index efc8378..9c157f3 100644
--- a/toolchain/external-toolchain/Config.in
+++ b/toolchain/external-toolchain/Config.in
@@ -19,4 +19,22 @@ config BR2_TOOLCHAIN_EXTERNAL_STRIP
         prompt "Strip shared libraries"
 	help
 	  Strip shared libraries copied from the external toolchain.
+
+config BR2_TOOLCHAIN_EXTERNAL_EXTRA_LIBS
+	string "Extra libraries to copy from the external toolchain"
+	default ""
+	help
+	  A list of extra libraries to copy from the external toolchain, beyond
+	  the C library. If C++ support has been selected, that will automatically
+	  be copied and does not need to be specified here.
+
+config BR2_TOOLCHAIN_EXTERNAL_EXTRA_LIB_DIRS
+	string "Directories to search for extra libraries"
+	default ""
+	help
+	  Directories under the toolchain path to search for the extra libraries to copy.
+	  Only lib is searched by default. usr/lib will be added if C++ support has been
+	  selected.
+	  Do not put a leading /
+
 endif
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 1f5aa19..f9a610a 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -36,36 +36,40 @@
 #
 # $1: sysroot directory
 # $2: library name
-# $3: destination directory
+# $3: source directories under sysroot to search for library
 # $4: strip (y|n), default is to strip
 #
 copy_toolchain_lib_root = \
 	SYSROOT_DIR="$(strip $1)"; \
 	LIB="$(strip $2)"; \
-	DST="$(strip $3)"; \
+	SRCDIRS="$(strip $3)"; \
 	STRIP="$(strip $4)"; \
  \
-	LIB_DIR="$${SYSROOT_DIR}/lib" ; \
-	for FILE in `find $${LIB_DIR} -maxdepth 1 -name "$${LIB}.*"`; do \
+	LIBS=`(cd $${SYSROOT_DIR}; find $${SRCDIRS} -maxdepth 1 -name "$${LIB}.*")`; \
+	echo $${LIBS}; \
+	for FILE in $${LIBS}; do \
 		LIB=`basename $${FILE}`; \
+		LIB_DIR=`dirname $${FILE}`; \
+		SRC_PATH="$${SYSROOT_DIR}/$${LIB_DIR}"; \
+		DST_PATH="$(TARGET_DIR)/$${LIB_DIR}"; \
 		while test \! -z "$${LIB}"; do \
-			rm -fr $(TARGET_DIR)$${DST}/$${LIB}; \
-			mkdir -p $(TARGET_DIR)$${DST}; \
-			if test -h $${LIB_DIR}/$${LIB}; then \
-				cp -d $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/; \
-			elif test -f $${LIB_DIR}/$${LIB}; then \
-				$(INSTALL) -D -m0755 $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/$${LIB}; \
+			rm -fr $${DST_PATH}/$${LIB}; \
+			mkdir -p $${DST_PATH}; \
+			if test -h $${SRC_PATH}/$${LIB}; then \
+				cp -d $${SRC_PATH}/$${LIB} $${DST_PATH}/; \
+			elif test -f $${SRC_PATH}/$${LIB}; then \
+				$(INSTALL) -D -m0755 $${SRC_PATH}/$${LIB} $${DST_PATH}/$${LIB}; \
 				case "$${STRIP}" in \
 				(0 | n | no) \
 ;; \
 				(*) \
-					$(TARGET_CROSS)strip "$(TARGET_DIR)$${DST}/$${LIB}"; \
+					$(TARGET_CROSS)strip "$${DST_PATH}/$${LIB}"; \
 ;; \
 				esac; \
 			else \
 				exit -1; \
 			fi; \
-			LIB="`readlink $${LIB_DIR}/$${LIB}`"; \
+			LIB="`readlink $${SRC_PATH}/$${LIB}`"; \
 		done; \
 	done; \
  \
@@ -195,14 +199,25 @@ check_cross_compiler_exists = \
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
 EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
+EXTERNAL_LIB_DIRS=lib
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 EXTERNAL_LIBS+=ld-uClibc.so
+EXTERNAL_LIB_DIRS+=usr/$(ARCH)-$(BR2_GNU_TARGET_SUFFIX)/lib
 else
 EXTERNAL_LIBS+=ld-linux.so libnss_files.so libnss_dns.so
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 EXTERNAL_LIBS+=libstdc++.so
+EXTERNAL_LIB_DIRS+=usr/lib
+endif
+
+ifneq ($(BR2_TOOLCHAIN_EXTERNAL_EXTRA_LIBS),)
+EXTERNAL_LIBS+=$(BR2_TOOLCHAIN_EXTERNAL_EXTRA_LIBS)
+endif
+
+ifneq ($(BR2_TOOLCHAIN_EXTERNAL_EXTRA_LIB_DIRS),)
+EXTERNAL_LIB_DIRS+=$(BR2_TOOLCHAIN_EXTERNAL_EXTRA_LIB_DIRS)
 endif
 
 SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
@@ -225,7 +240,7 @@ endif
 	mkdir -p $(TARGET_DIR)/lib
 	@echo "Copy external toolchain libraries to target..."
 	$(Q)for libs in $(EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$(SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+		$(call copy_toolchain_lib_root,$(SYSROOT_DIR),$$libs,$(EXTERNAL_LIB_DIRS),$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
 	@echo "Copy external toolchain sysroot to staging..."
 	$(Q)$(call copy_toolchain_sysroot,$(SYSROOT_DIR))
