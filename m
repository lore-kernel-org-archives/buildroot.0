From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2014 15:02:45 +0100
Subject: [Buildroot] [git commit] omniorb: add option to build applications
	and services
Message-ID: <20140110141524.00E159C420@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4a28e6c5cb4c74649990f5256cf0f7971c1abec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/omniorb/Config.in  |   15 +++++++++++++--
 package/omniorb/omniorb.mk |   15 ++++++++++++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
index 192ad54..b8c4e0a 100644
--- a/package/omniorb/Config.in
+++ b/package/omniorb/Config.in
@@ -1,3 +1,7 @@
+
+comment "omniORB needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_OMNIORB
 	bool "omniorb"
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -11,5 +15,12 @@ config BR2_PACKAGE_OMNIORB
 
 	  http://omniorb.sourceforge.net/
 
-comment "omniORB needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+if BR2_PACKAGE_OMNIORB
+
+config BR2_PACKAGE_OMNIORB_WITH_APPS
+	bool "Enable Apps and Services"
+	help
+	  omniORB applications and services disabled by default
+	  embedded system build configuration.
+
+endif
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 490ff93..fa2492f 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -24,6 +24,19 @@ OMNIORB_INSTALL_TARGET = YES
 OMNIORB_CONF_OPT += --disable-longdouble
 HOST_OMNIORB_CONF_OPT += --disable-longdouble
 
+# The EmbeddedSystem define (set below in OMNIORB_ADJUST_TOOLDIR)
+# enables building of just the lib and disables building of
+# tools/apps/services.  In some cases the apps/services are still
+# required.  The tools however are host related and should never
+# be required on target.
+define OMNIORB_ENABLE_EXTRA_APPS
+$(SED) 's:SUBDIRS += lib:SUBDIRS += lib appl services:g' $(@D)/src/dir.mk
+endef
+
+ifeq ($(BR2_PACKAGE_OMNIORB_WITH_APPS),y)
+OMNIORB_POST_PATCH_HOOKS += OMNIORB_ENABLE_EXTRA_APPS
+endif
+
 # omniORB is not completely cross-compile friendly and has some
 # assumptions where a couple host tools must be built and then
 # used by the target build.  The host tools generate code from
@@ -32,7 +45,7 @@ HOST_OMNIORB_CONF_OPT += --disable-longdouble
 define OMNIORB_ADJUST_TOOLDIR
 	# Point to the host folder to get HOST_OMNIORB tools
 	$(SED) 's:TOOLBINDIR = $$(TOP)/$$(BINDIR):TOOLBINDIR = $(HOST_DIR)/usr/bin:g' $(@D)/mk/beforeauto.mk
-	# Disables OMNIORB tool building
+	# Disables OMNIORB app/service/tool building
 	echo "EmbeddedSystem=1" >> $(@D)/mk/beforeauto.mk
 endef
 OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_ADJUST_TOOLDIR
