From: guoren at kernel.org <guoren@kernel.org>
Date: Wed,  8 May 2019 16:58:31 +0800
Subject: [Buildroot] [PATCH V2 5/9] package/gcc: Add C-SKY support
In-Reply-To: <1557305915-11247-1-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
Message-ID: <1557305915-11247-5-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Add gcc build for C-SKY Architecture.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/gcc/Config.in.host | 8 ++++++++
 package/gcc/gcc.hash       | 2 ++
 package/gcc/gcc.mk         | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8e22a4c..c123a84 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,6 +3,7 @@ comment "GCC Options"
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
+	default BR2_GCC_VERSION_CSKY if BR2_csky
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
 	default BR2_GCC_VERSION_7_X
 	help
@@ -14,6 +15,12 @@ config BR2_GCC_VERSION_ARC
 	depends on BR2_arc
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+config BR2_GCC_VERSION_CSKY
+	bool "gcc csky"
+	# Only supported architecture
+	depends on BR2_csky
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
 config BR2_GCC_VERSION_OR1K
 	bool "gcc or1k (5.x)"
 	# Only supported architecture
@@ -85,6 +92,7 @@ config BR2_GCC_VERSION
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
 	default "arc-2018.09-release" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
+	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4f1e7f9..780484d 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -13,3 +13,5 @@ sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8
 sha512  4d12c3ac27b9de9c533be3b8964cf23d21bf6933b5073183e1affe714b0ff33f9d6169e3b55a5c505d7dae33c9bb4f8b0d110461e3a124182d8c8d51b66b8e45  gcc-arc-2018.09-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/gcc)
+sha512  1c3564fd6573dce13451a73015e7d88fecbb214dc1df96607976255b1d8b9e60318405333f4f218eea8d07e3675a802b66eff6df3921d505c4036481512792c2  gcc-48152afb96c59733d5bc79e3399bb7b3d4b44266.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5901624..abc29c7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -16,6 +16,9 @@ GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else ifeq ($(BR2_or1k),y)
 GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
+else ifeq ($(BR2_csky),y)
+GCC_SITE = $(call github,c-sky,gcc,$(GCC_VERSION))
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 # From version 5.5.0, 6.4.0, 7.2.0 and 8.1.0 a bz2 release tarball is not
-- 
2.7.4
