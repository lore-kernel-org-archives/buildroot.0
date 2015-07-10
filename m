From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:04:30 +0200
Subject: [Buildroot] [git commit] zeromq: depend on libsodium if available
Message-ID: <20150710220506.A2280819AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6272583956ebd659f40cd5e7ef89367abaa83539
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ZeroMQ doesn't require libsodium, but will enable CURVE security if it's
available. This patch adds the optional dependency.

[Thomas: pass --without-libsodium explicitly when libsodium is not
enabled, and to achieve this, backport a patch from upstream zeromq.]

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zeromq/0004-allow-without-libsodium.patch |   38 +++++++++++++++++++++
 package/zeromq/zeromq.mk                          |    9 +++++
 2 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/zeromq/0004-allow-without-libsodium.patch b/package/zeromq/0004-allow-without-libsodium.patch
new file mode 100644
index 0000000..19850ba
--- /dev/null
+++ b/package/zeromq/0004-allow-without-libsodium.patch
@@ -0,0 +1,38 @@
+From c561766ab4ee4b3420b72e33fac4a75fb9194430 Mon Sep 17 00:00:00 2001
+From: Min RK <benjaminrk@gmail.com>
+Date: Mon, 16 Feb 2015 14:59:54 -0800
+Subject: [PATCH] allow `--without-libsodium`
+
+and `--with-libsodium=no` to disable linking against libsodium.
+
+Without this patch, it is not possible to disable linking with libsodium present on the default path.
+
+Backport from upstream commit
+faaf4550263395b84e6a80d3f9d7ba8816cdd714.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 194fcb2..3d5f6d6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -257,7 +257,12 @@ esac
+ # Checks for libraries
+ AC_CHECK_LIB([pthread], [pthread_create])
+ AC_CHECK_LIB([rt], [clock_gettime])
+-AC_CHECK_LIB([sodium], [sodium_init],,AC_MSG_WARN(libsodium is needed for CURVE security))
++
++if test "x$with_libsodium" != "xno"; then
++    AC_CHECK_LIB([sodium], [sodium_init],,AC_MSG_WARN(libsodium is needed for CURVE security))
++else
++    AC_MSG_WARN(libsodium is needed for CURVE security)
++fi
+ 
+ #
+ # Check if the compiler supports -fvisibility=hidden flag. MinGW32 uses __declspec
+-- 
+2.4.5
+
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 7e9ed19..623a12e 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -12,6 +12,7 @@ ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 # For 0001-tests-disable-test_fork-if-fork-is-not-available.patch
 # and 0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
+# and 0004-allow-without-libsodium.patch
 ZEROMQ_AUTORECONF = YES
 
 # Assume these flags are always available. It is true, at least for
@@ -34,4 +35,12 @@ ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
 ZEROMQ_CONF_OPTS += --with-system-pgm
 endif
 
+# ZeroMQ uses libsodium if it's available.
+ifeq ($(BR2_PACKAGE_LIBSODIUM), y)
+ZEROMQ_DEPENDENCIES += libsodium
+ZEROMQ_CONF_OPTS += --with-libsodium="$(STAGING_DIR)/usr"
+else
+ZEROMQ_CONF_OPTS += --without-libsodium
+endif
+
 $(eval $(autotools-package))
