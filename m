From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 14:44:52 +0200
Subject: [Buildroot] [git commit] ptpd2: handle snmp optional dep
Message-ID: <20140405124545.44528834E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd7f1d93be78a577194329b4d93fdc0012bdafa6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Handle the optional net-snmp dep or be explicit in disabling it since
since it can pick up a distribution net-snmp-config and pollute
everything. Hopefully fixes:
http://autobuild.buildroot.net/results/5bd/5bdfcf544a83e18d12e27c598084c0ad520d6164/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ptpd2/ptpd2.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index a5d1aff..3133726 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -13,6 +13,13 @@ PTPD2_AUTORECONF = YES
 PTPD2_LICENSE = BSD-2c
 PTPD2_LICENSE_FILES = COPYRIGHT
 
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+	PTPD2_CONF_ENV += ac_cv_path_PATH_NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
+	PTPD2_DEPENDENCIES += netsnmp
+else
+	PTPD2_CONF_OPT += --disable-snmp
+endif
+
 define PTPD2_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/ptpd2/S65ptpd2 \
 		$(TARGET_DIR)/etc/init.d/S65ptpd2
