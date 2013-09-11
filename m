From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Wed, 11 Sep 2013 13:13:59 -0500
Subject: [Buildroot] [PATCH v2] omniorb: new package
Message-ID: <1378923239-30344-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
Changes v1 -> v2:
  * Fixed formatting of help and added select of python in  package/omniorb/Config.in (suggested by Thomas)
  * Removed extra open ended config option as it isn't used  package/omniorb/Config.in (suggested by Thomas)
  * Cleaned up use of brackets and replaced with braces package/omniorb/Config.in (suggested by Thomas)
  * Updated licenses to be GPL and LGPL with a + package/omniorb/omniorb.mk (suggested by Thomas)
  * Removed redundant conf opt and target install sets package/omniorb/omniorb.mk (suggested by Thomas)
  * Added a post install step to replace overloading the default staging installs package/omniorb/omniorb.mk (suggested by Thomas)
  * Broke out tools(host) build into seperate post conf step package/omniorb/omniorb.mk (suggested by Thomas)
  * Removed clean and uninstall package/omniorb/omniorb.mk (suggested by Thomas)

 package/Config.in          |    1 +
 package/omniorb/Config.in  |    9 ++++++++
 package/omniorb/omniorb.mk |   50 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 package/omniorb/Config.in
 create mode 100644 package/omniorb/omniorb.mk

diff --git a/package/Config.in b/package/Config.in
index a94cb62..b4cc869 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -600,6 +600,7 @@ source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/libwebsockets/Config.in"
 source "package/nss-mdns/Config.in"
+source "package/omniorb/Config.in"
 source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
 source "package/slirp/Config.in"
diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
new file mode 100644
index 0000000..eaa1585
--- /dev/null
+++ b/package/omniorb/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OMNIORB
+	bool "omniorb"
+	select BR2_PACKAGE_PYTHON
+	help
+	  omniORB is a robust high performance CORBA ORB for C++ and Python.
+	  omniORB is largely CORBA 2.6 compliant. omniORB is one of only 
+	  three ORBs to have been awarded the Open Group's Open Brand for 
+	  CORBA. This means that omniORB has been tested and certified 
+	  CORBA compliant, to version 2.1 of the CORBA specification. 
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
new file mode 100644
index 0000000..15f7ced
--- /dev/null
+++ b/package/omniorb/omniorb.mk
@@ -0,0 +1,50 @@
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
+OMNIORB_DEPENDENCIES += host-python
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+	OMNIORB_DEPENDENCIES += python
+	OMNIORB_CONF_OPT += --enable-python-bindings
+else
+	OMNIORB_CONF_OPT += --disable-python-bindings
+endif
+
+
+# The following is a space-separated list of files that need to have directory fixups
+OMNIORB_FIXUP_FILES = ${STAGING_DIR}/usr/bin/omniidl
+
+# Should be able to create a patch that cleans this up.........
+define OMNIORB_FIXUP_FILE_PATHS_HOOK
+	echo "Fixing file paths..."
+	for i in $(OMNIORB_FIXUP_FILES); do \
+	$(SED) "s:$(HOST_DIR)/usr:/usr:g" $$i; \
+	done
+endef
+OMNIORB_POST_INSTALL_STAGING_HOOKS += OMNIORB_FIXUP_FILE_PATHS_HOOK 
+
+# OMNIORB is currently not cross-compile friendly and has some assumptions where
+# a couple host tools are built in place and then used during the build.  The tools
+# generate code from the IDL description language, which is then built into the 
+# cross compiled OMNIORB application.
+# So this hook first builds the couple tools required for the host side generation of code.
+# It then leaves/places them in the locations where the existing build infrastructure expects.
+define OMNIORB_TOOLS_HOOK
+	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $(@D)/src/tool/omkdepend
+	cp $(@D)/src/tool/omkdepend/omkdepend $(@D)/bin/
+	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $(@D)/src/tool/omniidl/cxx/cccp
+	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $(@D)/src/tool/omniidl/cxx
+endef
+OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_TOOLS_HOOK
+
+$(eval $(autotools-package))
+
-- 
1.7.1
