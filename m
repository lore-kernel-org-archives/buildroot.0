From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:25:26 +1300
Subject: [Buildroot] [git commit] libselinux: bump version to 2.6
Message-ID: <20170125102553.B1FA08057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4ba984ade64541fdfbfaa15a4aebed67c41abbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit also adds a patch that allows libselinux 2.6 to build
properly with older compilers such as gcc 4.4.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
[Thomas: add patch to fix gcc 4.4 build issue.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...src-regex.c-support-old-compilers-for-the.patch | 47 ++++++++++++++++++++++
 package/libselinux/libselinux.hash                 |  2 +-
 package/libselinux/libselinux.mk                   |  4 +-
 3 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/package/libselinux/0001-libselinux-src-regex.c-support-old-compilers-for-the.patch b/package/libselinux/0001-libselinux-src-regex.c-support-old-compilers-for-the.patch
new file mode 100644
index 0000000..3bda607
--- /dev/null
+++ b/package/libselinux/0001-libselinux-src-regex.c-support-old-compilers-for-the.patch
@@ -0,0 +1,47 @@
+From e0803c0bdbb1abf06b6b5bb1b52fdb733505b8f7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 25 Jan 2017 22:41:02 +1300
+Subject: [PATCH] src/regex.c: support old compilers for the endian
+ check
+
+libselinux 2.6 has added some code in regex.c that uses __BYTE_ORDER__
+to determine the system endianness. Unfortunately, this definition
+provided directly by the compiler doesn't exist in older gcc versions
+such as gcc 4.4.
+
+In order to address this, this commit extends the logic to use
+<endian.h> definitions if __BYTE_ORDER__ is not provided by the
+compiler. This allows libselinux to build properly with gcc 4.4.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/regex.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/regex.c b/src/regex.c
+index a3b427b..0c5ad27 100644
+--- a/src/regex.c
++++ b/src/regex.c
+@@ -13,7 +13,18 @@
+ #endif
+ 
+ #ifndef __BYTE_ORDER__
+-#error __BYTE_ORDER__ not defined. Unable to determine endianness.
++
++/* If the compiler doesn't define __BYTE_ORDER__, try to use the C
++ * library <endian.h> header definitions. */
++#include <endian.h>
++#ifndef __BYTE_ORDER
++#error Neither __BYTE_ORDER__ nor __BYTE_ORDER defined. Unable to determine endianness.
++#endif
++
++#define __ORDER_LITTLE_ENDIAN __LITTLE_ENDIAN
++#define __ORDER_BIG_ENDIAN __BIG_ENDIAN
++#define __BYTE_ORDER__ __BYTE_ORDER
++
+ #endif
+ 
+ #ifdef USE_PCRE2
+-- 
+2.7.4
+
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index a4c3440..76130b2 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 94c9e97706280bedcc288f784f67f2b9d3d6136c192b2c9f812115edba58514f libselinux-2.5.tar.gz
+sha256 4ea2dde50665c202253ba5caac7738370ea0337c47b251ba981c60d24e1a118a libselinux-2.6.tar.gz
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 165ac4c..44120c4 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 2.5
-LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
+LIBSELINUX_VERSION = 2.6
+LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
