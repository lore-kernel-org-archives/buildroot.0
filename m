From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 15:02:26 +0200
Subject: [Buildroot] [git commit] Revert "binutils: get rid of host-texinfo
	dependency and other documentation tricks"
Message-ID: <20161009130312.13F4F816A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d71570e7791d65eb23d239a21fa927a60916ca81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit f7e7aea90dc83a175e86e577446811ae84f7b3db.

This change broke the build of the toolchain. See:

  http://autobuild.buildroot.net/results/90d0537bc12cbb2a7c6d344b3c6c9e1a5046d791/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4e87fcb..3a4a661 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -29,8 +29,19 @@ BINUTILS_LICENSE = GPLv3+, libiberty LGPLv2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 
 ifeq ($(BINUTILS_FROM_GIT),y)
-BINUTILS_DEPENDENCIES += host-flex host-bison
-HOST_BINUTILS_DEPENDENCIES += host-flex host-bison
+BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
+HOST_BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
+endif
+
+# The .info files in the >= 2.26 tarball have an incorrect timestamp,
+# so binutils tries to re-generate them. In order to avoid the
+# dependency on host-texinfo, we simply update the timestamps.
+ifeq ($(BR2_BINUTILS_VERSION_2_26_X)$(BR2_BINUTILS_VERSION_2_27_X),y)
+define BINUTILS_FIXUP_INFO_TIMESTAMPS
+	find $(@D) -name '*.info' -exec touch {} \;
+endef
+BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
+HOST_BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
 endif
 
 # When binutils sources are fetched from the binutils-gdb repository,
@@ -57,12 +68,8 @@ endif
 
 # Don't build documentation. It takes up extra space / build time,
 # and sometimes needs specific makeinfo versions to work
-BINUTILS_CONF_ENV += MAKEINFO=true
-BINUTILS_MAKE_OPTS += MAKEINFO=true
-BINUTILS_INSTALL_TARGET_OPTS += MAKEINFO=true
-HOST_BINUTILS_CONF_ENV += MAKEINFO=true
-HOST_BINUTILS_MAKE_OPTS += MAKEINFO=true
-HOST_BINUTILS_INSTALL_OPTS += MAKEINFO=true
+BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
+HOST_BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
 
 # gcc bug with Os/O2/O3, PR77311
 # error: unable to find a register to spill in class 'CCREGS'
@@ -102,7 +109,7 @@ HOST_BINUTILS_CONF_OPTS = \
 # binutils run configure script of subdirs at make time, so ensure
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
 define BINUTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) $(BINUTILS_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) -C $(@D)
 endef
 
 # We just want libbfd, libiberty and libopcodes,
