From: Guy Benyei <guybe@mellanox.com>
Date: Wed, 7 Jun 2017 10:41:51 +0000
Subject: [Buildroot] [PATCH]Libssp support
Message-ID: <AM3PR05MB433972636565D3B639BB0BAC9C80@AM3PR05MB433.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I tried to activate gcc's -fstack-protector flag, but the compiler was looking for libssp:

.../toolchain/bin/arceb-linux-gcc  -O2 -o stack_overrun stack_overrun.c -fstack-protector
.../arceb-ezchip-linux-uclibc/bin/ld: cannot find -lssp_nonshared
.../arceb-ezchip-linux-uclibc/bin/ld: cannot find -lssp
collect2: error: ld returned 1 exit status

Building libssp seems to be disabled with no option to enable it in package/gcc.mk by using the --disable-libssp flag for configuring gcc. Applying the patch below enables the usage of libssp. Of course, it could be conditional with some configuration symbol, to save place when libssp is not needed.
Any thoughts on it?

It seems to be related to this bug:
https://bugs.busybox.net/show_bug.cgi?id=4039

Thanks
        Guy Benyei


diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index e8d2e18..d0f23c9 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -147,6 +147,15 @@ endef
 
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBATOMIC
 
+define HOST_GCC_FINAL_INSTALL_LIBSSP
+       -cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libssp* \
+               $(STAGING_DIR)/lib/
+       -cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libssp* \
+               $(TARGET_DIR)/lib/
+endef
+
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBSSP
+
 # Handle the installation of libraries in /usr/lib  HOST_GCC_FINAL_USR_LIBS =
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk index b52f945..cca3847 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -90,7 +90,6 @@ HOST_GCC_COMMON_CONF_OPTS = \
        --with-sysroot=$(STAGING_DIR) \
        --disable-__cxa_atexit \
        --with-gnu-ld \
-       --disable-libssp \
        --disable-multilib \
        --with-gmp=$(HOST_DIR)/usr \
        --with-mpc=$(HOST_DIR)/usr \
