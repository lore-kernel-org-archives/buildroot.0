From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Dec 2018 19:05:50 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: fix build with pkgconf 1.5.3
Message-ID: <20181215180550.24626-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

lxc uses the completionsdir variable from bash-completions.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the bashcompdir to use
explicitly instead of relying on bash-completions.pc.

Fixes:
 - http://autobuild.buildroot.org/results/d99e5b749cb09adc04393e3933ba3defb6d9642a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index c9838fb229..a225d72c08 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -17,6 +17,10 @@ LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LXC_CONF_ENV += bashcompdir=/usr/share/bash-completion/completions
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LXC_CONF_OPTS += --enable-gnutls
 LXC_DEPENDENCIES += gnutls
-- 
2.14.1
