From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:19:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to latest git commit
Message-ID: <20210303091904.467706-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to latest git commit to retrieve the following commits:
- https://github.com/rsmarples/dhcpcd/commit/e3a40586dbb584774d0a17bc277e69cb500cfa38
- https://github.com/rsmarples/dhcpcd/commit/f3f7332001d5d5722239f6b7279f32923e4eedd0
- https://github.com/rsmarples/dhcpcd/commit/d670866ce008c21cbf6d5b20c4d4af6460ec35d2
- https://github.com/rsmarples/dhcpcd/commit/19c3d9209a834e02918a17e011afd9da3e5be38d
- https://github.com/rsmarples/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266
- https://github.com/rsmarples/dhcpcd/commit/dcfd7a23f002793a855156255e81662ef84064d3
- https://github.com/rsmarples/dhcpcd/commit/166491c2953546a677073694036f43a65fc25063

This will fix builds with arc, microblaze, nios2, or1k, sh, sparc and
xtensa

Update hash of LICENSE (update in year:
https://github.com/rsmarples/dhcpcd/commit/f3d2ff551bb9b2919094ba6526dcebe217824f5c)

Fixes:
 - http://autobuild.buildroot.org/results/9ed863b3ba5e6e0587a48e619395e5bdb7e9c557
 - http://autobuild.buildroot.org/results/affd2f094084c4f53a324830539d07050b83587e
 - http://autobuild.buildroot.org/results/67f39606054930d307ddd0eb7743f06316d41544

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rivsep-linux.c-add-support-for-nds32.patch | 40 -------------------
 package/dhcpcd/dhcpcd.hash                    |  5 +--
 package/dhcpcd/dhcpcd.mk                      | 24 ++++++++---
 3 files changed, 21 insertions(+), 48 deletions(-)
 delete mode 100644 package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch

diff --git a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch b/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
deleted file mode 100644
index 89dd3c7637..0000000000
--- a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From bc59536c202ba134422a42fe4dfdfe0643806c8f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 29 Jan 2021 22:21:00 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for nds32
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rsmarples/dhcpcd/pull/21]
----
- src/privsep-linux.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 2226659b..e81689bb 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -182,6 +182,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  else
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MIPS
- #  endif
-+#elif defined(__nds32__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
- #elif defined(__powerpc64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
- #elif defined(__powerpc__)
--- 
-2.29.2
-
diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 413f5c842b..098a2fb198 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,3 @@
-# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-9.4.0.tar.xz.distinfo
-sha256  41a69297f380bf15ee8f94f73154f8c2bca7157a087c0d5aca8de000ba1d4513  dhcpcd-9.4.0.tar.xz
 # Locally calculated
-sha256  9cce1077bad23544349788ec750ec6e5aee106fc437fd6b5d73c0d8510426578  LICENSE
+sha256  9e05998e88c4930be17b7e180c8716be590ab5c80f9469da75209fa6352e676b  dhcpcd-f322b5a1ae427c3f8be08448564ee5b1b5ef6683.tar.gz
+sha256  4f21ce186859516dcab9b3197f3e9533a9bd1b87932015c87f539af4a48cd592  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index cb269f1138..8aa7243061 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 9.4.0
-DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
-DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
+DHCPCD_VERSION = f322b5a1ae427c3f8be08448564ee5b1b5ef6683
+DHCPCD_SITE = $(call github,rsmarples,dhcpcd,$(DHCPCD_VERSION))
 DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2-Clause
 DHCPCD_LICENSE_FILES = LICENSE
@@ -16,8 +15,23 @@ DHCPCD_CONFIG_OPTS = \
 	--os=linux \
 	--privsepuser=dhcpcd
 
-# AUDIT_ARCH_NDS32 is only available since kernel >= 5.2
-ifeq ($(BR2_nds32):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2),y:)
+# AUDIT_ARCH_{OPENRISC,SH,SHEL,SH64,SHEL64} are only available with kernel >= 3.7
+ifeq ($(BR2_or1k)$(BR2_sh):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7),y:)
+DHCPCD_CONFIG_OPTS += --disable-privsep
+endif
+
+# AUDIT_ARCH_MICROBLAZE is only available with kernel >= 3.18
+ifeq ($(BR2_microblazeel)$(BR2_microblazebe):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18),y:)
+DHCPCD_CONFIG_OPTS += --disable-privsep
+endif
+
+# AUDIT_ARCH_XTENSA is only available with kernel >= 5.0
+ifeq ($(BR2_xtensa):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0),y:)
+DHCPCD_CONFIG_OPTS += --disable-privsep
+endif
+
+# AUDIT_ARCH_{ARCOMPACT,ARCV2,NDS32,NIOS2} are only available with kernel >= 5.2
+ifeq ($(BR2_arceb)$(BR2_arcle)$(BR2_nds32)$(BR2_nios2):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2),y:)
 DHCPCD_CONFIG_OPTS += --disable-privsep
 endif
 
-- 
2.30.0
