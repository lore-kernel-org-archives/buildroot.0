From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:26:22 +0100
Subject: [Buildroot] [git commit] toolchain: add option for toolchains
	affected by GCC PR libstdc++/64735
Message-ID: <20170209202747.5560B81848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=accba02a47942b54c01b506512ddccf34d57c357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

exception_ptr, nested_exception, and future from libstdc++ are not
available for architectures not supporting always lock-free atomic ints
before GCC 7.

Bug report:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735

Fix available starting from GCC 7 (not yet released):
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=244051

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas:
 - directly define the value where BR2_TOOLCHAIN_HAS_GCC_BUG_64735
   rather than having additional patches touching affected architectures
   Config.in files
 - add a better comment above the Config.in option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 7a217b6..c64f204 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -7,6 +7,18 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735
+# exception_ptr, nested_exception, and future from libstdc++ are not
+# available for architectures not supporting always lock-free atomic
+# ints before GCC 7
+config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	bool
+	default y
+	depends on !BR2_nios2
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on !BR2_ARM_CPU_ARMV5
+	depends on !BR2_sparc_v8
+
 # https://sourceware.org/bugzilla/show_bug.cgi?id=19405
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
 	bool
