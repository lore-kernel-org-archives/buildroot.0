From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:56:51 +0100
Subject: [Buildroot] [PATCH v3 02/24] toolchain-external:
	TOOLCHAIN_EXTERNAL_INSTALL_*_LIBS: use arguments instead of
	global variables
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new external toolchain package infrastructure will be introduced in a
followup patch, so TOOLCHAIN_EXTERNAL_{CC,CFLAGS...} global variables
will no longer exist. Instead, each external toolchain packages will
provide it's own <toolchain-external-name>_{CC,CFLAGS...} variables.

So additional arguments are needed to provide CC and CFLAG when calling
TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,
TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC and
TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT

Also, an additional argument is needed to provide LIBS (the shared
libraries list) when calling TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS to
copy the external toolchain libraries to target.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: use local variables for functions/macros (Yann)
v2: rework commit log/title (Arnout)
---
 toolchain/toolchain-external/toolchain-external.mk | 50 ++++++++++++++--------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2b07da0..e51b9ed 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -634,10 +634,12 @@ endef
 # Buildroot, Crosstool-NG, CodeSourcery and Linaro
 # before doing any modification on the below logic.
 
+# $1: toolchain LIBS
 ifeq ($(BR2_STATIC_LIBS),)
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	$(Q)$(call MESSAGE,"Copying external toolchain libraries to target...")
-	$(Q)for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
+	$(Q)TOOLCHAIN_LIBS="$(strip $1)" ; \
+	for libs in $${TOOLCHAIN_LIBS}; do \
 		$(call copy_toolchain_lib_root,$$libs); \
 	done
 endef
@@ -666,13 +668,17 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER
 endef
 endif
 
+# $1: toolchain CC
+# $2: toolchain CFLAGS
 define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
-	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
-	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	$(Q)TOOLCHAIN_CC="$(strip $1)" ; \
+	TOOLCHAIN_CFLAGS="$(strip $2)" ; \
+	SYSROOT_DIR="$(call toolchain_find_sysroot,$${TOOLCHAIN_CC})" ; \
+	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
 	SUPPORT_LIB_DIR="" ; \
 	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-		LIBSTDCPP_A_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
+		LIBSTDCPP_A_LOCATION=$$(LANG=C $${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS} -print-file-name=libstdc++.a) ; \
 		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
 			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
 		fi ; \
@@ -693,24 +699,30 @@ endef
 # FDPIC is not the primary binary format being used, but the user has
 # nonetheless requested the installation of the FDPIC libraries to the
 # target filesystem.
+# $1: toolchain CC
+# $2: toolchain CFLAGS
 ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...")
-	$(Q)FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
-	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	$(Q)TOOLCHAIN_CC="$(strip $1)" ; \
+	TOOLCHAIN_CFLAGS="$(strip $2)" ; \
+	FDPIC_EXTERNAL_CC=$(dir $${TOOLCHAIN_CC})/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
+	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $${TOOLCHAIN_CFLAGS})" ; \
+	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $${TOOLCHAIN_CFLAGS})" ; \
 	FDPIC_SUPPORT_LIB_DIR="" ; \
 	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
+	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $${TOOLCHAIN_CFLAGS} -print-file-name=libstdc++.a) ; \
 	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
 	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
 	        fi ; \
 	fi ; \
 	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
 endef
+# $1: toolchain LIBS
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...")
-	$(Q)for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
+	$(Q)TOOLCHAIN_LIBS="$(strip $1)" ; \
+	for libs in $${TOOLCHAIN_LIBS}; do \
 		$(call copy_toolchain_lib_root,$$libs); \
 	done
 endef
@@ -722,11 +734,15 @@ endif
 # to the target filesystem. The flat libraries are found and linked
 # according to the index in name "libN.so". Index 1 is reserved for
 # the standard C library. Customer libraries can use 4 and above.
+# $1: toolchain CC
+# $2: toolchain CFLAGS
 ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
 	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...")
-	$(Q)FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
-	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
+	$(Q)TOOLCHAIN_CC="$(strip $1)" ; \
+	TOOLCHAIN_CFLAGS="$(strip $2)" ; \
+	FLAT_EXTERNAL_CC=$(dir $${TOOLCHAIN_CC})../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
+	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $${TOOLCHAIN_CFLAGS} -mid-shared-library -print-file-name=libc`; \
 	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
 	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
 	fi
@@ -794,8 +810,8 @@ TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_WRAPPER_INSTALL)
 	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
+	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
+	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
@@ -805,10 +821,10 @@ endef
 # install-staging step, arbitrarily.
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 	$(call TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
+	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS,$(TOOLCHAIN_EXTERNAL_LIBS))
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT)
+	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_LIBS))
+	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
 endef
 
-- 
2.5.5
