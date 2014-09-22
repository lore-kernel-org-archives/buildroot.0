From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 22 Sep 2014 14:34:17 +0200
Subject: [Buildroot] [PATCH] package/mono: new package
Message-ID: <1411389257-25920-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the complete Mono implementation. This patch compiles
both the native and managed parts.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---

This is my third attempt, I hope this time it will be considered.
Thi patch bump to the last 3.8.0 version.

 package/Config.in                         |  1 +
 package/mono/Config.in                    |  7 +++++++
 package/mono/mono-managed/mono-managed.mk | 26 ++++++++++++++++++++++++++
 package/mono/mono-native/mono-native.mk   | 19 +++++++++++++++++++
 package/mono/mono.mk                      | 18 ++++++++++++++++++
 5 files changed, 71 insertions(+)
 create mode 100644 package/mono/Config.in
 create mode 100644 package/mono/mono-managed/mono-managed.mk
 create mode 100644 package/mono/mono-native/mono-native.mk
 create mode 100644 package/mono/mono.mk

diff --git a/package/Config.in b/package/Config.in
index 2eefc3f..8a42846 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -432,6 +432,7 @@ menu "Lua libraries/modules"
 	source "package/xavante/Config.in"
 endmenu
 endif
+	source "package/mono/Config.in"
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
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
index 0000000..6940ceb
--- /dev/null
+++ b/package/mono/mono.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# mono
+#
+#############################################################
+
+MONO_VERSION	= 3.8.0
+MONO_SITE	= http://download.mono-project.com/sources/mono/
+MONO_SOURCE	= mono-$(MONO_VERSION).tar.bz2
+MONO_INSTALL_STAGING = YES
+
+MONO_CONF_OPT = --disable-gtk-doc \
+		--with-mcs-docs=no 
+
+ifeq ($(BR2_PACKAGE_MONO),y)
+	include package/mono/*/*.mk
+	TARGETS += mono-native mono-managed
+endif
-- 
2.1.0
