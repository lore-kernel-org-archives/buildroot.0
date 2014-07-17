From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Jul 2014 21:47:49 -0300
Subject: [Buildroot] [PATCH] ntp: properly select/filter netsnmp for ntpsnmpd
Message-ID: <1405558069-7023-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_NTP_SNMPD was pushing netsnmp into dependencies but was
never selected, and since netsnmp requires fork it wasn't filtered out
for nommu. Fixes:

http://autobuild.buildroot.net/results/776/7769afe0da09e3f4f96d9a0f4c0febb0c72cc34f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntp/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index ec5dbbb..858a9ad 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -54,6 +54,8 @@ config BR2_PACKAGE_NTP_NTPQ
 
 config BR2_PACKAGE_NTP_NTPSNMPD
 	bool "ntpsnmpd"
+	depends on BR2_USE_MMU # netsnmp fork()
+	select BR2_PACKAGE_NETSNMP
 	help
 	  Install ntpsnmpd NTP SNMP MIB agent.
 
-- 
1.8.5.5
