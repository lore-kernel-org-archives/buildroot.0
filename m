From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jul 2014 19:16:25 -0300
Subject: [Buildroot] [PATCH] ptpd2: fix static linking
Message-ID: <1406758585-24577-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do the same as in commit b64a06d7b70bd7b160826bf9b97e60e18171913d
to avoid missing libraries needed by libpcap. Fixes:
http://autobuild.buildroot.net/results/1a1/1a1dadfa2b22074d401b013606f0cede66efe826/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ptpd2/ptpd2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index 3133726..6a6ae60 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -13,6 +13,10 @@ PTPD2_AUTORECONF = YES
 PTPD2_LICENSE = BSD-2c
 PTPD2_LICENSE_FILES = COPYRIGHT
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	PTPD2_CONF_OPT += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+endif
+
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
 	PTPD2_CONF_ENV += ac_cv_path_PATH_NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
 	PTPD2_DEPENDENCIES += netsnmp
-- 
1.8.5.5
