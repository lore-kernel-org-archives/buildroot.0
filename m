From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 May 2017 16:15:59 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: set libcap as an optional dependency
Message-ID: <1495203359-57057-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/Config.in |  1 -
 package/lxc/lxc.hash  |  1 +
 package/lxc/lxc.mk    | 13 ++++++++++++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index c5c75ea..22aa813 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LXC
 	# build system forcefully builds a shared library
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # setns() system call
-	select BR2_PACKAGE_LIBCAP
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 086b139..801759a 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	0d8e34b302cfe4c40c6c9ae5097096aa5cc2c1dfceea3f0f22e3e16c4a4e8494	lxc-2.0.8.tar.gz
+sha256	c79443c5db7e7defd53992d120cad2bc8afc2ff363b1e84ec31bc2b95ec5ca44	bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 4ba6d9f..8a200e7 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -8,9 +8,13 @@ LXC_VERSION = 2.0.8
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
-LXC_DEPENDENCIES = libcap host-pkgconf
+LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
 
+# This patch fixes compilation without capabilities
+LXC_PATCH = \
+	https://github.com/lxc/lxc/commit/bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch
+
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-python --disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
@@ -22,6 +26,13 @@ else
 LXC_CONF_OPTS += --disable-gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+LXC_CONF_OPTS += --enable-capabilities
+LXC_DEPENDENCIES += libcap
+else
+LXC_CONF_OPTS += --disable-capabilities
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 LXC_CONF_OPTS += --enable-seccomp
 LXC_DEPENDENCIES += libseccomp
-- 
2.5.0
