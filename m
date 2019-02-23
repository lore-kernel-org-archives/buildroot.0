From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 09:44:36 +0100
Subject: [Buildroot] [git commit] package/stress-ng: Fix build issue with
 libbsd wchar check
Message-ID: <20190223084528.B01848B6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a358818e9835623835508859b4b080a704f713d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

stress-ng uses test/test-bsd-wchar.c program to check if there is
support for libbsd's wchar, but the test fails because wchar.h also
requires the FILE* definition from stdio.h which is not included
automatically, so fix it by include stdio.h explicitly.

Fixes:
	http://autobuild.buildroot.net/results/6def1bba8e7ec05682e74c4edc3a35c8c118d28b

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...test-bsd-wchar-Explicitly-include-stdio.h.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch b/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch
new file mode 100644
index 0000000000..79d381bc65
--- /dev/null
+++ b/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch
@@ -0,0 +1,29 @@
+From 291070801245da26e4841c321910b55016ca23c0 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim.kochan@petcube.com>
+Date: Tue, 1 Jan 2019 17:24:54 +0200
+Subject: [PATCH] test/test-bsd-wchar: Explicitly include stdio.h
+
+libbsd's wchar requires FILE for some it's functions, for some
+reason it is not included by wchar automatically and the test fails. So
+include it explicitly.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ test/test-bsd-wchar.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/test/test-bsd-wchar.c b/test/test-bsd-wchar.c
+index 4f7c7ca..6125968 100644
+--- a/test/test-bsd-wchar.c
++++ b/test/test-bsd-wchar.c
+@@ -22,6 +22,7 @@
+  * functionality.
+  *
+  */
++#include <stdio.h>
+ #include <bsd/wchar.h>
+ 
+ int main(void)
+-- 
+2.14.1
+
