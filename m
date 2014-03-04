From: Noam Camus <noamc@ezchip.com>
Date: Tue, 4 Mar 2014 04:51:53 +0000
Subject: [Buildroot] [PATCH 1/1] [V3] toolchain: control vendor part in
	GNU_TARGET_NAME
In-Reply-To: <1393908571-30334-1-git-send-email-noamc@ezchip.com>
References: <1393908571-30334-1-git-send-email-noamc@ezchip.com>
Message-ID: <884EA965490E3C4D8E66AEF41E9802500939A1@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option allows to customize the "vendor" part of the
toolchain tuple, where the toolchain tuple has the form
<cpu>-<vendor>-<kernel>-<os>. Use this option in situations
where gcc might make different decisions based on the vendor
part of the tuple.

Signed-off-by: Noam Camus <noamc@ezchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in                     |   12 +++++++++++-
 toolchain/toolchain-buildroot/Config.in |   17 +++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 454f614..121fe74 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -20,8 +20,18 @@ endif
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))

+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_VENDOR),)
+VENDOR:=buildroot
+else
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_VENDOR),unknown)
+$(error The value 'unknown' is not allowed. It might be confused with native toolchain)
+else
+VENDOR:=$(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
+endif
+endif
+
 # Compute GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
+GNU_TARGET_NAME=$(ARCH)-$(VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)

 # Blackfin FLAT needs uclinux
 ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 07db50b..34f78ae 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -70,6 +70,23 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
        default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
        default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC

+config BR2_TOOLCHAIN_BUILDROOT_VENDOR
+       string "custom toolchain vendor name"
+       default "buildroot"
+       help
+
+         This option allows to customize the "vendor" part of the
+         toolchain tuple, where the toolchain tuple has the form
+         <cpu>-<vendor>-<kernel>-<os>. The default value, "buildroot",
+         is fine for most cases, except in very specific situations
+         where gcc might make different decisions based on the vendor
+         part of the tuple. The value "unknown" is not allowed, as the
+         cross-compiling toolchain might then be confused with the
+         native toolchain when the target and host architecture are
+         identical.
+
+         If you're not sure, just leave the default "buildroot" value.
+
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
--
1.7.1
