From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Aug 2010 11:08:41 +0200
Subject: [Buildroot] [git commit master 1/1] kismet: fix build when none of
	client, server or drone are selected
Message-ID: <20100830091041.910048A329@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2ab8ec9e266cda26d6c782c75f666c39a033b7c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Random package configuration can trigger the selection of kismet, but
neither of client, server or drone suboptions. In this case, the
KISMET_TARGET_BINARIES variable is empty, leading to failure during
the installation stage.

At the same time, we remove the useless stripping of the installed
binaries, since this is done globally by the Buildroot infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                  |    7 ++++---
 package/kismet/kismet.mk |    7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3cc7171..1cc9a38 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,9 +18,10 @@
 	fs: old-style squashfs for big endian archs fixed.
 
 	Updated/fixed packages: busybox, gst-plugins-base,
-	imagemagick, libgail, libglib2, libgtk2, lua, luafilesystem,
-	lzo, ncurses, netcat, pango, php, pppd, proftpd, qt, samba,
-	startup-notification, swfdec, sysvinit, util-linux
+	imagemagick, kismet, libgail, libglib2, libgtk2, lua,
+	luafilesystem, lzo, ncurses, netcat, pango, php, pppd,
+	proftpd, qt, samba, startup-notification, swfdec, sysvinit,
+	util-linux
 
 	Removed packages: stunnel
 
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 1b61ddd..6135c88 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -33,18 +33,19 @@ $(eval $(call AUTOTARGETS,package,kismet))
 
 $(KISMET_TARGET_INSTALL_TARGET):
 	$(call MESSAGE,"Installing")
+ifdef KISMET_TARGET_BINARIES
 	$(INSTALL) -m 755 $(addprefix $(KISMET_DIR)/, $(KISMET_TARGET_BINARIES)) $(TARGET_DIR)/usr/bin
+endif
 ifdef KISMET_TARGET_CONFIGS
 	$(INSTALL) -m 644 $(addprefix $(KISMET_DIR)/conf/, $(KISMET_TARGET_CONFIGS)) $(TARGET_DIR)/etc
 endif
-ifeq ($(BR2_ENABLE_DEBUG),)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
-endif
 	touch $@
 
 $(KISMET_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
+ifdef KISMET_TARGET_BINARIES
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
+endif
 ifdef KISMET_TARGET_CONFIGS
 	rm -f $(addprefix $(TARGET_DIR)/etc/, $(KISMET_TARGET_CONFIGS))
 endif
-- 
1.7.1
