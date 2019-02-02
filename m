From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Feb 2019 22:33:06 +0100
Subject: [Buildroot] [git commit] pcre2: bump to version 10.32
Message-ID: <20190202213355.253C1835D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3449c00d2b129d2509418ba9b89a234948e7985a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Update hash of license file:
  https://vcs.pcre.org/pcre2/code/trunk/LICENCE?r1=1001&r2=910

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre2/0001-fix-heapframe-alignment.patch | 49 ------------------------
 package/pcre2/pcre2.hash                         |  6 +--
 package/pcre2/pcre2.mk                           |  2 +-
 3 files changed, 4 insertions(+), 53 deletions(-)

diff --git a/package/pcre2/0001-fix-heapframe-alignment.patch b/package/pcre2/0001-fix-heapframe-alignment.patch
deleted file mode 100644
index a10e9e793f..0000000000
--- a/package/pcre2/0001-fix-heapframe-alignment.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-src/pcre2_intmodedep.h: fix alignment of fields in struct heapframe
-
-pcre2_intmodedep.h has a check to verify that the size of the struct
-heapframe is a multiple of 4 bytes. On most architectures this works
-fine, but not on m68k. Indeed, when building the 16-bit variant of
-pcre2, the heapframe structure contains:
-
- PCRE2_UCHAR occu[2];
- PCRE2_SPTR  eptr;
-
-Where PCRE2_UCHAR is a 16-bit data type, and PCRE2_SPTR is a
-pointer. The occu[] array starts at byte 0x32, so not aligned on a
-32-bit boundary. With 2 x 16-bit, the occur[] array ends at byte 0x36.
-
-Now, on most architectures, the alignment required for a pointer will
-make the eptr field start at 0x38 (on 32 bit architectures). However,
-on m68k, it is fine to have a pointer aligned only on a 16-bit
-boundary, and the eptr pointer will be at offset 0x36.
-
-This doesn't cause a problem per-se, but breaks the check that
-heapframe should be a multiple of 4 bytes.
-
-To fix this, we make sure eptr is aligned by introducing an unused
-field of 16 bits after the occu[] array (in the 16-bit variant) or
-after the occu[] array (in the 32-bit variant). These choices have
-been made to keep the structure layout unchanged.
-
-Fixes the following build failure on m68k:
-
-src/pcre2_intmodedep.h:818:14: error: size of array 'check_heapframe_size' is negative
- typedef char check_heapframe_size[
-              ^~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Upstream: https://bugs.exim.org/show_bug.cgi?id=2247
-
-Index: src/pcre2_intmodedep.h
-===================================================================
---- a/src/pcre2_intmodedep.h	(revision 923)
-+++ b/src/pcre2_intmodedep.h	(working copy)
-@@ -797,7 +797,9 @@
-   PCRE2_UCHAR occu[6];       /* Used for other case code units */
- #elif PCRE2_CODE_UNIT_WIDTH == 16
-   PCRE2_UCHAR occu[2];       /* Used for other case code units */
-+  uint8_t     unused[2];     /* Ensure 32 bit alignment */
- #else
-+  uint8_t     unused[2];     /* Ensure 32 bit alignment */
-   PCRE2_UCHAR occu[1];       /* Used for other case code units */
- #endif
diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 210e2e58c1..a3210b184a 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.31.tar.bz2.sig
-sha256 e07d538704aa65e477b6a392b32ff9fc5edf75ab9a40ddfc876186c4ff4d68ac  pcre2-10.31.tar.bz2
+# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.32.tar.bz2.sig
+sha256 f29e89cc5de813f45786580101aaee3984a65818631d4ddbda7b32f699b87c2e  pcre2-10.32.tar.bz2
 # Locally computed
-sha256 4806d1c067bffe106d97dac68744373a866bfdd65486c0532ed1b41595ec4b64  LICENCE
+sha256 c4a8b89cd38d6a7501d5b11a472fa15e71a051b66d6331c6cda364101389d6ee  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 49ece6b9dc..ee3cacb9aa 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.31
+PCRE2_VERSION = 10.32
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
