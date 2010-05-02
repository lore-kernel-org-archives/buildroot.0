From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] haserl: Add lua option
Message-ID: <20100502074442.E88EC8A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bb73ce22225306a4484c45fc359ebe7b64512501
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #719

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |   25 +++++++++++++------------
 package/haserl/Config.in |    8 ++++++++
 package/haserl/haserl.mk |    9 ++++++---
 3 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/CHANGES b/CHANGES
index e574c90..deabb09 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,18 +12,18 @@
 	New packages: librsync, libatomic_ops, libusb-compat, lmbench,
 	netperf, squid
 
-	Updated/fixed packages: alsa-utils, busybox, dnsmasq, dosfstools,
-	e2fsprogs, eeprog, fbv, freetype, hostapd, iperf, iptables, iw, less,
-	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, lua, matchbox,
-	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, pciutils,
-	php, pixman, portage, pppd, pthread-stubs, python, qt, radvd,
-	samba, setserial, squashfs, tslib, usb_modeswith, wget,
-	xdata_xcursor-themes, xdriver_xf86-video-intel,
-	xkeyboard-config, xlib_libX11, xlib_libXaw, xlib_libXfont,
-	xlib_libXfontcache, xlib_libXxf86misc, xlib_libXtst,
-	xlib_libpciaccess, xproto_dri2proto, xproto_eviext,
-	xproto_fontcacheproto, xproto_xf86miscproto,
-	xserver_xorg-server
+	Updated/fixed packages: alsa-utils, busybox, dnsmasq,
+	dosfstools, e2fsprogs, eeprog, fbv, freetype, haserl, hostapd,
+	iperf, iptables, iw, less, libaio,libdrm, libgcrypt, libglib2,
+	libpng, libxml2, lua, matchbox, mdadm, memstat, mesa3d,
+	mtd-utils, nano, openssl, pciutils, php, pixman, portage,
+	pppd, pthread-stubs, python, qt, radvd, samba, setserial,
+	squashfs, tslib, usb_modeswith, wget, xdata_xcursor-themes,
+	xdriver_xf86-video-intel, xkeyboard-config, xlib_libX11,
+	xlib_libXaw, xlib_libXfont, xlib_libXfontcache,
+	xlib_libXxf86misc, xlib_libXtst, xlib_libpciaccess,
+	xproto_dri2proto, xproto_eviext, xproto_fontcacheproto,
+	xproto_xf86miscproto, xserver_xorg-server
 
 	Removed packages: xapp_xtrap, xlib_libXTrap, xlib_libXevie,
 	xlib_libXxf86misc, xxproto_evieext, proto_trapproto,
@@ -33,6 +33,7 @@
 
 	#513: Add new squid package
 	#661: lmbench: new package
+	#719: Add lua option to haserl
 	#800: [PATCH] iperf update to 2.0.4
 	#803: [PATCH] lua - add shared library patch and config option for...
 	#805: [PATCH] mdadm - version update
diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 21ab63c..a8d2ee5 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -7,6 +7,14 @@ config BR2_PACKAGE_HASERL
 
 	  http://haserl.sourceforge.net/
 
+config BR2_PACKAGE_HASERL_WITH_LUA
+	bool "lua support"
+	depends on BR2_PACKAGE_HASERL
+	depends on BR2_PACKAGE_HASERL_VERSION_0_9_X
+	select BR2_PACKAGE_LUA
+	help
+	  Enable LUA support for haserl
+
 choice
 	prompt "Haserl version"
 	default BR2_PACKAGE_HASERL_VERSION_0_9_X
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 41b89ae..257a257 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -5,10 +5,8 @@
 #############################################################
 
 HASERL_VERSION:=$(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
-HASERL_SOURCE:=haserl-$(HASERL_VERSION).tar.gz
 HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
-HASERL_AUTORECONF:=no
-HASERL_INSTALL_STAGING:=NO
+HASERL_AUTORECONF:=NO
 HASERL_INSTALL_TARGET:=YES
 ifeq ($(BR2_ENABLE_DEBUG),)
 HASERL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' install-strip
@@ -18,6 +16,11 @@ endif
 HASERL_CONF_ENV = ac_cv_path_install=./install-sh
 # the above doesn't interact nicely with a shared cache, so disable for now
 HASERL_USE_CONFIG_CACHE = NO
+ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
+	HASERL_CONF_OPT += --with-lua=$(STAGING_DIR) \
+		--with-lua-headers=$(STAGING_DIR)
+	HASERL_DEPENDENCIES += lua
+endif
 
 $(eval $(call AUTOTARGETS,package,haserl))
 
-- 
1.6.3.3
