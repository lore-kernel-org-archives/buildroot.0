From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 May 2014 17:56:35 +0200
Subject: [Buildroot] [PATCH] binutils: add patch to fix AArch64 glibc build
	issue
Message-ID: <1400169395-11964-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders are not able to build glibc on AArch64 since we moved
to the internal toolchain backend as the default for AArch64. The
reason is that the cross-ld segfaults while linking of the glibc
utilities. Unfortunately, the issue has so far been impossible to
reproduce outside of the autobuilder CI loop itself: even on the same
machine, in the same chroot, the issue does not appear.

Today, Will Newton helped me analyze a bit further the problem. In the
logs of the build machine, we have found that the following segfault
notification matched the dates of the autobuilder failures:

/var/log/syslog:May 15 10:39:20 sd-56966 kernel: [767023.832598] ld[6846]: segfault at 1b2c002 ip 00000000004caf80 sp 00007fffaa308df8 error 4 in ld[400000+1b9000]
/var/log/syslog.2.gz:May 13 07:58:24 sd-56966 kernel: [585094.434264] ld[17761]: segfault at 154b002 ip 00000000004caf80 sp 00007fff0d400168 error 4 in ld[400000+1b9000]
/var/log/syslog.3.gz:May 12 20:24:08 sd-56966 kernel: [543558.227915] ld[14841]: segfault at 2706002 ip 00000000004caf80 sp 00007fffc08d41c8 error 4 in ld[400000+1b9000]
/var/log/syslog.4.gz:May 11 19:51:59 sd-56966 kernel: [455484.523033] ld[50162]: segfault at 1f00002 ip 00000000004caf80 sp 00007fff14a02328 error 4 in ld[400000+1b9000]
/var/log/syslog.4.gz:May 12 05:13:37 sd-56966 kernel: [489085.120089] ld[32067]: segfault at 2430002 ip 00000000004caf80 sp 00007fffc448db48 error 4 in ld[400000+1b9000]
/var/log/syslog.6.gz:May  9 15:20:38 sd-56966 kernel: [266948.197141] ld[13483]: segfault at ff0002 ip 00000000004caf80 sp 00007fff7e4fe948 error 4 in ld[400000+1b9000]
/var/log/syslog.7.gz:May  8 16:45:08 sd-56966 kernel: [185853.688607] ld[1757]: segfault at 20b1002 ip 00000000004caf80 sp 00007fffd07d5ae8 error 4 in ld[400000+1b9000]

See
http://autobuild.buildroot.org/?reason=glibc-2.18-svnr23787&arch=aarch64
for the autobuilder results.

So, the segfault always happens while accessing an address 2 bytes
after the beginning of a page: it looks like a buffer overflow, which
gets triggered because the object is placed towards the end of the
previous page, and crosses over the next, unallocated page.

Moreover, we looked at the 0x4caf80 address in an AArch64 cross-ld
built by Buildroot, and it turns out that it is part of the
iterative_hash() function. This nicely correlates with the patch that
Will Newton had pointed in
http://lists.busybox.net/pipermail/buildroot/2014-May/095881.html as a
fix for invalid memory accesses reported by Valgrind in the AArch64
cross-ld, specifically around the same area of 'ld'.

Therefore, even though we have not been able to reproduce the issue
outside of the autobuilders, and cannot confirm that the patch is
fixing the issue, I propose to integrate this binutils patch into
Buildroot. It is anyway an upstream binutils patch, which fixes a real
problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ont-segv-on-initial-instructions-overflow.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/binutils/2.24/002-dont-segv-on-initial-instructions-overflow.patch

diff --git a/package/binutils/2.24/002-dont-segv-on-initial-instructions-overflow.patch b/package/binutils/2.24/002-dont-segv-on-initial-instructions-overflow.patch
new file mode 100644
index 0000000..7881646
--- /dev/null
+++ b/package/binutils/2.24/002-dont-segv-on-initial-instructions-overflow.patch
@@ -0,0 +1,66 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 20 Dec 2013 13:27:52 +0000 (+1030)
+Subject: Don't segv on cie.initial_instructions[] overflow.
+X-Git-Tag: gdb-7.7-release~148
+X-Git-Url: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff_plain;h=99d190fac4d2aab238cfc798dc5c28ab41456882
+
+Don't segv on cie.initial_instructions[] overflow.
+
+Don't attempt to merge CIEs with a larger number of insns than will
+fit in the buffer.
+
+	* elf-eh-frame.c (cie_eq): Return false when initial_insn_length
+	is too large.
+	(cie_compute_hash): Don't exceed bounds of initial_instructions.
+	(_bfd_elf_parse_eh_frame): Always set initial_insn_length, and
+	save as much of insns to initial_instructions[] as will fit.
+---
+
+diff --git a/bfd/elf-eh-frame.c b/bfd/elf-eh-frame.c
+index 832a991..4b6e8ea 100644
+--- a/bfd/elf-eh-frame.c
++++ b/bfd/elf-eh-frame.c
+@@ -235,6 +235,7 @@ cie_eq (const void *e1, const void *e2)
+       && c1->lsda_encoding == c2->lsda_encoding
+       && c1->fde_encoding == c2->fde_encoding
+       && c1->initial_insn_length == c2->initial_insn_length
++      && c1->initial_insn_length <= sizeof (c1->initial_instructions)
+       && memcmp (c1->initial_instructions,
+ 		 c2->initial_instructions,
+ 		 c1->initial_insn_length) == 0)
+@@ -254,6 +255,7 @@ static hashval_t
+ cie_compute_hash (struct cie *c)
+ {
+   hashval_t h = 0;
++  size_t len;
+   h = iterative_hash_object (c->length, h);
+   h = iterative_hash_object (c->version, h);
+   h = iterative_hash (c->augmentation, strlen (c->augmentation) + 1, h);
+@@ -267,7 +269,10 @@ cie_compute_hash (struct cie *c)
+   h = iterative_hash_object (c->lsda_encoding, h);
+   h = iterative_hash_object (c->fde_encoding, h);
+   h = iterative_hash_object (c->initial_insn_length, h);
+-  h = iterative_hash (c->initial_instructions, c->initial_insn_length, h);
++  len = c->initial_insn_length;
++  if (len > sizeof (c->initial_instructions))
++    len = sizeof (c->initial_instructions);
++  h = iterative_hash (c->initial_instructions, len, h);
+   c->hash = h;
+   return h;
+ }
+@@ -762,11 +767,10 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
+ 	    cie->fde_encoding = DW_EH_PE_absptr;
+ 
+ 	  initial_insn_length = end - buf;
+-	  if (initial_insn_length <= sizeof (cie->initial_instructions))
+-	    {
+-	      cie->initial_insn_length = initial_insn_length;
+-	      memcpy (cie->initial_instructions, buf, initial_insn_length);
+-	    }
++	  cie->initial_insn_length = initial_insn_length;
++	  memcpy (cie->initial_instructions, buf,
++		  initial_insn_length <= sizeof (cie->initial_instructions)
++		  ? initial_insn_length : sizeof (cie->initial_instructions));
+ 	  insns = buf;
+ 	  buf += initial_insn_length;
+ 	  ENSURE_NO_RELOCS (buf);
-- 
1.9.3
