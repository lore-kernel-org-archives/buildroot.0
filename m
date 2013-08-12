From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 12 Aug 2013 22:49:08 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix lib64 symlinks
Message-ID: <1376340548-14050-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Do not copy the lib directories from the toolchain when the target
architecture is 64 bits;
* Fix the lib symlinks (target: lib -> lib64, sysroot: lib64 -> lib);
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
--

Fixes http://autobuild.buildroot.net/results/23fb6b1479d2b5906b72c9437b06ab4700ff246d

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---

This patch needs heavy testing, especially with external non-CodeSourcery
toolchains, and maybe with the old CodeSourcery ones.

Once again, it raises the question, does 64-bit toolchain need 32-bit
stuff?
---
 Makefile                                 |  4 ++--
 toolchain/helpers.mk                     | 23 ++++++++++++++++++-----
 toolchain/toolchain-external/ext-tool.mk |  1 -
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index fcfc0be..756d4b1 100644
--- a/Makefile
+++ b/Makefile
@@ -424,8 +424,8 @@ $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST
 
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/bin
-	@mkdir -p $(STAGING_DIR)/lib
-	@mkdir -p $(STAGING_DIR)/usr/lib
+	@mkdir -p $(STAGING_DIR)/lib$(if $(BR2_ARCH_IS_64),64)
+	@mkdir -p $(STAGING_DIR)/usr/lib$(if $(BR2_ARCH_IS_64),64)
 	@mkdir -p $(STAGING_DIR)/usr/include
 	@mkdir -p $(STAGING_DIR)/usr/bin
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 4c988a5..1374282 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -137,7 +137,9 @@ copy_toolchain_sysroot = \
 	SUPPORT_LIB_DIR="$(strip $5)" ; \
 	for i in etc $${ARCH_LIB_DIR} sbin usr ; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
-			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
+			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' \
+				--exclude 'usr/lib$(if $(BR2_ARCH_IS_64),,64)' \
+				$${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
 		fi ; \
 	done ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
@@ -159,6 +161,17 @@ copy_toolchain_sysroot = \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
 #
+# Create lib -> lib64 or lib64 -> lib as needed
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
 # Create lib64 -> lib and usr/lib64 -> usr/lib symbolic links in the
 # target and staging directories. This is needed for some 64 bits
 # toolchains such as the Crosstool-NG toolchains, for which the path
@@ -166,10 +179,10 @@ copy_toolchain_sysroot = \
 # libraries are stored in /lib.
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
 
 #
 # Check the availability of a particular glibc feature. This function
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 01be85c..f64773e 100644
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
-- 
1.8.3.4
