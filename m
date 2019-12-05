From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:14:56 +0000
Subject: [Buildroot] [PATCH v1 09/30] package/Makefile.in: Provide
 TARGET_CROSS without path and trailing -
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-10-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The LLVM/Clang toolchain takes the target triple as a `--target=`
argument, rather than having separate binaries with different
names for each target.

This change exposes just the triple as TARGET_CROSS_TRIPLE.

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/Makefile.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 47808292b0..273e9de5d9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -192,11 +192,13 @@ TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CROSS = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-
+TARGET_CROSS_TRIPLE = $(GNU_TARGET_NAME)
 else
-TARGET_CROSS = $(HOST_DIR)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+TARGET_CROSS_TRIPLE = $(TOOLCHAIN_EXTERNAL_PREFIX)
 endif
 
+TARGET_CROSS = $(HOST_DIR)/bin/$(TARGET_CROSS_TRIPLE)-
+
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
-- 
2.20.1
