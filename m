From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 09:59:14 +0200
Subject: [Buildroot] [git commit] ntp: properly select/filter netsnmp for
	ntpsnmpd
Message-ID: <20140717075920.BABF79CFD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f821f6522c085a5f66c8d96dc187ec5d8ef7ff3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_NTP_SNMPD was pushing netsnmp into dependencies but was
never selected, and since netsnmp requires fork it wasn't filtered out
for nommu. Fixes:

http://autobuild.buildroot.net/results/776/7769afe0da09e3f4f96d9a0f4c0febb0c72cc34f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
 
