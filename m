From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:16:06 +0200
Subject: [Buildroot] [git commit] toolchain: control vendor part in
	GNU_TARGET_NAME
Message-ID: <20140406121640.E42C69C58D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65c2400ff251397db930e90c65c51d714d00fa96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option allows to customize the "vendor" part of the
toolchain tuple, where the toolchain tuple has the form
<arch>-<vendor>-<os>-<libc>. Use this option in situations
where gcc might make different decisions based on the vendor
part of the tuple.

[Thomas: move the config option in a slightly different place, so that
it does not appear between the C library selection and the C library
options.]

Signed-off-by: "Noam Camus" <noamc@ezchip.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in                     |   17 ++++++++++++++++-
 toolchain/toolchain-buildroot/Config.in |   17 +++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 1f5cbcd..0830cd5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -20,8 +20,23 @@ endif
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+TARGET_VENDOR = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
+else
+TARGET_VENDOR = buildroot
+endif
+
+# Sanity checks
+ifeq ($(TARGET_VENDOR),)
+$(error BR2_TOOLCHAIN_BUILDROOT_VENDOR is not allowed to be empty)
+endif
+ifeq ($(TARGET_VENDOR),unknown)
+$(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
+        It might be confused with the native toolchain)
+endif
+
 # Compute GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
+GNU_TARGET_NAME=$(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # Blackfin FLAT needs uclinux
 ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 07db50b..42166d2 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -1,6 +1,23 @@
 # Config entries for internal toolchain backend
 
 if BR2_TOOLCHAIN_BUILDROOT
+
+config BR2_TOOLCHAIN_BUILDROOT_VENDOR
+	string "custom toolchain vendor name"
+	default "buildroot"
+	help
+	  This option allows to customize the "vendor" part of the
+	  toolchain tuple, where the toolchain tuple has the form
+	  <arch>-<vendor>-<os>-<libc>. The default value, "buildroot",
+	  is fine for most cases, except in very specific situations
+	  where gcc might make different decisions based on the vendor
+	  part of the tuple. The value "unknown" is not allowed, as the
+	  cross-compiling toolchain might then be confused with the
+	  native toolchain when the target and host architecture are
+	  identical. The value can not be empty either.
+
+	  If you're not sure, just leave the default "buildroot" value.
+
 source "package/linux-headers/Config.in.host"
 
 choice
