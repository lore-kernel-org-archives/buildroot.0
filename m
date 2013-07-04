From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jul 2013 15:30:26 -0300
Subject: [Buildroot] [PATCH] toolchain/buildroot: properly handle SSP
Message-ID: <1372962626-20736-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current SSP handling is incomplete.

First we need to build uClibc with SSP support for a complete
"experience".

Second, it doesn't hurt to add -fstack-protector-all to the
CFLAGS/CXXFLAGS since most users would expect buildroot to do this
rather than adding the flags themselves.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in                       |  5 +++++
 package/uclibc/uclibc.mk                  | 10 ++++++++--
 toolchain/toolchain-buildroot/Config.in.2 |  2 +-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 66e45d2..01c1256 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -119,6 +119,11 @@ TARGET_CFLAGS += -msep-data
 TARGET_CXXFLAGS += -msep-data
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
+TARGET_CFLAGS += -fstack-protector-all
+TARGET_CXXFLAGS += -fstack-protector-all
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 5cbc011..6060efa 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -255,9 +255,15 @@ endif
 # SSP
 #
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
-UCLIBC_SSP_CONFIG = $(call UCLIBC_OPT_SET,UCLIBC_HAS_SSP,y,$(@D))
+define UCLIBC_SSP_CONFIG
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_SSP,y,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_BUILD_SSP,y,$(@D))
+endef
 else
-UCLIBC_SSP_CONFIG = $(call UCLIBC_OPT_UNSET,UCLIBC_HAS_SSP,$(@D))
+define UCLIBC_SSP_CONFIG
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_SSP,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_BUILD_SSP,$(@D))
+endef
 endif
 
 #
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 9bbf016..67aecaa 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -16,7 +16,7 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	bool "Enable stack protection support"
 	help
 	  Enable stack smashing protection support using GCCs
-	  -fstack-protector[-all] option.
+	  -fstack-protector-all option.
 
 	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
 	  for details.
-- 
1.8.1.5
