From: Allan Clark <allanc@chickenandporn.com>
Date: Thu, 5 Jul 2007 17:53:30 -0400
Subject: [Buildroot] gcc-4.2.0 on MacOSX
Message-ID: <37c712e0707051453t580a4264w7641fad0cae59d36@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi;

In order to compile gcc-4.2.0, I needed the following:
1) my solution to bug-1415
2) my solution to bug-1422 (both patches)
3) the foo.h removal of #include <features.h> I mentioned earlier on the list
4) replacement of "cp -fa" with the more traditional format (below)
5) replacement of MAP_ANONYMOUS with MAP_ANON (below)

If anyone has cycles to test these changes in their own environments,
I'd appreciate the help and feedback.  Although I tried to use the bug
tool, it seems this format is preferred, since downloading from the
bugtool URLs is apparently a bit too complex.

Allan


Patch #1: http://bugs.uclibc.org/file_download.php?file_id=1071&type=bug

Patch #2: http://bugs.uclibc.org/file_download.php?file_id=1072&type=bug
and http://bugs.uclibc.org/file_download.php?file_id=1073&type=bug

Patch #3: (foo.h)

Index: package/config/foo.h
===================================================================
--- package/config/foo.h        (revision 19002)
+++ package/config/foo.h        (working copy)
@@ -1,6 +1,8 @@
 #ifndef __KCONFIG_FOO_H
 #define __KCONFIG_FOO_H
+#ifdef ALLANC_CNP__BOGUS_DEFINE
 #include <features.h>
+#endif
 #include <limits.h>

 #ifndef PATH_MAX



Patch #4: change cp -fa:

Index: target/device/Soekris/net4521/linux.mk
===================================================================
--- target/device/Soekris/net4521/linux.mk      (revision 19006)
+++ target/device/Soekris/net4521/linux.mk      (working copy)
@@ -96,7 +96,7 @@
        $(MAKE) PATH=$(TARGET_PATH) -C $(LINUX_DIR) modules

 $(LINUX_KERNEL): $(LINUX_DIR)/$(LINUX_BINLOC)
-       cp -fa $(LINUX_DIR)/$(LINUX_BINLOC) $(LINUX_KERNEL)
+       cp -fPpR $(LINUX_DIR)/$(LINUX_BINLOC) $(LINUX_KERNEL)
        touch -c $(LINUX_KERNEL)

 $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep: $(LINUX_KERNEL)
Index: target/device/Via/epia-mii/linux.mk
===================================================================
--- target/device/Via/epia-mii/linux.mk (revision 19006)
+++ target/device/Via/epia-mii/linux.mk (working copy)
@@ -86,7 +86,7 @@
        $(MAKE) -C $(LINUX_DIR) modules

 $(LINUX_KERNEL): $(LINUX_DIR)/$(LINUX_BINLOC)
-       cp -fa $(LINUX_DIR)/$(LINUX_BINLOC) $(LINUX_KERNEL)
+       cp -fPpR $(LINUX_DIR)/$(LINUX_BINLOC) $(LINUX_KERNEL)
        touch -c $(LINUX_KERNEL)

 $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep: $(LINUX_KERNEL)
Index: target/device/Sharp/LNode80/linux.mk
===================================================================
--- target/device/Sharp/LNode80/linux.mk        (revision 19006)
+++ target/device/Sharp/LNode80/linux.mk        (working copy)
@@ -94,7 +94,7 @@
        $(MAKE) PATH=$(TARGET_PATH) -C $(LINUX_DIR) $(LINUX_FORMAT)

 $(LINUX_KERNEL): $(LINUX_DIR)/$(LINUX_BINLOC)
-       cp -fa $(LINUX_DIR)/$(LINUX_BINLOC) $(LINUX_KERNEL)
+       cp -fPpR $(LINUX_DIR)/$(LINUX_BINLOC) $(LINUX_KERNEL)
        touch -c $(LINUX_KERNEL)

 $(STAGING_DIR)/include/linux/version.h: $(LINUX_DIR)/.configured
Index: package/openssl/openssl.mk
===================================================================
--- package/openssl/openssl.mk  (revision 19006)
+++ package/openssl/openssl.mk  (working copy)
@@ -56,13 +56,13 @@

 $(STAGING_DIR)/usr/lib/libcrypto.a: $(OPENSSL_DIR)/apps/openssl
        $(MAKE) CC=$(TARGET_CC) INSTALL_PREFIX=$(STAGING_DIR)/usr -C
$(OPENSSL_DIR) install
-       cp -fa $(OPENSSL_DIR)/libcrypto.so* $(STAGING_DIR)/usr/lib/
+       cp -fPpR $(OPENSSL_DIR)/libcrypto.so* $(STAGING_DIR)/usr/lib/
        chmod a-x $(STAGING_DIR)/usr/lib/libcrypto.so.0.9.7
        (cd $(STAGING_DIR)/usr/lib ; \
         ln -fs libcrypto.so.0.9.7 libcrypto.so ; \
         ln -fs libcrypto.so.0.9.7 libcrypto.so.0 ; \
        )
-       cp -fa $(OPENSSL_DIR)/libssl.so* $(STAGING_DIR)/usr/lib/
+       cp -fPpR $(OPENSSL_DIR)/libssl.so* $(STAGING_DIR)/usr/lib/
        chmod a-x $(STAGING_DIR)/usr/lib/libssl.so.0.9.7
        (cd $(STAGING_DIR)/usr/lib ; \
         ln -fs libssl.so.0.9.7 libssl.so ; \
@@ -72,9 +72,9 @@

 $(TARGET_DIR)/usr/lib/libcrypto.so.0.9.7: $(STAGING_DIR)/usr/lib/libcrypto.a
        mkdir -p $(TARGET_DIR)/usr/lib
-       cp -fa $(STAGING_DIR)/usr/lib/libcrypto.so* $(TARGET_DIR)/usr/lib/
-       cp -fa $(STAGING_DIR)/usr/lib/libssl.so* $(TARGET_DIR)/usr/lib/
-       #cp -fa $(STAGING_DIR)/bin/openssl  $(TARGET_DIR)/bin/
+       cp -fPpR $(STAGING_DIR)/usr/lib/libcrypto.so* $(TARGET_DIR)/usr/lib/
+       cp -fPpR $(STAGING_DIR)/usr/lib/libssl.so* $(TARGET_DIR)/usr/lib/
+       #cp -fPpR $(STAGING_DIR)/bin/openssl  $(TARGET_DIR)/bin/
        -$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libssl.so.0.9.7
        -$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libcrypto.so.0.9.7

Index: Makefile
===================================================================
--- Makefile    (revision 19006)
+++ Makefile    (working copy)
@@ -214,7 +214,7 @@
 $(TARGET_DIR):
        mkdir -p $(TARGET_DIR)
        if [ -d "$(TARGET_SKELETON)" ] ; then \
-               cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
+               cp -fPpR $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
        fi;
        touch $(STAGING_DIR)/.fakeroot.00000
        -find $(TARGET_DIR) -type d -name CVS | xargs rm -rf




Patch #5: MAP_ANONYMOUS -> MAP_ANON  (patch-patch)

--- toolchain/gcc/4.2.0/500-bsd-no-map_anonymous.patch  1969-12-31
19:00:00.000000000 -0500
+++ toolchain/gcc/4.2.0/500-bsd-no-map_anonymous.patch  2007-07-05
17:07:04.000000000 -0400
@@ -0,0 +1,12 @@
+diff -ur gcc-4.2.0/gcc/config/host-linux.c gcc-4.2.0/gcc/config/host-linux.c
+--- gcc-4.2.0/gcc/config/host-linux.c  2007-07-05 17:02:45.000000000 -0400
++++ gcc-4.2.0/gcc/config/host-linux.c  2007-07-05 17:03:16.000000000 -0400
+@@ -189,7 +189,7 @@
+
+   /* Try to make an anonymous private mmap at the desired location.  */
+   addr = mmap (base, size, PROT_READ | PROT_WRITE,
+-             MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
++             MAP_PRIVATE | MAP_ANON, -1, 0);
+
+   if (addr != base)
+     {


-- 
allanc at chickenandporn.com  "??" http://linkedin.com/in/goldfish
please, no proprietary attachments (http://tinyurl.com/cbgq)
