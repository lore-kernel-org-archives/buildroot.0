From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Dec 2016 12:04:52 +0100
Subject: [Buildroot] [PATCH v2,1/1] lxc: enable lua if package is selected
Message-ID: <1482059092-79108-1-git-send-email-fabrice.fontaine@orange.com>
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
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Enable also lua binding when luajit is selected

 package/lxc/lxc.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 589930f..b9e3a43 100644
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
@@ -20,4 +20,15 @@ else
 LXC_CONF_OPTS += --disable-seccomp
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
+LXC_CONF_OPTS += --enable-lua
+LXC_DEPENDENCIES += luainterpreter
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+# By default, lxc will only search for lua.pc
+LXC_CONF_OPTS += --with-lua-pc=$(STAGING_DIR)/usr/lib/pkgconfig/luajit.pc
+endif
+else
+LXC_CONF_OPTS += --disable-lua
+endif
+
 $(eval $(autotools-package))
-- 
2.5.0
