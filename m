From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Jun 2021 11:40:12 +0200
Subject: [Buildroot] [PATCH 3/6] package/gcc: add support for gcc 11
In-Reply-To: <20210612094015.6792-1-romain.naour@gmail.com>
References: <20210612094015.6792-1-romain.naour@gmail.com>
Message-ID: <20210612094015.6792-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable sparc architecture for gcc 11 due to an recent gcc change
that broke uClibc-ng. The change was reverted by the patch
0005-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
for gcc 8.4, 9.3 and 10.1 but stop maintaining it for newer gcc
releases.

Rutime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/318043235

https://gcc.gnu.org/gcc-11/changes.html
https://gcc.gnu.org/gcc-11/porting_to.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 16 ++++++++++++++++
 package/gcc/gcc.hash       |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5b056a934a..a89d92bf61 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -50,6 +50,21 @@ config BR2_GCC_VERSION_10_X
 	depends on !BR2_csky
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
+config BR2_GCC_VERSION_11_X
+	bool "gcc 11.x"
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_powerpc_SPE
+	# C-SKY sk610 needs abiv1, which is not supported in
+	# upstream gcc. C-SKY gcc upstream support not tested
+	# with upstream binutils and glibc.
+	depends on !BR2_csky
+	# uClibc-ng broken on sparc due to recent gcc changes
+	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
+	depends on !BR2_sparc
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+
 endchoice
 
 # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
@@ -75,6 +90,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_8_X
 	default "9.3.0"     if BR2_GCC_VERSION_9_X
 	default "10.3.0"    if BR2_GCC_VERSION_10_X
+	default "11.1.0"    if BR2_GCC_VERSION_11_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 566ae09fc2..8a8a7b4581 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,6 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  4b9e3639eef6e623747a22c37a904b4750c93b6da77cf3958d5047e9b5ebddb7eebe091cc16ca0a227c0ecbd2bf3b984b221130f269a97ee4cc18f9cf6c444de  gcc-9.3.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
 sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-11.1.0/sha512.sum
+sha512  fd6bba0f67ff48069d03073d1a9b5e896383b1cfc9dde008e868e60a9ec5014a837d56af0ecbf467b3fb9b37ec74a676e819a18b44393a0a3c4280175b5d7ad8  gcc-11.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
-- 
2.31.1
