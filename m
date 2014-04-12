From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 18:39:16 +0200
Subject: [Buildroot] [git commit] znc: new package
Message-ID: <20140412164012.0B53D9C73E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d66f773aa7f13992b4381f64e308b7feb8c99727
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ported patch from C??dric Ch??pied:
http://patchwork.ozlabs.org/patch/306896/

[Thomas: added comment explaining why we don't use <pkg>_AUTORECONF,
and use a more conventional syntax for <pkg>_DEPENDENCIES and
<pkg>_CONF_OPT.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |    1 +
 package/znc/Config.in |   10 ++++++++++
 package/znc/znc.mk    |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 98d94e3..4a7fed6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1025,6 +1025,7 @@ source "package/wpa_supplicant/Config.in"
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
index 0000000..5e9b45b
--- /dev/null
+++ b/package/znc/znc.mk
@@ -0,0 +1,49 @@
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
+ZNC_DEPENDENCIES = host-pkgconf host-autoconf host-automake
+ZNC_CONF_OPT = --disable-perl
+
+# The standard <pkg>_AUTORECONF = YES invocation doesn't work for this
+# package, because it does not use automake in a normal way.
+define ZNC_RUN_AUTOGEN
+	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
+endef
+ZNC_PRE_CONFIGURE_HOOKS += ZNC_RUN_AUTOGEN
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+ZNC_DEPENDENCIES += icu
+ZNC_CONF_OPT += --enable-icu
+else
+ZNC_CONF_OPT += --disable-icu
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ZNC_DEPENDENCIES += openssl
+ZNC_CONF_OPT += --enable-openssl
+else
+ZNC_CONF_OPT += --disable-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+ZNC_DEPENDENCIES += zlib
+ZNC_CONF_OPT += --enable-zlib
+else
+ZNC_CONF_OPT += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ZNC_DEPENDENCIES += python3 host-swig
+ZNC_CONF_OPT += --enable-python=python3
+else
+ZNC_CONF_OPT += --disable-python
+endif
+
+$(eval $(autotools-package))
