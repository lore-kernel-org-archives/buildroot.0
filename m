From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 14 Nov 2018 21:36:33 +0100
Subject: [Buildroot] [PATCH v1] libv4l: bump version to 1.16.2
Message-ID: <20181114203633.14508-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- changes since 1.16.1
  0f68a3f6 configure: build without BPF support in ir-keytable
  5f8bd4e8 keytable: fix compilation warning
  f735bee7 keytable: fix BPF protocol compilation on mips
  c393c3bc Prepare for 1.16.2 release

- use new '--disable-bpf' option instead of ac_cv_prog_CLANG
  to disable BPF support, fixes [1]:

  bpf.c:48:4: error: #error __NR_bpf not defined. libbpf does not support your arch.

- remove upstream denied patch (see [2]) fixing part of the BPF support
  for older toolchains

[1] http://autobuild.buildroot.net/results/32b8f63e84616f91b645230e889eb1518972a398
[2] https://www.spinics.net/lists/linux-media/msg142729.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0005-Add-missing-linux-bpf_common.h.patch | 80 -------------------
 package/libv4l/libv4l.hash                    |  4 +-
 package/libv4l/libv4l.mk                      |  7 +-
 3 files changed, 6 insertions(+), 85 deletions(-)
 delete mode 100644 package/libv4l/0005-Add-missing-linux-bpf_common.h.patch

diff --git a/package/libv4l/0005-Add-missing-linux-bpf_common.h.patch b/package/libv4l/0005-Add-missing-linux-bpf_common.h.patch
deleted file mode 100644
index d43ea70027..0000000000
--- a/package/libv4l/0005-Add-missing-linux-bpf_common.h.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 311e344039d58cfde09dd34f14804db8ac0513c9 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 2 Nov 2018 18:58:53 +0100
-Subject: [PATCH] Add missing linux/bpf_common.h
-
-Copy from [1], needed by bpf.h.
-
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/include/uapi/linux/bpf_common.h?h=v4.19
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- include/linux/bpf_common.h | 57 ++++++++++++++++++++++++++++++++++++++
- 1 file changed, 57 insertions(+)
- create mode 100644 include/linux/bpf_common.h
-
-diff --git a/include/linux/bpf_common.h b/include/linux/bpf_common.h
-new file mode 100644
-index 00000000..ee97668b
---- /dev/null
-+++ b/include/linux/bpf_common.h
-@@ -0,0 +1,57 @@
-+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-+#ifndef _UAPI__LINUX_BPF_COMMON_H__
-+#define _UAPI__LINUX_BPF_COMMON_H__
-+
-+/* Instruction classes */
-+#define BPF_CLASS(code) ((code) & 0x07)
-+#define		BPF_LD		0x00
-+#define		BPF_LDX		0x01
-+#define		BPF_ST		0x02
-+#define		BPF_STX		0x03
-+#define		BPF_ALU		0x04
-+#define		BPF_JMP		0x05
-+#define		BPF_RET		0x06
-+#define		BPF_MISC        0x07
-+
-+/* ld/ldx fields */
-+#define BPF_SIZE(code)  ((code) & 0x18)
-+#define		BPF_W		0x00 /* 32-bit */
-+#define		BPF_H		0x08 /* 16-bit */
-+#define		BPF_B		0x10 /*  8-bit */
-+/* eBPF		BPF_DW		0x18    64-bit */
-+#define BPF_MODE(code)  ((code) & 0xe0)
-+#define		BPF_IMM		0x00
-+#define		BPF_ABS		0x20
-+#define		BPF_IND		0x40
-+#define		BPF_MEM		0x60
-+#define		BPF_LEN		0x80
-+#define		BPF_MSH		0xa0
-+
-+/* alu/jmp fields */
-+#define BPF_OP(code)    ((code) & 0xf0)
-+#define		BPF_ADD		0x00
-+#define		BPF_SUB		0x10
-+#define		BPF_MUL		0x20
-+#define		BPF_DIV		0x30
-+#define		BPF_OR		0x40
-+#define		BPF_AND		0x50
-+#define		BPF_LSH		0x60
-+#define		BPF_RSH		0x70
-+#define		BPF_NEG		0x80
-+#define		BPF_MOD		0x90
-+#define		BPF_XOR		0xa0
-+
-+#define		BPF_JA		0x00
-+#define		BPF_JEQ		0x10
-+#define		BPF_JGT		0x20
-+#define		BPF_JGE		0x30
-+#define		BPF_JSET        0x40
-+#define BPF_SRC(code)   ((code) & 0x08)
-+#define		BPF_K		0x00
-+#define		BPF_X		0x08
-+
-+#ifndef BPF_MAXINSNS
-+#define BPF_MAXINSNS 4096
-+#endif
-+
-+#endif /* _UAPI__LINUX_BPF_COMMON_H__ */
--- 
-2.19.1
-
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 5dd5e45003..2b01c1a713 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.1.tar.bz2.asc
-sha256 c7e4d6f4b4b7f278a6fa4bf56385526920d40fbd9e3e2827b75ddcd41da0504a  v4l-utils-1.16.1.tar.bz2
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.2.tar.bz2.asc
+sha256 6c3208c9a1c73455d30bae83096d161e57bec5008594f270a2a67df8c86d8e47  v4l-utils-1.16.2.tar.bz2
 # Locally calculated
 sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
 sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index f473c03806..6b5b7bd2ee 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.16.1
+LIBV4L_VERSION = 1.16.2
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
@@ -56,8 +56,9 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 
-# Disable clang that is used to build BPF (in-kernel bytecode machine) protocols
-LIBV4L_CONF_ENV += ac_cv_prog_CLANG=""
+# IR BPF decoder support needs toolchain with linux-headers >= 3.18
+# libelf and clang support
+LIBV4L_CONF_OPTS += --disable-bpf
 
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
 LIBV4L_CONF_OPTS += --enable-qv4l2
-- 
2.19.1
