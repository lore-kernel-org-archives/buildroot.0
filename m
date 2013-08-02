From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 02 Aug 2013 09:33:54 +0200
Subject: [Buildroot] [PATCH 2 of 4] host-ccache: turn into a proper
	dependency
In-Reply-To: <patchbomb.1375428832@BEANTN0L019720>
References: <patchbomb.1375428832@BEANTN0L019720>
Message-ID: <f72fc9db6ce74195608e.1375428834@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch moves the host-ccache build target from BASE_TARGETS in Makefile
to an actual host prerequisite in support/dependencies. This causes
host-ccache to be built as part of the dependencies, before any real package
is built.
Since the dependencies are built without ccache anyway, there is no need to
set HOST_CCACHE_CONF_ENV anymore.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---

 Makefile                             |  4 ----
 package/ccache/ccache.mk             |  6 ------
 support/dependencies/dependencies.mk |  4 ++++
 3 files changed, 4 insertions(+), 10 deletions(-)


Note: this in itself works, when the dependencies are built (regular 'make'
for example, or explicit 'make dependencies'). However, if we want to
supersede patch http://patchwork.ozlabs.org/patch/257372/, that wants
the following to work:

$ make clean menuconfig
$ make {barebox,busybox,ctng,linux,uclibc}-menuconfig

then I think something additional is necessary. In the above flow, the
dependencies target is never used, so host-ccache doesn't get a chance to
build.

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -222,10 +222,6 @@ GNU_HOST_NAME:=$(shell support/gnuconfig
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
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -10,12 +10,6 @@ CCACHE_SOURCE  = ccache-$(CCACHE_VERSION
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
