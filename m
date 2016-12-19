From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Dec 2016 16:26:18 +0100
Subject: [Buildroot] [PATCH v2,1/1] lxc: add dependency on gnutls
Message-ID: <1482161178-20667-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lxc can use gnutls for various checksumming so add a dependency on it if
package is selected

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Get upstream patch that add --enable-gnutls option

 package/lxc/lxc.hash |  1 +
 package/lxc/lxc.mk   | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 7b34e88..8fb4dc0 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	7c292cd0055dac1a0e6fbb6a7740fd12b6ffb204603c198faf37c11c9d6dcd7a	lxc-2.0.6.tar.gz
+sha256	e8ca30fb1e8d6dbafb5cccc04b3fd1784c35bc8ccf79112036e5166924b6b01d	64fa248372c90c9d98fc9d67f80327d865c11a48.patch
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index e9e925f..34a8556 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -9,10 +9,24 @@ LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
+# we're patching configure.ac
+LXC_AUTORECONF = YES
+
+# This patch adds --enable-gnutls option
+LXC_PATCH = \
+	https://github.com/lxc/lxc/commit/64fa248372c90c9d98fc9d67f80327d865c11a48.patch
+
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-python --disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LXC_CONF_OPTS += --enable-gnutls
+LXC_DEPENDENCIES += gnutls
+else
+LXC_CONF_OPTS += --disable-gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 LXC_CONF_OPTS += --enable-seccomp
 LXC_DEPENDENCIES += libseccomp
-- 
2.7.4
