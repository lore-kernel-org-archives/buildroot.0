From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 19 Jun 2020 16:57:14 +0200
Subject: [Buildroot] [PATCH v2 2/7] package/cups-filters: bump to version
 1.27.5
In-Reply-To: <20200619145719.2352019-1-angelo@amarulasolutions.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
Message-ID: <20200619145719.2352019-3-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps cups-filters to version 1.27.5.
While bumping, fixing also the missing installation for the service files
for cups-browsed.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups-filters/Config.in         |  3 +++
 package/cups-filters/S82cups-browsed   | 23 +++++++++++++++++++++++
 package/cups-filters/cups-filters.hash |  2 +-
 package/cups-filters/cups-filters.mk   | 20 +++++++++++++++++---
 4 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 package/cups-filters/S82cups-browsed

diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index 9e4e37ca6b..26e8d4aa06 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_DEJAVU
+	select BR2_PACKAGE_DEJAVU_SANS
+	select BR2_PACKAGE_DEJAVU_SERIF
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
diff --git a/package/cups-filters/S82cups-browsed b/package/cups-filters/S82cups-browsed
new file mode 100644
index 0000000000..c73ff1fbfa
--- /dev/null
+++ b/package/cups-filters/S82cups-browsed
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		printf "Starting cups-browsed: "
+		start-stop-daemon -S -q -m -p /var/run/cups-browsed.pid \
+			-b -x cups-browsed -- -c /etc/cups/cups-browsed.conf
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		printf "Stopping cups-browsed: "
+		start-stop-daemon -K -q -p /var/run/cups-browsed.pid
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	restart)
+		"$0" stop
+		sleep 1
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 9e24abe393..61cb42a438 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 ff8679fcd0c31c25d229262c7ad100ba161ef6b2aa455a2df673dd74ef93f488  cups-filters-1.26.0.tar.gz
+sha256 08e4081ce50ce2e620af6e950bdcf64cea2ab4c81ab3c5ea05da25d82ad62db6  cups-filters-1.27.5.tar.gz
 sha256 527463af65312372111804589a9624f4c52813e253062ae351e75af5003f317f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 1f17018bc5..20d4c68995 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.26.0
+CUPS_FILTERS_VERSION = 1.27.5
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
 
-CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
+CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg dejavu
 
 CUPS_FILTERS_CONF_OPTS = \
 	--disable-mutool \
@@ -19,7 +19,10 @@ CUPS_FILTERS_CONF_OPTS = \
 	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
 	--with-sysroot=$(STAGING_DIR) \
 	--with-pdftops=pdftops \
-	--with-jpeg
+	--with-jpeg \
+	--with-rcdir=no \
+	--with-fontdir=$(STAGING_DIR)/usr/share/fonts/ \
+	--with-test-font-path=$(STAGING_DIR)/usr/share/fonts/dejavu/DejaVuSans.ttf
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 CUPS_FILTERS_CONF_OPTS += --with-png
@@ -71,4 +74,15 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-poppler
 endif
 
+define CUPS_FILTERS_INSTALL_INIT_SYSV
+	@$(RM) $(TARGET_DIR)/etc/init.d/cups-browsed
+	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \
+		$(TARGET_DIR)/etc/init.d/S82cups-browsed
+endef
+
+define CUPS_FILTERS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0755 $(@D)/utils/cups-browsed.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/cups-browsed.service
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1
