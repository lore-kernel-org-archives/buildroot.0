From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 23:45:48 +0200
Subject: [Buildroot] [git commit] package/glibc: use upstream glibc for
 RISC-V 32-bit
Message-ID: <20200903214031.1551587774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4889545aa653e7f001f212eda169e7d676aefc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until glibc 2.33 gets released, we use the current 2.32 master branch.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-riscv-Do-not-use-__has_include__.patch    | 28 ----------------------
 .../glibc.hash                                     |  7 ------
 .../glibc.hash                                     |  2 ++
 package/glibc/glibc.mk                             |  6 +++--
 4 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch b/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch
deleted file mode 100644
index 93159e9a7b..0000000000
--- a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 28dd3939221ab26c6774097e9596e30d9753f758 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Thu, 6 Jun 2019 11:24:32 +0200
-Subject: [PATCH] riscv: Do not use __has_include__
-
-The user-visible preprocessor construct is called __has_include.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- sysdeps/unix/sysv/linux/riscv/flush-icache.c | 2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/sysdeps/unix/sysv/linux/riscv/flush-icache.c b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
-index cd5c400977..f2dfcc50d0 100644
---- a/sysdeps/unix/sysv/linux/riscv/flush-icache.c
-+++ b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
-@@ -21,7 +21,7 @@
- #include <stdlib.h>
- #include <atomic.h>
- #include <sys/cachectl.h>
--#if __has_include__ (<asm/syscalls.h>)
-+#if __has_include (<asm/syscalls.h>)
- # include <asm/syscalls.h>
- #else
- # include <asm/unistd.h>
--- 
-2.25.4
-
diff --git a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash b/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
deleted file mode 100644
index ce378c0bd1..0000000000
--- a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated (fetched from Github)
-sha256 703877c0df77fce00719fe55cc62b07bb8d5f44fdb704bbb1b0bf2cf38afe10a  glibc-06983fe52cfe8e4779035c27e8cc5d2caab31531.tar.gz
-
-# Hashes for license files
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
-sha256 35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f LICENSES
diff --git a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash b/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
new file mode 100644
index 0000000000..8db8252e05
--- /dev/null
+++ b/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
@@ -0,0 +1,2 @@
+# Locally calculated (fetched from Github)
+sha256 c3828224d69a42f5b6982cbec8ae01cf494fe975ce9023e36ff2c10a2fb93e42 glibc-2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index ed03a6911f..f2b5b4caf6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -8,8 +8,10 @@ ifeq ($(BR2_arc),y)
 GLIBC_VERSION =  arc-2020.03-release
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
-GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
-GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
+# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
+# Until 2.33 is released, just use master
+GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
+GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_csky),y)
 GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
 GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
