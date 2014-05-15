From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 15 May 2014 22:09:37 +0200
Subject: [Buildroot] [PATCH] Add Mono native/managed package.
Message-ID: <1400184577-3138-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package builds both the native and managed part
with all standard libraries and provides a complete
mono environment.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in                         |  1 +
 package/mono/Config.in                    |  7 +++++++
 package/mono/mono-managed/mono-managed.mk | 26 ++++++++++++++++++++++++++
 package/mono/mono-native/mono-native.mk   | 19 +++++++++++++++++++
 package/mono/mono.mk                      | 17 +++++++++++++++++
 5 files changed, 70 insertions(+)
 create mode 100644 package/mono/Config.in
 create mode 100644 package/mono/mono-managed/mono-managed.mk
 create mode 100644 package/mono/mono-native/mono-native.mk
 create mode 100644 package/mono/mono.mk

diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..52dc8f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -478,6 +478,7 @@ endmenu
 endif
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
+source "package/mono/Config.in"
 if BR2_PACKAGE_TCL
 menu "tcl libraries/modules"
 source "package/expect/Config.in"
diff --git a/package/mono/Config.in b/package/mono/Config.in
new file mode 100644
index 0000000..1fd45d9
--- /dev/null
+++ b/package/mono/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MONO
+	bool "mono"
+	select BR2_STRIP_none
+	help
+		An open source, cross-platform, implementation of C# and the CLR that is binary compatible with Microsoft.NET.
+
+		http://download.mono-project.com/sources/mono/
diff --git a/package/mono/mono-managed/mono-managed.mk b/package/mono/mono-managed/mono-managed.mk
new file mode 100644
index 0000000..94be274
--- /dev/null
+++ b/package/mono/mono-managed/mono-managed.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# mono-managed
+#
+#############################################################
+
+MONO_MANAGED_VERSION          = $(MONO_VERSION)
+MONO_MANAGED_SITE             = $(MONO_SITE)
+MONO_MANAGED_SOURCE           = $(MONO_SOURCE)
+
+HOST_MONO_MANAGED_CONF_OPT = \
+	$(MONO_CONF_OPT) \
+	--enable-static
+
+define MONO_MANAGED_GETMONOLITE
+     $(MAKE) -C $(@D) get-monolite-latest
+endef
+
+define MONO_MANAGED_INSTALL
+     cp -av $(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
+endef
+
+HOST_MONO_MANAGED_POST_CONFIGURE_HOOKS += MONO_MANAGED_GETMONOLITE
+HOST_MONO_MANAGED_POST_INSTALL_HOOKS   += MONO_MANAGED_INSTALL
+
+$(eval $(host-autotools-package))
diff --git a/package/mono/mono-native/mono-native.mk b/package/mono/mono-native/mono-native.mk
new file mode 100644
index 0000000..3d6b3bf
--- /dev/null
+++ b/package/mono/mono-native/mono-native.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# mono-native
+#
+#############################################################
+
+MONO_NATIVE_VERSION = $(MONO_VERSION)
+MONO_NATIVE_SITE    = $(MONO_SITE)
+MONO_NATIVE_SOURCE  = $(MONO_SOURCE)
+MONO_NATIVE_INSTALL_STAGING = $(MONO_INSTALL_STAGING)
+
+MONO_NATIVE_DEPENDENCIES += host-mono-managed
+
+# Disable managed code (mcs folder) from building
+MONO_NATIVE_CONF_OPT = \
+	$(MONO_CONF_OPT) \
+	--disable-mcs-build
+
+$(eval $(autotools-package))
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
new file mode 100644
index 0000000..7706190
--- /dev/null
+++ b/package/mono/mono.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# mono
+#
+#############################################################
+
+MONO_VERSION	= 3.2.8
+MONO_SITE	= http://download.mono-project.com/sources/mono/
+MONO_SOURCE	= mono-$(MONO_VERSION).tar.bz2
+MONO_INSTALL_STAGING = YES
+
+MONO_CONF_OPT = --disable-gtk-doc --with-mcs-docs=no 
+
+ifeq ($(BR2_PACKAGE_MONO),y)
+	include package/mono/*/*.mk
+	TARGETS += mono-native mono-managed
+endif
-- 
1.9.1
