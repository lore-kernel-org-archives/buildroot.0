From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Jan 2017 13:02:04 -0300
Subject: [Buildroot] [PATCH] musl: security bump to version 1.1.16
Message-ID: <20170102160204.26561-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-8859 - fixes a serious under-allocation bug in regexec due to
integer overflow.

Drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...regression-in-tcsetattr-on-all-mips-archs.patch | 67 ----------------------
 package/musl/0002-avoid-kernel-if_ether.h.patch    | 30 ----------
 package/musl/musl.hash                             |  2 +-
 package/musl/musl.mk                               |  2 +-
 4 files changed, 2 insertions(+), 99 deletions(-)
 delete mode 100644 package/musl/0001-fix-regression-in-tcsetattr-on-all-mips-archs.patch
 delete mode 100644 package/musl/0002-avoid-kernel-if_ether.h.patch

diff --git a/package/musl/0001-fix-regression-in-tcsetattr-on-all-mips-archs.patch b/package/musl/0001-fix-regression-in-tcsetattr-on-all-mips-archs.patch
deleted file mode 100644
index 73ccae4..0000000
--- a/package/musl/0001-fix-regression-in-tcsetattr-on-all-mips-archs.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From cff5747c74c41b22f1ce1340978b1c226a8cdf32 Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Wed, 13 Jul 2016 15:04:30 -0400
-Subject: [PATCH] fix regression in tcsetattr on all mips archs
-
-revert commit 8c316e9e49d37ad92c2e7493e16166a2afca419f. it was wrong
-and does not match how the kernel API works.
-
-Signed-off-by: Rich Felker <dalias@aerifal.cx>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- arch/mips/bits/termios.h    | 6 +++---
- arch/mips64/bits/termios.h  | 6 +++---
- arch/mipsn32/bits/termios.h | 6 +++---
- 3 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/arch/mips/bits/termios.h b/arch/mips/bits/termios.h
-index f559f76..6a1205d 100644
---- a/arch/mips/bits/termios.h
-+++ b/arch/mips/bits/termios.h
-@@ -141,9 +141,9 @@ struct termios {
- #define TCOFLUSH  1
- #define TCIOFLUSH 2
- 
--#define TCSANOW 0x540e
--#define TCSADRAIN 0x540f
--#define TCSAFLUSH 0x5410
-+#define TCSANOW   0
-+#define TCSADRAIN 1
-+#define TCSAFLUSH 2
- 
- #if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
- #define EXTA    0000016
-diff --git a/arch/mips64/bits/termios.h b/arch/mips64/bits/termios.h
-index f559f76..6a1205d 100644
---- a/arch/mips64/bits/termios.h
-+++ b/arch/mips64/bits/termios.h
-@@ -141,9 +141,9 @@ struct termios {
- #define TCOFLUSH  1
- #define TCIOFLUSH 2
- 
--#define TCSANOW 0x540e
--#define TCSADRAIN 0x540f
--#define TCSAFLUSH 0x5410
-+#define TCSANOW   0
-+#define TCSADRAIN 1
-+#define TCSAFLUSH 2
- 
- #if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
- #define EXTA    0000016
-diff --git a/arch/mipsn32/bits/termios.h b/arch/mipsn32/bits/termios.h
-index f559f76..6a1205d 100644
---- a/arch/mipsn32/bits/termios.h
-+++ b/arch/mipsn32/bits/termios.h
-@@ -141,9 +141,9 @@ struct termios {
- #define TCOFLUSH  1
- #define TCIOFLUSH 2
- 
--#define TCSANOW 0x540e
--#define TCSADRAIN 0x540f
--#define TCSAFLUSH 0x5410
-+#define TCSANOW   0
-+#define TCSADRAIN 1
-+#define TCSAFLUSH 2
- 
- #if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
- #define EXTA    0000016
diff --git a/package/musl/0002-avoid-kernel-if_ether.h.patch b/package/musl/0002-avoid-kernel-if_ether.h.patch
deleted file mode 100644
index 8efbcc8..0000000
--- a/package/musl/0002-avoid-kernel-if_ether.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 3984adc4976de7553f51e0cf4de1e18c373b332b Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 15 Dec 2016 15:10:19 +0200
-Subject: [PATCH] Avoid redefinition of struct ethhdr
-
-This is a workaround to the if_ether.h conflict between musl and the kernel.
-Both define struct ethhdr.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- include/netinet/if_ether.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/include/netinet/if_ether.h b/include/netinet/if_ether.h
-index 11ee65823f93..cfe1949d3371 100644
---- a/include/netinet/if_ether.h
-+++ b/include/netinet/if_ether.h
-@@ -1,6 +1,9 @@
- #ifndef _NETINET_IF_ETHER_H
- #define _NETINET_IF_ETHER_H
- 
-+/* Suppress kernel if_ether.h header inclusion */
-+#define _LINUX_IF_ETHER_H
-+
- #include <stdint.h>
- #include <sys/types.h>
- 
--- 
-2.10.2
-
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 8ef4def..f3f3741 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	97e447c7ee2a7f613186ec54a93054fe15469fe34d7d323080f7ef38f5ecb0fa  musl-1.1.15.tar.gz
+sha256	937185a5e5d721050306cf106507a006c3f1f86d86cd550024ea7be909071011  musl-1.1.16.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index ea1ce6d..6d56033 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.15
+MUSL_VERSION = 1.1.16
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.10.2
