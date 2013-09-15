From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 20:45:57 +0200
Subject: [Buildroot] [git commit] omniorb: new package
Message-ID: <20130915184623.241179B73F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f88689801a2c27d58974ceb5927c8319005605d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix C++ dependency and trailing spaces, drop ';' from fixup hook]
Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/omniorb/Config.in                          |   14 ++++++
 .../omniorb-0001-crosscompile-tool-export.patch    |   30 +++++++++++++
 package/omniorb/omniorb.mk                         |   46 ++++++++++++++++++++
 4 files changed, 91 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3ea4b4e..ca92812 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -626,6 +626,7 @@ source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/libwebsockets/Config.in"
 source "package/nss-mdns/Config.in"
+source "package/omniorb/Config.in"
 source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
 source "package/slirp/Config.in"
diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
new file mode 100644
index 0000000..d94603c
--- /dev/null
+++ b/package/omniorb/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_OMNIORB
+	bool "omniorb"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  omniORB is a robust high performance CORBA ORB for C++ and Python.
+	  omniORB is largely CORBA 2.6 compliant. omniORB is one of only
+	  three ORBs to have been awarded the Open Group's Open Brand for
+	  CORBA. This means that omniORB has been tested and certified
+	  CORBA compliant, to version 2.1 of the CORBA specification.
+
+	  http://omniorb.sourceforge.net/
+
+comment "omniORB requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/omniorb/omniorb-0001-crosscompile-tool-export.patch b/package/omniorb/omniorb-0001-crosscompile-tool-export.patch
new file mode 100644
index 0000000..260d86f
--- /dev/null
+++ b/package/omniorb/omniorb-0001-crosscompile-tool-export.patch
@@ -0,0 +1,30 @@
+beforeauto.mk.in: added support for overriding the configure time
+defined CC/CXX/RANLIB/CPP variables so that a couple pkg tools could be
+built which generate code during the cross compile build.
+
+http://www.omniorb-support.com/pipermail/omniorb-list/2013-September/031473.html
+
+Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
+
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
index 0000000..8a41dc7
--- /dev/null
+++ b/package/omniorb/omniorb.mk
@@ -0,0 +1,46 @@
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
+# omniORB is currently not cross-compile friendly and has some assumptions
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
+	$(SED) "s:$(HOST_DIR)/usr:/usr:g" $(STAGING_DIR)/usr/bin/omniidl
+endef
+OMNIORB_POST_INSTALL_STAGING_HOOKS += OMNIORB_FIXUP_FILE_PATHS_HOOK
+
+$(eval $(autotools-package))
