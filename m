From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Mar 2014 05:34:05 +0100
Subject: [Buildroot] [PATCH 3/4] toolchain-external: Linaro AArch64
	toolchains need a symlink, like ARM ones
In-Reply-To: <1395376446-29367-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1395376446-29367-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1395376446-29367-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like ARM ones, the Linaro AArch64 toolchains expect libraries in
/lib/aarch64-linux-gnu and /usr/lib/aarch64-linux-gnu, but Buildroot
always installs them in /lib and /usr/lib. Therefore, this commit adds
the appropriate symbolic links, just like we're already doing for
Linaro ARM toolchains.

Reported-by: Kevin Hilman <khilman@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1b1053d..547d55d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -242,6 +242,11 @@ define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 	ln -sf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
 endef
 
+define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
+	ln -sf . $(TARGET_DIR)/lib/aarch64-linux-gnu
+	ln -sf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
+endef
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
@@ -346,12 +351,15 @@ TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.09/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.09_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_10),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.10/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.10-1_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_11),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.11/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.11_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-- 
1.8.3.2
