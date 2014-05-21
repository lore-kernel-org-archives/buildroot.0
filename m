From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 May 2014 09:52:02 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix Linaro 2014.02 symlink
Message-ID: <1400658722-31343-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit cd32da8f7931af61737df293d1f8bcedaab8648e
("toolchain-external: add Linaro ARM big endian toolchain") a mistake
was made, probably due to a rebase conflict that was incorrect solved:
the call to the post install staging hook that creates the necessary
symbolic links for a root filesystem based on Linaro 2014.02 to work
was removed.

This commit reinstates this call, which should fix the problem
observed by Maxime Hadjinlian while using Linaro 2014.02.

Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3f88188..34520be 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -286,6 +286,7 @@ TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2014.02_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.8-2014.02_linux.tar.xz
-- 
1.9.3
