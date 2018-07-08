From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 syslog-ng
Message-ID: <20180708110810.371BF863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fd118aac02c079fe7b5c4d273d879b337a2e15d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In so doing, we must now ensure that busybox does not overwrite
the startup script already installed by syslog-ng.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk     | 6 +++++-
 package/syslog-ng/syslog-ng.mk | 5 -----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9d3ea22d96..c6c7b03ab3 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_SYSLOG_NG),syslog-ng) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd) \
 	$(if $(BR2_PACKAGE_SYSVINIT),sysvinit) \
 	$(if $(BR2_PACKAGE_TAR),tar) \
@@ -208,8 +209,11 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
 endef
 endif
 
+# Only install our own if no other package already did.
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
-	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
+	if grep -q CONFIG_SYSLOGD=y $(@D)/.config && \
+		[ ! -e $(TARGET_DIR)/etc/init.d/S01logging ]; \
+	then \
 		$(INSTALL) -m 0755 -D package/busybox/S01logging \
 			$(TARGET_DIR)/etc/init.d/S01logging; \
 	fi
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 2b6f2c09e9..793fea0972 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -17,11 +17,6 @@ SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
 	--disable-java --disable-java-modules --disable-mongodb
 
-# We override busybox's S01logging init script
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSLOG_NG_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 SYSLOG_NG_DEPENDENCIES += geoip
 SYSLOG_NG_CONF_OPTS += --enable-geoip
