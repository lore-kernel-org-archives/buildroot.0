From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 19 May 2017 17:49:17 -0300
Subject: [Buildroot] [PATCH 2/3] uboot-tools: bump to version 2017.05
In-Reply-To: <1495226958-3630-1-git-send-email-festevam@gmail.com>
References: <1495226958-3630-1-git-send-email-festevam@gmail.com>
Message-ID: <1495226958-3630-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 2017.05 and also remove the patches that have been
upstreamed.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../uboot-tools/0001-drop-configh-from-tools.patch | 44 ----------------------
 ...y-CFLAGS-on-invocation-of-libfdt-setup.py.patch | 36 ------------------
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  2 +-
 4 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 package/uboot-tools/0001-drop-configh-from-tools.patch
 delete mode 100644 package/uboot-tools/0004-Pass-empty-CFLAGS-on-invocation-of-libfdt-setup.py.patch

diff --git a/package/uboot-tools/0001-drop-configh-from-tools.patch b/package/uboot-tools/0001-drop-configh-from-tools.patch
deleted file mode 100644
index fbc9608..0000000
--- a/package/uboot-tools/0001-drop-configh-from-tools.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b742c7590ac6d9ac72dd227679ccff79433b3512 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Tue, 4 Aug 2015 22:13:20 +0200
-Subject: [PATCH] drop configh from tools
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We need to build u-boot tools without a board configuration for the target.
-fw_env just uses config.h to define the default environment of the created
-image, so it really isn't mandatory.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[J?rg Krause: update for version 2015.07]
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- tools/env/fw_env.h | 11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/tools/env/fw_env.h b/tools/env/fw_env.h
-index 57149e7..50049fe 100644
---- a/tools/env/fw_env.h
-+++ b/tools/env/fw_env.h
-@@ -8,17 +8,6 @@
- #include <aes.h>
- #include <stdint.h>
- 
--/* Pull in the current config to define the default environment */
--#include <linux/kconfig.h>
--
--#ifndef __ASSEMBLY__
--#define __ASSEMBLY__ /* get only #defines from config.h */
--#include <config.h>
--#undef	__ASSEMBLY__
--#else
--#include <config.h>
--#endif
--
- /*
-  * To build the utility with the static configuration
-  * comment out the next line.
--- 
-2.7.4
-
diff --git a/package/uboot-tools/0004-Pass-empty-CFLAGS-on-invocation-of-libfdt-setup.py.patch b/package/uboot-tools/0004-Pass-empty-CFLAGS-on-invocation-of-libfdt-setup.py.patch
deleted file mode 100644
index ae01b33..0000000
--- a/package/uboot-tools/0004-Pass-empty-CFLAGS-on-invocation-of-libfdt-setup.py.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7807af13118eff3ac291bbaaf2159c7a441c0902 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Thu, 16 Mar 2017 11:21:58 -0700
-Subject: [PATCH] Pass empty CFLAGS on invocation of libfdt/setup.py
-
-When building u-boot tools in cross-build environment CFLAGS environment
-variable set up for target is taken into an account when building code
-for host. Make it empty on invocation of python.
-
-This fixes the following build errors when cross-compiling for xtensa:
-
-  cc1: error: unrecognized command line option "-mlongcalls"
-  cc1: error: unrecognized command line option "-mauto-litpools"
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
----
- tools/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/Makefile b/tools/Makefile
-index 1c840d7..f3de657 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -120,7 +120,7 @@ _libfdt.so-sharedobjs += $(LIBFDT_OBJS)
- libfdt:
- 
- tools/_libfdt.so: $(patsubst %.o,%.c,$(LIBFDT_OBJS)) tools/libfdt_wrap.c
--	LDFLAGS="$(HOSTLDFLAGS)" python $(srctree)/lib/libfdt/setup.py \
-+	LDFLAGS="$(HOSTLDFLAGS)" CFLAGS= python $(srctree)/lib/libfdt/setup.py \
- 		"$(_hostc_flags)" $^
- 	mv _libfdt.so $@
- 
--- 
-2.1.4
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 9606d9f..e11d92f 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  f54baf3f9325bf444c7905f3a5b6f83680edb1e6e1a4d5f8a5ad80abe885113f  u-boot-2017.03.tar.bz2
+sha256  c8373949d7f0de1059e507b83a655d4cea539f75dc66ccdbb27adbd38d83095e  u-boot-2017.05.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 352f53d..f6b1fc3 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2017.03
+UBOOT_TOOLS_VERSION = 2017.05
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
-- 
2.7.4
