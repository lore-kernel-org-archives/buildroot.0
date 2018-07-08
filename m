From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 procps-ng
Message-ID: <20180708110810.63D4C863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb47802facc682221bf169fa83b2676838503504
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk     |  1 +
 package/procps-ng/procps-ng.mk | 10 ++--------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1a1ed792a2..df51f288c4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_PROCPS_NG),procps-ng) \
 	$(if $(BR2_PACKAGE_PSMISC),psmisc) \
 	$(if $(BR2_PACKAGE_RSYSLOGD),rsyslog) \
 	$(if $(BR2_PACKAGE_START_STOP_DAEMON),start-stop-daemon) \
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index e1fddea32c..03b74784d2 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -13,12 +13,6 @@ PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
-# If both procps-ng and busybox are selected, make certain procps-ng
-# wins the fight over who gets to have their utils actually installed.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-PROCPS_NG_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PROCPS_NG_DEPENDENCIES += systemd
 PROCPS_NG_CONF_OPTS += --with-systemd
@@ -26,8 +20,8 @@ else
 PROCPS_NG_CONF_OPTS += --without-systemd
 endif
 
-# Make sure binaries get installed in /bin, so that they overwrite
-# their busybox counterparts.
+# Make sure binaries get installed in /bin, as busybox does, so that we
+# don't end up with two versions.
 # Make sure libprocps.pc is installed in STAGING_DIR/usr/lib/pkgconfig/
 # otherwise it's installed in STAGING_DIR/lib/pkgconfig/ breaking
 # pkg-config --libs libprocps.
