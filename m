From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:39:19 +0200
Subject: [Buildroot] [git commit] package/systemd: use libqrencode
 independently of remote tools
Message-ID: <20201014183045.085FE81E1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c572e797a03f9a4c37e779d8e8960b411778494a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemds libqrencode support is independent from journal-gatewayd. In
v247 it will additionally be used in homectl for recovery key
generation.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 30e28adf95..b684f538a8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -243,14 +243,8 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
 SYSTEMD_CONF_OPTS += -Dmicrohttpd=true
-ifeq ($(BR2_PACKAGE_LIBQRENCODE),y)
-SYSTEMD_CONF_OPTS += -Dqrencode=true
-SYSTEMD_DEPENDENCIES += libqrencode
 else
-SYSTEMD_CONF_OPTS += -Dqrencode=false
-endif
-else
-SYSTEMD_CONF_OPTS += -Dmicrohttpd=false -Dqrencode=false
+SYSTEMD_CONF_OPTS += -Dmicrohttpd=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
@@ -260,6 +254,13 @@ else
 SYSTEMD_CONF_OPTS += -Dremote=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBQRENCODE),y)
+SYSTEMD_DEPENDENCIES += libqrencode
+SYSTEMD_CONF_OPTS += -Dqrencode=true
+else
+SYSTEMD_CONF_OPTS += -Dqrencode=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 SYSTEMD_DEPENDENCIES += libselinux
 SYSTEMD_CONF_OPTS += -Dselinux=true
