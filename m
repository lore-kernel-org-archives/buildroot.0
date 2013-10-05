From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Oct 2013 16:16:10 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain-external: conditionalize the
	installation of libraries
In-Reply-To: <1380982574-16628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1380982574-16628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1380982574-16628-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 toolchain/toolchain-external/ext-tool.mk | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index db2a99e..93f1c0f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -49,8 +49,16 @@
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
@@ -59,12 +67,7 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
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
-- 
1.8.1.2
