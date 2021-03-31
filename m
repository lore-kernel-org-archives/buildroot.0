From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 31 Mar 2021 10:14:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: fix script
 net-snmp-create-v3-user's usage of 'ps'.
Message-ID: <20210331081447.29552-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

net-snmp-create-v3-user uses ps to check if snmpd is running.  To know
how to invoke 'ps', the build system use 'which ps' and does other
checks for the output format of 'ps', therefore inspecting 'ps' on the
build machine instead of the target.

If the build machine runs a OS like Debian, that uses a merged-usr and a
PATH of '/usr/bin:/bin', then 'which ps' returns /usr/bin/ps, which will
not work on the target if it does not also use a merged-usr.

Hardcode 'ps' to be /bin/ps to fix this issue and to improve build
reproducibility.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/netsnmp/netsnmp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 5b22d1a063..1a9a776033 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -12,7 +12,9 @@ NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
 NETSNMP_INSTALL_STAGING = YES
-NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=no
+NETSNMP_CONF_ENV = \
+	ac_cv_NETSNMP_CAN_USE_SYSCTL=no \
+	ac_cv_path_PSPROG=/bin/ps
 NETSNMP_CONF_OPTS = \
 	--with-persistent-directory=/var/lib/snmp \
 	--with-defaults \
-- 
2.31.0
