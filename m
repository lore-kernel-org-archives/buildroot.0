From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 22:46:18 +0200
Subject: [Buildroot] [git commit master 1/1] target-g++: fix build
Message-ID: <20100727204729.7190083471@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=454b70d03afd45a9f78976b93051c61b80ab245d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just as we did to fix target-gcc, pass CXX_FOR_TARGET when building
target g++, and remove useless copies of g++ and c++.

Tested on ARM by compiling a simple C++ program using <iostream> on
the target and running it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 9720ed3..6e767ac 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -399,6 +399,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
 		BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
 		GCC_FOR_TARGET="$(TARGET_CC)" \
 		CC_FOR_TARGET="$(TARGET_CC)" \
+		CXX_FOR_TARGET="$(TARGET_CXX)" \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
 		--prefix=/usr \
 		--build=$(GNU_HOST_NAME) \
@@ -445,8 +446,10 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
 	# Remove broken specs file (cross compile flag is set).
 	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
 
-	# Remove useless copies of gcc
+	# Remove useless copies of gcc, c++, g++
 	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc*
+	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++*
+	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++*
 
 	# Work around problem of missing syslimits.h
 	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \
-- 
1.7.1
