From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed,  1 Nov 2017 16:28:13 +0100
Subject: [Buildroot] [PATCH v5] libostree: new package
Message-ID: <20171101152813.30630-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OSTree is an upgrade system for Linux-based operating systems

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
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
 package/libostree/Config.in      | 20 ++++++++++++++
 package/libostree/libostree.hash |  1 +
 package/libostree/libostree.mk   | 60 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)
 create mode 100644 package/libostree/Config.in
 create mode 100644 package/libostree/libostree.hash
 create mode 100644 package/libostree/libostree.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 632d87a829..c10a62e4f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -985,6 +985,9 @@ F:	package/turbolua/
 N:	Marcin Nowakowski <marcin.nowakowski@imgtec.com>
 F:	package/libkcapi/
 
+N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/libostree/
+
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
 F:	package/polkit/
diff --git a/package/Config.in b/package/Config.in
index dbfb288d53..c7bec5152b 100644
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
index 0000000000..d4a802a6b6
--- /dev/null
+++ b/package/libostree/Config.in
@@ -0,0 +1,20 @@
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
diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
new file mode 100644
index 0000000000..b8bdd974c4
--- /dev/null
+++ b/package/libostree/libostree.hash
@@ -0,0 +1 @@
+sha256 fc409f04c9fd440b83b4fa324f3b912cbf61145389378d44254b8b191c9fef08  libostree-2017.12.tar.xz
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
new file mode 100644
index 0000000000..cb928af66a
--- /dev/null
+++ b/package/libostree/libostree.mk
@@ -0,0 +1,60 @@
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
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBOSTREE_CONF_OPTS += --with-curl --with-libsoup
+LIBOSTREE_DEPENDENCIES += libcurl libsoup
+else
+LIBOSTREE_CONF_OPTS += --without-curl
+
+ifeq ($(BR2_PACKAGE_LIBSOUP),y)
+LIBOSTREE_CONF_OPTS += --with-libsoup
+LIBOSTREE_DEPENDENCIES += libsoup
+else
+LIBOSTREE_CONF_OPTS += --without-libsoup
+endif
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
