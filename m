From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 15:12:18 +0200
Subject: [Buildroot] [git commit] toolchain-external: conditionalize the
	installation of libraries
Message-ID: <20131009143429.84CE29B9A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36ef1b4494f669d9c6f8507fb912f83f46a2d63d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The external toolchain code makes the assumption that all C libraries
have a ld*.so, libc.so, libcrypt.so, libdl.so, libgcc_s.so, libm.so,
libnsl.so, libresolv.so, libutil.so, and when thread support is
enabled, libpthread.so, etc.

However, this is not the case with the musl C library, which
integrates all the functionalities in a single libc.so file. In
preparation of the support of the musl library, we make the current
value of LIB_EXTERNAL_LIBS conditional to glibc or uClibc.

The addition of additional libraries through
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS is kept outside the condition, at
the end.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 85fc341..aaf4994 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -54,8 +54,16 @@
 #  $(HOST_DIR)/usr/bin like for the internal toolchains, and the rest
 #  of Buildroot is handled identical for the 2 toolchain types.
 
-LIB_EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
-LIB_EXTERNAL_LIBS+=$(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+LIB_EXTERNAL_LIBS+=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIB_EXTERNAL_LIBS+=libpthread.so
+ifneq ($(BR2_PACKAGE_GDB_SERVER)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
+LIB_EXTERNAL_LIBS+=libthread_db.so
+endif # gdbserver
+endif # ! no threads
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
 endif
@@ -64,12 +72,7 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 USR_LIB_EXTERNAL_LIBS+=libstdc++.so
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIB_EXTERNAL_LIBS+=libpthread.so
-ifneq ($(BR2_PACKAGE_GDB_SERVER)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
-LIB_EXTERNAL_LIBS+=libthread_db.so
-endif # gdbserver
-endif # ! no threads
+LIB_EXTERNAL_LIBS+=$(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 # Details about sysroot directory selection.
 #
