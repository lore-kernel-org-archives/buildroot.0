From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jul 2015 14:29:03 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 4.1.1
Message-ID: <20150707123246.48E1B818B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85945aad91354a3a62fdc73d5be121229b714bce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now with local header for tipc support on older kernels.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-make-build-conditional-on-having-libmnl.patch |   33 --------------------
 package/iproute2/iproute2.hash                     |    2 +-
 package/iproute2/iproute2.mk                       |   14 ++------
 3 files changed, 4 insertions(+), 45 deletions(-)

diff --git a/package/iproute2/0001-tipc-make-build-conditional-on-having-libmnl.patch b/package/iproute2/0001-tipc-make-build-conditional-on-having-libmnl.patch
deleted file mode 100644
index ccd1daf..0000000
--- a/package/iproute2/0001-tipc-make-build-conditional-on-having-libmnl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From db17dd9728b77485f26abb1ac5fcda65130f4a8d Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 27 Jun 2015 08:08:51 -0300
-Subject: [PATCHv2 iproute2] tipc: make build conditional on having libmnl
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- tipc/Makefile | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/tipc/Makefile b/tipc/Makefile
-index 4bda8c5..b3ef9b9 100644
---- a/tipc/Makefile
-+++ b/tipc/Makefile
-@@ -1,3 +1,6 @@
-+include ../Config
-+ifeq ($(HAVE_MNL),y)
-+
- TIPCOBJ=bearer.o \
-     cmdl.o link.o \
-     media.o misc.o \
-@@ -8,6 +11,8 @@ TIPCOBJ=bearer.o \
- TARGETS=tipc
- LDLIBS += -lmnl
- 
-+endif
-+
- all: $(TARGETS) $(LIBS)
- 
- tipc: $(TIPCOBJ)
--- 
-2.3.6
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 659e275..2263e89 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	d1326696c6a8f81ba66aaf48d858005cf280c81d3284d8d2c99748e3d0746146	iproute2-4.1.0.tar.xz
+sha256	73077a989efb934450bd655cbd9aaddaa747cb696c64d0c9a3323768a6a8e66f	iproute2-4.1.1.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index b2627ec..c42c5c9 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.1.0
+IPROUTE2_VERSION = 4.1.1
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
-IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf
+IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBMNL),libmnl)
 IPROUTE2_LICENSE = GPLv2
 IPROUTE2_LICENSE_FILES = COPYING
 
@@ -17,15 +18,6 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 IPROUTE2_DEPENDENCIES += busybox
 endif
 
-# tipc support needs 3.18+ headers and libmnl
-ifeq ($(BR2_PACKAGE_LIBMNL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18),yy)
-IPROUTE2_DEPENDENCIES += libmnl
-else
-define IPROUTE2_DISABLE_TIPC
-	$(SED) '/HAVE_MNL/d' $(@D)/Config
-endef
-endif
-
 # If we've got iptables enable xtables support for tc
 ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
