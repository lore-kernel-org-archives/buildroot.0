From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 16:08:24 +0100
Subject: [Buildroot] [git commit] lxc: add optional dependency on gnutls
Message-ID: <20170130152338.5D54E81FCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc6091caea67e8a9144f0f2602ddb2798eb725cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lxc can use gnutls for various checksumming so add a dependency on it if
package is selected

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
