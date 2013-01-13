From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 21:02:01 +0100
Subject: [Buildroot] [git commit] dvbsnoop: new package dvbsnoop
Message-ID: <20130113200347.CBED499CAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06c22d620abebf0f02588aa1acdabee2dc24a612
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dvbsnoop is a DVB/MPEG stream analyzer. It's designed to debug, dump or
view the digital stream info available via

    satellite   -> DVB-S, DVB-S2
    cable       -> DVB-C, DVB-C2
    terrestrial -> DVB-T, DVB-T2

dvbsnoop can be used on any digital settopbox that running on linux and
provides the DVB APIv3. It's also usable on classical PCs that contains
a DVB hardware (PCI Card or USB Plug).

[Peter: needs largefile, fix help text]
Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/dvbsnoop/Config.in   |   25 +++++++++++++++++++++++++
 package/dvbsnoop/dvbsnoop.mk |   12 ++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 427b4db..770d842 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -218,6 +218,7 @@ endif
 source "package/dmidecode/Config.in"
 source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
+source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
 source "package/evtest/Config.in"
 source "package/flashrom/Config.in"
diff --git a/package/dvbsnoop/Config.in b/package/dvbsnoop/Config.in
new file mode 100644
index 0000000..f21191a
--- /dev/null
+++ b/package/dvbsnoop/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_DVBSNOOP
+	bool "dvbsnoop"
+	depends on BR2_LARGEFILE
+	help
+	  Dvbsnoop is just a simple tool to analyze, view or debug a transport
+	  stream (TS), program elementary stream (PES) or even a program stream
+	  (PS). Dvbsnoop is trying to get input mostly direct from a frontend
+	  (satellite or cable tuner inside a set-top box for example) via DVB
+	  APIv3 to view into a TS, or a demux to view PES or PS (also mostly
+	  inside the set-top box or even PCI Card or USB Plug) but also from a
+	  file (recorded TS).
+	  Dvbsnoop is working well on SD transport streams but may have some
+	  limited functionality on HD transport streams (DVB-{C,S,T}2 because
+	  of missing knowledge how to handle it.
+
+	  Dvbsnoop itself doesn't do the tuning on the frontend, this has to be
+	  done by external helpers or manually driver call.
+	  The dvbsnoop tool was written while developing the software Neutrino
+	  on the set-top box DBox2.
+
+	  http://dvbsnoop.sourceforge.net
+	  http://en.wikipedia.org/wiki/DBox2
+
+comment "dvbsnoop requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
diff --git a/package/dvbsnoop/dvbsnoop.mk b/package/dvbsnoop/dvbsnoop.mk
new file mode 100644
index 0000000..dd62e8c
--- /dev/null
+++ b/package/dvbsnoop/dvbsnoop.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# dvbsnoop
+#
+#############################################################
+
+DVBSNOOP_VERSION        = 1.4.50
+DVBSNOOP_SITE           = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
+DVBSNOOP_LICENSE        = GPLv2
+DVBSNOOP_LICENSE_FILES  = COPYING
+
+$(eval $(autotools-package))
