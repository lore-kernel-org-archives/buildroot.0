From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 12:32:11 +0100
Subject: [Buildroot] [git commit] lxc: enable lua if package is selected
Message-ID: <20161218113235.AB7FA81844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c383856268b2088d476932f11cfcacab3b085d58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lua and python bindings were removed with the same patch:
https://patchwork.ozlabs.org/patch/367361. There is a real issue with
python but not with lua so enable it if lua is selected

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
[Thomas: simplify value passed to --with-lua-pc.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/lxc.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 589930f..e9e925f 100644
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
+LXC_CONF_OPTS += --with-lua-pc=luajit
+endif
+else
+LXC_CONF_OPTS += --disable-lua
+endif
+
 $(eval $(autotools-package))
