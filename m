From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 14 Oct 2020 17:12:49 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd: link libqrencode
 independent of remote
In-Reply-To: <20201014151249.18330-1-buildroot@heine.tech>
References: <20201014151249.18330-1-buildroot@heine.tech>
Message-ID: <20201014151249.18330-2-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemds libqrencode support is independent from journal-gatewayd.
In v247 it will additionally be used in homectl for recovery key
generation.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
-- 
2.25.1
