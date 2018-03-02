From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Mar 2018 08:36:45 +0100
Subject: [Buildroot] [git commit] dash: fix build with musl
Message-ID: <20180302073757.42376807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9329935402042670058edaf807242351d91f39b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl libc requires the getopt.h header for the definition of 'optreset'.

Fixes:
http://autobuild.buildroot.net/results/c23/c233ade479d6124ed7b382f2aa9859fe509d7bca/
http://autobuild.buildroot.net/results/081/0813c13c2a978316e6fa9a3cdbd5512612f5c374/
http://autobuild.buildroot.net/results/182/18230384d8225fbd7fddabfcbd685eaa38e31b31/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-histedit-fix-build-with-musl-libc.patch   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/dash/0002-histedit-fix-build-with-musl-libc.patch b/package/dash/0002-histedit-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..a9e4c5aea1
--- /dev/null
+++ b/package/dash/0002-histedit-fix-build-with-musl-libc.patch
@@ -0,0 +1,35 @@
+From 2da5b72c704fed10f1b04b5432ac6b078d016fae Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 2 Mar 2018 08:25:36 +0200
+Subject: [PATCH] histedit: fix build with musl libc
+
+musl libc defines the optreset BSD extension only in getopt.h. This
+fixes the following build failure:
+
+histedit.c: In function 'histcmd':
+histedit.c:220:2: error: 'optreset' undeclared (first use in this function)
+  optreset = 1; optind = 1; /* initialize getopt */
+  ^~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://www.mail-archive.com/dash at vger.kernel.org/msg01389.html
+
+ src/histedit.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/histedit.c b/src/histedit.c
+index 94465d785cc9..f5c90aba873b 100644
+--- a/src/histedit.c
++++ b/src/histedit.c
+@@ -39,6 +39,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
++#include <getopt.h>
+ /*
+  * Editline and history functions (and glue).
+  */
+-- 
+2.16.1
+
