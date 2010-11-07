From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Nov 2010 20:25:39 +0100
Subject: [Buildroot] [git commit master 1/1] wireless-tools: add option to
	install shared lib
Message-ID: <20101107192623.8D6BA8DC03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=70fb5d46ee05a1bb74fc3361b64c7bfcd8a87297
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2461

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |   12 +++++++-----
 package/wireless_tools/Config.in         |    6 ++++++
 package/wireless_tools/wireless_tools.mk |   23 +++++++++++++++++++----
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3c7b326..412fa00 100644
--- a/CHANGES
+++ b/CHANGES
@@ -47,11 +47,12 @@
 	pkg-config, portmap, pppd, pptp-linux, prboom, proftpd, radvd,
 	rdesktop, readline, rp-pppoe, ruby, qt, quagga, samba, sawman,
 	sdl_mixer, sdl_sound, sed, setserial, shared-mime-info, slang,
-	speex, sqlite, squashfs, startup-notification, strace, sylpheed,
-	sysstat, taglib, tcpdump, thttpd, tiff, tn5250, torsmo, tslib,
-	udev, udpcast, usbmount, usbutils, vsftpd, vtun, which,
-	wpa_supplicant, xapp_twm, xapp_xbacklight, xapp_xcursorgen,
-	xapp_xinit, xapp_xinput, xapp_xmore,
+	speex, sqlite, squashfs, startup-notification, strace,
+	sylpheed, sysstat, taglib, tcpdump, thttpd, tiff, tn5250,
+	torsmo, tslib, udev, udpcast, usbmount, usbutils, vsftpd,
+	vtun, which, wireless-tools, wpa_supplicant, xapp_twm,
+	xapp_xbacklight, xapp_xcursorgen, xapp_xinit, xapp_xinput,
+	xapp_xmore,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
@@ -73,6 +74,7 @@
 
 	#901:  new package: gpsd
 	#2389: Generate a Makefile wrapper in $(O)
+	#2461: wireless_tools: install shared library if needed
 	#2521: Can't compile sdl_mixer, mikmod.h can't be found
 	#2563: [PATCH] cairo: Expose the configure option to disable some...
 	#2581: libmms: Update to 0.6, and patch to work on architectures...
diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index efe28d2..c51ee9b 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -4,3 +4,9 @@ config BR2_PACKAGE_WIRELESS_TOOLS
 	  A collection of tools to configure wireless lan cards.
 
 	  http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html
+
+config BR2_PACKAGE_WIRELESS_TOOLS_LIB
+	bool "Install shared library"
+	depends on BR2_PACKAGE_WIRELESS_TOOLS
+	help
+	  The shared library of wireless tools
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 0707808..d8358ba 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -7,19 +7,34 @@
 WIRELESS_TOOLS_VERSION = 29
 WIRELESS_TOOLS_SITE = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
 WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
+WIRELESS_TOOLS_INSTALL_STAGING = YES
+
+WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
+WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
+
+
+ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
+	WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION)
+	WIRELESS_TOOLS_INSTALL_TARGETS += install-dynamic
+
+define WIRELESS_TOOLS_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" install-dynamic
+	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)/usr" install-hdr
+endef
+
+endif
 
 define WIRELESS_TOOLS_BUILD_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		iwmulticall
+		$(WIRELESS_TOOLS_BUILD_TARGETS)
 endef
 
 define WIRELESS_TOOLS_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-	rm -f $(@D)/iwmulticall
+	$(MAKE) -C $(@D) realclean
 endef
 
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" install-iwmulticall
+	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" $(WIRELESS_TOOLS_INSTALL_TARGETS)
 	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
 endef
 
-- 
1.7.1
