From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:25 +0200
Subject: [Buildroot] [PATCH 25/31] package/systemd: Add optional support for
	myhostname
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-25-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in  | 11 +++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c1a4105..8e72526 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -206,6 +206,17 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
 
+config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
+	bool "enable myhostname NSS plugin"
+	default y
+	help
+	  nss-myhostname is a plug-in module for the GNU Name Service Switch (NSS)
+	  functionality of the GNU C Library (glibc), primarily providing hostname
+	  resolution for the locally configured system hostname as returned by
+	  gethostname(2).
+
+	  http://www.freedesktop.org/software/systemd/man/nss-myhostname.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c79b64c..1be2b53 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -229,6 +229,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-machined
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_MYHOSTNAME),y)
+SYSTEMD_CONF_OPTS += --enable-myhostname
+else
+SYSTEMD_CONF_OPTS += --disable-myhostname
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_IMPORTD),y)
 SYSTEMD_CONF_OPTS += --enable-importd
 else
-- 
2.8.1
