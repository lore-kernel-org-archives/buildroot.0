From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  2 Aug 2016 17:13:46 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to v2.4.1
Message-ID: <1470150826-1175-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patches.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...-veth-avoid-kernel-header-issue-with-musl.patch | 90 ----------------------
 ...-Disable-Werror-date-time-for-kernel-3.14.patch | 35 ---------
 ...6-PCIe-Fix-name-of-sched_priority-element.patch | 52 -------------
 ...apps-include-stdarg.h-in-eventlogstring.h.patch | 61 ---------------
 package/openpowerlink/openpowerlink.hash           |  8 +-
 package/openpowerlink/openpowerlink.mk             |  2 +-
 6 files changed, 5 insertions(+), 243 deletions(-)
 delete mode 100644 package/openpowerlink/0004-veth-avoid-kernel-header-issue-with-musl.patch
 delete mode 100644 package/openpowerlink/0005-PCIe-Driver-Disable-Werror-date-time-for-kernel-3.14.patch
 delete mode 100644 package/openpowerlink/0006-PCIe-Fix-name-of-sched_priority-element.patch
 delete mode 100644 package/openpowerlink/0007-apps-include-stdarg.h-in-eventlogstring.h.patch

diff --git a/package/openpowerlink/0004-veth-avoid-kernel-header-issue-with-musl.patch b/package/openpowerlink/0004-veth-avoid-kernel-header-issue-with-musl.patch
deleted file mode 100644
index a85b94e..0000000
--- a/package/openpowerlink/0004-veth-avoid-kernel-header-issue-with-musl.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 9cd93aeecbca62db278f2fe4a2c0a2f6fd04924b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 25 May 2016 13:26:49 +0200
-Subject: [PATCH] veth: avoid kernel header issue with musl
-
-The Virtual Ethernet driver doesn't build when the musl libc is used on the
-system. As stated in the musl wiki [1], the userspace and kernel headers are
-mixed leading to a "clash" with the definitions provided by musl.
-
-Remove netinet/if_ether.h userspace header and replace ETHER_ADDR_LEN by
-ETH_ALEN [2] and ETHERMTU by ETH_DATA_LEN [3] in veth-linuxuser.c.
-
-Fixes:
-http://autobuild.buildroot.org/results/2ca/2ca04bb046263e479e7597867b56469893d3c11d/build-end.log
-
-Upsteam status: pending
-https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/120
-
-[1] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_am_i_getting_.22error:_redefinition_of_struct_ethhdr.2Ftcphdr.2Fetc.22_.3F
-[2] https://git.musl-libc.org/cgit/musl/tree/include/net/ethernet.h?h=v1.1.14#n35
-[3] https://git.musl-libc.org/cgit/musl/tree/include/net/ethernet.h?h=v1.1.14#n48
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- stack/src/kernel/veth/veth-linuxuser.c | 13 ++++++-------
- 1 file changed, 6 insertions(+), 7 deletions(-)
-
-diff --git a/stack/src/kernel/veth/veth-linuxuser.c b/stack/src/kernel/veth/veth-linuxuser.c
-index d70566c..ddcf950 100644
---- a/stack/src/kernel/veth/veth-linuxuser.c
-+++ b/stack/src/kernel/veth/veth-linuxuser.c
-@@ -61,7 +61,6 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #include <arpa/inet.h>
- #include <linux/if.h>
- #include <linux/if_tun.h>
--#include <netinet/if_ether.h>
- 
- //============================================================================//
- //            G L O B A L   D E F I N I T I O N S                             //
-@@ -248,7 +247,7 @@ static void getMacAdrs(UINT8* pMac_p)
- 
-     close(sock);
- 
--    OPLK_MEMCPY(pMac_p, &ifr.ifr_hwaddr.sa_data[0], ETHER_ADDR_LEN);
-+    OPLK_MEMCPY(pMac_p, &ifr.ifr_hwaddr.sa_data[0], ETH_ALEN);
- }
- 
- //------------------------------------------------------------------------------
-@@ -272,9 +271,9 @@ static tOplkError veth_receiveFrame(tFrameInfo* pFrameInfo_p,
- 
-     // replace the MAC address of the POWERLINK Ethernet interface with virtual
-     // Ethernet MAC address before forwarding it into the virtual Ethernet interface
--    if (OPLK_MEMCMP(pFrameInfo_p->frame.pBuffer->aDstMac, vethInstance_l.macAdrs, ETHER_ADDR_LEN) == 0)
-+    if (OPLK_MEMCMP(pFrameInfo_p->frame.pBuffer->aDstMac, vethInstance_l.macAdrs, ETH_ALEN) == 0)
-     {
--        OPLK_MEMCPY(pFrameInfo_p->frame.pBuffer->aDstMac, vethInstance_l.tapMacAdrs, ETHER_ADDR_LEN);
-+        OPLK_MEMCPY(pFrameInfo_p->frame.pBuffer->aDstMac, vethInstance_l.tapMacAdrs, ETH_ALEN);
-     }
- 
-     nwrite = write(vethInstance_l.fd, pFrameInfo_p->frame.pBuffer, pFrameInfo_p->frameSize);
-@@ -302,7 +301,7 @@ to be used as a thread which does a blocking read in a while loop.
- //------------------------------------------------------------------------------
- static void* vethRecvThread(void* pArg_p)
- {
--    UINT8               buffer[ETHERMTU];
-+    UINT8               buffer[ETH_DATA_LEN];
-     UINT                nread;
-     tFrameInfo          frameInfo;
-     tOplkError          ret = kErrorOk;
-@@ -331,7 +330,7 @@ static void* vethRecvThread(void* pArg_p)
-                 break;
- 
-             default:    // data from tun/tap ready for read
--                nread = read(pInstance->fd, buffer, ETHERMTU);
-+                nread = read(pInstance->fd, buffer, ETH_DATA_LEN);
-                 if (nread > 0)
-                 {
-                     DEBUG_LVL_VETH_TRACE("VETH:Read %d bytes from the tap interface\n", nread);
-@@ -340,7 +339,7 @@ static void* vethRecvThread(void* pArg_p)
-                     DEBUG_LVL_VETH_TRACE("DST MAC: %02X:%02X:%02x:%02X:%02X:%02x\n",
-                                           buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5]);
-                     // replace src MAC address with MAC address of virtual Ethernet interface
--                    OPLK_MEMCPY(&buffer[6], pInstance->macAdrs, ETHER_ADDR_LEN);
-+                    OPLK_MEMCPY(&buffer[6], pInstance->macAdrs, ETH_ALEN);
- 
-                     frameInfo.frame.pBuffer = (tPlkFrame *)buffer;
-                     frameInfo.frameSize = nread;
--- 
-2.5.5
-
diff --git a/package/openpowerlink/0005-PCIe-Driver-Disable-Werror-date-time-for-kernel-3.14.patch b/package/openpowerlink/0005-PCIe-Driver-Disable-Werror-date-time-for-kernel-3.14.patch
deleted file mode 100644
index eb61f93..0000000
--- a/package/openpowerlink/0005-PCIe-Driver-Disable-Werror-date-time-for-kernel-3.14.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cfd85e15957305b461a3553afe1710590b9e01cd Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 4 Jun 2016 01:14:24 +0200
-Subject: [PATCH] PCIe Driver: Disable Werror=date-time for kernel >= 3.14
-
-Avoid a build error due to __DATE__ and __TIME___ being used in
-oplk driver. Just disable the warning with -Wno-date-time.
-
-See da76c94059ed799689ad3283ddcb32d5ace175a0
-
-Upstream status: pending
-https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/123
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- drivers/linux/drv_kernelmod_pcie/CMakeLists.txt | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/drivers/linux/drv_kernelmod_pcie/CMakeLists.txt b/drivers/linux/drv_kernelmod_pcie/CMakeLists.txt
-index d16e2fb..9b119e7 100644
---- a/drivers/linux/drv_kernelmod_pcie/CMakeLists.txt
-+++ b/drivers/linux/drv_kernelmod_pcie/CMakeLists.txt
-@@ -45,6 +45,9 @@ MESSAGE(STATUS "CMAKE_SYSTEM_PROCESSOR is ${CMAKE_SYSTEM_PROCESSOR}")
- STRING(TOLOWER "${CMAKE_SYSTEM_NAME}" SYSTEM_NAME_DIR)
- STRING(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" SYSTEM_PROCESSOR_DIR)
- 
-+# Since 3.14 kernel Werror=date-time is automatically used if the compiler supports it.
-+SET(MODULE_DEFS "${MODULE_DEFS} -Wno-date-time")
-+
- ################################################################################
- # Configuration options
- 
--- 
-2.5.5
-
diff --git a/package/openpowerlink/0006-PCIe-Fix-name-of-sched_priority-element.patch b/package/openpowerlink/0006-PCIe-Fix-name-of-sched_priority-element.patch
deleted file mode 100644
index 8e622b2..0000000
--- a/package/openpowerlink/0006-PCIe-Fix-name-of-sched_priority-element.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 98a4d9b805300511ee87596803a02a5a9376b806 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 4 Jun 2016 11:47:41 +0200
-Subject: [PATCH] PCIe: Fix name of sched_priority element
-
-commit 6212747994ff00c06d7285777ea194e725e62011 and
-3d18c96d3f3be40fc87effba1c982d9607f33712 already removed
-__sched_priority since it's non POSIX compliant.
-
-Upstream status: Pending
-https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/124
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- stack/src/user/event/eventucal-linuxpcie.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/stack/src/user/event/eventucal-linuxpcie.c b/stack/src/user/event/eventucal-linuxpcie.c
-index 1eceb8a..b287d5c 100644
---- a/stack/src/user/event/eventucal-linuxpcie.c
-+++ b/stack/src/user/event/eventucal-linuxpcie.c
-@@ -162,11 +162,11 @@ tOplkError eventucal_init(void)
-     if (pthread_create(&instance_l.kernelEventThreadId, NULL, k2uEventFetchThread, NULL) != 0)
-         goto Exit;
- 
--    schedParam.__sched_priority = KERNEL_EVENT_FETCH_THREAD_PRIORITY;
-+    schedParam.sched_priority = KERNEL_EVENT_FETCH_THREAD_PRIORITY;
-     if (pthread_setschedparam(instance_l.kernelEventThreadId, SCHED_FIFO, &schedParam) != 0)
-     {
-         DEBUG_LVL_ERROR_TRACE("%s(): couldn't set K2U thread scheduling parameters! %d\n",
--                              __func__, schedParam.__sched_priority);
-+                              __func__, schedParam.sched_priority);
-     }
- 
- #if (defined(__GLIBC__) && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 12)
-@@ -177,11 +177,11 @@ tOplkError eventucal_init(void)
-     if (pthread_create(&instance_l.processEventThreadId, NULL, eventProcessThread, NULL) != 0)
-         goto Exit;
- 
--    schedParam.__sched_priority = EVENT_PROCESS_THREAD_PRIORITY;
-+    schedParam.sched_priority = EVENT_PROCESS_THREAD_PRIORITY;
-     if (pthread_setschedparam(instance_l.processEventThreadId, SCHED_FIFO, &schedParam) != 0)
-     {
-         DEBUG_LVL_ERROR_TRACE("%s(): couldn't set event process thread scheduling parameters! %d\n",
--                              __func__, schedParam.__sched_priority);
-+                              __func__, schedParam.sched_priority);
-     }
- 
- #if (defined(__GLIBC__) && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 12)
--- 
-2.5.5
-
diff --git a/package/openpowerlink/0007-apps-include-stdarg.h-in-eventlogstring.h.patch b/package/openpowerlink/0007-apps-include-stdarg.h-in-eventlogstring.h.patch
deleted file mode 100644
index 70e44c2..0000000
--- a/package/openpowerlink/0007-apps-include-stdarg.h-in-eventlogstring.h.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 533f40e097b8d08e1dfeb03e2484a4369fad778f Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 8 Jun 2016 13:13:36 +0200
-Subject: [PATCH] [FIX] apps: include stdarg.h in eventlogstring.h
-
-va_list type is used in eventlogstring.h so it must include stdarg.h to define
-it.
-
-Upstream status: Pending
-https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/127
-
-Fixes:
-http://autobuild.buildroot.net/results/a9e/a9e7615a19922706039bf97ccb94bcf5b99330b2/build-end.log
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- apps/common/src/eventlog/eventlog.c       | 1 -
- apps/common/src/eventlog/eventlogstring.c | 1 -
- apps/common/src/eventlog/eventlogstring.h | 2 ++
- 3 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/apps/common/src/eventlog/eventlog.c b/apps/common/src/eventlog/eventlog.c
-index f2193e2..eba1101 100644
---- a/apps/common/src/eventlog/eventlog.c
-+++ b/apps/common/src/eventlog/eventlog.c
-@@ -47,7 +47,6 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- //------------------------------------------------------------------------------
- 
- #include <stdio.h>
--#include <stdarg.h>
- #include <time.h>
- 
- #include <oplk/debugstr.h>
-diff --git a/apps/common/src/eventlog/eventlogstring.c b/apps/common/src/eventlog/eventlogstring.c
-index 9fb677b..a55a1a4 100644
---- a/apps/common/src/eventlog/eventlogstring.c
-+++ b/apps/common/src/eventlog/eventlogstring.c
-@@ -47,7 +47,6 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #include "eventlogstring.h"
- 
- #include <stdio.h>
--#include <stdarg.h>
- #include <time.h>
- 
- #include <oplk/debugstr.h>
-diff --git a/apps/common/src/eventlog/eventlogstring.h b/apps/common/src/eventlog/eventlogstring.h
-index 2c291a6..3a5f2fa 100644
---- a/apps/common/src/eventlog/eventlogstring.h
-+++ b/apps/common/src/eventlog/eventlogstring.h
-@@ -41,6 +41,8 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- //------------------------------------------------------------------------------
- // includes
- //------------------------------------------------------------------------------
-+#include <stdarg.h>
-+
- #include <oplk/oplk.h>
- #include <oplk/nmt.h>
- 
--- 
-2.5.5
-
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index d112947..a6026cb 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.4.0/
-md5	a833ca76a162db04a28c36ccecfd8a05	openPOWERLINK_V2.4.0.tar.gz
-sha1	d2260f7d1b7f264dd7a0323509bec233d36aed11	openPOWERLINK_V2.4.0.tar.gz
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.4.1/
+md5	13389a419f3727b9c5f07b1b412eff30	openPOWERLINK_V2.4.1.tar.gz
+sha1	eb3883f1771d665d1f948fc35e57bb97dd5c7ca5	openPOWERLINK_V2.4.1.tar.gz
 # sha256 locally computed
-sha256	7296556e621adfeeb643c6541747433ecf86176923d736ea909e9ff6dcf1650b	openPOWERLINK_V2.4.0.tar.gz
+sha256	f627fb8efcb5d9b1b9d8e7701ad611d44d05ad046b1b62ea0f71bd8244d5bf49	openPOWERLINK_V2.4.1.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 4d27d5a..5b1b175 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.4.0
+OPENPOWERLINK_VERSION = V2.4.1
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
-- 
2.5.5
