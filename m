From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Nov 2018 13:52:11 +0100
Subject: [Buildroot] [PATCH 2/2] libssh2: fix static linking scenarios
 involving mbedtls
In-Reply-To: <20181104125211.20852-1-fontaine.fabrice@gmail.com>
References: <20181104125211.20852-1-fontaine.fabrice@gmail.com>
Message-ID: <20181104125211.20852-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

curl can be statically linked with mbedtls, in this case build will fail
on:
kex.c:(.text+0x1be0): undefined reference to `mbedtls_mpi_read_binary'

This is due to the fact that CURL_LIBRARIES does not contain mbedtls
library:
CURL_LIBRARIES:INTERNAL=curl;cares;ssh2;ssh2;z;ssl;crypto;z;z;crypto;z;z;ssl;z;z;crypto;z

even if libcurl.pc is correct:
Libs.private: -lcares -lssh2 -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lssh2 /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lz -lssl -lcrypto -lssl -lz -lz -lcrypto -lz -lz

This full library path is added by patch
0002-acinclude.m4-add-mbedtls-to-LIBS.patch on libssh2 so update it to
replace $LIBMBDEDCRYPTO by -lmbedcrypto

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch b/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
index 76e08c51a9..a70b1fe84f 100644
--- a/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
+++ b/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
@@ -8,6 +8,10 @@ libssh2.pc contains correct info for the benefit of pkg-config users.
 Static link with libssh2 requires this information.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Fabrice: Replace $LIBMBEDCRYTO by -lmdedcrypto to avoid adding a full
+library path to libssh2.pc as it raises build failures on some packages
+such as xerces]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
 Upstream status: https://github.com/libssh2/libssh2/pull/242
 
@@ -22,7 +26,7 @@ index c0e89a1a0c98..02c70845d27c 100644
  [mbedtls], [
    LIBSSH2_LIB_HAVE_LINKFLAGS([mbedcrypto], [], [#include <mbedtls/version.h>], [
      AC_DEFINE(LIBSSH2_MBEDTLS, 1, [Use $1])
-+    LIBS="$LIBS $LIBMBEDCRYPTO"
++    LIBS="$LIBS -lmbedcrypto"
      found_crypto="$1"
      support_clear_memory=yes
    ])
-- 
2.17.1
