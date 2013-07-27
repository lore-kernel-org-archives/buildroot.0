From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 13:16:50 +0200
Subject: [Buildroot] [git commit] toolchain/buildroot: properly handle SSP
Message-ID: <20130727111726.A9ED09ABCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=808cc0a5e17af2c9cd2210cdcbf0d98e79b6e157
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current SSP handling is incomplete.

First we need to build uClibc with SSP support for a complete
"experience".

Second, it doesn't hurt to add -fstack-protector-all to the
CFLAGS/CXXFLAGS since most users would expect buildroot to do this
rather than adding the flags themselves.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in                       |    5 +++++
 package/uclibc/uclibc.mk                  |   10 ++++++++--
 toolchain/toolchain-buildroot/Config.in.2 |    2 +-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a597290..95eec52 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -124,6 +124,11 @@ TARGET_CFLAGS += -msep-data
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
index 044de21..cf53280 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -251,9 +251,15 @@ endif
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
index a9c102f..bf27e6b 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -21,7 +21,7 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	bool "Enable stack protection support"
 	help
 	  Enable stack smashing protection support using GCCs
-	  -fstack-protector[-all] option.
+	  -fstack-protector-all option.
 
 	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
 	  for details.
