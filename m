From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Dec 2016 00:09:49 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: enable lua if package is selected
Message-ID: <1482016189-32585-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lua and python bindings were removed with the same patch:
https://patchwork.ozlabs.org/patch/367361. There is a real issue with
python but not with lua so enable it if lua is selected

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/lxc/lxc.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 589930f..980f1dc 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -10,7 +10,7 @@ LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
-	--disable-lua --disable-python --disable-werror \
+	--disable-python --disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
@@ -20,4 +20,11 @@ else
 LXC_CONF_OPTS += --disable-seccomp
 endif
 
+ifeq ($(BR2_PACKAGE_LUA),y)
+LXC_CONF_OPTS += --enable-lua
+LXC_DEPENDENCIES += lua
+else
+LXC_CONF_OPTS += --disable-lua
+endif
+
 $(eval $(autotools-package))
-- 
2.5.0
