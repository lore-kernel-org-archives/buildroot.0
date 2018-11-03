From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:27:50 +0100
Subject: [Buildroot] [git commit] package/libv4l: add missing bpf_common.h
 header
Message-ID: <20181103132542.E72C38824C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f10aa4252a9fc0332a2ffd6845a72adb3b1d9120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1] (for older toolchains not providing this header):

    CC       keytable.o
  In file included from bpf.h:26:0,
                   from keytable.c:37:
  ../../include/linux/bpf.h:12:10: fatal error: linux/bpf_common.h: No such file or directory
   #include <linux/bpf_common.h>
            ^~~~~~~~~~~~~~~~~~~~

[1] http://autobuild.buildroot.org/results/d22c0939eed4bc949f7eaeae7595d01ec45cc2cd

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0005-Add-missing-linux-bpf_common.h.patch      | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/libv4l/0005-Add-missing-linux-bpf_common.h.patch b/package/libv4l/0005-Add-missing-linux-bpf_common.h.patch
new file mode 100644
index 0000000000..d43ea70027
--- /dev/null
+++ b/package/libv4l/0005-Add-missing-linux-bpf_common.h.patch
@@ -0,0 +1,80 @@
+From 311e344039d58cfde09dd34f14804db8ac0513c9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 2 Nov 2018 18:58:53 +0100
+Subject: [PATCH] Add missing linux/bpf_common.h
+
+Copy from [1], needed by bpf.h.
+
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/include/uapi/linux/bpf_common.h?h=v4.19
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ include/linux/bpf_common.h | 57 ++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 57 insertions(+)
+ create mode 100644 include/linux/bpf_common.h
+
+diff --git a/include/linux/bpf_common.h b/include/linux/bpf_common.h
+new file mode 100644
+index 00000000..ee97668b
+--- /dev/null
++++ b/include/linux/bpf_common.h
+@@ -0,0 +1,57 @@
++/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
++#ifndef _UAPI__LINUX_BPF_COMMON_H__
++#define _UAPI__LINUX_BPF_COMMON_H__
++
++/* Instruction classes */
++#define BPF_CLASS(code) ((code) & 0x07)
++#define		BPF_LD		0x00
++#define		BPF_LDX		0x01
++#define		BPF_ST		0x02
++#define		BPF_STX		0x03
++#define		BPF_ALU		0x04
++#define		BPF_JMP		0x05
++#define		BPF_RET		0x06
++#define		BPF_MISC        0x07
++
++/* ld/ldx fields */
++#define BPF_SIZE(code)  ((code) & 0x18)
++#define		BPF_W		0x00 /* 32-bit */
++#define		BPF_H		0x08 /* 16-bit */
++#define		BPF_B		0x10 /*  8-bit */
++/* eBPF		BPF_DW		0x18    64-bit */
++#define BPF_MODE(code)  ((code) & 0xe0)
++#define		BPF_IMM		0x00
++#define		BPF_ABS		0x20
++#define		BPF_IND		0x40
++#define		BPF_MEM		0x60
++#define		BPF_LEN		0x80
++#define		BPF_MSH		0xa0
++
++/* alu/jmp fields */
++#define BPF_OP(code)    ((code) & 0xf0)
++#define		BPF_ADD		0x00
++#define		BPF_SUB		0x10
++#define		BPF_MUL		0x20
++#define		BPF_DIV		0x30
++#define		BPF_OR		0x40
++#define		BPF_AND		0x50
++#define		BPF_LSH		0x60
++#define		BPF_RSH		0x70
++#define		BPF_NEG		0x80
++#define		BPF_MOD		0x90
++#define		BPF_XOR		0xa0
++
++#define		BPF_JA		0x00
++#define		BPF_JEQ		0x10
++#define		BPF_JGT		0x20
++#define		BPF_JGE		0x30
++#define		BPF_JSET        0x40
++#define BPF_SRC(code)   ((code) & 0x08)
++#define		BPF_K		0x00
++#define		BPF_X		0x08
++
++#ifndef BPF_MAXINSNS
++#define BPF_MAXINSNS 4096
++#endif
++
++#endif /* _UAPI__LINUX_BPF_COMMON_H__ */
+-- 
+2.19.1
+
