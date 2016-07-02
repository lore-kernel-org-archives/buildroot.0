From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:45:34 +0200
Subject: [Buildroot] [git commit] package/systemd: Add optional support for
	resolved
Message-ID: <20160702144554.E4CE8807A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db04c468d38c64ed16e8e2690c44331533a7b1ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 11 +++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b00ef21..fcf8853 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -287,6 +287,17 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+config BR2_PACKAGE_SYSTEMD_RESOLVED
+	bool "enable resolve daemon"
+	default y
+	help
+	  systemd-resolved is a system service that provides network
+	  name resolution to local applications. It implements a
+	  caching and validating DNS/DNSSEC stub resolver, as well as
+	  an LLMNR resolver and responder.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-resolved.html
+
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	bool "enable SNTP client"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cca3f05..6f5a610 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -296,6 +296,12 @@ define SYSTEMD_INSTALL_SERVICE_NETWORK
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
+SYSTEMD_CONF_OPTS += --enable-resolved
+else
+SYSTEMD_CONF_OPTS += --disable-resolved
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += --enable-timesyncd
 define SYSTEMD_INSTALL_SERVICE_TIMESYNC
