From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:34:05 +0100
Subject: [Buildroot] [git commit] package/libev: bump version to 4.22
Message-ID: <20160201224659.53D5181847@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e100ab132045ece1691eca78d055fe04bf4a0c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch also fixes the broken download of version 4.19 because
upstream move the archive file to Attic/

Removed patch after upstream applied a similar fix:
http://cvs.schmorp.de/libev/ev.c?r1=1.476&r2=1.477

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libev/0001-fix-sparcv8-condition.patch | 29 --------------------------
 package/libev/libev.hash                       |  2 +-
 package/libev/libev.mk                         |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/package/libev/0001-fix-sparcv8-condition.patch b/package/libev/0001-fix-sparcv8-condition.patch
deleted file mode 100644
index d411f83..0000000
--- a/package/libev/0001-fix-sparcv8-condition.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Fix SPARCv8 condition
-
-The define provided by the compiler on SPARCv8 is __sparc_v8__ and not
-__sparcv8. From a SPARCv8 gcc:
-
-$ sparc-linux-gcc --version
-sparc-linux-gcc (Buildroot 2015.08-git-00497-ge110081) 4.9.3
-[...]
-$ sparc-linux-gcc -dM -E - < /dev/null | grep sparc
-#define sparc 1
-#define __sparc__ 1
-#define __sparc 1
-#define __sparc_v8__ 1
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/ev.c
-===================================================================
---- a/ev.c
-+++ b/ev.c
-@@ -649,7 +649,7 @@
-       #define ECB_MEMORY_FENCE         __asm__ __volatile__ ("dmb"      : : : "memory")
-     #elif __aarch64__
-       #define ECB_MEMORY_FENCE         __asm__ __volatile__ ("dmb ish"  : : : "memory")
--    #elif (__sparc || __sparc__) && !__sparcv8
-+    #elif (__sparc || __sparc__) && !__sparc_v8__
-       #define ECB_MEMORY_FENCE         __asm__ __volatile__ ("membar #LoadStore | #LoadLoad | #StoreStore | #StoreLoad" : : : "memory")
-       #define ECB_MEMORY_FENCE_ACQUIRE __asm__ __volatile__ ("membar #LoadStore | #LoadLoad"                            : : : "memory")
-       #define ECB_MEMORY_FENCE_RELEASE __asm__ __volatile__ ("membar #LoadStore             | #StoreStore")
diff --git a/package/libev/libev.hash b/package/libev/libev.hash
index 2252483..7f029df 100644
--- a/package/libev/libev.hash
+++ b/package/libev/libev.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	88fc5f89ca96ceca14c16c10e7be3e921dae65e84932d680c2fd6a40173edccb	libev-4.19.tar.gz
+sha256	736079e8ac543c74d59af73f9c52737b3bfec9601f020bf25a87a4f4d0f01bd6	libev-4.22.tar.gz
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index cde2ee0..02bc72c 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEV_VERSION = 4.19
+LIBEV_VERSION = 4.22
 LIBEV_SITE = http://dist.schmorp.de/libev
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2c or GPLv2+
