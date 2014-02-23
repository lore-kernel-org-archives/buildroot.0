From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 11:08:25 +0100
Subject: [Buildroot] [PATCH] pixman: fix patch for FE_DIVBYZERO detection
Message-ID: <1393150105-8421-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit a9baea4345625f6f00fc59395faec83e08346015 ('pixman: add patch
to fix Microblaze build failure'), a patch is added to the pixman
package to avoid using the FE_DIVBYZERO definition when it is not
available. However, it was using the have_fe_divbyzero variable to
define or not HAVE_FEDIVBYZERO, while the AC_CHECK_DECL autoconf macro
sets the ac_cv_have_decl_FE_DIVBYZERO variable.

The end result was that the FE_DIVBYZERO macro was considered as never
being available. This commit fixes that by using the appropriate
variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pixman/pixman-02-check-fe-divbyzero.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pixman/pixman-02-check-fe-divbyzero.patch b/package/pixman/pixman-02-check-fe-divbyzero.patch
index 44dd691..01c6c96 100644
--- a/package/pixman/pixman-02-check-fe-divbyzero.patch
+++ b/package/pixman/pixman-02-check-fe-divbyzero.patch
@@ -16,7 +16,7 @@ Index: b/configure.ac
  fi
  
 +AC_CHECK_DECL([FE_DIVBYZERO], [], [], [[#include <fenv.h>]])
-+if test x$have_fe_divbyzero = xyes; then
++if test x$ac_cv_have_decl_FE_DIVBYZERO = xyes; then
 +   AC_DEFINE(HAVE_FEDIVBYZERO, 1, [Whether we have FE_DIVBYZERO])
 +fi
 +
-- 
1.8.3.2
