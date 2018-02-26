From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 23:43:01 +0100
Subject: [Buildroot] [PATCH] pcre2: add patch fixing a build issue on m68k
Message-ID: <20180226224301.5826-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A pretty nasty difference in alignment rules between most
architectures and m68k lead pcre2 to fail building its 16-bit and
32-bit variants on m68k. This commit adds a patch that fixes that.

Fixes:

  http://autobuild.buildroot.net/results/f6a45df5cb80e3fd94d57163bd28a0014a02bf4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre2/0001-fix-heapframe-alignment.patch | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/pcre2/0001-fix-heapframe-alignment.patch

diff --git a/package/pcre2/0001-fix-heapframe-alignment.patch b/package/pcre2/0001-fix-heapframe-alignment.patch
new file mode 100644
index 0000000000..3a9bd8ec47
--- /dev/null
+++ b/package/pcre2/0001-fix-heapframe-alignment.patch
@@ -0,0 +1,47 @@
+src/pcre2_intmodedep.h: fix alignment of fields in struct heapframe
+
+pcre2_intmodedep.h has a check to verify that the size of the struct
+heapframe is a multiple of 4 bytes. On most architectures this works
+fine, but not on m68k. Indeed, when building the 16-bit variant of
+pcre2, the heapframe structure contains:
+
+ PCRE2_UCHAR occu[2];
+ PCRE2_SPTR  eptr;
+
+Where PCRE2_UCHAR is a 16-bit data type, and PCRE2_SPTR is a
+pointer. The occu[] array starts at byte 0x32, so not aligned on a
+32-bit boundary. With 2 x 16-bit, the occur[] array ends at byte 0x36.
+
+Now, on most architectures, the alignment required for a pointer will
+make the eptr field start at 0x38 (on 32 bit architectures). However,
+on m68k, it is fine to have a pointer aligned only on a 16-bit
+boundary, and the eptr pointer will be at offset 0x36.
+
+This doesn't cause a problem per-se, but breaks the check that
+heapframe should be a multiple of 4 bytes.
+
+To fix this, we make sure eptr is aligned by introducing an unused
+field of 16 bits before the occu[] array
+
+Fixes the following build failure on m68k:
+
+src/pcre2_intmodedep.h:818:14: error: size of array 'check_heapframe_size' is negative
+ typedef char check_heapframe_size[
+              ^~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream: https://bugs.exim.org/show_bug.cgi?id=2247
+
+Index: src/pcre2_intmodedep.h
+===================================================================
+--- a/src/pcre2_intmodedep.h	(revision 923)
++++ b/src/pcre2_intmodedep.h	(working copy)
+@@ -797,8 +797,10 @@
+   PCRE2_UCHAR occu[6];       /* Used for other case code units */
+ #elif PCRE2_CODE_UNIT_WIDTH == 16
+   PCRE2_UCHAR occu[2];       /* Used for other case code units */
++  uint8_t     unused[2];     /* Ensure 32 bit alignment */
+ #else
+   PCRE2_UCHAR occu[1];       /* Used for other case code units */
++  uint8_t     unused[2];     /* Ensure 32 bit alignment */
+ #endif
-- 
2.14.3
