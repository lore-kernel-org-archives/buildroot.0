From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 20 Aug 2016 00:41:34 +0200
Subject: [Buildroot] [PATCH] musl: fix a regression for mips
Message-ID: <20160819224134.GA8395@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix a regression regarding tcsetattr.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...regression-in-tcsetattr-on-all-mips-archs.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/musl/0001-fix-regression-in-tcsetattr-on-all-mips-archs.patch

diff --git a/package/musl/0001-fix-regression-in-tcsetattr-on-all-mips-archs.patch b/package/musl/0001-fix-regression-in-tcsetattr-on-all-mips-archs.patch
new file mode 100644
index 0000000..73ccae4
--- /dev/null
+++ b/package/musl/0001-fix-regression-in-tcsetattr-on-all-mips-archs.patch
@@ -0,0 +1,67 @@
+From cff5747c74c41b22f1ce1340978b1c226a8cdf32 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Wed, 13 Jul 2016 15:04:30 -0400
+Subject: [PATCH] fix regression in tcsetattr on all mips archs
+
+revert commit 8c316e9e49d37ad92c2e7493e16166a2afca419f. it was wrong
+and does not match how the kernel API works.
+
+Signed-off-by: Rich Felker <dalias@aerifal.cx>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ arch/mips/bits/termios.h    | 6 +++---
+ arch/mips64/bits/termios.h  | 6 +++---
+ arch/mipsn32/bits/termios.h | 6 +++---
+ 3 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/arch/mips/bits/termios.h b/arch/mips/bits/termios.h
+index f559f76..6a1205d 100644
+--- a/arch/mips/bits/termios.h
++++ b/arch/mips/bits/termios.h
+@@ -141,9 +141,9 @@ struct termios {
+ #define TCOFLUSH  1
+ #define TCIOFLUSH 2
+ 
+-#define TCSANOW 0x540e
+-#define TCSADRAIN 0x540f
+-#define TCSAFLUSH 0x5410
++#define TCSANOW   0
++#define TCSADRAIN 1
++#define TCSAFLUSH 2
+ 
+ #if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
+ #define EXTA    0000016
+diff --git a/arch/mips64/bits/termios.h b/arch/mips64/bits/termios.h
+index f559f76..6a1205d 100644
+--- a/arch/mips64/bits/termios.h
++++ b/arch/mips64/bits/termios.h
+@@ -141,9 +141,9 @@ struct termios {
+ #define TCOFLUSH  1
+ #define TCIOFLUSH 2
+ 
+-#define TCSANOW 0x540e
+-#define TCSADRAIN 0x540f
+-#define TCSAFLUSH 0x5410
++#define TCSANOW   0
++#define TCSADRAIN 1
++#define TCSAFLUSH 2
+ 
+ #if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
+ #define EXTA    0000016
+diff --git a/arch/mipsn32/bits/termios.h b/arch/mipsn32/bits/termios.h
+index f559f76..6a1205d 100644
+--- a/arch/mipsn32/bits/termios.h
++++ b/arch/mipsn32/bits/termios.h
+@@ -141,9 +141,9 @@ struct termios {
+ #define TCOFLUSH  1
+ #define TCIOFLUSH 2
+ 
+-#define TCSANOW 0x540e
+-#define TCSADRAIN 0x540f
+-#define TCSAFLUSH 0x5410
++#define TCSANOW   0
++#define TCSADRAIN 1
++#define TCSAFLUSH 2
+ 
+ #if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
+ #define EXTA    0000016
-- 
2.1.4
