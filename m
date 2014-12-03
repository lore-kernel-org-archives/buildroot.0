From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Thu,  4 Dec 2014 00:13:59 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fix check-musl
Message-ID: <1417648439-10146-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

check_musl works fine for the external musl 1.1.1 toolchain which is downloaded
and installed, but fails for a musl toolchain which, in a first step is build
by the internal toolchain backend of Buildroot, and in a second step is copied
to an external directory and imported as an custom external toolchain (in a new
configuration).

In case of the downloaded musl 1.1.1 toolchain the libc.so and libm.a files
reside in the sysroot/lib directory and sysroot/usr/lib is a symlink to
sysroot/lib.

In case of the custom musl toolchain build by Buildroot the files reside in
sysroot/usr/lib which is not a symlink.

To let check_musl detect the custom musl toolchain correctly test for libc.so
and lib.m in sysroot/usr/lib which works in both cases.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..425a448 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -229,7 +229,7 @@ check_glibc = \
 # $1: sysroot directory
 check_musl = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if test ! -f $${SYSROOT_DIR}/lib/libc.so -o -e $${SYSROOT_DIR}/lib/libm.so ; then \
+	if test ! -f $${SYSROOT_DIR}/usr/lib/libc.so -o -e $${SYSROOT_DIR}/usr/lib/libm.so ; then \
 		echo "Incorrect selection of the C library" ; \
 		exit -1; \
 	fi
-- 
2.1.3
