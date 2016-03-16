From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Mar 2016 20:07:10 +0200
Subject: [Buildroot] [PATCH] quagga: fix build when ospfd is disabled
Message-ID: <036588a526c3c3462653f00dbcccf17ea31a82c4.1458151630.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ospfclient and ospfapi that build by default depend on libospf. But libospf
doesn't build when ospfd is disabled. Disable ospfapi in this case.

Fixes:
http://autobuild.buildroot.net/results/918/918f5ced9c7dd59a8fcab654dc8f6d2798515e34/
http://autobuild.buildroot.net/results/edb/edbcb616b6019bced330238228fb5c6f880ab885/
http://autobuild.buildroot.net/results/831/8311f611559b3e7e98860d5a0264db97d4de1a54/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/quagga/quagga.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 93c01f9c37f4..5f0d201fa9ef 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -25,7 +25,7 @@ QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-ze
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGPD),--enable-bgpd,--disable-bgpd)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_RIPD),--enable-ripd,--disable-ripd)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_RIPNGD),--enable-ripngd,--disable-ripngd)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OSPFD),--enable-ospfd,--disable-ospfd)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OSPFD),--enable-ospfd,--disable-ospfd --disable-ospfapi)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OSPF6D),--enable-ospf6d,--disable-ospf6d)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_PIMD),--enable-pimd,--disable-pimd)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),--enable-watchquagga,--disable-watchquagga)
-- 
2.7.0
