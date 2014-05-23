From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 23 May 2014 16:50:20 +0200
Subject: [Buildroot] [PATCH v2] Add Mono native/managed package
Message-ID: <1400856620-12562-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package builds both the native and managed part
with all standard libraries and provides a complete
mono environment, it's based on latest mono version 3.4.0.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in                                  |  1 +
 package/mono/Config.in                             |  7 ++++++
 ...anaged-0001-fixes-lacking-of-targets-file.patch | 13 +++++++++++
 package/mono/mono-managed/mono-managed.mk          | 27 ++++++++++++++++++++++
 package/mono/mono-native/mono-native.mk            | 17 ++++++++++++++
 package/mono/mono.mk                               | 14 +++++++++++
 6 files changed, 79 insertions(+)
 create mode 100644 package/mono/Config.in
 create mode 100644 package/mono/mono-managed/mono-managed-0001-fixes-lacking-of-targets-file.patch
 create mode 100644 package/mono/mono-managed/mono-managed.mk
 create mode 100644 package/mono/mono-native/mono-native.mk
 create mode 100644 package/mono/mono.mk

diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..5e0068e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -415,6 +415,7 @@ source "package/wsapi/Config.in"
 source "package/xavante/Config.in"
 endmenu
 endif
+source "package/mono/Config.in"
 source "package/nodejs/Config.in"
 source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/mono/Config.in b/package/mono/Config.in
new file mode 100644
index 0000000..5451f36
--- /dev/null
+++ b/package/mono/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MONO
+	bool "mono"
+	select BR2_STRIP_none
+	help
+	  An open source, cross-platform, implementation of C# and the CLR that is binary compatible with Microsoft.NET.
+	  
+	  http://download.mono-project.com/sources/mono/
diff --git a/package/mono/mono-managed/mono-managed-0001-fixes-lacking-of-targets-file.patch b/package/mono/mono-managed/mono-managed-0001-fixes-lacking-of-targets-file.patch
new file mode 100644
index 0000000..a9213e1
--- /dev/null
+++ b/package/mono/mono-managed/mono-managed-0001-fixes-lacking-of-targets-file.patch
@@ -0,0 +1,13 @@
+diff --git a/mcs/tools/xbuild/targets/Microsoft.Portable.Common.targets b/mcs/tools/xbuild/targets/Microsoft.Portable.Common.targets
+new file mode 100644
+index 0000000..82bea1e
+--- /dev/null
++++ b/mcs/tools/xbuild/targets/Microsoft.Portable.Common.targets
+@@ -0,0 +1,4 @@
++<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
++	<Import Project="..\Microsoft.Portable.Core.props" />
++	<Import Project="..\Microsoft.Portable.Core.targets" />
++</Project>
+-- 
+1.9.3
+
diff --git a/package/mono/mono-managed/mono-managed.mk b/package/mono/mono-managed/mono-managed.mk
new file mode 100644
index 0000000..3f7b581
--- /dev/null
+++ b/package/mono/mono-managed/mono-managed.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# mono-managed
+#
+#############################################################
+
+MONO_MANAGED_VERSION = $(MONO_VERSION)
+MONO_MANAGED_SITE = $(MONO_SITE)
+MONO_MANAGED_SOURCE = $(MONO_SOURCE)
+
+# Enable static, otherwise Mono complains and the build fails
+HOST_MONO_MANAGED_CONF_OPT = $(MONO_CONF_OPT) --enable-static
+
+define MONO_MANAGED_GETMONOLITE
+	$(MAKE) -C $(@D) get-monolite-latest
+endef
+
+HOST_MONO_MANAGED_POST_CONFIGURE_HOOKS += MONO_MANAGED_GETMONOLITE
+
+define MONO_MANAGED_INSTALL
+     cp -av $(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
+     cp -av $(HOST_DIR)/etc/mono/ $(TARGET_DIR)/etc/
+endef
+
+HOST_MONO_MANAGED_POST_INSTALL_HOOKS += MONO_MANAGED_INSTALL
+
+$(eval $(host-autotools-package))
diff --git a/package/mono/mono-native/mono-native.mk b/package/mono/mono-native/mono-native.mk
new file mode 100644
index 0000000..4656248
--- /dev/null
+++ b/package/mono/mono-native/mono-native.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# mono-native
+#
+#############################################################
+
+MONO_NATIVE_VERSION = $(MONO_VERSION)
+MONO_NATIVE_SITE = $(MONO_SITE)
+MONO_NATIVE_SOURCE = $(MONO_SOURCE)
+MONO_NATIVE_INSTALL_STAGING = $(MONO_INSTALL_STAGING)
+
+MONO_NATIVE_DEPENDENCIES += host-mono-managed
+
+# Disable managed code (mcs folder) from building
+MONO_NATIVE_CONF_OPT = $(MONO_CONF_OPT) --disable-mcs-build
+
+$(eval $(autotools-package))
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
new file mode 100644
index 0000000..830b469
--- /dev/null
+++ b/package/mono/mono.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# mono
+#
+#############################################################
+
+MONO_VERSION = 3.4.0
+MONO_SITE = http://download.mono-project.com/sources/mono/
+MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
+MONO_INSTALL_STAGING = YES
+
+MONO_CONF_OPT = --disable-gtk-doc --with-mcs-docs=no 
+
+include package/mono/*/*.mk
-- 
1.9.1
