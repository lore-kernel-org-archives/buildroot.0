From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 14:49:40 +0100
Subject: [Buildroot] [git commit] package/gcc: 4.9.x: backport a fix for
	libcap-ng issue on nios2
Message-ID: <20160305134946.5DF1780AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d71397f0af02cee6fb6e09ee45116770cb20e87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch is part of gcc 5.3 release.

Fixes:
http://autobuild.buildroot.net/results/901/90186d1fe134b804c0101554296b1235dc0ccbb0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gcc/4.9.3/880-nios2_legitimize_address.patch   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/gcc/4.9.3/880-nios2_legitimize_address.patch b/package/gcc/4.9.3/880-nios2_legitimize_address.patch
new file mode 100644
index 0000000..4623f29
--- /dev/null
+++ b/package/gcc/4.9.3/880-nios2_legitimize_address.patch
@@ -0,0 +1,49 @@
+From b0ea54f3f995754881e0ea6651133aa7b58eeaa2 Mon Sep 17 00:00:00 2001
+From: cltang <cltang@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 22 Sep 2015 12:23:20 +0000
+Subject: [PATCH] nios2_legitimize_address 2015-09-22  Chung-Lin Tang 
+ <cltang@codesourcery.com>
+
+	Backport from mainline
+	2015-09-22  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	* config/nios2/nios2.c (nios2_legitimize_address): When handling
+	'reg + reloc' cases, allow first operand to be non-REG, and use
+	force_reg() to enforce address pattern.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 228013 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Fixes:
+http://autobuild.buildroot.net/results/901/90186d1fe134b804c0101554296b1235dc0ccbb0
+
+[backported to 4.9.3]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/nios2/nios2.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/nios2/nios2.c b/gcc/config/nios2/nios2.c
+index 047b615..41dd6f9 100644
+--- a/gcc/config/nios2/nios2.c
++++ b/gcc/config/nios2/nios2.c
+@@ -1786,15 +1786,15 @@ nios2_legitimize_address (rtx x, rtx oldx ATTRIBUTE_UNUSED,
+ 
+      Which will be output as '%tls_le(var+48)(r23)' in assembly.  */
+   if (GET_CODE (x) == PLUS
+-      && GET_CODE (XEXP (x, 0)) == REG
+       && GET_CODE (XEXP (x, 1)) == CONST)
+     {
+-      rtx unspec, offset, reg = XEXP (x, 0);
++      rtx unspec, offset;
+       split_const (XEXP (x, 1), &unspec, &offset);
+       if (GET_CODE (unspec) == UNSPEC
+ 	  && !nios2_large_offset_p (XINT (unspec, 1))
+ 	  && offset != const0_rtx)
+ 	{
++	  rtx reg = force_reg (Pmode, XEXP (x, 0));
+ 	  unspec = copy_rtx (unspec);
+ 	  XVECEXP (unspec, 0, 0)
+ 	    = plus_constant (Pmode, XVECEXP (unspec, 0, 0), INTVAL (offset));
+-- 
+2.5.0
+
