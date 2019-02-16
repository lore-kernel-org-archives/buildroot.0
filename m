From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Feb 2019 11:09:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix build with older
 kernels
Message-ID: <20190216100951.10872-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These 4 patches have been sent upstream and merged in version 241:
https://github.com/systemd/systemd/pull/11641

Fixes:
 - http://autobuild.buildroot.org/results/970b09e1d49b53dff12a07ca4ad424ef9dd29a69
 - http://autobuild.buildroot.org/results/0a671b08d5e74ff0b04024e729c498c4444e3e92

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...vlan.c-fix-build-without-BRIDGE_VLAN_INFO.patch | 34 ++++++++++++++++++++++
 ...isc.c-fix-build-without-IFA_F_NOPREFIXROU.patch | 33 +++++++++++++++++++++
 ...dress.c-fix-build-without-IFA_F_NOPREFIXR.patch | 33 +++++++++++++++++++++
 ...cp6.c-fix-build-without-IFA_F_NOPREFIXROU.patch | 33 +++++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 package/systemd/0014-networkd-brvlan.c-fix-build-without-BRIDGE_VLAN_INFO.patch
 create mode 100644 package/systemd/0015-networkd-ndisc.c-fix-build-without-IFA_F_NOPREFIXROU.patch
 create mode 100644 package/systemd/0016-networkd-address.c-fix-build-without-IFA_F_NOPREFIXR.patch
 create mode 100644 package/systemd/0017-networkd-dhcp6.c-fix-build-without-IFA_F_NOPREFIXROU.patch

diff --git a/package/systemd/0014-networkd-brvlan.c-fix-build-without-BRIDGE_VLAN_INFO.patch b/package/systemd/0014-networkd-brvlan.c-fix-build-without-BRIDGE_VLAN_INFO.patch
new file mode 100644
index 0000000000..7a91aac519
--- /dev/null
+++ b/package/systemd/0014-networkd-brvlan.c-fix-build-without-BRIDGE_VLAN_INFO.patch
@@ -0,0 +1,34 @@
+From 7bd188b1e628d11011cc6c98456e2e4ed72c645b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Feb 2019 17:32:46 +0100
+Subject: [PATCH] networkd-brvlan.c: fix build without
+ BRIDGE_VLAN_INFO_RANGE_END
+
+systemd fails to build on kernel without BRIDGE_VLAN_INFO_RANGE_END
+since 9714c02
+
+So put include missing_if_bridge.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/970b09e1d49b53dff12a07ca4ad424ef9dd29a69
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/network/networkd-brvlan.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
+index 8f9103f14..8377623da 100644
+--- a/src/network/networkd-brvlan.c
++++ b/src/network/networkd-brvlan.c
+@@ -9,6 +9,7 @@
+ 
+ #include "alloc-util.h"
+ #include "conf-parser.h"
++#include "missing_if_bridge.h"
+ #include "netlink-util.h"
+ #include "networkd-brvlan.h"
+ #include "networkd-link.h"
+-- 
+2.14.1
+
diff --git a/package/systemd/0015-networkd-ndisc.c-fix-build-without-IFA_F_NOPREFIXROU.patch b/package/systemd/0015-networkd-ndisc.c-fix-build-without-IFA_F_NOPREFIXROU.patch
new file mode 100644
index 0000000000..6351f05eb3
--- /dev/null
+++ b/package/systemd/0015-networkd-ndisc.c-fix-build-without-IFA_F_NOPREFIXROU.patch
@@ -0,0 +1,33 @@
+From d909e4af6ac61f6777d429a0c84ab5b3d1907c6d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Feb 2019 18:28:16 +0100
+Subject: [PATCH] networkd-ndisc.c: fix build without IFA_F_NOPREFIXROUTE
+
+systemd fails to build on kernel without IFA_F_NOPREFIXROUTE
+since 9714c02
+
+So put include missing_network.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/970b09e1d49b53dff12a07ca4ad424ef9dd29a69
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/network/networkd-ndisc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
+index 80bfd2cba..e5b8d1155 100644
+--- a/src/network/networkd-ndisc.c
++++ b/src/network/networkd-ndisc.c
+@@ -8,6 +8,7 @@
+ 
+ #include "sd-ndisc.h"
+ 
++#include "missing_network.h"
+ #include "networkd-ndisc.h"
+ #include "networkd-route.h"
+ #include "strv.h"
+-- 
+2.14.1
+
diff --git a/package/systemd/0016-networkd-address.c-fix-build-without-IFA_F_NOPREFIXR.patch b/package/systemd/0016-networkd-address.c-fix-build-without-IFA_F_NOPREFIXR.patch
new file mode 100644
index 0000000000..33d3328a89
--- /dev/null
+++ b/package/systemd/0016-networkd-address.c-fix-build-without-IFA_F_NOPREFIXR.patch
@@ -0,0 +1,33 @@
+From 081aea25022a987d349394ada2d6a959bf3ce4cd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Feb 2019 18:33:39 +0100
+Subject: [PATCH] networkd-address.c: fix build without IFA_F_NOPREFIXROUTE
+
+systemd fails to build on kernel without IFA_F_NOPREFIXROUTE
+since 9714c02
+
+So put include missing_network.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/970b09e1d49b53dff12a07ca4ad424ef9dd29a69
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/network/networkd-address.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/network/networkd-address.c b/src/network/networkd-address.c
+index fa7f9b8d7..3cdbd9e37 100644
+--- a/src/network/networkd-address.c
++++ b/src/network/networkd-address.c
+@@ -5,6 +5,7 @@
+ #include "alloc-util.h"
+ #include "conf-parser.h"
+ #include "firewall-util.h"
++#include "missing_network.h"
+ #include "netlink-util.h"
+ #include "networkd-address.h"
+ #include "networkd-manager.h"
+-- 
+2.14.1
+
diff --git a/package/systemd/0017-networkd-dhcp6.c-fix-build-without-IFA_F_NOPREFIXROU.patch b/package/systemd/0017-networkd-dhcp6.c-fix-build-without-IFA_F_NOPREFIXROU.patch
new file mode 100644
index 0000000000..2b7ae1898a
--- /dev/null
+++ b/package/systemd/0017-networkd-dhcp6.c-fix-build-without-IFA_F_NOPREFIXROU.patch
@@ -0,0 +1,33 @@
+From aeed8332afa88728ed914b2917ce758d9c2218a4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Feb 2019 18:38:10 +0100
+Subject: [PATCH] networkd-dhcp6.c: fix build without IFA_F_NOPREFIXROUTE
+
+systemd fails to build on kernel without IFA_F_NOPREFIXROUTE
+since 9714c02
+
+So put include missing_network.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/970b09e1d49b53dff12a07ca4ad424ef9dd29a69
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/network/networkd-dhcp6.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
+index f9df26d75..c1fba03f9 100644
+--- a/src/network/networkd-dhcp6.c
++++ b/src/network/networkd-dhcp6.c
+@@ -11,6 +11,7 @@
+ 
+ #include "hashmap.h"
+ #include "hostname-util.h"
++#include "missing_network.h"
+ #include "network-internal.h"
+ #include "networkd-link.h"
+ #include "networkd-manager.h"
+-- 
+2.14.1
+
-- 
2.14.1
