From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:37:04 +0200
Subject: [Buildroot] [git commit] putty: fix musl build for 64-bit targets
Message-ID: <20160522193712.725DB8041C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d6c0bcc3420fe89cc95f3135b67e5edd032bc00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch fixing MinGW build that also fixes musl build. Both of them
do not provide __uint64_t on 64-bit targets.

Fixes:
http://autobuild.buildroot.net/results/8f7/8f7683b2e204249c37690bae915208298ea94490/
http://autobuild.buildroot.net/results/f28/f2836f3a7e27f74f5adf38d1769b9b047d59c385/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...02-Fix-__uint128_t-compile-error-on-MinGW.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/putty/0002-Fix-__uint128_t-compile-error-on-MinGW.patch b/package/putty/0002-Fix-__uint128_t-compile-error-on-MinGW.patch
new file mode 100644
index 0000000..514b629
--- /dev/null
+++ b/package/putty/0002-Fix-__uint128_t-compile-error-on-MinGW.patch
@@ -0,0 +1,30 @@
+From 3377ea57f5d333d65d44a1130161396782389e88 Mon Sep 17 00:00:00 2001
+From: Tim Kosse <tim.kosse@filezilla-project.org>
+Date: Tue, 11 Aug 2015 09:43:34 +0200
+Subject: [PATCH] Fix  __uint128_t compile error on MinGW.
+
+MinGW has __uint128_t, but not __uint64_t.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 3377ea57f5
+
+ sshbn.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sshbn.h b/sshbn.h
+index a043241eea67..9366f614ae4c 100644
+--- a/sshbn.h
++++ b/sshbn.h
+@@ -26,7 +26,7 @@
+  * using the same 'two machine registers' kind of code generation that
+  * 32-bit targets use for 64-bit ints. If we have one of these, we can
+  * use a 64-bit BignumInt and a 128-bit BignumDblInt. */
+-typedef __uint64_t BignumInt;
++typedef unsigned long long BignumInt;
+ typedef __uint128_t BignumDblInt;
+ #define BIGNUM_INT_MASK  0xFFFFFFFFFFFFFFFFULL
+ #define BIGNUM_TOP_BIT   0x8000000000000000ULL
+-- 
+2.8.1
+
