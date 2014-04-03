From: Paul Cercueil <paul@crapouillou.net>
Date: Thu,  3 Apr 2014 23:01:11 +0200
Subject: [Buildroot] [PATCH 01/11] toolchain: Make vendor configurable
Message-ID: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maarten ter Huurne <maarten@treewalker.org>

This is used in the GNU configuration name (machine triple/quadruple).

Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
Acked-By: Paul Cercueil <paul@crapouillou.net>
---
 Makefile                                |  1 +
 package/Makefile.in                     |  2 +-
 toolchain/toolchain-buildroot/Config.in | 11 +++++++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 41c51c6..09be13c 100644
--- a/Makefile
+++ b/Makefile
@@ -307,6 +307,7 @@ QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)
 
 # Strip off the annoying quoting
 ARCH:=$(call qstrip,$(BR2_ARCH))
+VENDOR:=$(call qstrip,$(BR2_VENDOR))
 
 KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
diff --git a/package/Makefile.in b/package/Makefile.in
index 454f614..d102009 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -21,7 +21,7 @@ MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
 
 # Compute GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
+GNU_TARGET_NAME=$(ARCH)-$(VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # Blackfin FLAT needs uclinux
 ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 07db50b..9d97487 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -70,6 +70,17 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
+config BR2_VENDOR
+	string "Toolchain vendor in GNU configuration name"
+	default "buildroot"
+	help
+	  The GNU build system identifies a machine using configuration name
+	  in the following format:
+	    <arch>-<vendor>-<kernel>-<os>
+	  This option lets you select the vendor part of that string.
+
+	  Usually it is best to stick with the default value of "buildroot".
+
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
-- 
1.9.0
