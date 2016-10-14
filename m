From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 19:40:09 +0200
Subject: [Buildroot] [git commit] binutils: get rid of host-texinfo
	dependency and other documentation tricks
Message-ID: <20161014181012.A040F822CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4ebc1c1de6d2bb9090cd99253a3e84dff9d87e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The binutils/host-binutils package applied several tricks to avoid building
info documentation. In the worst case, host-texinfo is added as dependency.

However, there is a simpler solution that removes the need for all these
tricks: instruct the makefiles to use a dummy makeinfo command ('true').

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/binutils.mk | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 3a4a661..966cc79 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -29,19 +29,8 @@ BINUTILS_LICENSE = GPLv3+, libiberty LGPLv2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 
 ifeq ($(BINUTILS_FROM_GIT),y)
-BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
-HOST_BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
-endif
-
-# The .info files in the >= 2.26 tarball have an incorrect timestamp,
-# so binutils tries to re-generate them. In order to avoid the
-# dependency on host-texinfo, we simply update the timestamps.
-ifeq ($(BR2_BINUTILS_VERSION_2_26_X)$(BR2_BINUTILS_VERSION_2_27_X),y)
-define BINUTILS_FIXUP_INFO_TIMESTAMPS
-	find $(@D) -name '*.info' -exec touch {} \;
-endef
-BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
-HOST_BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
+BINUTILS_DEPENDENCIES += host-flex host-bison
+HOST_BINUTILS_DEPENDENCIES += host-flex host-bison
 endif
 
 # When binutils sources are fetched from the binutils-gdb repository,
@@ -68,8 +57,12 @@ endif
 
 # Don't build documentation. It takes up extra space / build time,
 # and sometimes needs specific makeinfo versions to work
-BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
-HOST_BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
+BINUTILS_CONF_ENV += MAKEINFO=true
+BINUTILS_MAKE_OPTS += MAKEINFO=true
+BINUTILS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MAKEINFO=true install
+HOST_BINUTILS_CONF_ENV += MAKEINFO=true
+HOST_BINUTILS_MAKE_OPTS += MAKEINFO=true
+HOST_BINUTILS_INSTALL_OPTS += MAKEINFO=true install
 
 # gcc bug with Os/O2/O3, PR77311
 # error: unable to find a register to spill in class 'CCREGS'
@@ -109,7 +102,7 @@ HOST_BINUTILS_CONF_OPTS = \
 # binutils run configure script of subdirs at make time, so ensure
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
 define BINUTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) $(BINUTILS_MAKE_OPTS) -C $(@D)
 endef
 
 # We just want libbfd, libiberty and libopcodes,
