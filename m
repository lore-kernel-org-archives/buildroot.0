From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Thu, 5 Sep 2013 17:03:04 -0500
Subject: [Buildroot] [PATCH 1/1] omniorb: new package
Message-ID: <1378418584-21899-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Target packages -> Libraries -> Networking -> OmniOrb

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/Config.in          |    1 +
 package/omniorb/Config.in  |   16 ++++++++++
 package/omniorb/omniorb.mk |   68 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 0 deletions(-)
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
index 0000000..4c8c3fc
--- /dev/null
+++ b/package/omniorb/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_OMNIORB
+	bool "omniorb"
+	help
+          omniORB is a robust high performance CORBA ORB for C++ and Python. 
+          omniORB is largely CORBA 2.6 compliant. omniORB is one of only three ORBs 
+          to have been awarded the Open Group's Open Brand for CORBA. This means that 
+          omniORB has been tested and certified CORBA compliant, to version 2.1 of the 
+          CORBA specification. You can find out more about the branding program at 
+          the Open Group.
+
+config BR2_OMNIORB_EXTRA_CONFIG_OPTIONS
+	string "Additional omniorb configuration options"
+	depends on BR2_PACKAGE_OMNIORB
+	default ""
+	help
+	  Any additional configure options you may want to include.
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
new file mode 100644
index 0000000..ed2a7e7
--- /dev/null
+++ b/package/omniorb/omniorb.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# omniorb 
+#
+################################################################################
+
+OMNIORB_VERSION = 4.1.6
+OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-${OMNIORB_VERSION}
+OMNIORB_SOURCE = omniORB-${OMNIORB_VERSION}.tar.bz2
+OMNIORB_INSTALL_STAGING = YES
+OMNIORB_INSTALL_TARGET = YES
+OMNIORB_DEPENDENCIES = python 
+OMNIORB_LICENSE = GPL2 LGPLv2.1
+OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
+
+OMNIORB_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_OMNIORB_EXTRA_CONFIG_OPTIONS))
+
+OMNIORB_CONF_OPT = $(OMNIORB_EXTRA_CONFIG_OPTIONS)
+
+# The following is a space-separated list of files that need to have directory fixups
+OMNIORB_FIXUP_FILES = ${STAGING_DIR}/usr/bin/omniidl
+
+define OMNIORB_INSTALL_STAGING_CMDS
+	echo "Installing to staging dir: $(STAGING_DIR)"
+	$(TARGET_MAKE_ENV) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_INSTALL_STAGING_OPT) -C $($(PKG)_SRCDIR)
+	for i in $(OMNIORB_FIXUP_FILES); do \
+	$(SED) "s:$(HOST_DIR)/usr:/usr:g" $$i; \
+	done
+endef
+
+define OMNIORB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $($(PKG)_SRCDIR)
+endef
+
+# OMNIORB has some host tools integrated into it's build.  We first build those, then use
+# the host IDL2CPP/depend tools to generate code for the target compilation
+define OMNIORB_BUILD_CMDS
+	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omkdepend
+	cp $($(PKG)_SRCDIR)src/tool/omkdepend/omkdepend $($(PKG)_SRCDIR)/bin
+	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omniidl/cxx/cccp
+	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omniidl/cxx
+	${TARGET_MAKE_ENV} ${MAKE} -C $($(PKG)_SRCDIR)
+endef
+
+define OMNIORB_CLEAN_CMDS
+	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omkdepend clean
+	$(RM) $($(PKG)_SRCDIR)/bin/omkdepend
+	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omniidl/cxx/cccp clean
+	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omniidl/cxx clean
+	${TARGET_MAKE_ENV} ${MAKE} -C $($(PKG)_SRCDIR) clean
+endef
+
+define OMNIORB_UNINSTALL_STAGING_CMDS
+	$(RM) -r ${STAGING_DIR}/usr/include/omniORB4 ${STAGING_DIR}/usr/include/omnithread
+	$(RM) ${STAGING_DIR}/usr/include/omniconfig.h ${STAGING_DIR}/usr/include/omnithread.h
+	$(RM) ${STAGING_DIR}/usr/lib/libomni*
+	$(RM) ${STAGING_DIR}/usr/bin/omni* ${STAGING_DIR}/usr/bin/omkdepend
+endef
+
+define OMNIORB_UNINSTALL_TARGET_CMDS
+	$(RM) -r ${TARGET_DIR}/usr/include/omniORB4 ${TARGET_DIR}/usr/include/omnithread
+	$(RM) ${TARGET_DIR}/usr/include/omniconfig.h ${TARGET_DIR}/usr/include/omnithread.h
+	$(RM) ${TARGET_DIR}/usr/lib/libomni*
+	$(RM) ${TARGET_DIR}/usr/bin/omni* ${TARGET_DIR}/usr/bin/omkdepend
+endef
+
+$(eval $(autotools-package))
+
-- 
1.7.1
