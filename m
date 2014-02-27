From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2014 14:26:44 +0100
Subject: [Buildroot] [git commit] pcsc-lite: add patch to fix libusb
	detection when linking statically
Message-ID: <20140227134822.C70F39BB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ddf44a3ab97161f93a0c22cb55fc302456cc61c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libusb support is requested in pcsc-lite, the configure script will try
to link a test application to check libusb_init(). However, when libusb
needs threads, the linking step should link in threads as well.

The configure script, first tries to call libusb-config to determine the
necessary cflags and libraries (which should include the thread flags), but
this program does not exist, so the cflags/libs variables are empty.

Therefore, add a patch to explicitly add PTHREAD_CFLAGS and PTHREAD_LIBS to
the libusb test, so libusb is detected correctly.

Fixes
http://autobuild.buildroot.org/results/432/432be0db3f8415f6a026b69234579ad4d23b6421/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../pcsc-lite-0001-pthread-needed-for-libusb.patch |   29 ++++++++++++++++++++
 package/pcsc-lite/pcsc-lite.mk                     |    1 +
 2 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite-0001-pthread-needed-for-libusb.patch b/package/pcsc-lite/pcsc-lite-0001-pthread-needed-for-libusb.patch
new file mode 100644
index 0000000..acb777a
--- /dev/null
+++ b/package/pcsc-lite/pcsc-lite-0001-pthread-needed-for-libusb.patch
@@ -0,0 +1,29 @@
+configure.ac: explicitly add pthread cflags/libs in the libusb test
+
+If libusb-config does not exist, LIBUSB_CFLAGS and PTHREAD_CFLAGS will be
+empty, and the test for libusb will be performed without additional flags.
+However, when libusb needs threads, some extra flags are needed (depending
+on the platform), like -pthreads, -lpthread, etc. Without these flags, the
+test for libusb_init() will fail to link correctly, and pcsc-lite will fail
+detecting libusb.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+
+Upstream-status: will be submitted
+
+---
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -254,8 +254,8 @@ if test "x$use_libusb" != xno ; then
+ 	saved_CPPFLAGS="$CPPFLAGS"
+ 	saved_LIBS="$LIBS"
+ 
+-	CPPFLAGS="$CPPFLAGS $LIBUSB_CFLAGS"
+-	LIBS="$LDFLAGS $LIBUSB_LIBS"
++	CPPFLAGS="$CPPFLAGS $LIBUSB_CFLAGS $PTHREAD_CFLAGS"
++	LIBS="$LDFLAGS $LIBUSB_LIBS $PTHREAD_LIBS"
+ 
+ 	AC_CHECK_HEADERS(libusb.h, [],
+ 		[ AC_MSG_ERROR([libusb.h not found, use ./configure LIBUSB_CFLAGS=...]) ])
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index afbe822..7048573 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -11,6 +11,7 @@ PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
 PCSC_LITE_LICENSE = BSD-3c
 PCSC_LITE_LICENSE_FILES = COPYING
+PCSC_LITE_AUTORECONF = YES
 
 # - libudev and libusb are optional
 # - libudev and libusb can't be used together
