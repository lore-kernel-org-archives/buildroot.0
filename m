From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 31 Dec 2010 08:39:04 -0300
Subject: [Buildroot] [PATCH 4/6] oprofile: use new libbfd option
In-Reply-To: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293795546-19674-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert the oprofile target to select the new libbfd staging/target
option to avoid a huge target binutils for a simple task.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/oprofile/Config.in   |    1 +
 package/oprofile/oprofile.mk |    5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index c877dae..0e3652d 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OPROFILE
 	# choosen in the config. This will have to be fixed later.
 	depends on !BR2_TOOLCHAIN_EXTERNAL
 	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_BINUTILS
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  OProfile is a system-wide profiler for Linux systems,
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 3be50f2..42bf0e2 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -5,9 +5,6 @@
 #############################################################
 OPROFILE_VERSION := 0.9.4
 OPROFILE_CONF_OPT :=	--localstatedir=/var \
-			--with-extra-includes="$(BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)-target/bfd \
-			-I$(TOOLCHAIN_DIR)/binutils-$(BR2_BINUTILS_VERSION)/include" \
-			--with-extra-libs=$(BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)-target/bfd \
 			--with-kernel-support
 
 OPROFILE_BINARIES := utils/ophelp
@@ -24,7 +21,7 @@ ifeq ($(OPROFILE_ARCH),)
 OPROFILE_ARCH := $(BR2_ARCH)
 endif
 
-OPROFILE_DEPENDENCIES := popt binutils_target
+OPROFILE_DEPENDENCIES := popt binutils
 
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
-- 
1.7.2.2
