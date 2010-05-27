From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 May 2010 09:53:01 +0200
Subject: [Buildroot] [git commit master] microperl: fix build with /bin/sh =
	dash
Message-ID: <20100527082704.54DB39AD38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=062cebb08fa9079b39f61144224de2ad2e2e56a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |   16 ++++++++--------
 package/microperl/microperl.mk |    5 +++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4926c6d..07bcb59 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,14 +5,14 @@
 	Updated/fixed packages: aumix, atk, avahi, bmon, busybox, cairo,
 	cdrkit, dbus-glib, dbus-python, docker, enchant, fltk, gamin,
 	gettext, gmpc, gob2, grep, gstreamer, gst-plugins-bad,
-	gst-plugins-base, gvfs, hal, iconv, icu, iperf, libcgicc, libdvdnav,
-	libdvdread, libglade, libglib2, libgtk2, libidn, libmms,
-	libmpd, libpcap, libsoup, lmbench, lsof, ltrace, lvm2, make,
-	metacity, mtd-utils, mutt, nbd, netsnmp, ntfsprogs, ntp, olsr,
-	pango, pciutils, pcmanfm, php, pkg-config, psmisc, qt, samba,
-	shared-mime-info, squashfs, squashfs3, sshfs,
-	startup-notification, swfdec, sylpheed, uemacs, util-linux,
-	valgrind, vpnc, vsftpd, webkit, xstroke
+	gst-plugins-base, gvfs, hal, iconv, icu, iperf, libcgicc,
+	libdvdnav, libdvdread, libglade, libglib2, libgtk2, libidn,
+	libmms, libmpd, libpcap, libsoup, lmbench, lsof, ltrace, lvm2,
+	make, metacity, microperl, mtd-utils, mutt, nbd, netsnmp,
+	ntfsprogs, ntp, olsr, pango, pciutils, pcmanfm, php,
+	pkg-config, psmisc, qt, samba, shared-mime-info, squashfs,
+	squashfs3, sshfs, startup-notification, swfdec, sylpheed,
+	uemacs, util-linux, valgrind, vpnc, vsftpd, webkit, xstroke
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 7985a65..869d99c 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -22,6 +22,11 @@ $(DL_DIR)/$(MICROPERL_SOURCE):
 
 $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 	$(MICROPERL_CAT) $(DL_DIR)/$(MICROPERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	# makedepend contains bashisms
+	$(SED) 's~sh ./makedepend~bash ./makedepend~' \
+		$(MICROPERL_DIR)/Makefile.SH \
+		$(MICROPERL_DIR)/x2p/Makefile.SH \
+		$(MICROPERL_DIR)/pod/Makefile.SH
 	chmod -R u+w $(MICROPERL_DIR)
 	touch $@
 
-- 
1.6.3.3
