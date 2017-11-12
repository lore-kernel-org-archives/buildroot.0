From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 12 Nov 2017 22:06:09 +0100
Subject: [Buildroot] [PATCH v8] libostree: new package
Message-ID: <20171112210609.12275-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OSTree is an upgrade system for Linux-based operating systems

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
v8:
- fix typo in comment

v7:
Fix comments from Bernd Kuhls:
- add "comment"-section in Config.in
- add hash of the license file 
v6:
- Rearrange logic for curl and libsoup check

v5:
Fix comments from Bernd Kuhls:
- use tarball provided by upstream
- propagate dependencies
- set optional dependencies
- depend on !musl

v4:
- bump version to 2017.12

v3:
- move with the package within Config.in to match the chronological order
  (the former name was just 'ostree')

v2:
- add e2fsprogs as dependency
 DEVELOPERS                       |  3 ++
 package/Config.in                |  1 +
 package/libostree/Config.in      | 26 ++++++++++++++++++
 package/libostree/libostree.hash |  3 ++
 package/libostree/libostree.mk   | 59 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 92 insertions(+)
 create mode 100644 package/libostree/Config.in
 create mode 100644 package/libostree/libostree.hash
 create mode 100644 package/libostree/libostree.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ddd675ea3a..1652c05c10 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1002,6 +1002,9 @@ F:	package/turbolua/
 N:	Marcin Nowakowski <marcin.nowakowski@imgtec.com>
 F:	package/libkcapi/
 
+N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/libostree/
+
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
 F:	package/polkit/
diff --git a/package/Config.in b/package/Config.in
index fe5ccc434e..0a9582addf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1916,6 +1916,7 @@ menu "System tools"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
+	source "package/libostree/Config.in"
 	source "package/lxc/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/libostree/Config.in b/package/libostree/Config.in
new file mode 100644
index 0000000000..2edd8664a4
--- /dev/null
+++ b/package/libostree/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIBOSTREE
+	bool "libostree"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme
+	depends on !BR2_STATIC_LIBS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_MMU # e2fsprogs, libfuse,libglib2, libgpgme
+
+	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_XZ
+	help
+	  OSTree is an upgrade system for Linux-based operating systems.
+
+	  https://ostree.readthedocs.io/en/latest/
+
+comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
new file mode 100644
index 0000000000..7acc04e3e8
--- /dev/null
+++ b/package/libostree/libostree.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 fc409f04c9fd440b83b4fa324f3b912cbf61145389378d44254b8b191c9fef08  libostree-2017.12.tar.xz
+sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
new file mode 100644
index 0000000000..0d8bc9bccd
--- /dev/null
+++ b/package/libostree/libostree.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# libostree
+#
+################################################################################
+
+LIBOSTREE_VERSION = 2017.12
+LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
+LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
+
+LIBOSTREE_LICENSE = GPLv2
+LIBOSTREE_LICENSE_FILES = COPYING
+LIBOSTREE_DEPENDENCIES = e2fsprogs host-pkgconf libfuse libglib2 libgpgme xz
+
+LIBOSTREE_CONF_OPTS += --with-gpgme-prefix=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBOSTREE_CONF_OPTS += --with-openssl
+LIBOSTREE_DEPENDENCIES += openssl
+else
+LIBOSTREE_CONF_OPTS += --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+LIBOSTREE_CONF_OPTS += --with-avahi
+LIBOSTREE_DEPENDENCIES += avahi
+else
+LIBOSTREE_CONF_OPTS += --without-avahi
+endif
+
+#cURL depends on libsoup
+ifeq ($(BR2_PACKAGE_LIBSOUP),y)
+LIBOSTREE_CONF_OPTS += --with-libsoup
+LIBOSTREE_DEPENDENCIES += libsoup
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBOSTREE_CONF_OPTS += --with-curl
+LIBOSTREE_DEPENDENCIES += libcurl
+else
+LIBOSTREE_CONF_OPTS += --without-curl
+endif
+else
+LIBOSTREE_CONF_OPTS += --without-libsoup --without-curl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+LIBOSTREE_CONF_OPTS += --with-libarchive
+LIBOSTREE_DEPENDENCIES += libarchive
+else
+LIBOSTREE_CONF_OPTS += --without-libarchive
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LIBOSTREE_CONF_OPTS += --with-selinux
+LIBOSTREE_DEPENDENCIES += libselinux
+else
+LIBOSTREE_CONF_OPTS += --without-selinux
+endif
+
+$(eval $(autotools-package))
-- 
2.13.1
