From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Sep 2011 21:57:44 +0200
Subject: [Buildroot] [PATCH 08/15] package: remove useless arguments from
	CMAKETARGETS
In-Reply-To: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ff7b25bd3be5e2d3be05347ed662df2f2435ab70.1317325743.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to the pkgdir and pkgname functions, we can rewrite the
GENTARGETS macro in a way that avoids the need for each package to
repeat its name and the directory in which it is present.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.cmake.in                   |   10 ++++------
 package/cdrkit/cdrkit.mk                    |    4 ++--
 package/multimedia/libcuefile/libcuefile.mk |    2 +-
 package/multimedia/musepack/musepack.mk     |    2 +-
 package/multimedia/taglib/taglib.mk         |    2 +-
 package/yajl/yajl.mk                        |    2 +-
 6 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
index 1263eb9..b48e09a 100644
--- a/package/Makefile.cmake.in
+++ b/package/Makefile.cmake.in
@@ -183,15 +183,13 @@ endef
 ################################################################################
 # CMAKETARGETS -- the target generator macro for CMake packages
 #
-# Argument 1 is the package directory prefix [mandatory]
-# Argument 2 is the lowercase package name   [mandatory]
-# Argument 3 is "target" or "host"           [optional, default: "target"]
+# Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
 define CMAKETARGETS
-ifeq ($(3),host)
-$(call CMAKETARGETS_INNER,$(3)-$(2),$(call UPPERCASE,$(3)-$(2)),$(call UPPERCASE,$(2)),$(1),host)
+ifeq ($(1),host)
+$(call CMAKETARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
 else
-$(call CMAKETARGETS_INNER,$(2),$(call UPPERCASE,$(2)),$(call UPPERCASE,$(2)),$(1),target)
+$(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
 endif
 endef
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index a57a8fd..9eebe6e 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -20,5 +20,5 @@ CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
 HOST_CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(HOST_DIR)/usr/include"
 HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
 
-$(eval $(call CMAKETARGETS,package,cdrkit))
-$(eval $(call CMAKETARGETS,package,cdrkit,host))
+$(eval $(call CMAKETARGETS))
+$(eval $(call CMAKETARGETS,host))
diff --git a/package/multimedia/libcuefile/libcuefile.mk b/package/multimedia/libcuefile/libcuefile.mk
index 765c5a2..7e1c843 100644
--- a/package/multimedia/libcuefile/libcuefile.mk
+++ b/package/multimedia/libcuefile/libcuefile.mk
@@ -20,4 +20,4 @@ endef
 LIBCUEFILE_POST_INSTALL_STAGING_HOOKS += LIBCUEFILE_INSTALL_STAGING_INCLUDES
 LIBCUEFILE_POST_INSTALL_TARGET_HOOKS += LIBCUEFILE_INSTALL_TARGET_INCLUDES
 
-$(eval $(call CMAKETARGETS,package/multimedia,libcuefile))
+$(eval $(call CMAKETARGETS))
diff --git a/package/multimedia/musepack/musepack.mk b/package/multimedia/musepack/musepack.mk
index 1e5ebcf..ac3660f 100644
--- a/package/multimedia/musepack/musepack.mk
+++ b/package/multimedia/musepack/musepack.mk
@@ -11,4 +11,4 @@ MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
 MUSEPACK_MAKE = $(MAKE1)
 
-$(eval $(call CMAKETARGETS,package/multimedia,musepack))
+$(eval $(call CMAKETARGETS))
diff --git a/package/multimedia/taglib/taglib.mk b/package/multimedia/taglib/taglib.mk
index b48e3d2..ce6adeb 100644
--- a/package/multimedia/taglib/taglib.mk
+++ b/package/multimedia/taglib/taglib.mk
@@ -24,4 +24,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 TAGLIB_POST_INSTALL_TARGET_HOOKS += TAGLIB_REMOVE_DEVFILE
 endif
 
-$(eval $(call CMAKETARGETS,package/multimedia,taglib))
+$(eval $(call CMAKETARGETS))
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index e67a7da..723cce4 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -8,4 +8,4 @@ YAJL_VERSION = 2.0.2
 YAJL_SITE = git://github.com/lloyd/yajl.git
 YAJL_INSTALL_STAGING = YES
 
-$(eval $(call CMAKETARGETS,package,yajl))
+$(eval $(call CMAKETARGETS))
-- 
1.7.4.1
