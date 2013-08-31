From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] host-ccache: turn into a proper dependency
Message-ID: <20130831213336.E6BA99B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db443f263a6d51ce6da6557d825a453676f6c664
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch moves the host-ccache build target from BASE_TARGETS in Makefile
to an actual host prerequisite in support/dependencies. This causes
host-ccache to be built as part of the dependencies, before any real package
is built.
Since the dependencies are built without ccache anyway, there is no need to
set HOST_CCACHE_CONF_ENV anymore.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                             |    4 ----
 package/ccache/ccache.mk             |    6 ------
 support/dependencies/dependencies.mk |    4 ++++
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index caa1e38..65127b2 100644
--- a/Makefile
+++ b/Makefile
@@ -222,10 +222,6 @@ GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 #
 ################################################################################
 
-ifeq ($(BR2_CCACHE),y)
-BASE_TARGETS += host-ccache
-endif
-
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BASE_TARGETS += toolchain-buildroot
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index c5cb966..bead908 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -10,12 +10,6 @@ CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
 CCACHE_LICENSE = GPLv3+, others
 CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 
-# When ccache is being built for the host, ccache is not yet
-# available, so we have to use the special C compiler without the
-# cache.
-HOST_CCACHE_CONF_ENV = \
-	CC="$(HOSTCC_NOCCACHE)"
-
 # Force ccache to use its internal zlib. The problem is that without
 # this, ccache would link against the zlib of the build system, but we
 # might build and install a different version of zlib in $(O)/host
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 934da40..4a220e0 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ+=host-sstrip
 endif
 
+ifeq ($(BR2_CCACHE),y)
+DEPENDENCIES_HOST_PREREQ += host-ccache
+endif
+
 core-dependencies:
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
