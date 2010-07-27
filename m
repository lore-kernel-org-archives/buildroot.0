From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 20:19:01 +0200
Subject: [Buildroot] [PATCH 4/4] target-gcc: remove useless copies of gcc
In-Reply-To: <cover.1280254559.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280254559.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fed6a2a6ea884630a3723d2a49579e63e87ffd57.1280254559.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When doing the "make install" of target, three identical copies of gcc
are installed in $(TARGET_DIR)/usr/bin:

  039adcc582c365f12ba6fc5f96098128  arm-unknown-linux-uclibcgnueabi-gcc
  039adcc582c365f12ba6fc5f96098128  arm-unknown-linux-uclibcgnueabi-gcc-4.3.5
  039adcc582c365f12ba6fc5f96098128  gcc

This patch removes the first two copies and keeps only the common "gcc" one.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 5dec86c..9720ed3 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -445,6 +445,9 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
 	# Remove broken specs file (cross compile flag is set).
 	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
 
+	# Remove useless copies of gcc
+	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc*
+
 	# Work around problem of missing syslimits.h
 	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \
 		echo "warning: working around missing syslimits.h"; \
-- 
1.7.0.4
