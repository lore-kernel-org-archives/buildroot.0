From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:50:29 +0200
Subject: [Buildroot] [git commit] package/pkg-generic: handle host-fakedate
 as a regular dependency
Message-ID: <20180325155336.2530D801CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38d1c4aae36650816e464b5800f6aba86ebc1f9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               |  1 -
 package/pkg-generic.mk | 14 ++++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 33c87b5ebb..925d6e4aec 100644
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
index bc4882235f..6d1f267328 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -555,24 +555,30 @@ ifneq ($(1),host-skeleton)
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
-ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-ccache,$(1)),)
+ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
 $(2)_DEPENDENCIES += host-ccache
 endif
 endif
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+ifeq ($(filter host-skeleton host-fakedate,$(1)),)
+$(2)_DEPENDENCIES += host-fakedate
+endif
+endif
+
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
