From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 15:17:02 +0100
Subject: [Buildroot] [PATCH 06/14] toolchain: move Stack Protection Support
	option
In-Reply-To: <cover.1292163398.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292163398.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a39ab8a30f677d4a07d6d88a2cc036ccba0ff225.1292163398.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_USE_SSP option is only used inside the uClibc build, so only
meaningful for Buildroot internal toolchains. Therefore, the option is
moved to the right location so that it isn't visible when working with
external toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in.2 |    9 +++++++++
 toolchain/toolchain-common.in             |    9 ---------
 toolchain/uClibc/uclibc.mk                |    2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index cf426ee..f1b0a7c 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -67,6 +67,15 @@ comment "C++ support broken in uClibc 0.9.31 with locale enabled with gcc 4.2"
 		    BR2_TOOLCHAIN_BUILDROOT_LOCALE    && \
 		    BR2_UCLIBC_VERSION_0_9_31
 
+config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
+	bool "Enable stack protection support"
+	help
+	  Enable stack smashing protection support using GCCs
+	  -fstack-protector[-all] option.
+
+	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
+	  for details.
+
 source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
 source "toolchain/sstrip/Config.in"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 2c54acd..5502ab4 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -76,15 +76,6 @@ config BR2_SOFT_FLOAT
 	  functions, then everything will need to be compiled with soft
 	  floating point support (-msoft-float).
 
-config BR2_USE_SSP
-	bool "Enable stack protection support"
-	help
-	  Enable stack smashing protection support using GCCs
-	  -fstack-protector[-all] option.
-
-	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
-	  for details.
-
 choice
 	prompt "Thread library implementation"
 	default BR2_PTHREADS_OLD
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 1ed40cc..e05e16c 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -271,7 +271,7 @@ else
 		-e 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g' \
 		$(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_USE_SSP),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
 	$(SED) 's,^.*UCLIBC_HAS_SSP[^_].*,UCLIBC_HAS_SSP=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_SSP[^_].*,UCLIBC_HAS_SSP=n,g' $(UCLIBC_DIR)/.oldconfig
-- 
1.7.0.4
