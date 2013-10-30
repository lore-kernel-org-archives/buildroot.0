From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 19:10:28 +0100
Subject: [Buildroot] [git commit] glibc,
	toolchain-external: copy libthread_db when gdb is enabled
Message-ID: <20131104211054.650299BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=934f8222f76407115a61014cde315514d56730ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Samuel Martin noticed, libthread_db is not only needed when
cross-gdb+gdbserver is used, but also when the native gdb is used on
the target. As a consequence, this patch modifies the glibc package
and the external toolchain logic to ensure that libthread_db is copied
to the target either when the native gdb or gdbserver is enabled, by
relying on the BR2_PACKAGE_GDB option, which is enabled when native
gdb and/or gdbserver are enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.mk                             |    2 +-
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0dab492..2e7fe82 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -116,7 +116,7 @@ GLIBC_LIBS_LIB = \
 	libnsl.so.* libpthread.so.* libresolv.so.* librt.so.* libutil.so.*   \
 	libnss_files.so.* libnss_dns.so.*
 
-ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+ifeq ($(BR2_PACKAGE_GDB),y)
 GLIBC_LIBS_LIB += libthread_db.so.*
 endif
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 668e9c3..2722600 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -63,7 +63,7 @@ LIB_EXTERNAL_LIBS+=ld*.so.*
 endif
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIB_EXTERNAL_LIBS+=libpthread.so.*
-ifneq ($(BR2_PACKAGE_GDB_SERVER)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
+ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
 LIB_EXTERNAL_LIBS+=libthread_db.so.*
 endif # gdbserver
 endif # ! no threads
