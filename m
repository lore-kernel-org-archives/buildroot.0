From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 21:07:03 +0200
Subject: [Buildroot] [git commit] libnss: fix build with uClibc
Message-ID: <20180626190430.AA6ED811AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a9f539d97850ef1a53a3c64a31c24330a2bcd8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch defining AT_HWCAP2 locally since uClibc is missing this
macro. Once uClibc updates its elf.h copy we can remove this patch.

Fixes:

  http://autobuild.buildroot.net/results/06f/06f5ee4bc9e623fa08d77278acdcb447148ae997/
  http://autobuild.buildroot.net/results/7cd/7cd7586f5854f9447c37adeedb9c113ba37ebea4/
  http://autobuild.buildroot.net/results/335/335bee755fbec45a6d5336c2501dc2687859ec0e/

Cc: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnss/0001-fix-uclibc-build.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/libnss/0001-fix-uclibc-build.patch b/package/libnss/0001-fix-uclibc-build.patch
new file mode 100644
index 0000000000..a9e84c264b
--- /dev/null
+++ b/package/libnss/0001-fix-uclibc-build.patch
@@ -0,0 +1,22 @@
+Fix build with uClibc-ng
+
+The elf.h header in uClibc-ng is missing the AT_HWCAP2 definition. Add it in
+the code.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: Not upstreamable; uClibc needs to update elf.h
+
+diff -Nuar nss-3.38.orig/nss/lib/freebl/blinit.c nss-3.38/nss/lib/freebl/blinit.c
+--- nss-3.38.orig/nss/lib/freebl/blinit.c	2018-06-21 12:24:45.000000000 +0300
++++ nss-3.38/nss/lib/freebl/blinit.c	2018-06-26 13:13:55.636434720 +0300
+@@ -100,6 +100,9 @@
+     defined(__GNUC__) && __GNUC__ >= 2 && defined(__ELF__)
+ #include <sys/auxv.h>
+ extern unsigned long getauxval(unsigned long type) __attribute__((weak));
++#ifndef AT_HWCAP2
++#define AT_HWCAP2	26
++#endif
+ #else
+ static unsigned long (*getauxval)(unsigned long) = NULL;
+ #define AT_HWCAP2 0
