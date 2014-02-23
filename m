From: Noam Camus <noamc@ezchip.com>
Date: Sun, 23 Feb 2014 08:28:21 +0000
Subject: [Buildroot] [PATCH] toolchain: control GNU_TARGET_NAME vendor part
Message-ID: <884EA965490E3C4D8E66AEF41E98025006BF23@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the toolchain is custom we can denote that by setting in the triplet the vendor part.
This is done through configution, where the default is buildroot.

Signed-off-by: Noam Camus <noamc@ezchip.com>
---
 package/Makefile.in                     |    4 +++-
 toolchain/toolchain-buildroot/Config.in |    4 ++++
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in index eea7043..38d8416 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -20,8 +20,10 @@ endif
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
 
+VENDOR:=$(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
+
 # Compute GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
+GNU_TARGET_NAME=$(ARCH)-$(VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # Blackfin FLAT needs uclinux
 ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cd88889..d1760dd 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -69,6 +69,10 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
+config BR2_TOOLCHAIN_BUILDROOT_VENDOR
+	string "custom buildroot toolchain vendor name"
+	default "buildroot"
+
 source "package/uclibc/Config.in"
 
 source "package/binutils/Config.in.host"
--
1.7.1
