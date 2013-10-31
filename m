From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 31 Oct 2013 18:20:26 +0100
Subject: [Buildroot] [PATCH 1/1] openpowerlink: bump to version 1.8.4
Message-ID: <1383240026-10300-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...Fix-Linux-Powerlink-user-lib-add-INSTALL.patch} |  0
 .../openpowerlink-0001-fix-demo-mn-qt.patch        | 22 ------
 ...002-Fix-compilation-issue-for-kernels-3.5.patch | 78 ----------------------
 package/openpowerlink/openpowerlink.mk             |  4 +-
 4 files changed, 2 insertions(+), 102 deletions(-)
 rename package/openpowerlink/{openpowerlink-0003-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch => openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch} (100%)
 delete mode 100644 package/openpowerlink/openpowerlink-0001-fix-demo-mn-qt.patch
 delete mode 100644 package/openpowerlink/openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch

diff --git a/package/openpowerlink/openpowerlink-0003-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch b/package/openpowerlink/openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
similarity index 100%
rename from package/openpowerlink/openpowerlink-0003-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
rename to package/openpowerlink/openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
diff --git a/package/openpowerlink/openpowerlink-0001-fix-demo-mn-qt.patch b/package/openpowerlink/openpowerlink-0001-fix-demo-mn-qt.patch
deleted file mode 100644
index c573662..0000000
--- a/package/openpowerlink/openpowerlink-0001-fix-demo-mn-qt.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-commit 8658075bd7c49a7481e8f6d0d7a13b0651e1dfd7
-Author: Romain Naour <romain.naour@openwide.fr>
-Date:   Wed Sep 18 23:33:04 2013 +0200
-
-    [FIX] demo_mn_qt: add EplDebug.c in demo_sources list
-
-    demo_mn_qt use EplGetEmergErrCodeStr()
-
-    Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-
-diff --git a/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt b/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt
-index 9db2f7f..48ae9eb 100644
---- a/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt
-+++ b/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt
-@@ -78,6 +78,7 @@ SET(DEMO_SOURCES src/EplApi.cpp
-                  src/MainWindow.cpp
-                  src/NodeState.cpp
-                  ${POWERLINK_SOURCE_DIR}/ObjDicts/${OBJDICT}/EplApiProcessImageSetup.c
-+                 ${POWERLINK_SOURCE_DIR}/EplStack/EplDebug.c
-     )
-
- # The TRACE macros need trace.c on the Windows platform
diff --git a/package/openpowerlink/openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch b/package/openpowerlink/openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch
deleted file mode 100644
index 064a6f0..0000000
--- a/package/openpowerlink/openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 9990e19bc554d11c4123986692c5e0572682467a Mon Sep 17 00:00:00 2001
-From: Josef Baumgartner <josef.baumgartner@br-automation.com>
-Date: Wed, 14 Aug 2013 10:22:21 +0200
-Subject: [PATCH 1/1] [FIX] Fix compilation issue for kernels > 3.5
-
-With kernel version 3.5 the interface of kmap_atomic() and
-kunmap_atomic is changed. The fix adapts to the new interface.
-
-Change-Id: I0885b87dc594bf48d1ff4eaeaf188268ceb3b112
-Reviewed-on: http://brateggevoat1/gerrit/1261
-Tested-by: Jenkins <jenkins@brateggevoat1.br-automation.co.at>
-Reviewed-by: Josef Baumgartner <josef.baumgartner@br-automation.com>
----
- EplStack/EplApiProcessImage.c | 24 +++++++++++++++++++-----
- 1 file changed, 19 insertions(+), 5 deletions(-)
-
-diff --git a/EplStack/EplApiProcessImage.c b/EplStack/EplApiProcessImage.c
-index a1a049f..02907bc 100644
---- a/EplStack/EplApiProcessImage.c
-+++ b/EplStack/EplApiProcessImage.c
-@@ -573,7 +573,7 @@ tEplApiProcessImageCopyJobInt   IntCopyJob;
- #elif (TARGET_SYSTEM == _WIN32_)
-     if (EplApiProcessImageInstance_g.m_dwCurrentThreadId == GetCurrentThreadId())
- #elif (TARGET_SYSTEM == _VXWORKS_)
--    if (EplApiProcessImageInstance_g.m_currentThreadId == taskIdSelf())    	
-+    if (EplApiProcessImageInstance_g.m_currentThreadId == taskIdSelf())
- #else
- #error "OS currently not supported by EplApiProcessImage!"
- #endif
-@@ -1018,13 +1018,20 @@ void*           pVirtUserPart;
-             }
-
-             ulSize = min ((PAGE_SIZE - ulOffset), pPart->m_uiSize - ulLength);
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,5,0)
-             pVirtUserPart = kmap_atomic(ppPage[nIndex], KM_USER0);
-+#else
-+            pVirtUserPart = kmap_atomic(ppPage[nIndex]);
-+#endif
-
-             EPL_MEMCPY(pPIVar,
-                 pVirtUserPart + ulOffset,
-                 ulSize);
--
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,5,0)
-             kunmap_atomic(pVirtUserPart, KM_USER0);
-+#else
-+            kunmap_atomic(pVirtUserPart);
-+#endif
-
-             pPIVar += ulSize;
-             ulLength += ulSize;
-@@ -1063,14 +1070,21 @@ void*           pVirtUserPart;
-             }
-
-             ulSize = min ((PAGE_SIZE - ulOffset), pPart->m_uiSize - ulLength);
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,5,0)
-             pVirtUserPart = kmap_atomic(ppPage[nIndex], KM_USER0);
-+#else
-+            pVirtUserPart = kmap_atomic(ppPage[nIndex]);
-+#endif
-
-             EPL_MEMCPY(pVirtUserPart + ulOffset,
-                 pPIVar,
-                 ulSize);
-
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,5,0)
-             kunmap_atomic(pVirtUserPart, KM_USER0);
--
-+#else
-+            kunmap_atomic(pVirtUserPart);
-+#endif
-             pPIVar += ulSize;
-             ulLength += ulSize;
-             ulOffset = 0;
-
---
-1.8.4
-
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 5babdd6..3a60478 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V1.08.3
+OPENPOWERLINK_VERSION = V1.08.4
 OPENPOWERLINK_SOURCE = openPOWERLINK-$(OPENPOWERLINK_VERSION).zip
-OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V1.8.3
+OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V1.8.4
 
 OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
 OPENPOWERLINK_LICENSE_FILES = license.txt
-- 
1.8.1.4
