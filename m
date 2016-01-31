From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Jan 2016 17:40:17 +0100
Subject: [Buildroot] [PATCH] [RFC] core: ensure reproducible builds
Message-ID: <1454258417-6017-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the nice presentation on this topic at FOSDEM today, I did a
quick-n-dirty hack to at least pass a reproducible date when building
packages.

Probably not ready to go in for now, just a peek into that...
---
 package/Makefile.in    | 6 ++++++
 package/pkg-generic.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index c5652af..7041b8c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -21,6 +21,12 @@ MAKE1 := $(HOSTMAKE) -j1
 override MAKE = $(HOSTMAKE) \
 	$(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
 
+# Ensure reproducible builds.
+# We set this to the date the repository was last changed on. However,
+# for packages, we provide the date at which their .mk file was last
+# committed to the repository (this is done in the pkg-generic infra).
+export SOURCE_DATE_EPOCH := $(shell git log -n1 --pretty='format:%ct')
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_VENDOR = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
 else
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1e024d3..53cb765 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -367,6 +367,8 @@ $(2)_TYPE                       =  $(4)
 $(2)_NAME			=  $(1)
 $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
 $(2)_PKGDIR			=  $(pkgdir)
+$(2)_MK_FILE			=  $(lastword $(MAKEFILE_LIST))
+$(2)_SOURCE_DATE_EPOCH		=  $$(shell git log -n 1 --pretty='format:%ct' $$($(2)_MK_FILE))
 
 # Keep the package version that may contain forward slashes in the _DL_VERSION
 # variable, then replace all forward slashes ('/') by underscores ('_') to
@@ -710,11 +712,17 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_TARGET):		SOURCE_DATE_EPOCH=$$($(2)_SOURCE_DATE_EPOCH)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
+$$($(2)_TARGET_INSTALL_STAGING):	SOURCE_DATE_EPOCH=$$($(2)_SOURCE_DATE_EPOCH)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_IMAGES):		SOURCE_DATE_EPOCH=$$($(2)_SOURCE_DATE_EPOCH)
 $$($(2)_TARGET_INSTALL_HOST):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_HOST):		SOURCE_DATE_EPOCH=$$($(2)_SOURCE_DATE_EPOCH)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
+$$($(2)_TARGET_BUILD):			SOURCE_DATE_EPOCH=$$($(2)_SOURCE_DATE_EPOCH)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		SOURCE_DATE_EPOCH=$$($(2)_SOURCE_DATE_EPOCH)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-- 
1.9.1
