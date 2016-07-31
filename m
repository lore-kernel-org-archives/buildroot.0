From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 10:26:20 +0200
Subject: [Buildroot] [PATCH] binutils: fix bfin problem
Message-ID: <20160731082620.GA28355@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix for LINKER BUG: .rofixup section size mismatch problems.

Bug was already reported by Stuart Henderson to binutils upstream:
https://sourceware.org/bugzilla/show_bug.cgi?id=13391

Fixes:
http://autobuild.buildroot.net/results/d5999ae91a1f4dee3d01a0bbc3d8a4c5939ad175/
http://autobuild.buildroot.net/results/17232204249aeb04150ac43a2424aa26a6b6c807/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/2.26.1/0905-bfin-rofixup-bug.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/binutils/2.26.1/0905-bfin-rofixup-bug.patch

diff --git a/package/binutils/2.26.1/0905-bfin-rofixup-bug.patch b/package/binutils/2.26.1/0905-bfin-rofixup-bug.patch
new file mode 100644
index 0000000..da9d586
--- /dev/null
+++ b/package/binutils/2.26.1/0905-bfin-rofixup-bug.patch
@@ -0,0 +1,21 @@
+Fixes: LINKER BUG: .rofixup section size mismatch
+
+Workaround from adi-toolchain commit:
+af414ec1fb628ddb1562f062f3db49823ca14ca2
+[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur binutils-2.26.1.orig/bfd/elf32-bfin.c binutils-2.26.1/bfd/elf32-bfin.c
+--- binutils-2.26.1.orig/bfd/elf32-bfin.c	2015-11-13 09:27:40.000000000 +0100
++++ binutils-2.26.1/bfd/elf32-bfin.c	2016-07-31 00:50:48.357995132 +0200
+@@ -4879,7 +4879,8 @@
+ 
+ 	case R_BFIN_FUNCDESC:
+ 	  picrel->fd++;
+-	  picrel->relocsfd++;
++	  if (bfd_get_section_flags (abfd, sec) & SEC_ALLOC)
++	    picrel->relocsfd++;
+ 	  break;
+ 
+         /* This relocation describes the C++ object vtable hierarchy.
-- 
2.1.4
