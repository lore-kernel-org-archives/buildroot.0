From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 rsyslog
Message-ID: <20180708110810.52C19863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ee4f78b36fb8d6ccb3b1e8b5d845ccbd86790e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 package/rsyslog/rsyslog.mk | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 00e17c4be6..22b798207a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_RSYSLOGD),rsyslog) \
 	$(if $(BR2_PACKAGE_START_STOP_DAEMON),start-stop-daemon) \
 	$(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \
 	$(if $(BR2_PACKAGE_SYSLOG_NG),syslog-ng) \
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index e32505be22..61e08ba765 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -17,11 +17,6 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
-# Build after BusyBox
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-RSYSLOG_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RSYSLOG_DEPENDENCIES += gnutls
 RSYSLOG_CONF_OPTS += --enable-gnutls
