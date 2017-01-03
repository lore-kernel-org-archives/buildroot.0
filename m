From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 16:24:51 +0100
Subject: [Buildroot] [git commit] musl: security bump to version 1.1.16
Message-ID: <20170103152906.AD69A7FB3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63a7277107c32349d1aadd06e9c739503f33079e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-8859 - fixes a serious under-allocation bug in regexec due to
integer overflow.

Drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ....h.patch => 0001-avoid-kernel-if_ether.h.patch} |  0
 ...regression-in-tcsetattr-on-all-mips-archs.patch | 67 ----------------------
 package/musl/musl.hash                             |  2 +-
 package/musl/musl.mk                               |  2 +-
 4 files changed, 2 insertions(+), 69 deletions(-)

diff --git a/package/musl/0002-avoid-kernel-if_ether.h.patch b/package/musl/0001-avoid-kernel-if_ether.h.patch
similarity index 100%
rename from package/musl/0002-avoid-kernel-if_ether.h.patch
rename to package/musl/0001-avoid-kernel-if_ether.h.patch
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
