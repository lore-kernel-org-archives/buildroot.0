From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 20:49:46 +0100
Subject: [Buildroot] [PATCH v3,
 3/6] package/igd2-for-linux: security bump to version 2.0
In-Reply-To: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125194949.1173139-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Move site to Orange-OpenSource
- Drop patch (already in version)
- This version is compatible with libupnp 1.14.x to fix
  CallStranger a.k.a. CVE-2020-12695
- Add threadutil license (BSD-3-Clause)
- Update hash in license file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-with-gcc-10.patch          | 199 ------------------
 package/igd2-for-linux/Config.in              |   2 +-
 package/igd2-for-linux/igd2-for-linux.hash    |   5 +-
 package/igd2-for-linux/igd2-for-linux.mk      |   9 +-
 4 files changed, 9 insertions(+), 206 deletions(-)
 delete mode 100644 package/igd2-for-linux/0001-fix-build-with-gcc-10.patch

diff --git a/package/igd2-for-linux/0001-fix-build-with-gcc-10.patch b/package/igd2-for-linux/0001-fix-build-with-gcc-10.patch
deleted file mode 100644
index 32474a3adb..0000000000
--- a/package/igd2-for-linux/0001-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,199 +0,0 @@
-From 23ed73623810a0894c8efd9eb79dd38483794a3b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fabrice.fontaine@orange.com>
-Date: Thu, 20 Aug 2020 18:17:03 +0200
-Subject: [PATCH] fix build with gcc 10
-
-This will fix build failures with -fno-common which is enabled by
-default with gcc 10
-
-Fixes:
- - http://autobuild.buildroot.org/results/f296984c3851fc28341210e36ef1b55b2edac209
-
-Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
-[Retrieved from:
-https://github.com/Orange-OpenSource/igd2-for-linux/commit/23ed73623810a0894c8efd9eb79dd38483794a3b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- linuxigd2/src/gatedevice.c | 37 +++++++++++++++++++++++++++++++++
- linuxigd2/src/gatedevice.h | 42 +++++++++-----------------------------
- linuxigd2/src/pinholev6.c  |  2 ++
- linuxigd2/src/pinholev6.h  |  2 +-
- linuxigd2/src/pmlist.c     |  5 +++++
- linuxigd2/src/pmlist.h     |  2 +-
- linuxigd2/src/wanipv6fw.h  |  3 ---
- 7 files changed, 56 insertions(+), 37 deletions(-)
-
-diff --git a/linuxigd2/src/gatedevice.c b/linuxigd2/src/gatedevice.c
-index 8be53e5..a50525d 100644
---- a/linuxigd2/src/gatedevice.c
-+++ b/linuxigd2/src/gatedevice.c
-@@ -41,6 +41,43 @@
- #include "wanipv6fw.h"
- #include "config.h"
- 
-+// Thread which contains all kind of timers and threads used in gatedevice.c and deviceprotection.c
-+TimerThread gExpirationTimerThread;
-+
-+// IGD Device Globals
-+UpnpDevice_Handle deviceHandle;
-+UpnpDevice_Handle deviceHandleIPv6;
-+UpnpDevice_Handle deviceHandleIPv6UlaGua;
-+char *gateUDN;
-+char *wanUDN;
-+char *wanConnectionUDN;
-+char *lanUDN;
-+long int startup_time;
-+unsigned long connection_stats[STATS_LIMIT]; // this is used for defining if connection is in idling
-+long int idle_time;
-+
-+// State Variables
-+char ConnectionType[50];
-+char PossibleConnectionTypes[50];
-+char ConnectionStatus[20];
-+char LastConnectionError[35];
-+long int AutoDisconnectTime;
-+long int IdleDisconnectTime;
-+long int WarnDisconnectDelay;
-+int RSIPAvailable;
-+int NATEnabled;
-+char ExternalIPAddress[INET6_ADDRSTRLEN];
-+int PortMappingNumberOfEntries;
-+int PortMappingEnabled;
-+char RemoteHost[INET6_ADDRSTRLEN];    // updated IPv6 addrss length 16 -> 46
-+long int SystemUpdateID;
-+
-+// WANEthLinkConfig state variables
-+char EthernetLinkStatus[12];
-+
-+char FirewallEnabled[2];
-+char InboundPinholeAllowed[2];
-+
- //Definitions for mapping expiration timer thread
- static ThreadPool gExpirationThreadPool;
- static ThreadPoolJob gEventUpdateJob;
-diff --git a/linuxigd2/src/gatedevice.h b/linuxigd2/src/gatedevice.h
-index 28d6b21..dbaa0c2 100644
---- a/linuxigd2/src/gatedevice.h
-+++ b/linuxigd2/src/gatedevice.h
-@@ -33,42 +33,20 @@
- #include "util.h"
- 
- // Thread which contains all kind of timers and threads used in gatedevice.c and deviceprotection.c
--TimerThread gExpirationTimerThread;
-+extern TimerThread gExpirationTimerThread;
- 
- // IGD Device Globals
--UpnpDevice_Handle deviceHandle;
--UpnpDevice_Handle deviceHandleIPv6;
--UpnpDevice_Handle deviceHandleIPv6UlaGua;
--char *gateUDN;
--char *wanUDN;
--char *wanConnectionUDN;
--char *lanUDN;
--long int startup_time;
--unsigned long connection_stats[STATS_LIMIT]; // this is used for defining if connection is in idling
--long int idle_time;
--
--// State Variables
--char ConnectionType[50];
--char PossibleConnectionTypes[50];
--char ConnectionStatus[20];
--char LastConnectionError[35];
--long int AutoDisconnectTime;
--long int IdleDisconnectTime;
--long int WarnDisconnectDelay;
--int RSIPAvailable;
--int NATEnabled;
--char ExternalIPAddress[INET6_ADDRSTRLEN];
--int PortMappingNumberOfEntries;
--int PortMappingEnabled;
--char RemoteHost[INET6_ADDRSTRLEN];    // updated IPv6 addrss length 16 -> 46
--long int SystemUpdateID;
--
--// WANEthLinkConfig state variables
--char EthernetLinkStatus[12];
-+extern UpnpDevice_Handle deviceHandle;
-+extern UpnpDevice_Handle deviceHandleIPv6;
-+extern UpnpDevice_Handle deviceHandleIPv6UlaGua;
-+extern char *gateUDN;
-+extern char *wanUDN;
-+extern char *wanConnectionUDN;
-+extern char *lanUDN;
- 
- // Linked list for portmapping entries
--struct portMap *pmlist_Head;
--struct portMap *pmlist_Current;
-+extern struct portMap *pmlist_Head;
-+extern struct portMap *pmlist_Current;
- 
- // WanIPConnection Actions
- int EventHandler(Upnp_EventType EventType, void *Event, void *Cookie);
-diff --git a/linuxigd2/src/pinholev6.c b/linuxigd2/src/pinholev6.c
-index 44e8a19..78f886d 100644
---- a/linuxigd2/src/pinholev6.c
-+++ b/linuxigd2/src/pinholev6.c
-@@ -41,6 +41,8 @@ extern "C" {
- #include "gatedevice.h"
- #include "pinholev6.h"
- 
-+struct pinholev6 *ph_first;
-+
- static const char * add_rule_str = "ip6tables -I %s " //upnp forward chain
-         "-i %s "        //input interface
-         "-o %s "        //output interface
-diff --git a/linuxigd2/src/pinholev6.h b/linuxigd2/src/pinholev6.h
-index 295b9f9..353ae27 100644
---- a/linuxigd2/src/pinholev6.h
-+++ b/linuxigd2/src/pinholev6.h
-@@ -37,7 +37,7 @@ struct pinholev6 {
- 
-     struct pinholev6 *next;
- 
--} *ph_first;
-+};
- 
- struct phv6_expirationEvent
- {
-diff --git a/linuxigd2/src/pmlist.c b/linuxigd2/src/pmlist.c
-index 1b3fe05..95d0c61 100644
---- a/linuxigd2/src/pmlist.c
-+++ b/linuxigd2/src/pmlist.c
-@@ -41,6 +41,11 @@
- #include "iptc.h"
- #endif
- 
-+// Linked list for portmapping entries
-+struct portMap *pmlist_Head;
-+struct portMap *pmlist_Current;
-+struct portMap *pmlist_Tail;
-+
- /**
-  * Create new portMap struct of rule to add iptables. 
-  * portMap-struct is internal presentation of iptables rule in IGD. 
-diff --git a/linuxigd2/src/pmlist.h b/linuxigd2/src/pmlist.h
-index 436d228..017500d 100644
---- a/linuxigd2/src/pmlist.h
-+++ b/linuxigd2/src/pmlist.h
-@@ -57,7 +57,7 @@ struct portMap
- 
-     struct portMap* next;
-     struct portMap* prev;
--} *pmlist_Head, *pmlist_Tail, *pmlist_Current;
-+};
- 
- //struct portMap* pmlist_NewNode(void);
- struct portMap* pmlist_NewNode(int enabled, long int duration, char *remoteHost,
-diff --git a/linuxigd2/src/wanipv6fw.h b/linuxigd2/src/wanipv6fw.h
-index 55419fe..a50d267 100644
---- a/linuxigd2/src/wanipv6fw.h
-+++ b/linuxigd2/src/wanipv6fw.h
-@@ -46,9 +46,6 @@ extern "C" {
- #define ERR_SRC_ADD_WILDCARD        708
- #define ERR_NO_TRAFFIC              709
- 
--char FirewallEnabled[2];
--char InboundPinholeAllowed[2];
--
- //-----------------------------------------------------------------------------
- 
- int InitFirewallv6(void);
diff --git a/package/igd2-for-linux/Config.in b/package/igd2-for-linux/Config.in
index 157cc6f30b..f1658d3aa6 100644
--- a/package/igd2-for-linux/Config.in
+++ b/package/igd2-for-linux/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_IGD2_FOR_LINUX
 
 	  Please edit /etc/upnpd.conf before using upnpd!
 
-	  https://github.com/ffontaine/igd2-for-linux
+	  https://github.com/Orange-OpenSource/igd2-for-linux
 
 comment "igd2-for-linux needs a toolchain w/ threads, wchar"
 	depends on BR2_USE_MMU
diff --git a/package/igd2-for-linux/igd2-for-linux.hash b/package/igd2-for-linux/igd2-for-linux.hash
index ecde4b51c2..fc215727d7 100644
--- a/package/igd2-for-linux/igd2-for-linux.hash
+++ b/package/igd2-for-linux/igd2-for-linux.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256	523545a26b0d662e9f6913bec2518df6e70f4d497935d88983d994336a1b0ea9	igd2-for-linux-1.2.tar.gz
-sha256	204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994	linuxigd2/doc/LICENSE
+sha256  e3fcc7c9da4ad1ca16227b3b1b3712bcfb3f6ec922685eee7ae4a76edfa32bb4  igd2-for-linux-2.0.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  linuxigd2/doc/LICENSE
+sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  linuxigd2/src/threadutil/COPYING
diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
index 478c353997..85119a14b5 100644
--- a/package/igd2-for-linux/igd2-for-linux.mk
+++ b/package/igd2-for-linux/igd2-for-linux.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-IGD2_FOR_LINUX_VERSION = 1.2
-IGD2_FOR_LINUX_SITE = $(call github,ffontaine,igd2-for-linux,v$(IGD2_FOR_LINUX_VERSION))
+IGD2_FOR_LINUX_VERSION = 2.0
+IGD2_FOR_LINUX_SITE = \
+	$(call github,Orange-OpenSource,igd2-for-linux,v$(IGD2_FOR_LINUX_VERSION))
 
-IGD2_FOR_LINUX_LICENSE = GPL-2.0
-IGD2_FOR_LINUX_LICENSE_FILES = linuxigd2/doc/LICENSE
+IGD2_FOR_LINUX_LICENSE = GPL-2.0, BSD-3-Clause
+IGD2_FOR_LINUX_LICENSE_FILES = linuxigd2/doc/LICENSE linuxigd2/src/threadutil/COPYING
 
 IGD2_FOR_LINUX_DEPENDENCIES = libupnp
 
-- 
2.29.2
