From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:20:23 +0200
Subject: [Buildroot] [git commit] package/mtd: fix musl compile
Message-ID: <20150425083008.9411280E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9ae279e6a0232dc8af9856e229a57148bf222e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update rpmatch patch to commit 5923077649ca167991a24ca05bd285fdf6fa1a06 and
expand to musl. Rename it.

Add more patches to fix compile issues with musl.

Patches sent upstream:
1) "include/common.h: fix build against musl"
   http://patchwork.ozlabs.org/patch/464074/
2) "lib/libfec.c: fix build against musl"
   http://patchwork.ozlabs.org/patch/464073/
3) "serve_image: do not include error.h"
   http://patchwork.ozlabs.org/patch/464416/
4) "recv_image: do not include error.h"
   http://patchwork.ozlabs.org/patch/464417/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-Fix-rpmatch-call-under-uClibc-and-musl.patch} |   51 +++++++++++++-------
 .../0002-lib-libfec.c-fix-build-against-musl.patch |   29 +++++++++++
 .../0003-serve_image-do-not-include-error.h.patch  |   30 ++++++++++++
 .../0004-recv_image-do-not-include-error.h.patch   |   30 ++++++++++++
 4 files changed, 123 insertions(+), 17 deletions(-)

diff --git a/package/mtd/0001-Fix-rpmatch-call-under-uClibc.patch b/package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
similarity index 50%
rename from package/mtd/0001-Fix-rpmatch-call-under-uClibc.patch
rename to package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
index 910a501..fa2e709 100644
--- a/package/mtd/0001-Fix-rpmatch-call-under-uClibc.patch
+++ b/package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
@@ -1,12 +1,16 @@
-From aebb2831c13ffc6f1df79e638b99e78c52aed4ce Mon Sep 17 00:00:00 2001
-Message-Id: <aebb2831c13ffc6f1df79e638b99e78c52aed4ce.1397593673.git.baruch@tkos.co.il>
+From b56296212c27071f06d98cdad6b32b7db583adb0 Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Sun, 13 Apr 2014 15:26:46 +0300
-Subject: [PATCH] Fix rpmatch() call under uClibc
+Subject: [PATCH 1/1] Fix rpmatch() call under uClibc and musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
-Combine the following two patches. The first is upstream (commit 50c9e11f7e),
-the second has been posted upstream at
-http://patchwork.ozlabs.org/patch/339365/.
+The current uClibc 0.9.33 and the musl C library do not implement rpmatch().
+
+Combine two upstream uClibc patches (commit 50c9e11f7e and
+5923077649) and a musl patch sent to the mailing list
+(http://patchwork.ozlabs.org/patch/464074/).
 
 include/common.h: fix build against current uClibc
 
@@ -25,25 +29,39 @@ So the uClibc version check introduced in commit 50c9e11f7e (include/common.h:
 fix build against current uClibc) is not enough. Rename the local rpmatch()
 implementation to avoid collision.
 
-Cc: Mike Frysinger <vapier@gentoo.org>
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Acked-by: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Brian Norris <computersforpeace@gmail.com>
+
+include/common.h: fix build against musl
+
+Like uClibc version older than (not yet released) 0.9.34 musl does not have
+a rpmatch() implementation.
+
+uClibc defines both __UCLIBC__ and __GLIBC__. So first check for uCibc and its
+version and then for a non glibc implementation (like musl). Note, musl does
+not define __MUSL__.
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
 ---
- include/common.h | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
+ include/common.h | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
 
 diff --git a/include/common.h b/include/common.h
-index 4ffccea17213..838dc757bdf1 100644
+index 4ffccea..944c712 100644
 --- a/include/common.h
 +++ b/include/common.h
-@@ -102,6 +102,20 @@ extern "C" {
+@@ -102,6 +102,21 @@ extern "C" {
  	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
  } while(0)
  
-+#if defined(__UCLIBC__)
-+/* uClibc versions before 0.9.34 don't have rpmatch() */
-+#if __UCLIBC_MAJOR__ == 0 && \
++/* uClibc versions before 0.9.34 and musl don't have rpmatch() */
++#if defined(__UCLIBC__) && \
++		(__UCLIBC_MAJOR__ == 0 && \
 +		(__UCLIBC_MINOR__ < 9 || \
-+		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))
++		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))) || \
++	!defined(__GLIBC__)
++#undef rpmatch
 +#define rpmatch __rpmatch
 +static inline int __rpmatch(const char *resp)
 +{
@@ -51,11 +69,10 @@ index 4ffccea17213..838dc757bdf1 100644
 +	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
 +}
 +#endif
-+#endif
 +
  /**
   * prompt the user for confirmation
   */
 -- 
-1.9.1
+2.3.6
 
diff --git a/package/mtd/0002-lib-libfec.c-fix-build-against-musl.patch b/package/mtd/0002-lib-libfec.c-fix-build-against-musl.patch
new file mode 100644
index 0000000..3b1da53
--- /dev/null
+++ b/package/mtd/0002-lib-libfec.c-fix-build-against-musl.patch
@@ -0,0 +1,29 @@
+From 7086438e488fa57c1add720590256f2c92602877 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 31 Mar 2015 00:31:34 +0200
+Subject: [PATCH 2/4] lib/libfec.c: fix build against musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add missing #include <sys/types.h> for u_long.
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ lib/libfec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/libfec.c b/lib/libfec.c
+index ff5a127..c5e7749 100644
+--- a/lib/libfec.c
++++ b/lib/libfec.c
+@@ -45,6 +45,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/types.h>
+
+ /*
+  * stuff used for testing purposes only
+--
+2.3.6
diff --git a/package/mtd/0003-serve_image-do-not-include-error.h.patch b/package/mtd/0003-serve_image-do-not-include-error.h.patch
new file mode 100644
index 0000000..1b5c8dc
--- /dev/null
+++ b/package/mtd/0003-serve_image-do-not-include-error.h.patch
@@ -0,0 +1,30 @@
+From 2734daedb65c9cc43c0d5247b580c599953102fe Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 24 Apr 2015 22:04:45 +0200
+Subject: [PATCH 3/4] serve_image: do not include error.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+serve_image does not use anything from it and it is not available with all
+C libraries.
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ serve_image.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/serve_image.c b/serve_image.c
+index 38549a1..4f0e946 100644
+--- a/serve_image.c
++++ b/serve_image.c
+@@ -3,7 +3,6 @@
+
+ #include <time.h>
+ #include <errno.h>
+-#include <error.h>
+ #include <netdb.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+--
+2.3.6
diff --git a/package/mtd/0004-recv_image-do-not-include-error.h.patch b/package/mtd/0004-recv_image-do-not-include-error.h.patch
new file mode 100644
index 0000000..5c58dce
--- /dev/null
+++ b/package/mtd/0004-recv_image-do-not-include-error.h.patch
@@ -0,0 +1,30 @@
+From c5837be1cc2422fc16b1fe030548e5a3ab951a54 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 24 Apr 2015 22:06:31 +0200
+Subject: [PATCH 4/4] recv_image: do not include error.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+recv_image does not use anything from it and it is not available with all
+C libraries.
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ recv_image.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/recv_image.c b/recv_image.c
+index 26a8361..0093831 100644
+--- a/recv_image.c
++++ b/recv_image.c
+@@ -4,7 +4,6 @@
+ #define _BSD_SOURCE	/* struct ip_mreq */
+
+ #include <errno.h>
+-#include <error.h>
+ #include <stdio.h>
+ #include <netdb.h>
+ #include <stdlib.h>
+--
+2.3.6
