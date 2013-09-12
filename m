From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Thu, 12 Sep 2013 15:32:41 -0500
Subject: [Buildroot] [PATCH v3] omniorb: new package
Message-ID: <1379017961-22950-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
Changes v2 -> v3
  * Removed depend on python as the mk accounts for it 
    package/omniorb/Config.in (suggested by Thomas)
  * Added link to website package/omniorb/Config.in (suggested by Thomas)
  * Added note about host python requirement for build 
    package/omniorb/omniorb.mk (suggested by Thomas)
  * Removed staging loop of fixing file paths for a single file.  Instead it 
    no just operates on a single file package/omniorb/omniorb.mk (suggested by Thomas)
  * Fixed brackets  package/omniorb/omniorb.mk (suggested by Thomas)
  * Cleaned up host tool comment  package/omniorb/omniorb.mk (suggested by Thomas)
  * Cleaned up host tools to use HOST_CONFIGURE_OPTS to fix ccache 
    support package/omniorb/omniorb.mk (suggested by Thomas)
  * Switched over to use a make tools export and clean hook.  Required
    patching of the package to correctly assign the CC/CXX/etc defines.
    Submitted this patch upsteam as well as including in this patchset.
    package/omniorb/omniorb.mk (suggested by Arnout)

Changes v1 -> v2:
  * Fixed formatting of help and added select of python in  package/omniorb/Config.in (suggested by Thomas)
  * Removed extra open ended config option as it isn't used  package/omniorb/Config.in (suggested by Thomas)
  * Cleaned up use of brackets and replaced with braces package/omniorb/Config.in (suggested by Thomas)
  * Updated licenses to be GPL and LGPL with a + package/omniorb/omniorb.mk (suggested by Thomas)
  * Removed redundant conf opt and target install sets package/omniorb/omniorb.mk (suggested by Thomas)
  * Added a post install step to replace overloading the default staging installs package/omniorb/omniorb.mk (suggested by Thomas)
  * Broke out tools(host) build into seperate post conf step package/omniorb/omniorb.mk (suggested by Thomas)
  * Removed clean and uninstall package/omniorb/omniorb.mk (suggested by Thomas)

 package/Config.in                                  |    1 +
 package/omniorb/Config.in                          |   10 ++++
 ...mniorb-0001-supportCrossCompileToolExport.patch |   27 +++++++++++
 package/omniorb/omniorb.mk                         |   47 ++++++++++++++++++++
 4 files changed, 85 insertions(+), 0 deletions(-)
 create mode 100644 package/omniorb/Config.in
 create mode 100644 package/omniorb/omniorb-0001-supportCrossCompileToolExport.patch
 create mode 100644 package/omniorb/omniorb.mk

diff --git a/package/Config.in b/package/Config.in
index 02e5afc..820fae2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -624,6 +624,7 @@ source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/libwebsockets/Config.in"
 source "package/nss-mdns/Config.in"
+source "package/omniorb/Config.in"
 source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
 source "package/slirp/Config.in"
diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
new file mode 100644
index 0000000..327de03
--- /dev/null
+++ b/package/omniorb/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_OMNIORB
+	bool "omniorb"
+	help
+	  omniORB is a robust high performance CORBA ORB for C++ and Python.
+	  omniORB is largely CORBA 2.6 compliant. omniORB is one of only 
+	  three ORBs to have been awarded the Open Group's Open Brand for 
+	  CORBA. This means that omniORB has been tested and certified 
+	  CORBA compliant, to version 2.1 of the CORBA specification. 
+
+	  http://omniorb.sourceforge.net/
diff --git a/package/omniorb/omniorb-0001-supportCrossCompileToolExport.patch b/package/omniorb/omniorb-0001-supportCrossCompileToolExport.patch
new file mode 100644
index 0000000..20643a0
--- /dev/null
+++ b/package/omniorb/omniorb-0001-supportCrossCompileToolExport.patch
@@ -0,0 +1,27 @@
+
+This patch has been posted upstream (mlweber1 at rockwellcollins.com) 09/12/2013.
+
+Index: omniorb-4.1.6/mk/beforeauto.mk.in
+===================================================================
+--- omniorb-4.1.6.orig/mk/beforeauto.mk.in	2013-09-12 12:49:55.668708148 -0500
++++ omniorb-4.1.6/mk/beforeauto.mk.in	2013-09-12 12:51:22.707928579 -0500
+@@ -672,15 +672,15 @@
+ #
+ 
+ AR              = ar cq
+-CC              = @CC@
+-CXX             = @CXX@
+-RANLIB		= @RANLIB@
++CC		?= @CC@
++CXX		?= @CXX@
++RANLIB		?= @RANLIB@
+ MKDIRHIER	= $(BASE_OMNI_TREE)/bin/scripts/omkdirhier
+ INSTLIBFLAGS	= -m 0644
+ INSTEXEFLAGS	= -m 0755
+ CP		= cp
+ MV		= mv -f
+-CPP		= @CPP@
++CPP		?= @CPP@
+ OMKDEPEND	= $(TOOLBINDIR)/omkdepend
+ RMDIRHIER	= $(RM) -rf
+ 
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
new file mode 100644
index 0000000..5dd1a98
--- /dev/null
+++ b/package/omniorb/omniorb.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# omniorb
+#
+################################################################################
+
+OMNIORB_VERSION = 4.1.6
+OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
+OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
+OMNIORB_INSTALL_STAGING = YES
+OMNIORB_LICENSE = GPL2+ LGPLv2.1+
+OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
+# Required for internal code generation scripts
+OMNIORB_DEPENDENCIES = host-python
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+	OMNIORB_DEPENDENCIES += python
+	OMNIORB_CONF_OPT += --enable-python-bindings
+else
+	OMNIORB_CONF_OPT += --disable-python-bindings
+endif
+
+# OMNIORB is currently not cross-compile friendly and has some assumptions 
+# where a couple host tools are built in place and then used during the 
+# build.  The tools generate code from the IDL description language, which 
+# is then built into the cross compiled OMNIORB application.
+# So this first hook builds the tools required for the host side 
+# generation of code. Then the second hook cleans up before the install.
+define OMNIORB_BUILD_TOOLS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		-C $(@D)/src/tool export
+endef
+OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_BUILD_TOOLS
+
+define OMNIORB_CLEAN_TOOLS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		-C $(@D)/src/tool clean
+endef
+OMNIORB_POST_BUILD_HOOKS += OMNIORB_CLEAN_TOOLS
+
+define OMNIORB_FIXUP_FILE_PATHS_HOOK
+	$(SED) "s:$(HOST_DIR)/usr:/usr:g" $(STAGING_DIR)/usr/bin/omniidl;
+endef
+OMNIORB_POST_INSTALL_STAGING_HOOKS += OMNIORB_FIXUP_FILE_PATHS_HOOK 
+
+$(eval $(autotools-package))
+
-- 
1.7.1
