From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 12 Dec 2019 15:01:18 +0100
Subject: [Buildroot] [PATCH 2/2] package/libnss: remove patch
In-Reply-To: <20191212140118.90730-1-giulio.benetti@benettiengineering.com>
References: <20191212140118.90730-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191212140118.90730-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove uClibc fix patch since its change has been upstreamed despite the
comment contained in patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ... 0001-add-zlib-include-dir-variable.patch} |  0
 package/libnss/0001-fix-uclibc-build.patch    | 22 -------------------
 ...uild-failure-due-to-missing-posix-s.patch} |  0
 ...ix-PowerPc-build-sys-auxv.h-failure.patch} |  0
 ...nsinstall.c-build-failure-on-RHEL-7.patch} |  0
 5 files changed, 22 deletions(-)
 rename package/libnss/{0002-add-zlib-include-dir-variable.patch => 0001-add-zlib-include-dir-variable.patch} (100%)
 delete mode 100644 package/libnss/0001-fix-uclibc-build.patch
 rename package/libnss/{0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch => 0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch} (100%)
 rename package/libnss/{0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch => 0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch} (100%)
 rename package/libnss/{0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch => 0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch} (100%)

diff --git a/package/libnss/0002-add-zlib-include-dir-variable.patch b/package/libnss/0001-add-zlib-include-dir-variable.patch
similarity index 100%
rename from package/libnss/0002-add-zlib-include-dir-variable.patch
rename to package/libnss/0001-add-zlib-include-dir-variable.patch
diff --git a/package/libnss/0001-fix-uclibc-build.patch b/package/libnss/0001-fix-uclibc-build.patch
deleted file mode 100644
index a9e84c264b..0000000000
--- a/package/libnss/0001-fix-uclibc-build.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix build with uClibc-ng
-
-The elf.h header in uClibc-ng is missing the AT_HWCAP2 definition. Add it in
-the code.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: Not upstreamable; uClibc needs to update elf.h
-
-diff -Nuar nss-3.38.orig/nss/lib/freebl/blinit.c nss-3.38/nss/lib/freebl/blinit.c
---- nss-3.38.orig/nss/lib/freebl/blinit.c	2018-06-21 12:24:45.000000000 +0300
-+++ nss-3.38/nss/lib/freebl/blinit.c	2018-06-26 13:13:55.636434720 +0300
-@@ -100,6 +100,9 @@
-     defined(__GNUC__) && __GNUC__ >= 2 && defined(__ELF__)
- #include <sys/auxv.h>
- extern unsigned long getauxval(unsigned long type) __attribute__((weak));
-+#ifndef AT_HWCAP2
-+#define AT_HWCAP2	26
-+#endif
- #else
- static unsigned long (*getauxval)(unsigned long) = NULL;
- #define AT_HWCAP2 0
diff --git a/package/libnss/0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch b/package/libnss/0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
similarity index 100%
rename from package/libnss/0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
rename to package/libnss/0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
diff --git a/package/libnss/0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch b/package/libnss/0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
similarity index 100%
rename from package/libnss/0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
rename to package/libnss/0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
diff --git a/package/libnss/0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch b/package/libnss/0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
similarity index 100%
rename from package/libnss/0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
rename to package/libnss/0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
-- 
2.20.1
