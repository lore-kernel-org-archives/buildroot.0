From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 23 Aug 2013 00:59:35 +0200
Subject: [Buildroot] [PATCH v3] toolchain-external: fix lib64 symlinks
In-Reply-To: <1376340548-14050-1-git-send-email-s.martin49@gmail.com>
References: <1376340548-14050-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1377212375-22871-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

* Always link lib64 or lib32 to lib
* Only copy the architecture's lib directory to staging
* Also cleanup a couple of mkdirs (concerning some 'lib' directories).

Before this patch:
--
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
--

After this patch:
--
$ ls -ld host/usr/x86_64-buildroot-linux-gnu/sysroot/{,usr/}lib* target/{usr/,}lib*
drwxr-xr-x 2 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib/
lrwxrwxrwx 1 samuel users    5 Aug 12 22:36 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64 -> lib/
drwxr-xr-x 5 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/
lrwxrwxrwx 1 samuel users    5 Aug 12 22:36 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64 -> lib/
drwxr-xr-x 3 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/libexec/
drwxr-xr-x 2 samuel users 4.0K Aug 12 22:36 target/lib/
lrwxrwxrwx 1 samuel users    3 Aug 12 22:36 target/lib64 -> lib/
drwxr-xr-x 2 samuel users 4.0K Aug 12 22:36 target/usr/lib/
lrwxrwxrwx 1 samuel users    3 Aug 12 22:36 target/usr/lib64 -> lib/

$ find . -type l -xtype l # find broken symlinks
./target/etc/resolv.conf
./target/dev/log
--

Fixes http://autobuild.buildroot.net/results/23fb6b1479d2b5906b72c9437b06ab4700ff246d/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Tested with a couple of 32-bit and 64-bit MIPS Sourcery toolchains, and with
the x86_64 Sourcery toolchain. Should still be tested with a MIPS64/n32
toolchain, and with Linaro.

I didn't check if it actually fixes the referenced autobuild error...
But since my x86_64 allyesconfig passes cppcms that failed before, I
guess it's OK.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                                 | 13 +++++++++++++
 toolchain/helpers.mk                     | 21 +++++----------------
 toolchain/toolchain-external/ext-tool.mk |  4 ----
 3 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index 6018d63..2a2daa2 100644
--- a/Makefile
+++ b/Makefile
@@ -422,10 +422,20 @@ world: toolchain $(TARGETS_ALL)
 $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
 	@mkdir -p $@
 
+# We make a symlink lib32->lib or lib64->lib as appropriate
+# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+LIB_SYMLINK = lib64
+else
+LIB_SYMLINK = lib32
+endif
+
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/bin
 	@mkdir -p $(STAGING_DIR)/lib
+	@ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
 	@mkdir -p $(STAGING_DIR)/usr/lib
+	@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
 	@mkdir -p $(STAGING_DIR)/usr/include
 	@mkdir -p $(STAGING_DIR)/usr/bin
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
@@ -441,6 +451,9 @@ $(BUILD_DIR)/.root:
 		--exclude .hg --exclude=CVS --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
+	@ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK)
+	@mkdir -p $(TARGET_DIR)/usr
+	@ln -s lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
 	touch $@
 
 $(TARGET_DIR): $(BUILD_DIR)/.root
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 4c988a5..44b6018 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -125,7 +125,7 @@ copy_toolchain_lib_root = \
 # $1: main sysroot directory of the toolchain
 # $2: arch specific sysroot directory of the toolchain
 # $3: arch specific subdirectory in the sysroot
-# $4: directory of libraries ('lib' or 'lib64')
+# $4: directory of libraries ('lib', 'lib32' or 'lib64')
 # $5: support lib directories (for toolchains storing libgcc_s,
 #     libstdc++ and other gcc support libraries outside of the
 #     sysroot)
@@ -135,9 +135,11 @@ copy_toolchain_sysroot = \
 	ARCH_SUBDIR="$(strip $3)"; \
 	ARCH_LIB_DIR="$(strip $4)" ; \
 	SUPPORT_LIB_DIR="$(strip $5)" ; \
-	for i in etc $${ARCH_LIB_DIR} sbin usr ; do \
+	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
-			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
+			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' \
+				--exclude lib --exclude lib32 --exclude lib64 \
+				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
@@ -159,19 +161,6 @@ copy_toolchain_sysroot = \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
 #
-# Create lib64 -> lib and usr/lib64 -> usr/lib symbolic links in the
-# target and staging directories. This is needed for some 64 bits
-# toolchains such as the Crosstool-NG toolchains, for which the path
-# to the dynamic loader and other libraries is /lib64, but the
-# libraries are stored in /lib.
-#
-create_lib64_symlinks = \
-	(cd $(TARGET_DIR) ;      ln -s lib lib64) ; \
-	(cd $(TARGET_DIR)/usr ;  ln -s lib lib64) ; \
-	(cd $(STAGING_DIR) ;     ln -s lib lib64) ; \
-	(cd $(STAGING_DIR)/usr ; ln -s lib lib64)
-
-#
 # Check the availability of a particular glibc feature. This function
 # is used to check toolchain options that are always supported by
 # glibc, so we simply check that the corresponding option is properly
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 01be85c..38f6e22 100644
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
@@ -461,9 +460,6 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	fi ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
-	if [ -L $${ARCH_SYSROOT_DIR}/lib64 -o -d $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
-		$(call create_lib64_symlinks) ; \
-	fi ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
 		$(call MESSAGE,"Copying gdbserver") ; \
 		gdbserver_found=0 ; \
-- 
1.8.4.rc3
