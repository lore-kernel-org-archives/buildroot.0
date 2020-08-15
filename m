From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 23:30:08 +0200
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: fix patch to address
 musl builds
Message-ID: <20200815212348.6202D840F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19bd08900448aa45b506320ad2ab912f789e6e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, __WORDSIZE was being used to define RADIX_BITS.

__WORDSIZE is not defined consistently via limits.h across all libc
variants, so use LONG_BIT instead.

Fixes:

  http://autobuild.buildroot.net/results/b5cb347a98dc64f77982633c0fc48d14030aa5b6/

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...RADIX_BITS.patch => 0001-Use-LONG_BIT-to-define-RADIX_BITS.patch} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ibm-sw-tpm2/0001-Use-__WORDSIZE-to-define-RADIX_BITS.patch b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
similarity index 91%
rename from package/ibm-sw-tpm2/0001-Use-__WORDSIZE-to-define-RADIX_BITS.patch
rename to package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
index a19160f68c..3a7e02ba7a 100644
--- a/package/ibm-sw-tpm2/0001-Use-__WORDSIZE-to-define-RADIX_BITS.patch
+++ b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
@@ -1,12 +1,13 @@
 From 24a352fc99ebde22235b05b18615817ef7f4263c Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 26 Apr 2020 15:33:39 +0200
-Subject: [PATCH] Use __WORDSIZE to define RADIX_BITS
+Subject: [PATCH] Use LONG_BIT to define RADIX_BITS
 
 This allows to avoid having to support each CPU architecture
 individually.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
  src/LibSupport.h | 17 +++--------------
  1 file changed, 3 insertions(+), 14 deletions(-)
@@ -35,7 +36,7 @@ index b2e6a51..f064d20 100644
 -#endif // RADIX_BITS
 +#include <limits.h>
 +
-+#define RADIX_BITS __WORDSIZE
++#define RADIX_BITS LONG_BIT
  
  // These macros use the selected libraries to the proper include files.
  #define LIB_QUOTE(_STRING_) #_STRING_
