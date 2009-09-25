From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Sep 2009 10:01:19 +0200
Subject: [Buildroot] [git commit master] kernel-headers: 2.6.30.x: fix build
	error in ndelay() on mips
Message-ID: <20090925091643.805C377755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5eb68019cdc97eb032905785ff666063f817cceb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Dominic Mason <dominic@opusvl.com>.

From mainline 3cb3a66cf7559d9c.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../kernel-headers/linux-2.6.30.8-mips-delay.patch |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/kernel-headers/linux-2.6.30.8-mips-delay.patch

diff --git a/toolchain/kernel-headers/linux-2.6.30.8-mips-delay.patch b/toolchain/kernel-headers/linux-2.6.30.8-mips-delay.patch
new file mode 100644
index 0000000..9e13c2c
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.30.8-mips-delay.patch
@@ -0,0 +1,35 @@
+From 3cb3a66cf7559d9c5d47ddf58481530b8943052f Mon Sep 17 00:00:00 2001
+From: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
+Date: Tue, 9 Jun 2009 11:12:48 +0900
+Subject: [PATCH] MIPS: Fix __ndelay build error and add 'ull' suffix for 32-bit kernel
+
+Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
+Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
+---
+ arch/mips/lib/delay.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/mips/lib/delay.c b/arch/mips/lib/delay.c
+index f69c6b5..6b3b1de 100644
+--- a/arch/mips/lib/delay.c
++++ b/arch/mips/lib/delay.c
+@@ -43,7 +43,7 @@ void __udelay(unsigned long us)
+ {
+ 	unsigned int lpj = current_cpu_data.udelay_val;
+ 
+-	__delay((us * 0x000010c7 * HZ * lpj) >> 32);
++	__delay((us * 0x000010c7ull * HZ * lpj) >> 32);
+ }
+ EXPORT_SYMBOL(__udelay);
+ 
+@@ -51,6 +51,6 @@ void __ndelay(unsigned long ns)
+ {
+ 	unsigned int lpj = current_cpu_data.udelay_val;
+ 
+-	__delay((us * 0x00000005 * HZ * lpj) >> 32);
++	__delay((ns * 0x00000005ull * HZ * lpj) >> 32);
+ }
+ EXPORT_SYMBOL(__ndelay);
+-- 
+1.6.3.3
+
-- 
1.6.3.3
