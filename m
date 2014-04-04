From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 Apr 2014 20:22:53 +0200
Subject: [Buildroot] [PATCH 1/1 v2] znc: new package
Message-ID: <1396635773-31318-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: C?dric Ch?pied <cedric.chepied@gmail.com>

ported patch from C?dric Ch?pied:
http://patchwork.ozlabs.org/patch/306896/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: - rebased
    - added project URL to Config.in (Thomas)
    - use git snapshot; needs own ./autogen.sh as ZNC_AUTORECONF = YES fails
    - added dependency on BR2_INSTALL_LIBSTDCPP
    - added license info (Thomas)
    - added CONF_OPT options for icu (added in git after release of znc 1.2),
      openssl, zlib & python3 (python2 is unsupported) (Thomas)
    - disabled perl support, currently untested here, to be added later ;)

 package/Config.in     |    1 +
 package/znc/Config.in |   10 ++++++++++
 package/znc/znc.mk    |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/znc/Config.in
 create mode 100644 package/znc/znc.mk

diff --git a/package/Config.in b/package/Config.in
index 8433020..a1c5984 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1024,6 +1024,7 @@ source "package/wpa_supplicant/Config.in"
 source "package/wvdial/Config.in"
 source "package/xinetd/Config.in"
 source "package/xl2tp/Config.in"
+source "package/znc/Config.in"
 
 endmenu
 
diff --git a/package/znc/Config.in b/package/znc/Config.in
new file mode 100644
index 0000000..c055f9f
--- /dev/null
+++ b/package/znc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ZNC
+	bool "znc"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Advanced IRC bouncer
+
+	  http://www.znc.in
+
+comment "znc needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
new file mode 100644
index 0000000..a99a43b
--- /dev/null
+++ b/package/znc/znc.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# znc
+#
+################################################################################
+
+ZNC_VERSION = b396cafdb249544164ed02942a5babba59e519a3
+ZNC_SITE = git://github.com/znc/znc.git
+ZNC_LICENSE = Apache-2.0
+ZNC_LICENSE_FILES = LICENSE
+ZNC_DEPENDENCIES = host-pkgconf \
+	$(if $(BR2_PACKAGE_ICU),icu) \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_ZLIB),zlib)
+
+define ZNC_RUN_AUTOGEN
+	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
+endef
+ZNC_PRE_CONFIGURE_HOOKS += ZNC_RUN_AUTOGEN
+
+ZNC_CONF_OPT = --disable-perl \
+	$(if $(BR2_PACKAGE_ICU),--enable-icu,--disable-icu) \
+	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl) \
+	$(if $(BR2_PACKAGE_ZLIB),--enable-zlib,--disable-zlib)
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ZNC_DEPENDENCIES += python3 host-swig
+ZNC_CONF_OPT += --enable-python=python3
+else
+ZNC_CONF_OPT += --disable-python
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
