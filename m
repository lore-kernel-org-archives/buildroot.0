From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Jul 2015 11:47:13 +0300
Subject: [Buildroot] [PATCH] netsnmp: fix static build
Message-ID: <d83c0f02c2d855f666b1bdd307723e339431d74c.1437468433.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Exclude the ucd-snmp/dlmod MIB module when building statically.

Fixes:
http://autobuild.buildroot.net/results/782/7829e74f83c3c4a1f45e049ec9f9d6b00e002c1c/
http://autobuild.buildroot.net/results/5df/5df28482dfa3d7c54d1e4ae3e1d373bd8e9a2265/
http://autobuild.buildroot.net/results/4b7/4b7f3c15a4f4c4f4457e78767f5526c044d6dc1d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/netsnmp/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 47a53d7ead2f..57cc6b93fd25 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -31,7 +31,8 @@ config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 
 config BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES
 	string "Build with these MIB modules"
-	default "host ucd-snmp/dlmod agentx"
+	default "host ucd-snmp/dlmod agentx" if !BR2_STATIC_LIBS
+	default "host agentx" if BR2_STATIC_LIBS
 	help
 	  Specify which MIB modules to include.
 
-- 
2.1.4
