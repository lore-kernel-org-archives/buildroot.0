From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  9 Nov 2016 10:51:24 +0100
Subject: [Buildroot] [PATCH] valgrind: do not use host mpicc
Message-ID: <20161109095124.6037-1-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Valgrind may use 'mpicc' (from openmi project) to compile libmpiwrap-*.so.
Without any option, it will detect and use 'mpicc' from host and generate
libmpiwrap-*.so for host:

  $ file target/usr/lib/valgrind/libmpiwrap-arm-linux.so
  target/usr/lib/valgrind/libmpiwrap-arm-linux.so: ELF 64-bit LSB  shared object,
  x86-64, version 1 (SYSV), dynamically linked, not stripped

We simply disable openmi support for valgrind.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/valgrind/valgrind.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 09f7116..c7ac2a1 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -15,6 +15,8 @@ VALGRIND_INSTALL_STAGING = YES
 # patch 0004-Fixes-for-musl-libc.patch touching configure.ac
 VALGRIND_AUTORECONF = YES
 
+VALGRIND_CONF_OPTS += --without-mpicc
+
 # When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
 # -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture,
 # it forcibly adds -march=mips64. This causes Valgrind to be built
-- 
2.9.3
