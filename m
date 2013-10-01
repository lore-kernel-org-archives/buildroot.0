From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Tue, 1 Oct 2013 15:34:19 -0500
Subject: [Buildroot] [PATCH v2] omniorb: cleanup autobuild failure,
	CFLAGS issue
Message-ID: <1380659659-886-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed:
http://autobuild.buildroot.net/results/a08baf8821e3ee1fb9c36c8f74c4ced466af167b/
http://autobuild.buildroot.net/results/f0c7379c1f405385d3a64c0349c3d9565065e8a7/
http://autobuild.buildroot.net/results/c3de25ca52fdb8ffda7472cf9f7b64514954cbb1/

Change Log:
The target CFLAGS were getting mixed in during a manual build of some
omniorb pkg tools that could be viewed as host tools.
This manual build was a dirty workaround and created some bad
cornercases. So I converted the package over to actually using the
host pkg build and removed the need for a patch and custom mods in the build.

Also there wasn't a dependency on the target having python, just
host-python for performing the initial build.  So depends were adjusted
accordingly. If python bindings are required, they can be found in a different
package called omniORBpy.  The omniORB package only uses python for
the build process.

Fixed a bug with long double support.  Currently leaving it disabled
as most targets won't use it.  This allows greater toolchain compatibility.

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
Changes v1 -> v2:
  * Moved host dependencies up by target depends
       package/omniorb/Config.in (suggested by Arnout)
  * Added host conf opt to also host disable longdouble
      (host and target are forced to match, since tools share headers)
  * Renamed post config hook
       package/omniorb/Config.in (suggested by Arnout)

 package/omniorb/omniorb.mk |   53 ++++++++++++++++++++------------------------
 1 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 8a41dc7..490ff93 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -10,37 +10,32 @@ OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
 OMNIORB_LICENSE = GPL2+ LGPLv2.1+
 OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
-# Required for internal code generation scripts
-OMNIORB_DEPENDENCIES = host-python
+OMNIORB_DEPENDENCIES = host-omniorb
+HOST_OMNIORB_DEPENDENCIES = host-python
+OMNIORB_INSTALL_TARGET = YES
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-	OMNIORB_DEPENDENCIES += python
-	OMNIORB_CONF_OPT += --enable-python-bindings
-else
-	OMNIORB_CONF_OPT += --disable-python-bindings
-endif
+# Defaulting long double support to a safe option for the
+# mix of embedded targets, this could later be automated
+# based on checking the capability of the cross toolchain
+# for "__LONG_DOUBLE_128__".  Currently the host and target
+# need to match because of the code generation done by the
+# host tools during the target compile (ie headers generated
+# on host are used in target build).
+OMNIORB_CONF_OPT += --disable-longdouble
+HOST_OMNIORB_CONF_OPT += --disable-longdouble
 
-# omniORB is currently not cross-compile friendly and has some assumptions
-# where a couple host tools are built in place and then used during the
-# build.  The tools generate code from the IDL description language, which
-# is then built into the cross compiled OMNIORB application.
-# So this first hook builds the tools required for the host side
-# generation of code. Then the second hook cleans up before the install.
-define OMNIORB_BUILD_TOOLS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
-		-C $(@D)/src/tool export
+# omniORB is not completely cross-compile friendly and has some
+# assumptions where a couple host tools must be built and then
+# used by the target build.  The host tools generate code from
+# the IDL description language, which is then built into the
+# cross compiled target OMNIORB application.
+define OMNIORB_ADJUST_TOOLDIR
+	# Point to the host folder to get HOST_OMNIORB tools
+	$(SED) 's:TOOLBINDIR = $$(TOP)/$$(BINDIR):TOOLBINDIR = $(HOST_DIR)/usr/bin:g' $(@D)/mk/beforeauto.mk
+	# Disables OMNIORB tool building
+	echo "EmbeddedSystem=1" >> $(@D)/mk/beforeauto.mk
 endef
-OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_BUILD_TOOLS
-
-define OMNIORB_CLEAN_TOOLS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
-		-C $(@D)/src/tool clean
-endef
-OMNIORB_POST_BUILD_HOOKS += OMNIORB_CLEAN_TOOLS
-
-define OMNIORB_FIXUP_FILE_PATHS_HOOK
-	$(SED) "s:$(HOST_DIR)/usr:/usr:g" $(STAGING_DIR)/usr/bin/omniidl
-endef
-OMNIORB_POST_INSTALL_STAGING_HOOKS += OMNIORB_FIXUP_FILE_PATHS_HOOK
+OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_ADJUST_TOOLDIR
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.1
