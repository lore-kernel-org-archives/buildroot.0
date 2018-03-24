From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:39:49 +0100
Subject: [Buildroot] [git commit] libssh2: fix pkg-config info for mbedtls
 backend
Message-ID: <20180324204059.D46CB82DCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebbf8746243ee4fa6b51a5a6afa8b14459b4178f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libssh2.pc file did not contain the needed info for static link with
libssh2. Add a patch fixing that.

Fixes (qemu):
http://autobuild.buildroot.net/results/634/6346b25be2844f9ef722e52040ac1b43d9c38899/

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-acinclude.m4-add-mbedtls-to-LIBS.patch    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch b/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
new file mode 100644
index 0000000000..76e08c51a9
--- /dev/null
+++ b/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
@@ -0,0 +1,31 @@
+From f4846473f0f0ec313f8ed7ff4cd9f59c1741465d Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 20 Mar 2018 20:21:53 +0200
+Subject: [PATCH] acinclude.m4: add mbedtls to LIBS
+
+This is useful for static builds so that the Libs.private field in
+libssh2.pc contains correct info for the benefit of pkg-config users.
+Static link with libssh2 requires this information.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/libssh2/libssh2/pull/242
+
+ acinclude.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index c0e89a1a0c98..02c70845d27c 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -441,6 +441,7 @@ m4_case([$1],
+ [mbedtls], [
+   LIBSSH2_LIB_HAVE_LINKFLAGS([mbedcrypto], [], [#include <mbedtls/version.h>], [
+     AC_DEFINE(LIBSSH2_MBEDTLS, 1, [Use $1])
++    LIBS="$LIBS $LIBMBEDCRYPTO"
+     found_crypto="$1"
+     support_clear_memory=yes
+   ])
+-- 
+2.16.2
+
