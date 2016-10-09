From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:06:49 +0200
Subject: [Buildroot] [git commit] uclibc: fix mips/mips64 build with older
	compilers
Message-ID: <20161009200927.00E4881F03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e99c712bcea16ab0e17d92c69a4da4a2896e81b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For example gcc 4.8.x fails to build uClibc-ng for mips/mips64.
Check if feature exist before using it.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...5-fix-mips-mips64-build-for-old-compilers.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/uclibc/0005-fix-mips-mips64-build-for-old-compilers.patch b/package/uclibc/0005-fix-mips-mips64-build-for-old-compilers.patch
new file mode 100644
index 0000000..1475132
--- /dev/null
+++ b/package/uclibc/0005-fix-mips-mips64-build-for-old-compilers.patch
@@ -0,0 +1,28 @@
+From 43c4bbf3e0e61f5f487a00a0066816913503656c Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Sun, 9 Oct 2016 20:15:00 +0200
+Subject: [PATCH] fix mips/mips64 build for old compilers
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ Rules.mak | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index 67189ff..b9dbf25 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -404,8 +404,8 @@ ifeq ($(TARGET_ARCH),mips)
+ 	CPU_CFLAGS-$(CONFIG_MIPS_N64_ABI)+=-mabi=64
+ 	CPU_CFLAGS-$(CONFIG_MIPS_O32_ABI)+=-mabi=32
+ 	CPU_CFLAGS-$(CONFIG_MIPS_N32_ABI)+=-mabi=n32
+-	CPU_CFLAGS-$(CONFIG_MIPS_NAN_LEGACY)+=-mnan=legacy
+-	CPU_CFLAGS-$(CONFIG_MIPS_NAN_2008)+=-mnan=2008
++	CPU_CFLAGS-$(CONFIG_MIPS_NAN_LEGACY)+=$(call check_gcc,-mnan=legacy)
++	CPU_CFLAGS-$(CONFIG_MIPS_NAN_2008)+=$(call check_gcc,-mnan=2008)
+ 	CPU_LDFLAGS-y += $(CPU_CFLAGS)
+ endif
+ 
+-- 
+2.1.4
+
