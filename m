From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 00:52:13 +0200
Subject: [Buildroot] [git commit master 1/1] setserial: convert to
	autotargets and fix manpages install
Message-ID: <20100726225419.0597082DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aaa2b660a9f9f0446fb2ebd4dde7c76c9750f9c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Close #2269

[Peter: fix Makefile patch to not strip wrong file, rename hayes patch]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    9 +++---
 .../setserial-2.17-build-system-fix.patch          |   28 ++++++++++++++++++++
 ...> setserial-2.17-tiocghayesesp-build-fix.patch} |    0
 package/setserial/setserial.mk                     |   16 ++++++-----
 4 files changed, 42 insertions(+), 11 deletions(-)
 create mode 100644 package/setserial/setserial-2.17-build-system-fix.patch
 rename package/setserial/{setserial-tiocghayesesp-build-fix.patch => setserial-2.17-tiocghayesesp-build-fix.patch} (100%)

diff --git a/CHANGES b/CHANGES
index d03b434..73fb6eb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,10 +27,10 @@
 	libgpg-error, libidn, liblockfile, libpng, lighttpd, links,
 	linux-fusion, lmbench, lrzsz, ltrace, make, module-init-tools,
 	mplayer, mysql_client, nbd, ncurses, neon, netcat, netperf,
-	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
-	sdl_sound, sdl_ttf, squashfs, swfdec, tftpd, thttpd, tn5250,
-	tremor, usbutils, webif, wireless_tools, xkeyboard-config,
-	xserver_xorg-server, xvkbd
+	ntfsprogs, openssl, php, qt, quagga, setserial, sdl, sdl_mixer,
+	sdl_sound, sdl_ttf, sqlite, squashfs, swfdec, tftpd, thttpd,
+	tn5250, tremor, usbutils, webif, wireless_tools,
+	xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
 
@@ -81,6 +81,7 @@
 	#2233: Atmel atstk target skeletons have /etc/mtab as a file, not ...
 	#2245: Netcat does not work due to incorrect assumptions about signed..
 	#2251: directory output/build after make *_defconfig not found
+	#2269: setserial causes make error
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/setserial/setserial-2.17-build-system-fix.patch b/package/setserial/setserial-2.17-build-system-fix.patch
new file mode 100644
index 0000000..eec7993
--- /dev/null
+++ b/package/setserial/setserial-2.17-build-system-fix.patch
@@ -0,0 +1,28 @@
+Install the setserial program in /usr/bin instead of /bin, and make
+sure that the directories (especially the manpages directory) are
+created before installing files to them. This is similar to what
+automake does.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.in |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+Index: setserial-2.17/Makefile.in
+===================================================================
+--- setserial-2.17.orig/Makefile.in
++++ setserial-2.17/Makefile.in
+@@ -26,9 +26,10 @@ setserial.cat: setserial.8
+ 	nroff -man setserial.8 > setserial.cat
+ 
+ install: setserial setserial.8
+-	$(INSTALL_PROGRAM) setserial $(DESTDIR)/bin
+-	$(STRIP) $(DESTDIR)/bin/setserial
+-	$(INSTALL_DATA) setserial.8 $(DESTDIR)/usr/man/man8
++	mkdir -p $(DESTDIR)/usr/bin
++	$(INSTALL_PROGRAM) setserial $(DESTDIR)/usr/bin
++	mkdir -p $(DESTDIR)/usr/share/man/man8
++	$(INSTALL_DATA) setserial.8 $(DESTDIR)/usr/share/man/man8
+ 
+ clean:
+ 	$(RM) setserial setserial.o setserial.cat *~
diff --git a/package/setserial/setserial-tiocghayesesp-build-fix.patch b/package/setserial/setserial-2.17-tiocghayesesp-build-fix.patch
similarity index 100%
rename from package/setserial/setserial-tiocghayesesp-build-fix.patch
rename to package/setserial/setserial-2.17-tiocghayesesp-build-fix.patch
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 1c222a2..0b67346 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -3,16 +3,18 @@
 # Setserial
 #
 #############################################################
-SETSERIAL_VERSION:=2.17
-SETSERIAL_PATCH_VERSION:=.orig
-SETSERIAL_PATCH_FILE:=setserial_2.17-45.diff.gz
-SETSERIAL_SOURCE:=setserial_$(SETSERIAL_VERSION)$(SETSERIAL_PATCH_VERSION).tar.gz
-SETSERIAL_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
-SETSERIAL_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
+SETSERIAL_VERSION            = 2.17
+SETSERIAL_PATCH              = setserial_2.17-45.2.diff.gz
+SETSERIAL_SOURCE             = setserial_$(SETSERIAL_VERSION).orig.tar.gz
+SETSERIAL_SITE               = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
+SETSERIAL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
+	# Touching gorhack.h is needed for the Debian patch 18 to work
 	if [ -d $(@D)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+		touch $(@D)/gorhack.h; \
+		rm $(@D)/debian/patches/01_makefile.dpatch; \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches *.dpatch; \
 	fi
 endef
 
-- 
1.7.1
