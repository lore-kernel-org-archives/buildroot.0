From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:06:01 +0100
Subject: [Buildroot] [git commit] package/systemd: add dns-over-tls support
Message-ID: <20200309140910.511398EB58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4ebd8cd4ce75d4d14d22f7c30f98f583f3cf0f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set default-dns-over-tls to opportunistic when dns-over-tls is enabled
as it should be fully backwards compatible. The DNSOverTLS config in
resolved.conf can be used to override default-dns-over-tls.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1c3b81cfcb..d97336b7cd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -351,6 +351,16 @@ else
 SYSTEMD_CONF_OPTS += -Dresolve=false
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SYSTEMD_CONF_OPTS += -Ddns-over-tls=gnutls -Ddefault-dns-over-tls=opportunistic
+SYSTEMD_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SYSTEMD_CONF_OPTS += -Ddns-over-tls=openssl -Ddefault-dns-over-tls=opportunistic
+SYSTEMD_DEPENDENCIES += openssl
+else
+SYSTEMD_CONF_OPTS += -Ddns-over-tls=false -Ddefault-dns-over-tls=no
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += -Dtimesyncd=true
 SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
