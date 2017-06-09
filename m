From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Jun 2017 15:31:53 +0200
Subject: [Buildroot] [PATCH v3 4/6] gcc: add patch to support musl on SuperH
	in gcc 5.x
In-Reply-To: <1497015115-8740-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1497015115-8740-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1497015115-8740-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building a toolchain for SuperH/musl works, but the toolchain generate
bogus binaries, because the path to the program interpreter is not
known (and therefore is /dev/null).

This commit backports a patch from gcc 6.x to make SuperH support with
musl work properly.

The patch is not needed in gcc >= 6.x because the musl support is
upstream. The patch is not needed for gcc 4.9 because we had a
different musl support patch that had support for all architectures in
one patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - None
Changes since v1:
 - New patch in the series
---
 package/gcc/5.4.0/912-sh-musl-support.patch | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/gcc/5.4.0/912-sh-musl-support.patch

diff --git a/package/gcc/5.4.0/912-sh-musl-support.patch b/package/gcc/5.4.0/912-sh-musl-support.patch
new file mode 100644
index 0000000..6fdfacc
--- /dev/null
+++ b/package/gcc/5.4.0/912-sh-musl-support.patch
@@ -0,0 +1,50 @@
+From 6e9cad5fc3bdd0a1fa24ae172d4d4c1e3179a51c Mon Sep 17 00:00:00 2001
+From: nsz <nsz@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 20 Oct 2015 18:13:15 +0000
+Subject: [PATCH] musl support for sh
+
+	* config/sh/linux.h (MUSL_DYNAMIC_LINKER): Define.
+	(MUSL_DYNAMIC_LINKER_E, MUSL_DYNAMIC_LINKER_FP): Define.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 229095 138bc75d-0d04-0410-961f-82ee72b054a4
+[Thomas: backport from gcc 6.x]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gcc/config/sh/linux.h | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
+index 0f5d614..61cf777 100644
+--- a/gcc/config/sh/linux.h
++++ b/gcc/config/sh/linux.h
+@@ -43,6 +43,27 @@ along with GCC; see the file COPYING3.  If not see
+ 
+ #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
+ 
++#if TARGET_ENDIAN_DEFAULT == MASK_LITTLE_ENDIAN
++#define MUSL_DYNAMIC_LINKER_E "%{mb:eb}"
++#else
++#define MUSL_DYNAMIC_LINKER_E "%{!ml:eb}"
++#endif
++
++#if TARGET_CPU_DEFAULT & (MASK_HARD_SH2A_DOUBLE | MASK_SH4)
++/* "-nofpu" if any nofpu option is specified.  */
++#define MUSL_DYNAMIC_LINKER_FP \
++  "%{m1|m2|m2a-nofpu|m3|m4-nofpu|m4-100-nofpu|m4-200-nofpu|m4-300-nofpu|" \
++  "m4-340|m4-400|m4-500|m4al:-nofpu}"
++#else
++/* "-nofpu" if none of the hard fpu options are specified.  */
++#define MUSL_DYNAMIC_LINKER_FP "%{m2a|m4|m4-100|m4-200|m4-300|m4a:;:-nofpu}"
++#endif
++
++#undef MUSL_DYNAMIC_LINKER
++#define MUSL_DYNAMIC_LINKER \
++  "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
++  "%{mfdpic:-fdpic}.so.1"
++
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 
+ #undef SUBTARGET_LINK_EMUL_SUFFIX
+-- 
+2.7.4
+
-- 
2.7.4
