From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 22:43:04 +0200
Subject: [Buildroot] [git commit master 1/1] target-gcc: fix build
Message-ID: <20100727204323.142DF83471@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f43054d841c82c121c4fd8c1e6604888233b6d10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that $(STAGING_DIR)/usr/bin is no longer in the PATH, we need to
pass the absolute paths to $(TARGET_CC) when building the target gcc
compiler.

This commit fixes the target gcc build problem reported on the list. I
have successfully been able to build a target gcc for ARM, use it to
compile a hello world application on the target and run this
application.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index cfbe616..52b20e9 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -397,6 +397,8 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
 		CXXFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
 		CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
 		BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
+		GCC_FOR_TARGET="$(TARGET_CC)" \
+		CC_FOR_TARGET="$(TARGET_CC)" \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
 		--prefix=/usr \
 		--build=$(GNU_HOST_NAME) \
-- 
1.7.1
