From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jun 2018 13:28:23 +0300
Subject: [Buildroot] [PATCH 2/2] libnss: fix build with uClibc
In-Reply-To: <d20e1c9116d8625fce1f4db9b44c4ab009fbba40.1530008903.git.baruch@tkos.co.il>
References: <d20e1c9116d8625fce1f4db9b44c4ab009fbba40.1530008903.git.baruch@tkos.co.il>
Message-ID: <27c7d62e7c8529f1f8af8f367ff9b16b9a852e02.1530008903.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch defining AT_HWCAP2 locally since uClibc is missing this
macro. Once uClibc updates its elf.h copy we can remove this patch.

Cc: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnss/0001-fix-uclibc-build.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/libnss/0001-fix-uclibc-build.patch

diff --git a/package/libnss/0001-fix-uclibc-build.patch b/package/libnss/0001-fix-uclibc-build.patch
new file mode 100644
index 000000000000..a9e84c264b04
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
-- 
2.18.0
