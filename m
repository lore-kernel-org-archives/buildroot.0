From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  7 May 2020 18:59:55 -0700
Subject: [Buildroot] [PATCH 4/5] package/apparmor: add a dependency on
 net-tools if utils is selected
In-Reply-To: <20200508015956.3270405-1-aduskett@gmail.com>
References: <20200508015956.3270405-1-aduskett@gmail.com>
Message-ID: <20200508015956.3270405-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

aa-unconfied requires the full version of netstat provided by the net-tools
package. Without the full version, running aa-unconfined will result in the
error:
netstat: invalid option -- 'p'

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/apparmor/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
index b0d2e44ff7..481317ac7b 100644
--- a/package/apparmor/Config.in
+++ b/package/apparmor/Config.in
@@ -31,8 +31,10 @@ comment "utils need python3"
 
 config BR2_PACKAGE_APPARMOR_UTILS
 	bool "utils"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_READLINE
+	select BR2_PACKAGE_NET_TOOLS # aa-unconfined
 	help
 	  A set of utilities (written in python):
 	    aa-audit          aa-disable      aa-logprof
-- 
2.26.2
