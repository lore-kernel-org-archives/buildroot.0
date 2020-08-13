From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 22:43:59 +0200
Subject: [Buildroot] [git commit] package/ghostscript: fix CVE-2020-15900
Message-ID: <20200813204656.9502E86062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13ddfcdce75d4da053f20b1aefa27e7303bcdbf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A memory corruption issue was found in Artifex Ghostscript 9.50 and
9.52. Use of a non-standard PostScript operator can allow overriding of
file access controls. The 'rsearch' calculation for the 'post' size
resulted in a size that was too large, and could underflow to max
uint32_t. This was fixed in commit
5d499272b95a6b890a1397e11d20937de000d31b.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...900-Memory-Corruption-in-Ghostscript-9-52.patch | 54 ++++++++++++++++++++++
 package/ghostscript/ghostscript.mk                 |  3 ++
 2 files changed, 57 insertions(+)

diff --git a/package/ghostscript/0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch b/package/ghostscript/0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch
new file mode 100644
index 0000000000..893b96c5be
--- /dev/null
+++ b/package/ghostscript/0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch
@@ -0,0 +1,54 @@
+From 5d499272b95a6b890a1397e11d20937de000d31b Mon Sep 17 00:00:00 2001
+From: Ray Johnston <ray.johnston@artifex.com>
+Date: Wed, 22 Jul 2020 09:57:54 -0700
+Subject: [PATCH] Bug 702582, CVE 2020-15900 Memory Corruption in Ghostscript
+ 9.52
+
+Fix the 'rsearch' calculation for the 'post' size to give the correct
+size.  Previous calculation would result in a size that was too large,
+and could underflow to max uint32_t. Also fix 'rsearch' to return the
+correct 'pre' string with empty string match.
+
+A future change may 'undefine' this undocumented, non-standard operator
+during initialization as we do with the many other non-standard internal
+PostScript operators and procedures.
+
+[Retrieved from:
+https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5d499272b95a6b890a1397e11d20937de000d31b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ psi/zstring.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/psi/zstring.c b/psi/zstring.c
+index 33662dafa..58e1af2b3 100644
+--- a/psi/zstring.c
++++ b/psi/zstring.c
+@@ -142,13 +142,18 @@ search_impl(i_ctx_t *i_ctx_p, bool forward)
+     return 0;
+ found:
+     op->tas.type_attrs = op1->tas.type_attrs;
+-    op->value.bytes = ptr;
+-    r_set_size(op, size);
++    op->value.bytes = ptr;				/* match */
++    op->tas.rsize = size;				/* match */
+     push(2);
+-    op[-1] = *op1;
+-    r_set_size(op - 1, ptr - op[-1].value.bytes);
+-    op1->value.bytes = ptr + size;
+-    r_set_size(op1, count + (!forward ? (size - 1) : 0));
++    op[-1] = *op1;					/* pre */
++    op[-3].value.bytes = ptr + size;			/* post */
++    if (forward) {
++        op[-1].tas.rsize = ptr - op[-1].value.bytes;	/* pre */
++        op[-3].tas.rsize = count;			/* post */
++    } else {
++        op[-1].tas.rsize = count;			/* pre */
++        op[-3].tas.rsize -= count + size;		/* post */
++    }
+     make_true(op);
+     return 0;
+ }
+-- 
+2.17.1
+
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 7d12195f17..5c2c14de0b 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -23,6 +23,9 @@ GHOSTSCRIPT_DEPENDENCIES = \
 	libpng \
 	tiff
 
+# 0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch
+GHOSTSCRIPT_IGNORE_CVES += CVE-2020-15900
+
 # Ghostscript includes (old) copies of several libraries, delete them.
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
