From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 17:16:50 +0100
Subject: [Buildroot] [git commit] util-linux: bump to version 2.31.1
Message-ID: <20171231162215.B5FCE80F9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d8cc1405c29c66e7c85da52d47b0b138ec8df46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes in this version:

- Small improvement and bug fixes.
- Install rfkill at /usr/sbin (thus overriding the one eventually
  installed by BusyBox).

Drop the md5 patch, already applyed upstream.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-md5-declare-byteReverse-as-static.patch   | 44 ----------------------
 package/util-linux/util-linux.hash                 |  2 +-
 package/util-linux/util-linux.mk                   |  3 +-
 3 files changed, 3 insertions(+), 46 deletions(-)

diff --git a/package/util-linux/0001-md5-declare-byteReverse-as-static.patch b/package/util-linux/0001-md5-declare-byteReverse-as-static.patch
deleted file mode 100644
index a5b290c..0000000
--- a/package/util-linux/0001-md5-declare-byteReverse-as-static.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 424cee0f06ece9473786c189ab4741e1dea7061d Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Tue, 7 Nov 2017 14:39:09 +0100
-Subject: [PATCH] md5: declare byteReverse as static
-
-byteReverse() is an internal function in md5.c, and is not exposed via
-any header file, but it is not declared as static. This is a problem
-with the md5.c file since it is copied more or less verbatim in other
-programs (fontconfig and pjsip among others), causing a link error
-when linking two of them together.
-
-Fixes link failures such as:
-  http://autobuild.buildroot.net/results/419ab2c0e034cc68991281c51caa8271b0fadbab/build-end.log
-
-[Upstream patch: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=424cee0f06ece9473786c189ab4741e1dea7061d]
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
----
- lib/md5.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/md5.c b/lib/md5.c
-index 488d16ef69b4..282e2d22af25 100644
---- a/lib/md5.c
-+++ b/lib/md5.c
-@@ -21,13 +21,13 @@
- #if !defined(WORDS_BIGENDIAN)
- #define byteReverse(buf, len)	/* Nothing */
- #else
--void byteReverse(unsigned char *buf, unsigned longs);
-+static void byteReverse(unsigned char *buf, unsigned longs);
- 
- #ifndef ASM_MD5
- /*
-  * Note: this code is harmless on little-endian machines.
-  */
--void byteReverse(unsigned char *buf, unsigned longs)
-+static void byteReverse(unsigned char *buf, unsigned longs)
- {
-     uint32_t t;
-     do {
--- 
-2.7.4
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 8142505..838d2dc 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.31/sha256sums.asc
-sha256 f9be7cdcf4fc5c5064a226599acdda6bdf3d86c640152ba01ea642d91108dc8a  util-linux-2.31.tar.xz
+sha256 1a51b16fa9cd51d26ef9ab52d2f1de12403b810fc8252bf7d478df91b3cddf11  util-linux-2.31.1.tar.xz
 # License files, locally calculated
 sha256 1e4b65802b0df8115395c697029d03339f983d451a473a08643309c684410d9a  README.licensing
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPLv2
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 31a3fe4..5858887 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 UTIL_LINUX_VERSION_MAJOR = 2.31
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION_MINOR = 1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
