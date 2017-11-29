From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 23:04:42 +0100
Subject: [Buildroot] [git commit] libostree: new package
Message-ID: <20171201205340.BB4DF80E11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d42a19990f1c8d1c60f19990ee9709d6b3d3317f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OSTree is an upgrade system for Linux-based operating systems

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
[Thomas: use SPDX license code, fix license, it's GPL-2.0+ not GPL-2.0.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libostree/Config.in      | 25 +++++++++++++++++
 package/libostree/libostree.hash |  3 ++
 package/libostree/libostree.mk   | 59 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8bd7d85..35507de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1017,6 +1017,7 @@ N:	Marcin Nowakowski <marcin.nowakowski@imgtec.com>
 F:	package/libkcapi/
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/libostree/
 F:	utils/diffconfig
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
diff --git a/package/Config.in b/package/Config.in
index e2f71b4..877cbf2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1926,6 +1926,7 @@ menu "System tools"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
+	source "package/libostree/Config.in"
 	source "package/lxc/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/libostree/Config.in b/package/libostree/Config.in
new file mode 100644
index 0000000..b62f4ea
--- /dev/null
+++ b/package/libostree/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_LIBOSTREE
+	bool "libostree"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme
+	depends on !BR2_STATIC_LIBS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_MMU # e2fsprogs, libfuse,libglib2, libgpgme
+	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_XZ
+	help
+	  OSTree is an upgrade system for Linux-based operating
+	  systems.
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
index 0000000..7acc04e
--- /dev/null
+++ b/package/libostree/libostree.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 fc409f04c9fd440b83b4fa324f3b912cbf61145389378d44254b8b191c9fef08  libostree-2017.12.tar.xz
+sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
new file mode 100644
index 0000000..bac44dd
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
+LIBOSTREE_LICENSE = GPL-2.0+
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
+#cURL support depends on libsoup
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
