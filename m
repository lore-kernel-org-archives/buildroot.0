From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 27 May 2013 11:02:32 +0200
Subject: [Buildroot] [PATCH 1/1] infra: allow running 'make clean menuconfig
	; make *-menuconfig'
Message-ID: <1369645352-11942-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds host-ccache to the dependency list of any package if
BR2_CCACHE is enable.

Fixes bug #5678

Also, drop some explicit redundant host-ccache dependencies that
intend to fix this kind of issue.

Note that, only the uClibc dependency on host-ccache remains since
uClibc does not use any of the Buildroot package infrastructure yet.

Signed-off-by: "Samuel Martin" <s.martin49@gmail.com>
---
 package/crosstool-ng/crosstool-ng.mk |  2 +-
 package/pkg-generic.mk               | 12 ++++++++++++
 package/sstrip/sstrip.mk             |  5 -----
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index b533396..0b96b50 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -5,7 +5,7 @@ CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
 
 HOST_CROSSTOOL_NG_DEPENDENCIES = \
-	$(if $(BR2_CCACHE),host-ccache) host-gawk \
+	host-gawk \
 	host-automake host-gperf host-bison host-flex \
 	host-texinfo
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 56fca6b..1c8d182 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -306,6 +306,18 @@ $(2)_REDISTRIBUTE		?= YES
 
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
+# Inconditionnaly add host-ccache dependency when BR2_CCACHE is enabled.
+# This allows to run the following without failing on test the compiler
+# because the ccache binary is not yet built:
+#
+# $ make clean menuconfig
+# $ make [linux|ctng|uclibc|barebox|busybox]-menuconfig
+ifeq ($(BR2_CCACHE),y)
+ifneq ($(1),host-ccache)
+$(2)_DEPENDENCIES += host-ccache
+endif
+endif
+
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index e078b2c..3c29c52 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -8,11 +8,6 @@ SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk/tools/sstrip
 SSTRIP_VERSION = 20154
 HOST_SSTRIP_BINARY = $(GNU_TARGET_NAME)-sstrip
 
-# This is a kludge to get host-ccache built before us or it fails
-ifeq ($(BR2_CCACHE),y)
-HOST_SSTRIP_DEPENDENCIES = host-ccache
-endif
-
 define SSTRIP_BUILD_CMDS
 	cd $(@D) ; \
 	$(TARGET_CC) $(TARGET_CFLAGS) -include endian.h -include byteswap.h \
-- 
1.8.3
