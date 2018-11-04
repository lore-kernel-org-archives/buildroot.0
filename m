From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Nov 2018 13:52:10 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/libssh2: fix static linking
 scenarios involving mbedtls"
Message-ID: <20181104125211.20852-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 48218732a3a7b983825ff3a8cf0767f847ac8d04 because
LTLIBMBEDCRYPTO will return "-lmbedcrypto
-R/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib"

On some compilers, -R option won't be recognized and this will prevent
the detection of libz:

configure:17809: /accts/mlweber1/scripts/instance-3/output/host/bin/i586-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/include  conftest.c /accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib/libz.so -Wl,-rpath -Wl,/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib  -L/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib -lmbedcrypto -R/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib >&5
i586-linux-gcc.br_real: error: unrecognized command line option '-R'; did you mean '-R'?

Fixes:
 - http://autobuild.buildroot.org/results/68623f22b49473177c889fe7b12625d779cbd1ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch b/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
index 01ae0813dd..76e08c51a9 100644
--- a/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
+++ b/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
@@ -8,10 +8,6 @@ libssh2.pc contains correct info for the benefit of pkg-config users.
 Static link with libssh2 requires this information.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[Fabrice: Replace $LIBMBEDCRYTO by $LTLIBMBEDCRYPTO to avoid adding a
-full library path to libssh2.pc as it raises build failures on some
-packages such as xerces]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
 Upstream status: https://github.com/libssh2/libssh2/pull/242
 
@@ -26,7 +22,7 @@ index c0e89a1a0c98..02c70845d27c 100644
  [mbedtls], [
    LIBSSH2_LIB_HAVE_LINKFLAGS([mbedcrypto], [], [#include <mbedtls/version.h>], [
      AC_DEFINE(LIBSSH2_MBEDTLS, 1, [Use $1])
-+    LIBS="$LIBS $LTLIBMBEDCRYPTO"
++    LIBS="$LIBS $LIBMBEDCRYPTO"
      found_crypto="$1"
      support_clear_memory=yes
    ])
-- 
2.17.1
