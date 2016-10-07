From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  7 Oct 2016 22:09:17 +0200
Subject: [Buildroot] [PATCH 2/3] binutils: get rid of host-texinfo
	dependency and other documentation tricks
In-Reply-To: <1475870958-14790-1-git-send-email-patrickdepinguin@gmail.com>
References: <1475870958-14790-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1475870958-14790-2-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The binutils/host-binutils package applied several tricks to avoid building
info documentation. In the worst case, host-texinfo is added as dependency.

However, there is a simpler solution that removes the need for all these
tricks: instruct the makefiles to use a dummy makeinfo command ('true').

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/binutils/binutils.mk | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 3a4a661..b578854 100644
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
+BINUTILS_INSTALL_OPTS += MAKEINFO=true
+HOST_BINUTILS_CONF_ENV += MAKEINFO=true
+HOST_BINUTILS_MAKE_OPTS += MAKEINFO=true
+HOST_BINUTILS_INSTALL_OPTS += MAKEINFO=true
 
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
-- 
2.7.3
