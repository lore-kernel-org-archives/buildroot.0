From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 17 Feb 2015 23:02:55 +0100
Subject: [Buildroot] [PATCH 1/2] [RFC] LLVM: Added package
In-Reply-To: <1424210576-18526-1-git-send-email-paul@crapouillou.net>
References: <1424210576-18526-1-git-send-email-paul@crapouillou.net>
Message-ID: <1424210576-18526-2-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/Config.in.host      |  1 +
 package/llvm/Config.in.host | 13 +++++++++++++
 package/llvm/llvm.hash      |  1 +
 package/llvm/llvm.mk        | 22 ++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/llvm/Config.in.host
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 94981ad..b06970b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/llvm/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/llvm/Config.in.host b/package/llvm/Config.in.host
new file mode 100644
index 0000000..df0e582
--- /dev/null
+++ b/package/llvm/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_LLVM
+	bool "host llvm"
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || \
+		BR2_i386 || BR2_x86_64 || \
+		BR2_mips || BR2_mipsel || \
+		BR2_mips64 || BR2_mips64el || \
+		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		BR2_sparc
+	help
+	  The LLVM Project is a collection of modular and reusable compiler
+	  and toolchain technologies.
+
+	  http://llvm.org
diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
new file mode 100644
index 0000000..f641fc9
--- /dev/null
+++ b/package/llvm/llvm.hash
@@ -0,0 +1 @@
+sha256	bf3275d2d7890015c8d8f5e6f4f882f8cf3bf51967297ebe74111d6d8b53be15	llvm-3.5.1.src.tar.xz
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
new file mode 100644
index 0000000..e0a7ec2
--- /dev/null
+++ b/package/llvm/llvm.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# llvm
+#
+################################################################################
+
+LLVM_VERSION = 3.5.1
+LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
+LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
+LLVM_LICENSE = University of Illinois/NCSA Open Source License
+LLVM_LICENSE_FILES = LICENSE.TXT
+
+HOST_LLVM_DEPENDENCIES = host-libxml2 host-zlib host-python
+
+ENABLED_TARGETS := $(ARCH),$(if $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600),r600)
+
+HOST_LLVM_CONF_OPTS = --with-default-sysroot=$(STAGING_DIR) \
+					  --enable-bindings=none \
+					  --enable-targets=$(ENABLED_TARGETS) \
+					  --target=$(GNU_TARGET_NAME)
+
+$(eval $(host-autotools-package))
-- 
2.1.4
