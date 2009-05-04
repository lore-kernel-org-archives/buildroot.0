From: angus salkeld <angus.salkeld@alliedtelesis.co.nz>
Date: Tue, 05 May 2009 08:04:39 +1200
Subject: [Buildroot] [PATCH] fix gcc install problem on	
	powerpc+soft-float+install_libgcc_s
Message-ID: <49FFF317.D58A.0070.1@alliedtelesis.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am building with:
gcc-4.3.3
powerpc-8540
soft-float
install libgcc_s
install libstd++

I get the following error:

# These are in /lib, so...
rm -rf /home/anguss/imports/buildroot/project_build_powerpc/r1/root/usr/lib/libgcc_s*.so*
cp -dpf
/home/anguss/imports/buildroot/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/lib/libgcc_s* \
                /home/anguss/imports/buildroot/project_build_powerpc/r1/root/lib/
cp: cannot stat
`/home/anguss/imports/buildroot/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/lib/libgcc_s*':
No such file or directory
make:
[/home/anguss/imports/buildroot/project_build_powerpc/r1/autotools-stamps/gcc_libs_target_installed]
Error 1 (ignored)
/home/anguss/imports/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/anguss/imports/buildroot/project_build_powerpc/r1/root/lib/libgcc_s*
/home/anguss/imports/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strip:
'/home/anguss/imports/buildroot/project_build_powerpc/r1/root/lib/libgcc_s*': No such file
make:
[/home/anguss/imports/buildroot/project_build_powerpc/r1/autotools-stamps/gcc_libs_target_installed]
Error 1 (ignored)
mkdir -p /home/anguss/imports/buildroot/project_build_powerpc/r1/root/usr/lib
cp -dpf
/home/anguss/imports/buildroot/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/lib/libstdc++.so*
\
                /home/anguss/imports/buildroot/project_build_powerpc/r1/root/usr/lib/
cp: cannot stat
`/home/anguss/imports/buildroot/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/lib/libstdc++.so*':
No such file or directory
make:
[/home/anguss/imports/buildroot/project_build_powerpc/r1/autotools-stamps/gcc_libs_target_installed]
Error 1 (ignored)


So here is a patch that fixes it for me.

Note:

1) I only include this for powerpc (maybe it should only check for soft float)?
2) I have removed the ignore "-" from the copy, as it think that it is
   a problem if you want a library installed but it fails to install.

Regards
Angus Salkeld

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 42e9d29..ff6acfd 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -140,6 +140,12 @@ ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 GCC_DECIMAL_FLOAT:=--disable-decimal-float
 endif
 
+ifeq ($(BR2_SOFT_FLOAT),y)
+ifeq ($(ARCH),powerpc)
+GCC_NOF_DIR:=/nof
+endif
+endif
+
 # gcc version < 4.2.0 don't have -Wno-overlength-strings and the configure
 # script has problems detecting it, so help it
 ifeq ($(shell test $(HOSTCC_VERSION) -lt 420 && echo OLD),OLD)
@@ -347,18 +353,19 @@ endif
        mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
        touch $@
 
+
 $(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
        # These are in /lib, so...
        rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-   -cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* \
+ cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib$(GCC_NOF_DIR)/libgcc_s* \
                $(TARGET_DIR)/lib/
        -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
        mkdir -p $(TARGET_DIR)/usr/lib
-   -cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* \
+ cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib$(GCC_NOF_DIR)/libstdc++.so* \
                $(TARGET_DIR)/usr/lib/
        -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
