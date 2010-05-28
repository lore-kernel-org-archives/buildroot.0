From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 28 May 2010 23:23:14 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/external: only copt the pthread
	lib if needed
Message-ID: <20100528212314.1541.49408.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

If threads are disabled, do not try to copy the libpthread.so from the
external library.

It is still expected that the BR configuration matches the external
toolchain setup, and no check is done to enforce that.
---
 toolchain/external-toolchain/ext-tool.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index bb4809c..e858edb 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -251,7 +251,7 @@ check_cross_compiler_exists = \
 
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
-EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
+EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 EXTERNAL_LIBS+=ld-uClibc.so
 else
@@ -262,6 +262,10 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 EXTERNAL_LIBS+=libstdc++.so
 endif
 
+ifneq ($(BR2_PTHREADS_NONE),y)
+EXTERNAL_LIBS+=libpthread.so
+endif # ! no threads
+
 # SYSROOT_DIR selection. We first try the -print-sysroot option,
 # available in gcc 4.4.x and in some Codesourcery toolchains. If this
 # option is not available, we fallback to the value of --with-sysroot
