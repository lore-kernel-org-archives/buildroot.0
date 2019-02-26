From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Feb 2019 13:09:27 +0100
Subject: [Buildroot] [git commit] package/gcc: bump to version 8.3.0
Message-ID: <20190226120840.3DC3A88933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8605e4bb0ba3cc801552ca8dc9e51bb7a246d32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upsteam xtensa patches:
https://github.com/gcc-mirror/gcc/commit/68ca69a4854af36c90531b33a4c540464dbc6a23
https://github.com/gcc-mirror/gcc/commit/972057cb254e355805bfcd4a47d5c6f743cb76f4

Tested using Toolchain-builder:
https://gitlab.com/kubu93/toolchains-builder/pipelines/48904471

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nsa-fix-NAND-code-in-xtensa_expand_atomic.patch | 39 --------------------
 ...xtensa-don-t-force-PIC-for-uclinux-target.patch | 41 ----------------------
 package/gcc/Config.in.host                         |  2 +-
 package/gcc/gcc.hash                               |  4 +--
 4 files changed, 3 insertions(+), 83 deletions(-)

diff --git a/package/gcc/8.2.0/0004-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch b/package/gcc/8.2.0/0004-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
deleted file mode 100644
index d62d7c1566..0000000000
--- a/package/gcc/8.2.0/0004-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 6765eecde2ed8d4be0fc217408b9e9b92a840aff Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 4 Sep 2018 00:39:32 -0700
-Subject: [PATCH] gcc: xtensa: fix NAND code in xtensa_expand_atomic
-
-NAND is ~(a1 & a2), but xtensa_expand_atomic does ~a1 & a2.
-That fixes libatomic tests atomic-op-{1,2}.
-
-gcc/
-2018-09-04  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* config/xtensa/xtensa.c (xtensa_expand_atomic): Reorder AND and
-	XOR operations in NAND case.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Backported from: r264087
----
- gcc/config/xtensa/xtensa.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index 7cfe64d42895..080bb4ad765d 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -1614,9 +1614,9 @@ xtensa_expand_atomic (enum rtx_code code, rtx target, rtx mem, rtx val,
-       break;
- 
-     case MULT: /* NAND */
--      tmp = expand_simple_binop (SImode, XOR, old, ac.modemask,
-+      tmp = expand_simple_binop (SImode, AND, old, val,
- 				 NULL_RTX, 1, OPTAB_DIRECT);
--      tmp = expand_simple_binop (SImode, AND, tmp, val,
-+      tmp = expand_simple_binop (SImode, XOR, tmp, ac.modemask,
- 				 new_rtx, 1, OPTAB_DIRECT);
-       break;
- 
--- 
-2.11.0
-
diff --git a/package/gcc/8.2.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch b/package/gcc/8.2.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
deleted file mode 100644
index 360947cbb1..0000000000
--- a/package/gcc/8.2.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 960a2552f7b418134cdf7a31e96023a3811b98dd Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sun, 4 Nov 2018 23:55:59 -0800
-Subject: [PATCH] gcc: xtensa: don't force PIC for uclinux target
-
-xtensa-uclinux uses bFLT executable file format that cannot relocate
-fields representing offsets from data to code. C++ objects built as PIC
-use offsets to encode FDE structures. As a result C++ exception handling
-doesn't work correctly on xtensa-uclinux. Don't use PIC by default on
-xtensa-uclinux.
-
-gcc/
-2018-11-05  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* config/xtensa/uclinux.h (XTENSA_ALWAYS_PIC): Change to 0.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r265823
-
- gcc/config/xtensa/uclinux.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/xtensa/uclinux.h b/gcc/config/xtensa/uclinux.h
-index ba26187c8f7a..c7743df9d97c 100644
---- a/gcc/config/xtensa/uclinux.h
-+++ b/gcc/config/xtensa/uclinux.h
-@@ -59,8 +59,8 @@ along with GCC; see the file COPYING3.  If not see
- #undef LOCAL_LABEL_PREFIX
- #define LOCAL_LABEL_PREFIX	"."
- 
--/* Always enable "-fpic" for Xtensa Linux.  */
--#define XTENSA_ALWAYS_PIC 1
-+/* Don't enable "-fpic" for Xtensa uclinux.  */
-+#define XTENSA_ALWAYS_PIC 0
- 
- #undef TARGET_LIBC_HAS_FUNCTION
- #define TARGET_LIBC_HAS_FUNCTION no_c99_libc_has_function
--- 
-2.11.0
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 036a5b9790..8ec406a117 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -84,7 +84,7 @@ config BR2_GCC_VERSION
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "6.5.0"     if BR2_GCC_VERSION_6_X
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
-	default "8.2.0"     if BR2_GCC_VERSION_8_X
+	default "8.3.0"     if BR2_GCC_VERSION_8_X
 	default "arc-2018.09-release" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index abdcd9ac54..4f1e7f932f 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,8 +6,8 @@ sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe7
 sha512  ce046f9a50050fd54b870aab764f7db187fe7ea92eb4aaffb7c3689ca623755604e231f2af97ef795f41c406bb80c797dd69957cfdd51dfa2ba60813f72b7eac  gcc-6.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.4.0/sha512.sum
 sha512  8864d8e4b97c2e1a4f17422f6e68120172ebefeab97b1757734f7185ca68a6b9a89011c6833c03fa454c17b0ac35b15e1d284881e6971035948ac6100f3aa45e  gcc-7.4.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.2.0/sha512.sum
-sha512  64898a165f67e136d802a92e7633bf1b06c85266027e52127ea025bf5fc2291b5e858288aac0bdba246e6cdf7c6ec88bc8e0e7f3f6f1985f4297710cafde56ed  gcc-8.2.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.3.0/sha512.sum
+sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8dfe7e10be2276b4f62c357659ce2902f239f60a8648548231b4b5802  gcc-8.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  4d12c3ac27b9de9c533be3b8964cf23d21bf6933b5073183e1affe714b0ff33f9d6169e3b55a5c505d7dae33c9bb4f8b0d110461e3a124182d8c8d51b66b8e45  gcc-arc-2018.09-release.tar.gz
