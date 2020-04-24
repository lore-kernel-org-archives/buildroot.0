From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 24 Apr 2020 18:48:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: bump to version 2.31
In-Reply-To: <20200424164851.19897-1-romain.naour@smile.fr>
References: <20200424164851.19897-1-romain.naour@smile.fr>
Message-ID: <20200424164851.19897-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update LICENSES file hash due to url change:
"Prefer https to http for gnu.org and fsf.org URLs"

Apply the patch suggested by Florian Weimer fixing a build issue for
riscv64 0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch

Remove upstream patch for localedef:
0003-localedef-Use-initializer-for-flexible-array-member-.patch

The version bump required some patches applied on
several packages such busybox, gcc and openssh.

[Busybox] 13f2d688a24f47446af236829bd6ca194d5aea5b
[gcc] disable libsanitizer with gcc 7.5
[openssh] bad75bca315dbd2c69f8a9cb02fa9f27636e3d48

Tested by toolchain builder:
https://gitlab.com/kubu93/toolchains-builder/pipelines/129551000

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...ache-fix-glibc-2.31-toolchain-with-k.patch | 51 ++++++++++++
 .../glibc.hash                                |  4 +-
 package/glibc/glibc.mk                        |  2 +-
 ...itializer-for-flexible-array-member-.patch | 81 -------------------
 ...ACK-only-build-and-install-localedef.patch |  0
 ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch |  0
 .../localedef.hash                            |  4 +-
 package/localedef/localedef.mk                |  2 +-
 8 files changed, 57 insertions(+), 87 deletions(-)
 create mode 100644 package/glibc/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch
 rename package/glibc/{2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91 => 2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573}/glibc.hash (52%)
 delete mode 100644 package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch
 rename package/localedef/{2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91 => 2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573}/0001-HACK-only-build-and-install-localedef.patch (100%)
 rename package/localedef/{2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91 => 2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
 rename package/localedef/{2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91 => 2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573}/localedef.hash (52%)

diff --git a/package/glibc/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch b/package/glibc/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch
new file mode 100644
index 0000000000..e33f955f87
--- /dev/null
+++ b/package/glibc/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch
@@ -0,0 +1,51 @@
+From 5142becd7662fea48c1313364dadc4c17e0e4fb6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Wed, 25 Mar 2020 11:25:23 +0100
+Subject: [PATCH] riscv64/flush-icache: fix glibc 2.31 toolchain with kernel
+ headers < 5.0
+
+Without this patch, the risc64 port needs@least a kernel headers >= 5.0
+
+Otherwise glibc fail to build with:
+
+../sysdeps/unix/sysv/linux/riscv/rv64/arch-syscall.h:193:33: error: expected
+declaration specifiers or '...' before numeric constant
+  193 | #define __NR_riscv_flush_icache 259
+      |                                 ^~~
+In file included from ../sysdeps/unix/sysv/linux/riscv/flush-icache.c:25:
+/home/naourr/buildroot/test/toolchain/host/riscv64-buildroot-linux-gnu/sysroot/usr/include/asm/syscalls.h:29:36:
+error: unknown type name 'sys_riscv_flush_icache'
+   29 | __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
+      |                                    ^~~~~~~~~~~~~~~~~~~~~~
+
+See: https://gitlab.com/kubu93/toolchains-builder/-/jobs/422726962
+
+The syscalls.h header wasn't originally written as a UAPI header, including
+<sys/syscall.h> should now be sufficient.
+
+https://sourceware.org/ml/libc-alpha/2020-02/msg00018.html
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ sysdeps/unix/sysv/linux/riscv/flush-icache.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/riscv/flush-icache.c b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
+index 72caeb190f..ef33582bdf 100644
+--- a/sysdeps/unix/sysv/linux/riscv/flush-icache.c
++++ b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
+@@ -21,11 +21,6 @@
+ #include <stdlib.h>
+ #include <atomic.h>
+ #include <sys/cachectl.h>
+-#if __has_include (<asm/syscalls.h>)
+-# include <asm/syscalls.h>
+-#else
+-# include <asm/unistd.h>
+-#endif
+ #include <sys/syscall.h>
+ 
+ typedef int (*func_type) (void *, void *, unsigned long int);
+-- 
+2.21.1
+
diff --git a/package/glibc/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/glibc.hash b/package/glibc/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/glibc.hash
similarity index 52%
rename from package/glibc/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/glibc.hash
rename to package/glibc/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/glibc.hash
index 4283ea04b4..9830215cdb 100644
--- a/package/glibc/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/glibc.hash
+++ b/package/glibc/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/glibc.hash
@@ -1,7 +1,7 @@
 # Locally calculated (fetched from Github)
-sha256  fe1ca8099bc2cda997d8a585f1a512e59df56c52c9c7363a4058da2725c8f4a9  glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91.tar.gz
+sha256  f7a8261fffc5096bcf689093710ad7e78335147964ad7c06f18081d9496c8da8  glibc-2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
+sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 2ca73343b3..b1752b5a2b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -17,7 +17,7 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
+GLIBC_VERSION = 2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch
deleted file mode 100644
index 93547e08f0..0000000000
--- a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 6fea0a8e33760258c4baa5d0a6f3a145897427fe Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Tue, 3 Sep 2019 14:01:39 +0200
-Subject: [PATCH] localedef: Use initializer for flexible array member [BZ
- #24950]
-
-struct charseq used a zero-length array instead of a flexible array
-member.  This required a strange construct to initialize struct
-charseq objects, and GCC 10 warns about that:
-
-cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
-In file included from programs/repertoire.h:24,
-                 from programs/localedef.h:32,
-                 from programs/ld-ctype.c:35:
-programs/charmap.h:63:17: note: destination object declared here
-   63 |   unsigned char bytes[0];
-      |                 ^~~~~
-cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
-programs/charmap.h:63:17: note: destination object declared here
-cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
-programs/charmap.h:63:17: note: destination object declared here
-cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
-programs/charmap.h:63:17: note: destination object declared here
-
-The change makes the object physically const, but it is not expected
-to be modified.
-
-[Upstream: https://sourceware.org/git/?p=glibc.git;a=patch;h=1471fa556afb428c4a4c46cf5543a4101d5bcf91]
-[Dropped confliciting ChangeLog part]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- locale/programs/charmap.h  |  2 +-
- locale/programs/ld-ctype.c | 12 ++++++------
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/locale/programs/charmap.h b/locale/programs/charmap.h
-index 870a9e95..70db330d 100644
---- a/locale/programs/charmap.h
-+++ b/locale/programs/charmap.h
-@@ -60,7 +60,7 @@ struct charseq
-   const char *name;
-   uint32_t ucs4;
-   int nbytes;
--  unsigned char bytes[0];
-+  unsigned char bytes[];
- };
- 
- 
-diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index cfc9c43f..9123f64a 100644
---- a/locale/programs/ld-ctype.c
-+++ b/locale/programs/ld-ctype.c
-@@ -842,8 +842,6 @@ no input digits defined and none of the standard names in the charmap"));
-   for (cnt = 0; cnt < 10; ++cnt)
-     if (ctype->mboutdigits[cnt] == NULL)
-       {
--	static struct charseq replace[2];
--
- 	if (!warned)
- 	  {
- 	    record_error (0, 0, _("\
-@@ -851,10 +849,12 @@ not all characters used in `outdigit' are available in the charmap"));
- 	    warned = 1;
- 	  }
- 
--	replace[0].nbytes = 1;
--	replace[0].bytes[0] = '?';
--	replace[0].bytes[1] = '\0';
--	ctype->mboutdigits[cnt] = &replace[0];
-+	static const struct charseq replace =
-+	  {
-+	     .nbytes = 1,
-+	     .bytes = "?",
-+	  };
-+	ctype->mboutdigits[cnt] = (struct charseq *) &replace;
-       }
- 
-   warned = 0;
--- 
-2.26.0
-
diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash b/package/localedef/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/localedef.hash
similarity index 52%
rename from package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
rename to package/localedef/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/localedef.hash
index 4283ea04b4..9830215cdb 100644
--- a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
+++ b/package/localedef/2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573/localedef.hash
@@ -1,7 +1,7 @@
 # Locally calculated (fetched from Github)
-sha256  fe1ca8099bc2cda997d8a585f1a512e59df56c52c9c7363a4058da2725c8f4a9  glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91.tar.gz
+sha256  f7a8261fffc5096bcf689093710ad7e78335147964ad7c06f18081d9496c8da8  glibc-2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
+sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 1093e106fa..1dc1a235e3 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
+LOCALEDEF_VERSION = 2.31-18-g3937f6806d9de4bbd25ff6e6dc4df8f47ad47573
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.21.1
