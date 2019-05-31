From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:59:57 +0200
Subject: [Buildroot] [git commit branch/next] package/binutils: add C-SKY
 specific version
Message-ID: <20190531210133.C67B28D48D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b80ddf406c15399a3e835e620f4b2121c92aab51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 12 +++++++++++-
 package/binutils/binutils.hash  |  3 +++
 package/binutils/binutils.mk    |  7 +++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 52b0ea22e7..d9b34d7a9b 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,28 +7,38 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
+	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
 	  Select the version of binutils you wish to use.
 
 config BR2_BINUTILS_VERSION_2_30_X
 	bool "binutils 2.30"
+	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_2_31_X
 	bool "binutils 2.31.1"
+	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_2_32_X
 	bool "binutils 2.32"
+	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.31)"
 	depends on BR2_arc
+
+config BR2_BINUTILS_VERSION_CSKY
+	bool "binutils csky"
+	depends on BR2_csky
+
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2019.03-rc1"	if BR2_BINUTILS_VERSION_ARC
+	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 4792208e45..125372cc6f 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,3 +5,6 @@ sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724a
 
 # Locally calculated (fetched from Github)
 sha512  ceb0546cb73a29526f2f8916d855fbed52b2fc86b6706687cabf57b96df06932714820edec2f9038529790e7925304778ded0944babc985a39371eb08c6c7f52  binutils-gdb-arc-2019.03-rc1.tar.gz
+
+# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
+sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0b06f49d72..edb4be1869 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -20,6 +20,13 @@ BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
+
+ifeq ($(BR2_csky),y)
+BINUTILS_SITE = $(call github,c-sky,binutils-gdb,$(BINUTILS_VERSION))
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
+BINUTILS_FROM_GIT = y
+endif
+
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
