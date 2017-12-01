From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Dec 2017 21:53:48 +0100
Subject: [Buildroot] [RFCv3 11/15] package/pkg-generic: handle host-fakedate
 as a regular dependency
In-Reply-To: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171201205352.24287-12-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit moves the host-fakedate dependency handling from
DEPENDENCIES_HOST_PREREQ to a proper regular dependency handled by the
package infrastructure.

host-fakedate is added as dependency to all packages, except
host-skeleton, because we depend on it.

In addition, we make sure that host-fakedate does not grow a
dependency on host-{tar,xz,lzip,ccache} to avoid circular
dependencies. host-fakedate does not need any extraction tool and does
not need to build C/C++ code (the source code is just a shell script
available in Buildroot).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - New patch
---
 Makefile               |  1 -
 package/pkg-generic.mk | 14 ++++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 56bf083098..f31834682c 100644
--- a/Makefile
+++ b/Makefile
@@ -255,7 +255,6 @@ export LC_ALL = C
 export GZIP = -n
 BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH ?= $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
-DEPENDENCIES_HOST_PREREQ += host-fakedate
 endif
 
 # To put more focus on warnings, be less verbose as default
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index cb5889c9ef..7c5d951af9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -587,24 +587,30 @@ ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
 
-ifeq ($(filter host-tar host-skeleton,$(1)),)
+ifeq ($(filter host-tar host-skeleton host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
 endif
 
-ifeq ($(filter host-tar host-skeleton host-xz host-lzip,$(1)),)
+ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_XZCAT_HOST_DEPENDENCY)
 endif
 
-ifeq ($(filter host-tar host-skeleton host-xz host-lzip,$(1)),)
+ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_LZIP_HOST_DEPENDENCY)
 endif
 
 ifeq ($(BR2_CCACHE),y)
-ifeq ($(filter host-tar host-skeleton host-xz host-lzip,$(1)),)
+ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
 $(2)_DEPENDENCIES += host-ccache
 endif
 endif
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+ifeq ($(filter host-skeleton,$(1)),)
+$(2)_DEPENDENCIES += host-fakedate
+endif
+endif
+
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
-- 
2.13.6
