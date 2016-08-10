From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 00:03:45 +0200
Subject: [Buildroot] [git commit branch/next] libtasn1: bump to version 4.9
Message-ID: <20160810220349.37AD981D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e5ec4683a120d6b062acf3e4edb2c4210837a62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add upstream patch to fix build failure with gcc warnings on.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...configure-don-t-add-Werror-to-build-flags.patch | 28 ++++++++++++++++++++++
 package/libtasn1/libtasn1.hash                     |  2 +-
 package/libtasn1/libtasn1.mk                       |  4 +++-
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch b/package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
new file mode 100644
index 0000000..387ba7a
--- /dev/null
+++ b/package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
@@ -0,0 +1,28 @@
+From dd091c8af163213e12aa92f61bc4916e0f102633 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Tue, 26 Jul 2016 08:45:33 +0200
+Subject: [PATCH] configure: don't add -Werror to build flags
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: upstream
+
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7a14e04..066f5fe 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,8 +70,6 @@ AC_ARG_ENABLE([gcc-warnings],
+ )
+ 
+ if test "$gl_gcc_warnings" = yes; then
+-  gl_WARN_ADD([-Werror], [WERROR_CFLAGS])
+-
+   nw="$nw -Wsystem-headers"         # Don't let system headers trigger warnings
+   nw="$nw -Wc++-compat"             # We don't care strongly about C++ compilers
+   nw="$nw -Wtraditional"            # Warns on #elif which we use often
+-- 
+2.7.3
+
diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index dc65210..5b2100e 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fa802fc94d79baa00e7397cedf29eb6827d4bd8b4dd77b577373577c93a8c513	libtasn1-4.8.tar.gz
+sha256	4f6f7a8fd691ac2b8307c8ca365bad711db607d4ad5966f6938a9d2ecd65c920	libtasn1-4.9.tar.gz
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index c51d8c0..6b7e6b3 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.8
+LIBTASN1_VERSION = 4.9
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+, LGPLv2.1+
@@ -12,5 +12,7 @@ LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
 LIBTASN1_INSTALL_STAGING = YES
 # 'missing' fallback logic botched so disable it completely
 LIBTASN1_CONF_ENV = MAKEINFO="true"
+# For 0001-configure-don-t-add-Werror-to-build-flags.patch
+LIBTASN1_AUTORECONF = YES
 
 $(eval $(autotools-package))
