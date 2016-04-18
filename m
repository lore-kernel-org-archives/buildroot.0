From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Apr 2016 23:19:25 +0200
Subject: [Buildroot] [git commit] netsnmp: ensure lm-sensors is available if
	enabled
Message-ID: <20160418211944.C396380AED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdbbff08bc8a62a1c5bc5c14f7fce07a84858cf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ucd-snmp/lmsensorsMib module uses lm-sensors, so ensure netsnmp is built
after lm-sensors if enabled.

As the list of mib modules to built is configured using a string option in
Kconfig, we cannot easily select lm-sensors from the netsnmp package - But
we can at least ensure it gets built before hand if enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/netsnmp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 0eb3b26..48273b5 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -67,6 +67,11 @@ ifeq ($(BR2_PACKAGE_PCIUTILS),y)
 NETSNMP_DEPENDENCIES += pciutils
 endif
 
+# For ucd-snmp/lmsensorsMib
+ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
+NETSNMP_DEPENDENCIES += lm-sensors
+endif
+
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
 NETSNMP_CONF_OPTS += --disable-mib-loading
 NETSNMP_CONF_OPTS += --disable-mibs
