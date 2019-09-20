From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 20 Sep 2019 18:31:04 +0300
Subject: [Buildroot] [PATCH 1/3] package/bubblewrap: new package
In-Reply-To: <20190920153106.2274596-1-aperez@igalia.com>
References: <20190920153106.2274596-1-aperez@igalia.com>
Message-ID: <20190920153106.2274596-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bubblewrap is a sandboxing tool based on kernel namespaces, typically
used as lower-level infastructure by other end-user tools e.g. Flatpak.

https://github.com/containers/bubblewrap

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/bubblewrap/Config.in       |  7 ++++++
 package/bubblewrap/bubblewrap.hash |  5 ++++
 package/bubblewrap/bubblewrap.mk   | 40 ++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/bubblewrap/Config.in
 create mode 100644 package/bubblewrap/bubblewrap.hash
 create mode 100644 package/bubblewrap/bubblewrap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 67a0fef088..bf23b3e1e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -73,6 +73,7 @@ F:	package/jack1/
 
 N:	Adrian Perez de Castro <aperez@igalia.com>
 F:	package/brotli/
+F:	package/bubblewrap/
 F:	package/cog/
 F:	package/libepoxy/
 F:	package/libwpe/
diff --git a/package/Config.in b/package/Config.in
index dbf297f4df..412ea1129f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2193,6 +2193,7 @@ menu "System tools"
 	source "package/atop/Config.in"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
+	source "package/bubblewrap/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/coreutils/Config.in"
diff --git a/package/bubblewrap/Config.in b/package/bubblewrap/Config.in
new file mode 100644
index 0000000000..a5220e3fd5
--- /dev/null
+++ b/package/bubblewrap/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BUBBLEWRAP
+	bool "bubblewrap"
+	select BR2_PACKAGE_LIBCAP
+	help
+	  Unprivileged sandbox tool based on Linux namespaces.
+
+	  https://github.com/projectatomic/bubblewrap
diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
new file mode 100644
index 0000000000..c8177d00f5
--- /dev/null
+++ b/package/bubblewrap/bubblewrap.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256 c6a45f51794a908b76833b132471397a7413f07620af08e76c273d9f7b364dff bubblewrap-0.3.3.tar.xz
+
+# Hash for license files:
+sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
new file mode 100644
index 0000000000..cb02594373
--- /dev/null
+++ b/package/bubblewrap/bubblewrap.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# bubblewrap
+#
+################################################################################
+
+BUBBLEWRAP_VERSION = 0.3.3
+BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
+BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
+BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
+
+BUBBLEWRAP_LICENSE = LGPL-2.0-or-later
+BUBBLEWRAP_LICENSE_FILES = COPYING
+
+BUBBLEWRAP_CONF_OPTS = \
+	--enable-require-userns=no \
+	--disable-man \
+	--disable-sudo \
+	--with-priv-mode=none
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+BUBBLEWRAP_CONF_OPTS += --with-bash-completion-dir=/usr/share/bash-completion/completions
+else
+BUBBLEWRAP_CONF_OPTS += --without-bash-completion-dir
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+BUBBLEWRAP_CONF_OPTS += --enable-selinux
+BUBBLEWRAP_DEPENDENCIES += libselinux
+else
+BUBBLEWRAP_CONF_OPTS += --disable-selinux
+endif
+
+# We need to mark bwrap as setuid, in case the kernel
+# has user namespaces disabled for non-root users.
+define BUBBLEWRAP_PERMISSIONS
+	/usr/bin/bwrap f 1755 0 0 - - - - -
+endef
+
+$(eval $(autotools-package))
-- 
2.23.0
