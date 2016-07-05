From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2016 11:46:57 +0200
Subject: [Buildroot] [PATCH 3/5] gdb: add dependency on host-texinfo
In-Reply-To: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467712019-24632-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like binutils, when gdb is fetched from git, it wants to
re-generate its documentation. We were trying to avoid that by patching
the Makefiles, but it wasn't working in all situations.

So, we simply add a dependency on host-texinfo when gdb is fetched from
git, and remove our hackhish work-around.

Fixes:

  http://autobuild.buildroot.net/results/80e63edc009d23cb939880a6f5ae2f220f07a96a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 84f2029..c9c6bd1 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -11,11 +11,13 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+GDB_FROM_GIT = y
 endif
 
 ifeq ($(BR2_microblaze),y)
 GDB_SITE = $(call github,Xilinx,gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+GDB_FROM_GIT = y
 endif
 
 GDB_LICENSE = GPLv2+, LGPLv2+, GPLv3+, LGPLv3+
@@ -46,18 +48,10 @@ GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
-# Prevent gdb to build the documentation
-define GDB_DISABLE_DOC
-	$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
-	if test -e $(@D)/bfd/doc/Makefile.in ; then \
-		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/bfd/doc/Makefile.in ; \
-	fi
-	if test -e $(@D)/gprof/Makefile.in ; then \
-		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/gprof/Makefile.in ; \
-	fi
-endef
-GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
-HOST_GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
+ifeq ($(GDB_FROM_GIT),y)
+GDB_DEPENDENCIES += host-texinfo
+HOST_GDB_DEPENDENCIES += host-texinfo
+endif
 
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
-- 
2.7.4
