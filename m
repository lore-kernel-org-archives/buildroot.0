From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:51:02 +0200
Subject: [Buildroot] [git commit branch/next] glibc: add patch to fix build
	on x86
Message-ID: <20170809225750.107C97FE41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=163b6a5b39ad5b11b8ffa1704bc60a4ed09ee6b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This fixes the following build issues:

In file included from ../sysdeps/x86_64/multiarch/varshift.c:19:0,
                 from ../sysdeps/i386/i686/multiarch/varshift.c:1:
../sysdeps/x86_64/multiarch/varshift.h: In function '__m128i_shift_right':
../sysdeps/x86_64/multiarch/varshift.h:26:1: error: SSE vector return without SSE enabled changes the ABI [-Werror=psabi]
 {

[...]

.../lib/gcc/i686-buildroot-linux-gnu/7.1.0/include/tmmintrin.h:136:1: error: inlining failed in call to always_inline '_mm_shuffle_epi8': target specific option mismatch

The patch has been taken from glibc's patchwork at
https://patchwork.sourceware.org/patch/21003/.

Fixes bug #10156.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...g-IS_IN-libc-guards-to-vectorized-strcspn.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch b/package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
new file mode 100644
index 0000000..eebf89e
--- /dev/null
+++ b/package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
@@ -0,0 +1,47 @@
+From patchwork Wed Jun 14 06:19:50 2017
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: i686: Add missing IS_IN (libc) guards to vectorized strcspn
+From: Florian Weimer <fweimer@redhat.com>
+X-Patchwork-Id: 21003
+Message-Id: <20170614061950.400FE4010728F@oldenburg.str.redhat.com>
+To: libc-alpha at sourceware.org
+Date: Wed, 14 Jun 2017 08:19:50 +0200
+
+Since commit d957c4d3fa48d685ff2726c605c988127ef99395 (i386: Compile
+rtld-*.os with -mno-sse -mno-mmx -mfpmath=387), vector intrinsics can
+no longer be used in ld.so, even if the compiled code never makes it
+into the final ld.so link.  This commit adds the missing IS_IN (libc)
+guard to the SSE 4.2 strcspn implementation, so that it can be used from
+ld.so in the future.
+
+2017-06-14  Florian Weimer  <fweimer@redhat.com>
+
+	* sysdeps/i386/i686/multiarch/strcspn-c.c: Add IS_IN (libc) guard.
+	* sysdeps/i386/i686/multiarch/varshift.c: Likewise.
+
+[Thomas: fixes a build issue of glibc on x86:
+sysdeps/x86_64/multiarch/varshift.h:26:1: error: SSE vector return without SSE enabled changes the ABI]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff --git a/sysdeps/i386/i686/multiarch/strcspn-c.c b/sysdeps/i386/i686/multiarch/strcspn-c.c
+index 6d61e19..ec230fb 100644
+--- a/sysdeps/i386/i686/multiarch/strcspn-c.c
++++ b/sysdeps/i386/i686/multiarch/strcspn-c.c
+@@ -1,2 +1,4 @@
+-#define __strcspn_sse2 __strcspn_ia32
+-#include <sysdeps/x86_64/multiarch/strcspn-c.c>
++#if IS_IN (libc)
++# define __strcspn_sse2 __strcspn_ia32
++# include <sysdeps/x86_64/multiarch/strcspn-c.c>
++#endif
+diff --git a/sysdeps/i386/i686/multiarch/varshift.c b/sysdeps/i386/i686/multiarch/varshift.c
+index 7760b96..6742a35 100644
+--- a/sysdeps/i386/i686/multiarch/varshift.c
++++ b/sysdeps/i386/i686/multiarch/varshift.c
+@@ -1 +1,3 @@
+-#include <sysdeps/x86_64/multiarch/varshift.c>
++#if IS_IN (libc)
++# include <sysdeps/x86_64/multiarch/varshift.c>
++#endif
