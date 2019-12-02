From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 17:27:30 +0100
Subject: [Buildroot] [git commit] package/bubblewrap: new package
Message-ID: <20191202162015.118C483A1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f4bdc8fd1b05cc4f7d72afa9d7c951911fd3356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bubblewrap is a sandboxing tool based on kernel namespaces, typically
used as lower-level infastructure by other end-user tools e.g. Flatpak.

https://github.com/containers/bubblewrap

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Peter: needs mmu and !musl toolchain]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/bubblewrap/Config.in       | 13 +++++++++++++
 package/bubblewrap/bubblewrap.hash |  5 +++++
 package/bubblewrap/bubblewrap.mk   | 40 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e6c44b0671..a1f94df951 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -81,6 +81,7 @@ F:	package/jack1/
 
 N:	Adrian Perez de Castro <aperez@igalia.com>
 F:	package/brotli/
+F:	package/bubblewrap/
 F:	package/cog/
 F:	package/libepoxy/
 F:	package/libwpe/
diff --git a/package/Config.in b/package/Config.in
index 37861387e8..9e2b78fe6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2237,6 +2237,7 @@ menu "System tools"
 	source "package/atop/Config.in"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
+	source "package/bubblewrap/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/coreutils/Config.in"
diff --git a/package/bubblewrap/Config.in b/package/bubblewrap/Config.in
new file mode 100644
index 0000000000..b83f046c82
--- /dev/null
+++ b/package/bubblewrap/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_BUBBLEWRAP
+	bool "bubblewrap"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # TEMP_FAILURE_RETRY
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBCAP
+	help
+	  Unprivileged sandbox tool based on Linux namespaces.
+
+	  https://github.com/projectatomic/bubblewrap
+
+comment "bubblewrap needs a glibc or uclibc toolchain"
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+	depends on BR2_USE_MMU
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
index 0000000000..83bbb1b234
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
+BUBBLEWRAP_LICENSE = LGPL-2.0+
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
