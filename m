From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2015 00:20:45 +0200
Subject: [Buildroot] [PATCH 09/11] package/owl-linux: use kernel-module
	helper
In-Reply-To: <cover.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <d480fcab327d036f5d97d86f921ea3798e125b0a.1433628825.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Git rid of first patch, no longer needed; rename remaining patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../0001-fix-CROSS_COMPILE-usage-in-Makefile.patch       | 16 ----------------
 ...-linux-3.3.x.patch => 0001-fix-for-linux-3.3.x.patch} |  0
 package/owl-linux/owl-linux.mk                           | 11 +----------
 3 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 package/owl-linux/0001-fix-CROSS_COMPILE-usage-in-Makefile.patch
 rename package/owl-linux/{0002-fix-for-linux-3.3.x.patch => 0001-fix-for-linux-3.3.x.patch} (100%)

diff --git a/package/owl-linux/0001-fix-CROSS_COMPILE-usage-in-Makefile.patch b/package/owl-linux/0001-fix-CROSS_COMPILE-usage-in-Makefile.patch
deleted file mode 100644
index 14b4631..0000000
--- a/package/owl-linux/0001-fix-CROSS_COMPILE-usage-in-Makefile.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix the owl-linux Makefile so that it protects spaces in the CROSS_COMPILE
-variable. For example, this variable will contain spaces if ccache is used.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-diff -Nurp a/Makefile b/Makefile
---- a/Makefile	2012-06-14 10:51:45.000000000 +0100
-+++ b/Makefile	2012-07-20 10:46:41.636752148 +0100
-@@ -35,7 +35,7 @@ else
- 	PWD := $(shell pwd)
- 
- default:
--	$(MAKE) -C $(KERNELDIR) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) M=$(PWD) MODE=$(MODE) modules
-+	$(MAKE) -C $(KERNELDIR) ARCH=$(ARCH) CROSS_COMPILE="$(CROSS_COMPILE)" M=$(PWD) MODE=$(MODE) modules
- 
- clean: 
- 	-rm -f *.o *.mod.c *.ko modules.order Module.symvers
diff --git a/package/owl-linux/0002-fix-for-linux-3.3.x.patch b/package/owl-linux/0001-fix-for-linux-3.3.x.patch
similarity index 100%
rename from package/owl-linux/0002-fix-for-linux-3.3.x.patch
rename to package/owl-linux/0001-fix-for-linux-3.3.x.patch
diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
index 371cc02..1262425 100644
--- a/package/owl-linux/owl-linux.mk
+++ b/package/owl-linux/owl-linux.mk
@@ -10,14 +10,5 @@ OWL_LINUX_LICENSE = PROPRIETARY
 OWL_LINUX_LICENSE_FILES = LICENSE
 OWL_LINUX_REDISTRIBUTE = NO
 
-OWL_LINUX_DEPENDENCIES = linux
-
-define OWL_LINUX_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
-endef
-
-define OWL_LINUX_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(@D)" modules_install
-endef
-
+$(eval $(kernel-module))
 $(eval $(generic-package))
-- 
1.9.1
