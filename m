From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Sun, 29 Mar 2009 18:32:19 +0000 (UTC)
Subject: [Buildroot] svn commit: [25879] trunk/buildroot/package
Message-ID: <20090329183219.3F8197743B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2009-03-29 18:32:18 +0000 (Sun, 29 Mar 2009)
New Revision: 25879

Log:
Another external toolchain fix

Change the definition of TARGET_LDFLAGS to use --sysroot
$(STAGING_DIR) instead of -L$(STAGING_DIR)/lib
-L$(STAGING_DIR)/usr/lib. It fixes the following failure while trying
to build mtd-utils :

/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin/arm-unknown-linux-uclibcgnueabi-gcc -L/home/thomas/local/buildroot-output/build_arm/staging_dir/lib -L/home/thomas/local/buildroot-output/build_arm/staging_dir/usr/lib -o /home/thomas/local/buildroot-output/build_arm/mtd_orig/flash_eraseall /home/thomas/local/buildroot-output/build_arm/mtd_orig/crc32.o /home/thomas/local/buildroot-output/build_arm/mtd_orig/flash_eraseall.o
/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.2/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: cannot find /lib/libc.so.0
collect2: ld returned 1 exit status
make[1]: *** [/home/thomas/local/buildroot-output/build_arm/mtd_orig/flash_eraseall] Error 1

At the same time, simplify the definition of TARGET_CFLAGS, because
the -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include
-I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include are
no longer necessary since we sysroot the toolchain in $(SYSROOT_DIR).

This patch has no effect on non-external toolchain builds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-03-29 17:25:14 UTC (rev 25878)
+++ trunk/buildroot/package/Makefile.in	2009-03-29 18:32:18 UTC (rev 25879)
@@ -93,9 +93,9 @@
 # else it's an external toolchain
 #########################################################################
 else
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include --sysroot $(STAGING_DIR)/
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) --sysroot $(STAGING_DIR)/
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
-TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
+TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
 endif
 #########################################################################
 #ifeq ($(BR2_ROOTFS_SUFFIX),)
