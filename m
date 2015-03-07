From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 14:40:00 +0100
Subject: [Buildroot] [PATCH 3/3] uclibc: add patch fixing non-threaded build
	on Xtensa for uClibc-ng 1.0.0
In-Reply-To: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1425735600-16762-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backported from upstream, will be part of the next release of
uClibc-ng.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-fix-non-thread-compile-for-xtensa.patch   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/uclibc/1.0.0/0002-fix-non-thread-compile-for-xtensa.patch

diff --git a/package/uclibc/1.0.0/0002-fix-non-thread-compile-for-xtensa.patch b/package/uclibc/1.0.0/0002-fix-non-thread-compile-for-xtensa.patch
new file mode 100644
index 0000000..33f876b
--- /dev/null
+++ b/package/uclibc/1.0.0/0002-fix-non-thread-compile-for-xtensa.patch
@@ -0,0 +1,49 @@
+From bc8a6a6d8075998f0d1563cf202dcc18c39974b3 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Thu, 5 Mar 2015 19:47:26 +0100
+Subject: [PATCH 2/2] fix non-thread compile for xtensa
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ ldso/ldso/xtensa/dl-tlsdesc.S | 4 ++++
+ ldso/ldso/xtensa/elfinterp.c  | 3 +++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/ldso/ldso/xtensa/dl-tlsdesc.S b/ldso/ldso/xtensa/dl-tlsdesc.S
+index a6ebc94..dee4258 100644
+--- a/ldso/ldso/xtensa/dl-tlsdesc.S
++++ b/ldso/ldso/xtensa/dl-tlsdesc.S
+@@ -18,6 +18,9 @@
+ 
+ #include <sysdep.h>
+ #include <tls.h>
++
++#if defined(USE_TLS) && USE_TLS
++
+ #include "tlsdesc.h"
+ 
+ 
+@@ -94,3 +97,4 @@ _dl_tlsdesc_dynamic:
+ 	.size	_dl_tlsdesc_dynamic, .-_dl_tlsdesc_dynamic
+ 
+ #endif /* SHARED */
++#endif /* USE_TLS */
+diff --git a/ldso/ldso/xtensa/elfinterp.c b/ldso/ldso/xtensa/elfinterp.c
+index 1397e95..66deb63 100644
+--- a/ldso/ldso/xtensa/elfinterp.c
++++ b/ldso/ldso/xtensa/elfinterp.c
+@@ -31,8 +31,11 @@
+  */
+ 
+ #include "ldso.h"
++
++#if defined(USE_TLS) && USE_TLS
+ #include "dl-tls.h"
+ #include "tlsdeschtab.h"
++#endif
+ 
+ unsigned long
+ _dl_linux_resolver (struct elf_resolve *tpnt, int reloc_entry)
+-- 
+2.1.0
+
-- 
2.1.0
