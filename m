From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:29 -0300
Subject: [Buildroot] [PATCH 15/25] vala: new package
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in      |    1 +
 package/vala/Config.in |   14 ++++++++++++++
 package/vala/vala.mk   |   15 +++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/vala/Config.in
 create mode 100644 package/vala/vala.mk

diff --git a/package/Config.in b/package/Config.in
index 03cf3ae..fad0f18 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -143,6 +143,7 @@ source "package/rdesktop/Config.in"
 source "package/sylpheed/Config.in"
 source "package/synergy/Config.in"
 source "package/torsmo/Config.in"
+source "package/vala/Config.in"
 source "package/x11vnc/Config.in"
 source "package/xstroke/Config.in"
 source "package/xterm/Config.in"
diff --git a/package/vala/Config.in b/package/vala/Config.in
new file mode 100644
index 0000000..89b4459
--- /dev/null
+++ b/package/vala/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_VALA
+	bool "vala"
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Compiler for the GObject type system.
+
+	  http://live.gnome.org/Vala
+
+comment "vala requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
new file mode 100644
index 0000000..b1217cb
--- /dev/null
+++ b/package/vala/vala.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# vala
+#
+#############################################################
+
+VALA_VERSION = 0.12.1
+VALA_SITE = http://download.gnome.org/sources/vala/0.12
+VALA_SOURCE = vala-$(VALA_VERSION).tar.bz2
+VALA_DEPENDENCIES = host-flex libglib2 \
+		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+HOST_VALA_DEPENDENCIES = host-flex host-libglib2
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.3.4
