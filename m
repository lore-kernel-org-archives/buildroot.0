From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 20:19:09 +0200
Subject: [Buildroot] [git commit] ptpd2: fix static linking
Message-ID: <20140731182001.D34689CFE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97b9fb299fe4362f2cdd15b95a7f3c8a397cfd12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do the same as in commit b64a06d7b70bd7b160826bf9b97e60e18171913d
to avoid missing libraries needed by libpcap. Fixes:
http://autobuild.buildroot.net/results/1a1/1a1dadfa2b22074d401b013606f0cede66efe826/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ptpd2/ptpd2.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
