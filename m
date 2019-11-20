From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:24 +0000
Subject: [Buildroot] [RFC PATCH v3 10/30] package/Makefile.in: Provide
 TARGET_CROSS without path and trailing -
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-11-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

The LLVM/Clang toolchain takes the target triple as a `--target=`
argument, rather than having separate binaries with different
names for each target.

This change exposes just the triple as TARGET_CROSS_TRIPLE.

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
---
 package/Makefile.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 3b764baa47..94ec4dea61 100644
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
