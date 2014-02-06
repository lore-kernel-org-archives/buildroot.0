From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Thu,  6 Feb 2014 22:55:22 +0100
Subject: [Buildroot] [PATCH 1/1] mmc-utils: fix linux headers issue before
	3-4
Message-ID: <1391723722-7567-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With toolchains that include linux kernel headers before the 3.4 kernel,
an issue exists with linux/mmc/ioctl.h in that it doesn't include
linux/types.h.

Merged the patch with an existing patch for mmc-utils as it modifies
the same file and fixes similar issues. Also updated the patch to
conform to the buildroot patch naming standard.

Fixes:
  http://autobuild.buildroot.net/results/828/828c7a686736710c4fcb152230d0fa6b5f4d6ad3

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 ...ion.patch => mmc-utils-001-fix-mmc-h-includes.patch} | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename package/mmc-utils/{0001-mmc-utils-Fix-64-bit-values-redefinition.patch => mmc-utils-001-fix-mmc-h-includes.patch} (79%)

diff --git a/package/mmc-utils/0001-mmc-utils-Fix-64-bit-values-redefinition.patch b/package/mmc-utils/mmc-utils-001-fix-mmc-h-includes.patch
similarity index 79%
rename from package/mmc-utils/0001-mmc-utils-Fix-64-bit-values-redefinition.patch
rename to package/mmc-utils/mmc-utils-001-fix-mmc-h-includes.patch
index 07dc742..8d0b2eb 100644
--- a/package/mmc-utils/0001-mmc-utils-Fix-64-bit-values-redefinition.patch
+++ b/package/mmc-utils/mmc-utils-001-fix-mmc-h-includes.patch
@@ -1,4 +1,4 @@
-mmc-utils: Fix 64-bit values redefinition
+mmc-utils: fix mmc.h includes
 
 Some toolchains include asm-generic/int-l64.h from their asm/types.h
 file for certain 64-bit architectures. This causes a conflict between
@@ -13,28 +13,29 @@ asm-generic/int-ll64.h:29:44: note: previous declaration of '__s64' was
 here
  __extension__ typedef __signed__ long long __s64;
 
+[Ryan: added include of linux/types.h because mmc/ioctl.h does not
+       include it in kernel version before 3.4]
+
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 ---
  mmc.h |    4 +++-
  1 files changed, 3 insertions(+), 1 deletions(-)
-
 diff --git a/mmc.h b/mmc.h
 index 9871d62..2d54ec5 100644
 --- a/mmc.h
 +++ b/mmc.h
-@@ -14,9 +14,11 @@
+@@ -14,9 +14,12 @@
   * Boston, MA 021110-1307, USA.
   */
- 
+
 -#include <asm-generic/int-ll64.h>
++#include <linux/types.h>
  #include <linux/mmc/ioctl.h>
  #include <stdio.h>
 +#ifndef _ASM_GENERIC_INT_L64_H
 +#include <asm-generic/int-ll64.h>
 +#endif
- 
+
  #define CHECK(expr, msg, err_stmt) { if (expr) { fprintf(stderr, msg); err_stmt; } }
- 
--- 
-1.7.1
 
-- 
1.8.3.2
