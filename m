From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 21:47:59 +0100
Subject: [Buildroot] [PATCH] cups: add host-pkgconf as a dependency
Message-ID: <1487105279-25370-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cups configure script checks for a pkg-config program. If host-pkgconf
has not been built prior to cups, it uses the system pkg-config, which
might potentially lead to bogus results:

checking for i586-buildroot-linux-musl-pkg-config... no
checking for pkg-config... /usr/bin/pkg-config

With this patch applied:

checking for i586-buildroot-linux-musl-pkg-config... no
checking for pkg-config... /home/thomas/projets/buildroot/output/host/usr/bin/pkg-config

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups/cups.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 0573776..7ef2f36 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -28,6 +28,7 @@ CUPS_CONF_OPTS = \
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
 	host-autoconf \
+	host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.7.4
