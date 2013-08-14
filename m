From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 14 Aug 2013 14:18:57 +0200
Subject: [Buildroot] [PATCH] toolchain: improving lib{32,64} symlinks
Message-ID: <1376482737-27650-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usually 64-bit toolchains have a couple of lib64 directory containing
all the 64-bit stuff.
Some of them provide 32-bit ABI, and may store this stuff in lib32
directory, this lib32 directory may be a mandatory at runtime for the
libc interp (e.g. mips/n32-uClibc).

This patch ensures that:
- only things corresponding to the selected ABI is copied from the
  external toolchain into the Buildroot sysroot;
- the lib and lib64 (respectively lib32) directories point to the
  same location (in the sysroot and the target tree), so there is no
  confusion at buildtime for the compiler, and at runtime for the
  libc interp;

To achieve this, a new symbol - BR2_ARCH_64_NEEDS_LIB32 - has been
introduce. It is only available for 64-bit toolchain and should be
selected whenever the toolchain provides a 32-bit ABI and expect a
lib32 directory exists (and this directory is a mandatory).

A couple of things have also been reworked:
- the symlinks lib -> lib64 and lib64 -> lib are now always created if
  BR2_ARCH_IS_64 and !BR2_ARCH_64_NEEDS_LIB32, respectively the symlinks
  lib -> lib32 and lib32 -> lib, if BR2_ARCH_IS_64 and BR2_ARCH_64_NEEDS_LIB32
  (only available for the Buildroot and external toolchain backends);
- the libs directories (in the sysroot an the target tree) are no longer
  created by the dirs targets, but are deferred the toolchain backend
  which will populate them accordingly, and create the symlinks.

Before this patch:
<snip>
$ cd output-x86_64
$ ls -ld host/usr/x86_64-buildroot-linux-gnu/sysroot/{,usr/}lib* target/{usr/,}lib*
drwxr-xr-x 2 samuel users 4.0K Aug 12 22:26 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib/
drwxr-xr-x 2 samuel users 4.0K Aug 12 22:27 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64/
drwxr-xr-x 5 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/
drwxr-xr-x 5 samuel users 4.0K Aug 12 22:27 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/
drwxr-xr-x 3 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/libexec/
drwxr-xr-x 2 samuel users 4.0K Aug 12 22:27 target/lib/
lrwxrwxrwx 1 samuel users    3 Aug 12 22:27 target/lib64 -> lib/
drwxr-xr-x 2 samuel users 4.0K Aug 12 22:27 target/usr/lib/
lrwxrwxrwx 1 samuel users    3 Aug 12 22:27 target/usr/lib64 -> lib/
$ find . -type l -xtype l # find broken symlinks
find: `./host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64/lib': Too many levels of symbolic links
find: `./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/lib': Too many levels of symbolic links
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_files.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_nis.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_compat.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_nisplus.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libutil.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libthread_db.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcidn.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcrypt.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libm.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_hesiod.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnsl.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/librt.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_db.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libanl.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libBrokenLocale.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_dns.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libresolv.so
./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libdl.so
./target/etc/resolv.conf
./target/dev/log

$ cd output-mips-n32
$ ls -ld host/usr/mips64el-buildroot-linux-uclibc/sysroot/{,usr/}lib* target/{usr/,}lib*
drwxr-xr-x 2 samuel users 4.0K Aug 13 17:27 host/usr/mips64el-buildroot-linux-uclibc/sysroot/lib/
drwxr-xr-x 2 samuel users 4.0K Aug 13 17:27 host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/
drwxr-xr-x 2 samuel users 4.0K Aug 14 14:05 target/lib/
drwxr-xr-x 2 samuel users 4.0K Aug 14 14:05 target/usr/lib/
$ find . -type l -xtype l # find broken symlinks
./target/etc/resolv.conf
./target/dev/log
</snip>

After this patch:
<snip>
$ cd output-x86_64
$ ls -ld host/usr/x86_64-buildroot-linux-gnu/sysroot/{,usr/}lib* target/{usr/,}lib*
lrwxrwxrwx 1 samuel users    5 Aug 12 22:36 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib -> lib64/
drwxr-xr-x 2 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64/
lrwxrwxrwx 1 samuel users    5 Aug 12 22:36 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib -> lib64/
drwxr-xr-x 5 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/
drwxr-xr-x 3 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/libexec/
drwxr-xr-x 2 samuel users 4.0K Aug 12 22:36 target/lib/
lrwxrwxrwx 1 samuel users    3 Aug 12 22:36 target/lib64 -> lib/
drwxr-xr-x 2 samuel users 4.0K Aug 12 22:36 target/usr/lib/
lrwxrwxrwx 1 samuel users    3 Aug 12 22:36 target/usr/lib64 -> lib/
$ find . -type l -xtype l # find broken symlinks
./target/etc/resolv.conf
./target/dev/log

$ cd output-mips-n32
$ ls -ld host/usr/mips64el-buildroot-linux-uclibc/sysroot/{,usr/}lib* target/{usr/,}lib*
drwxr-xr-x 2 samuel users 4.0K Aug 13 17:27 host/usr/mips64el-buildroot-linux-uclibc/sysroot/lib/
lrwxrwxrwx 1 samuel users    3 Aug 14 13:55 host/usr/mips64el-buildroot-linux-uclibc/sysroot/lib32 -> lib/
drwxr-xr-x 2 samuel users 4.0K Aug 13 17:27 host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/
lrwxrwxrwx 1 samuel users    3 Aug 14 13:55 host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib32 -> lib/
drwxr-xr-x 2 samuel users 4.0K Aug 14 13:55 target/lib/
lrwxrwxrwx 1 samuel users    3 Aug 14 13:55 target/lib32 -> lib/
drwxr-xr-x 2 samuel users 4.0K Aug 14 13:55 target/usr/lib/
lrwxrwxrwx 1 samuel users    3 Aug 14 13:55 target/usr/lib32 -> lib/
$ find . -type l -xtype l # find broken symlinks
./target/etc/resolv.conf
./target/dev/log
</snip>

Fixes http://autobuild.buildroot.net/results/23fb6b1479d2b5906b72c9437b06ab4700ff246d

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>

---
changes v1 -> v2

- add BR2_ARCH_64_NEEDS_LIB32 symbol (suggested by Thomas P. and Markos C.);
- add create_lib32_symlinks helper;
- more mkdir cleanup;
- mips/n32 toolchain now selects BR2_ARCH_64_NEEDS_LIB32;
* external toolchain backend:
  - update the lib(32|64) symlink creation;
* buildroot toolchain backend:
  -rework HOST_GCC_FINAL_HANDLE_LIB64 hook (suggested by Markos C.).
---
 Makefile                                 |  2 --
 arch/Config.in                           |  4 +++
 arch/Config.in.mips                      |  1 +
 package/gcc/gcc-final/gcc-final.mk       | 12 +++-----
 toolchain/helpers.mk                     | 52 ++++++++++++++++++++++++++------
 toolchain/toolchain-external/ext-tool.mk |  8 ++---
 6 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/Makefile b/Makefile
index fcfc0be..e51875a 100644
--- a/Makefile
+++ b/Makefile
@@ -424,8 +424,6 @@ $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST
 
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/bin
-	@mkdir -p $(STAGING_DIR)/lib
-	@mkdir -p $(STAGING_DIR)/usr/lib
 	@mkdir -p $(STAGING_DIR)/usr/include
 	@mkdir -p $(STAGING_DIR)/usr/bin
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
diff --git a/arch/Config.in b/arch/Config.in
index 0b5b218..690c723 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -1,6 +1,10 @@
 config BR2_ARCH_IS_64
 	bool
 
+config BR2_ARCH_64_NEEDS_LIB32
+	bool
+	depends on BR2_ARCH_IS_64
+
 config BR2_SOFT_FLOAT
 	bool
 
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 6242bcc..9054146 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -47,6 +47,7 @@ config BR2_MIPS_OABI32
 config BR2_MIPS_NABI32
 	bool "n32"
 	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_64_NEEDS_LIB32
 config BR2_MIPS_NABI64
 	bool "n64"
 	depends on BR2_ARCH_IS_64
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 9f54c68..bb821b7 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -57,14 +57,10 @@ HOST_GCC_FINAL_CONF_OPT += \
 
 # Handle lib64
 define HOST_GCC_FINAL_HANDLE_LIB64
-	if [ -d "$(STAGING_DIR)/lib64" ]; then \
-		if [ ! -e "$(STAGING_DIR)/lib" ]; then \
-			mkdir -p "$(STAGING_DIR)/lib"; \
-		fi; \
-		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/"; \
-		rmdir "$(STAGING_DIR)/lib64"; \
-		rm "$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/lib64";\
-	fi
+	case "$(BR2_ARCH_IS_64)-$(BR2_ARCH_64_NEEDS_LIB32)" in \
+		y-)  $(call create_lib64_symlinks) ;; \
+		y-y) $(call create_lib32_symlinks) ;; \
+	esac ;
 endef
 
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_HANDLE_LIB64
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 4c988a5..525fa47 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -129,6 +129,16 @@ copy_toolchain_lib_root = \
 # $5: support lib directories (for toolchains storing libgcc_s,
 #     libstdc++ and other gcc support libraries outside of the
 #     sysroot)
+ifeq ($(BR2_ARCH_IS_64),y)
+ifeq ($(BR2_ARCH_64_NEEDS_LIB32),y)
+TOOLCHAIN_LIBDIR_FILTER = usr/lib usr/lib64
+else
+TOOLCHAIN_LIBDIR_FILTER = usr/lib usr/lib32
+endif
+else
+TOOLCHAIN_LIBDIR_FILTER = usr/lib32 usr/lib64
+endif
+
 copy_toolchain_sysroot = \
 	SYSROOT_DIR="$(strip $1)"; \
 	ARCH_SYSROOT_DIR="$(strip $2)"; \
@@ -137,7 +147,12 @@ copy_toolchain_sysroot = \
 	SUPPORT_LIB_DIR="$(strip $5)" ; \
 	for i in etc $${ARCH_LIB_DIR} sbin usr ; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
-			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
+			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' \
+				`for d in $(TOOLCHAIN_LIBDIR_FILTER) ; do \
+					test "$${d} = "usr/$${ARCH_LIB_DIR}" || \
+						echo "--exclude '$${d}'" ; \
+				done` \
+				$${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
 		fi ; \
 	done ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
@@ -159,17 +174,34 @@ copy_toolchain_sysroot = \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
 #
-# Create lib64 -> lib and usr/lib64 -> usr/lib symbolic links in the
-# target and staging directories. This is needed for some 64 bits
-# toolchains such as the Crosstool-NG toolchains, for which the path
-# to the dynamic loader and other libraries is /lib64, but the
-# libraries are stored in /lib.
+# Create lib -> libXX or libXX -> lib as needed
+#  argument 1: bitwise or lib-suffix (32 or 64)
+#  argument 2: directory in which the symlink will be created
+#
+define create_libxx_symlink
+	( src=`test -d $(2)/lib$(1) && echo $(1)` ; \
+	  dst=`test -d $(2)/lib$(1) || echo $(1)` ; \
+	  ln -s "lib$${src}" "$(2)/lib$${dst}" )
+endef
+
+#
+# Create lib(32|64) -> lib and usr/lib(32|64) -> usr/lib symbolic
+# links in the target and staging directories. This is needed for
+# some 64 bits toolchains (with and without 32-bit ABI) for which the
+# path to the dynamic loader and other libraries is /lib64 or /lib32,
+# but the libraries are stored in /lib.
 #
 create_lib64_symlinks = \
-	(cd $(TARGET_DIR) ;      ln -s lib lib64) ; \
-	(cd $(TARGET_DIR)/usr ;  ln -s lib lib64) ; \
-	(cd $(STAGING_DIR) ;     ln -s lib lib64) ; \
-	(cd $(STAGING_DIR)/usr ; ln -s lib lib64)
+	$(call create_libxx_symlink,64,$(TARGET_DIR)) ; \
+	$(call create_libxx_symlink,64,$(TARGET_DIR)/usr) ; \
+	$(call create_libxx_symlink,64,$(STAGING_DIR)) ; \
+	$(call create_libxx_symlink,64,$(STAGING_DIR)/usr)
+
+create_lib32_symlinks = \
+	$(call create_libxx_symlink,32,$(TARGET_DIR)) ; \
+	$(call create_libxx_symlink,32,$(TARGET_DIR)/usr) ; \
+	$(call create_libxx_symlink,32,$(STAGING_DIR)) ; \
+	$(call create_libxx_symlink,32,$(STAGING_DIR)/usr)
 
 #
 # Check the availability of a particular glibc feature. This function
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 01be85c..73967e5 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -449,7 +449,6 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 		fi ; \
 	fi ; \
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
-	mkdir -p $(TARGET_DIR)/lib ; \
 	if test -z "$(BR2_PREFER_STATIC_LIB)" ; then \
 		$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
 		for libs in $(LIB_EXTERNAL_LIBS); do \
@@ -461,9 +460,10 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	fi ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
-	if [ -L $${ARCH_SYSROOT_DIR}/lib64 -o -d $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
-		$(call create_lib64_symlinks) ; \
-	fi ; \
+	case "$(BR2_ARCH_IS_64)-$(BR2_ARCH_64_NEEDS_LIB32)" in \
+		y-)  $(call create_lib64_symlinks) ;; \
+		y-y) $(call create_lib32_symlinks) ;; \
+	esac ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
 		$(call MESSAGE,"Copying gdbserver") ; \
 		gdbserver_found=0 ; \
-- 
1.8.3.4
