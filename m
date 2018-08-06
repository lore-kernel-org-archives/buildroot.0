From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Aug 2018 21:01:04 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/iperf3: bump version to 3.6
Message-ID: <20180806190104.9528-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, switched _SITE to https.

Iperf 3.2 added optional ssl support, build-tested with libressl,
run-time tested with openssl.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iperf3/iperf3.hash |  6 ++++--
 package/iperf3/iperf3.mk   | 11 +++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 3e34f98eb6..06dae42149 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,2 +1,4 @@
-# From http://software.es.net/iperf/news.html
-sha256 a4ef73406fe92250602b8da2ae89ec53211f805df97a1d1d629db5a14043734f  iperf-3.1.7.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.6.tar.gz.sha256
+sha256 de5d51e46dc460cc590fb4d44f95e7cad54b74fea1eba7d6ebd6f8887d75946e  iperf-3.6.tar.gz
+# Locally computed
+sha256 52c42914d7d79fe5e95d0d1b821556d9f06bf756ac910fe085a46d238a33e594  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index cc4e72427b..0080bd8c6c 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.1.7
-IPERF3_SITE = http://downloads.es.net/pub/iperf
+IPERF3_VERSION = 3.6
+IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
 IPERF3_LICENSE_FILES = LICENSE
 
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+IPERF3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
+IPERF3_DEPENDENCIES += openssl
+else
+IPERF3_CONF_OPTS += --without-openssl
+endif
+
 $(eval $(autotools-package))
-- 
2.18.0
