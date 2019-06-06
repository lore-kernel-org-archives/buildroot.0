From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 09:36:58 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/pcsc-lite: drop
 unneeded first patch
Message-ID: <20190606073742.7B5378D79E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6814f38a75e0d041c8d5e62ea6b61633ef1eae14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This patch is not needed as static build has been disabled since
commit ad8c327053f3736881e1ef6d7b394b3a500ed8fa

Moreover, pthread dependency should be correctly retrieved from
libusb-1.0.pc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5662244c9c03ce411d02b10c808abe829931646a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...=> 0001-Add-disable-documentation-option.patch} |  0
 .../pcsc-lite/0001-pthread-needed-for-libusb.patch | 29 ----------------------
 2 files changed, 29 deletions(-)

diff --git a/package/pcsc-lite/0002-Add-disable-documentation-option.patch b/package/pcsc-lite/0001-Add-disable-documentation-option.patch
similarity index 100%
rename from package/pcsc-lite/0002-Add-disable-documentation-option.patch
rename to package/pcsc-lite/0001-Add-disable-documentation-option.patch
diff --git a/package/pcsc-lite/0001-pthread-needed-for-libusb.patch b/package/pcsc-lite/0001-pthread-needed-for-libusb.patch
deleted file mode 100644
index acb777aa44..0000000000
--- a/package/pcsc-lite/0001-pthread-needed-for-libusb.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-configure.ac: explicitly add pthread cflags/libs in the libusb test
-
-If libusb-config does not exist, LIBUSB_CFLAGS and PTHREAD_CFLAGS will be
-empty, and the test for libusb will be performed without additional flags.
-However, when libusb needs threads, some extra flags are needed (depending
-on the platform), like -pthreads, -lpthread, etc. Without these flags, the
-test for libusb_init() will fail to link correctly, and pcsc-lite will fail
-detecting libusb.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-
-Upstream-status: will be submitted
-
----
-
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -254,8 +254,8 @@ if test "x$use_libusb" != xno ; then
- 	saved_CPPFLAGS="$CPPFLAGS"
- 	saved_LIBS="$LIBS"
- 
--	CPPFLAGS="$CPPFLAGS $LIBUSB_CFLAGS"
--	LIBS="$LDFLAGS $LIBUSB_LIBS"
-+	CPPFLAGS="$CPPFLAGS $LIBUSB_CFLAGS $PTHREAD_CFLAGS"
-+	LIBS="$LDFLAGS $LIBUSB_LIBS $PTHREAD_LIBS"
- 
- 	AC_CHECK_HEADERS(libusb.h, [],
- 		[ AC_MSG_ERROR([libusb.h not found, use ./configure LIBUSB_CFLAGS=...]) ])
