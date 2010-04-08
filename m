From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 13:16:13 +0200
Subject: [Buildroot] [git commit master] Enable e300c2,
	e300c3 and e500mc powerpc optimizations
Message-ID: <20100408111645.B80C78B661@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=633049d80064e8c156ff58e1fc776f2f9afe9163
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1513

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    4 +++-
 target/Config.in.arch      |   12 ++++++++++++
 toolchain/uClibc/uclibc.mk |    6 ++++++
 3 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2d8d2e8..4564aaa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,8 @@
 
 	Toolchain: uClibc 0.9.30.3 / 0.9.31, older 0.9.30.x removed.
 	2.6.33 kernel headers, binutils 2.20.1, removed broken nios2
-	support, improved external toolchain support.
+	support, ppc e300cX/e500mc support, improved external
+	toolchain support.
 
 	X.org updated to 7.5.
 
@@ -48,6 +49,7 @@
 	#1447: Package installation on target with debug symbols is broken
 	#1459: Misc QA fixes
 	#1489: radvd update to 1.6
+	#1513: Enable powerpc e300c2, e300c3 and e500mc optimization
 
 2010.02, Release February 26th, 2010:
 
diff --git a/target/Config.in.arch b/target/Config.in.arch
index 26f7aa5..1de679f 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -490,6 +490,15 @@ config BR2_powerpc_970
 	bool "970"
 config BR2_powerpc_8540
 	bool "8540"
+comment "e300c2 needs gcc >= 4.4.x"
+config BR2_powerpc_e300c2
+	bool "e300c2"
+comment "e300c3 needs gcc >= 4.4.x"
+config BR2_powerpc_e300c3
+	bool "e300c3"
+comment "e500mc needs gcc >= 4.4.x"
+config BR2_powerpc_e500mc
+	bool "e500mc"
 endchoice
 
 config BR2_ARCH
@@ -648,6 +657,9 @@ config BR2_GCC_TARGET_TUNE
 	default 860		if BR2_powerpc_860
 	default 970		if BR2_powerpc_970
 	default 8540		if BR2_powerpc_8540
+	default e300c2		if BR2_powerpc_e300c2
+	default e300c3		if BR2_powerpc_e300c3
+	default e500mc		if BR2_powerpc_e500mc
 	default v7		if BR2_sparc_v7
 	default cypress		if BR2_sparc_cypress
 	default v8		if BR2_sparc_v8
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 3e69770..ddeb395 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -232,6 +232,12 @@ ifeq ($(UCLIBC_TARGET_ARCH),sparc)
 endif
 ifeq ($(UCLIBC_TARGET_ARCH),powerpc)
 ifeq ($(BR2_powerpc_8540),y)
+	TARGET_POWERPC_CORE_E500:=y
+endif
+ifeq ($(BR2_powerpc_e500mc),y)
+	TARGET_POWERPC_CORE_E500:=y
+endif
+ifeq ($(TARGET_POWERPC_CORE_E500),y)
 	/bin/echo "# CONFIG_CLASSIC is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "CONFIG_E500=y" >> $(UCLIBC_DIR)/.oldconfig
 else
-- 
1.6.3.3
