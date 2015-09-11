From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 19:29:01 +0200
Subject: [Buildroot] [git commit] gdb: prevent building the documentation
Message-ID: <20150911172918.D123F81933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3aecfbd03dd2a8d49c97f1e68df42b077dbbd396
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force gdb to not build the documentation. This way we avoid depending on
host-texinfo. This is a temporary fix until upstream accepts a proposed
--disable-docs configure option.

Since the documentation will not be build at all, we can remove the
parts related to host-texinfo and MAKEINFO in the gdb.mk file.

Fixes:

  http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Brendan Heading <brendanheading@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk |   18 +++++++-----------
 1 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 338de20..58a1232 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -11,13 +11,11 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
-GDB_FROM_GIT = y
 endif
 
 ifeq ($(BR2_microblaze),y)
 GDB_SITE = $(call github,Xilinx,gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
-GDB_FROM_GIT = y
 endif
 
 # Use .tar.bz2 for 7.7.x since there was no .tar.xz release back then
@@ -53,6 +51,13 @@ GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
+# Prevent gdb to build the documentation
+define GDB_DISABLE_DOC
+	$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
+endef
+GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
+HOST_GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
+
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
 # so we disable it.
@@ -165,15 +170,6 @@ else
 HOST_GDB_CONF_OPTS += --without-python
 endif
 
-ifeq ($(GDB_FROM_GIT),y)
-GDB_DEPENDENCIES += host-texinfo
-HOST_GDB_DEPENDENCIES += host-texinfo
-else
-# don't generate documentation
-GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
-HOST_GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
-endif
-
 # legacy $arch-linux-gdb symlink
 define HOST_GDB_ADD_SYMLINK
 	cd $(HOST_DIR)/usr/bin && \
