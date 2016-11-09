From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:15:06 +0100
Subject: [Buildroot] [git commit] valgrind: do not use host mpicc
Message-ID: <20161109211541.6352881983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afc9274715d0bf4c92bd930cdeb91bdc60904c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Valgrind may use 'mpicc' (from openmi project) to compile libmpiwrap-*.so.
Without any option, it will detect and use 'mpicc' from host and generate
libmpiwrap-*.so for host:

  $ file target/usr/lib/valgrind/libmpiwrap-arm-linux.so
  target/usr/lib/valgrind/libmpiwrap-arm-linux.so: ELF 64-bit LSB  shared object,
  x86-64, version 1 (SYSV), dynamically linked, not stripped

We simply disable openmi support for valgrind.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
[Thomas: refactor with other unconditional CONF_OPTS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/valgrind/valgrind.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 09f7116..087a381 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -9,7 +9,9 @@ VALGRIND_SITE = http://valgrind.org/downloads
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
-VALGRIND_CONF_OPTS = --disable-ubsan
+VALGRIND_CONF_OPTS = \
+	--disable-ubsan \
+	--without-mpicc
 VALGRIND_INSTALL_STAGING = YES
 
 # patch 0004-Fixes-for-musl-libc.patch touching configure.ac
