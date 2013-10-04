From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 04 Oct 2013 22:18:22 +0200
Subject: [Buildroot] [PATCH v3 1/1] openpowerlink: new package
Message-ID: <524F228E.9070602@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---

v3:
  - Add CPP depends
  - Add build fix for kernels > 3.5
  - Fix lib install

v2:
  - Fix case
  - Fix statements

v1:
  - Move openpowerlink to hardware handling menu
  - Add package sources url
  - Add some help in menuconfig
  - Fix typo
  - Move openpowerlink demos in a submenu
  - Fix patch name
  - Fix debug default value
  - Add build Release or Debug depending on BR2_ENABLE_DEBUG

v0: initial commit
  - Add openpowerlink package.

 package/Config.in                                  |   1 +
 package/openpowerlink/Config.in                    | 112 +++++++++++++++++++++
 .../openpowerlink-0001-fix-demo-mn-qt.patch        |  22 ++++
 ...002-Fix-compilation-issue-for-kernels-3.5.patch |  88 ++++++++++++++++
 ...-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch |  28 ++++++
 package/openpowerlink/openpowerlink.mk             |  95 +++++++++++++++++
 6 files changed, 346 insertions(+)
 create mode 100644 package/openpowerlink/Config.in
 create mode 100644 package/openpowerlink/openpowerlink-0001-fix-demo-mn-qt.patch
 create mode 100644 package/openpowerlink/openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch
 create mode 100644 package/openpowerlink/openpowerlink-0003-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
 create mode 100644 package/openpowerlink/openpowerlink.mk

diff --git a/package/Config.in b/package/Config.in
index b7fdb89..8e37fbe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -311,6 +311,7 @@ source "package/ofono/Config.in"
 source "package/on2-8170-modules/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
+source "package/openpowerlink/Config.in"
 source "package/owl-linux/Config.in"
 source "package/parted/Config.in"
 source "package/pciutils/Config.in"
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
new file mode 100644
index 0000000..296b084
--- /dev/null
+++ b/package/openpowerlink/Config.in
@@ -0,0 +1,112 @@
+comment "openpowerlink requires a toolchain with C++ and threads support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OPENPOWERLINK
+	bool "openpowerlink"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  openPOWERLINK is an Open Source Industrial Ethernet
+	  stack implementing the POWERLINK protocol for Managing Node
+	  (MN, POWERLINK Master) and Controlled Node (CN, POWERLINK Slave).
+
+	  It is provided by
+	  SYSTEC electronic (http://www.systec-electronic.com),
+	  B&R (http://www.br-automation.com) and
+	  Kalycito (http://www.kalycito.com).
+
+	  https://sourceforge.net/projects/openpowerlink/
+
+if BR2_PACKAGE_OPENPOWERLINK
+
+choice
+	prompt "stack implementation"
+
+config BR2_PACKAGE_OPENPOWERLINK_LIBPCAP
+	bool "userspace stack"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  The Linux userspace implementation of the openPOWERLINK stack provides
+	  all functions for a software based POWERLINK solution running as Linux
+	  userspace application. The stack uses the libpcap library for accessing
+	  the network interface and is therefore totally independant of the used
+	  network card and driver.
+
+config BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
+	bool "kernel stack"
+	depends on BR2_LINUX_KERNEL
+	help
+	  The openPOWERLINK stack may be implemented as Linux kernel module.
+	  This solution provides the best performance, but is limited to the
+	  available openPOWERLINK network drivers.
+	  You may select BR2_PACKAGE_PCIUTILS for lscpi,
+	  and BR2_PACKAGE_PROCPS for ps command.
+	  These commands are used in EplLoad and EplUndload scripts.
+
+endchoice
+
+if BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
+
+choice
+	prompt "select Ethernet Powerlink Driver"
+
+config BR2_PACKAGE_OPENPOWERLINK_82573
+	bool "Intel 82573"
+
+config BR2_PACKAGE_OPENPOWERLINK_8255x
+	bool "Intel 8255x"
+
+config BR2_PACKAGE_OPENPOWERLINK_RTL8139
+	bool "Realtek RTL-8139"
+
+endchoice
+
+endif
+
+choice
+	prompt "Select MN/CN mode"
+
+	config BR2_PACKAGE_OPENPOWERLINK_MN
+	bool "MN"
+	help
+	  Enable Managing Node mode
+
+	config BR2_PACKAGE_OPENPOWERLINK_CN
+	bool "CN"
+	help
+	  Enable Controlled Node mode
+
+endchoice
+
+menu "openpowerlink demos"
+
+config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE
+	bool "console MN demo"
+	depends on BR2_PACKAGE_OPENPOWERLINK_MN
+
+config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_QT
+	bool "qt MN demo"
+	depends on BR2_PACKAGE_OPENPOWERLINK_MN
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_STL
+
+config BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE
+	bool "console CN demo"
+	depends on !BR2_PACKAGE_OPENPOWERLINK_MN
+
+config BR2_PACKAGE_OPENPOWERLINK_DEMO_LINUX_KERNEL
+	bool "kernel demo"
+	depends on BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
+	depends on BR2_PACKAGE_OPENPOWERLINK_MN
+
+endmenu
+
+config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
+	string "debug level for openpowerlink stack"
+	default "0xEC000000L"
+	help
+	  Debug level to be used for openPOWERLINK debugging functions.
+
+endif
diff --git a/package/openpowerlink/openpowerlink-0001-fix-demo-mn-qt.patch b/package/openpowerlink/openpowerlink-0001-fix-demo-mn-qt.patch
new file mode 100644
index 0000000..fcbdd52
--- /dev/null
+++ b/package/openpowerlink/openpowerlink-0001-fix-demo-mn-qt.patch
@@ -0,0 +1,22 @@
+commit 8658075bd7c49a7481e8f6d0d7a13b0651e1dfd7
+Author: Romain Naour <romain.naour@openwide.fr>
+Date:   Wed Sep 18 23:33:04 2013 +0200
+
+    [FIX] demo_mn_qt: add EplDebug.c in demo_sources list
+
+    demo_mn_qt use EplGetEmergErrCodeStr()
+
+    Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+
+diff --git a/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt b/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt
+index 9db2f7f..48ae9eb 100644
+--- a/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt
++++ b/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt
+@@ -78,6 +78,7 @@ SET(DEMO_SOURCES src/EplApi.cpp
+                  src/MainWindow.cpp
+                  src/NodeState.cpp
+                  ${POWERLINK_SOURCE_DIR}/ObjDicts/${OBJDICT}/EplApiProcessImageSetup.c
++                 ${POWERLINK_SOURCE_DIR}/EplStack/EplDebug.c
+     )
+
+ # The TRACE macros need trace.c on the Windows platform
diff --git a/package/openpowerlink/openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch
b/package/openpowerlink/openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch
new file mode 100644
index 0000000..a200c9c
--- /dev/null
+++ b/package/openpowerlink/openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch
@@ -0,0 +1,88 @@
+From 9990e19bc554d11c4123986692c5e0572682467a Mon Sep 17 00:00:00 2001
+From: Josef Baumgartner <josef.baumgartner@br-automation.com>
+Date: Wed, 14 Aug 2013 10:22:21 +0200
+Subject: [PATCH 1/1] [FIX] Fix compilation issue for kernels > 3.5
+
+With kernel version 3.5 the interface of kmap_atomic() and
+kunmap_atomic is changed. The fix adapts to the new interface.
+
+Change-Id: I0885b87dc594bf48d1ff4eaeaf188268ceb3b112
+Reviewed-on: http://brateggevoat1/gerrit/1261
+Tested-by: Jenkins <jenkins@brateggevoat1.br-automation.co.at>
+Reviewed-by: Josef Baumgartner <josef.baumgartner@br-automation.com>
+---
+ EplStack/EplApiProcessImage.c | 24 +++++++++++++++++++-----
+ 1 file changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/EplStack/EplApiProcessImage.c b/EplStack/EplApiProcessImage.c
+index a1a049f..02907bc 100644
+--- a/EplStack/EplApiProcessImage.c
++++ b/EplStack/EplApiProcessImage.c
+@@ -573,7 +573,7 @@ tEplApiProcessImageCopyJobInt   IntCopyJob;
+ #elif (TARGET_SYSTEM == _WIN32_)
+     if (EplApiProcessImageInstance_g.m_dwCurrentThreadId == GetCurrentThreadId())
+ #elif (TARGET_SYSTEM == _VXWORKS_)
+-    if (EplApiProcessImageInstance_g.m_currentThreadId == taskIdSelf())    	
++    if (EplApiProcessImageInstance_g.m_currentThreadId == taskIdSelf())
+ #else
+ #error "OS currently not supported by EplApiProcessImage!"
+ #endif
+@@ -1018,13 +1018,20 @@ void*           pVirtUserPart;
+             }
+
+             ulSize = min ((PAGE_SIZE - ulOffset), pPart->m_uiSize - ulLength);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,5,0)
+             pVirtUserPart = kmap_atomic(ppPage[nIndex], KM_USER0);
++#else
++            pVirtUserPart = kmap_atomic(ppPage[nIndex]);
++#endif
+
+             EPL_MEMCPY(pPIVar,
+                 pVirtUserPart + ulOffset,
+                 ulSize);
+-
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,5,0)
+             kunmap_atomic(pVirtUserPart, KM_USER0);
++#else
++            kunmap_atomic(pVirtUserPart);
++#endif
+
+             pPIVar += ulSize;
+             ulLength += ulSize;
+@@ -1063,14 +1070,21 @@ void*           pVirtUserPart;
+             }
+
+             ulSize = min ((PAGE_SIZE - ulOffset), pPart->m_uiSize - ulLength);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,5,0)
+             pVirtUserPart = kmap_atomic(ppPage[nIndex], KM_USER0);
++#else
++            pVirtUserPart = kmap_atomic(ppPage[nIndex]);
++#endif
+
+             EPL_MEMCPY(pVirtUserPart + ulOffset,
+                 pPIVar,
+                 ulSize);
+
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,5,0)
+             kunmap_atomic(pVirtUserPart, KM_USER0);
+-
++#else
++            kunmap_atomic(pVirtUserPart);
++#endif
+             pPIVar += ulSize;
+             ulLength += ulSize;
+             ulOffset = 0;
+@@ -1244,8 +1258,8 @@ tEplKernel      Ret = kEplSuccessful;
+     }
+ #elif (TARGET_SYSTEM == _VXWORKS_)
+     semDelete(pCopyJob_p->m_Event.m_semCompletion);
+-
+-#else
++
++#else
+ #error "OS currently not supported by EplApiProcessImage!"
+ #endif
+
+--
+1.8.4
+
diff --git a/package/openpowerlink/openpowerlink-0003-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
b/package/openpowerlink/openpowerlink-0003-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
new file mode 100644
index 0000000..d706461
--- /dev/null
+++ b/package/openpowerlink/openpowerlink-0003-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
@@ -0,0 +1,28 @@
+From cb6c4ff053e72f7fe5954894aebe2c0d94120b2d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 3 Oct 2013 23:22:17 +0200
+Subject: [PATCH 5/5] [FIX] Linux Powerlink user lib: add INSTALL
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt b/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
+index e67d573..40b7756 100644
+--- a/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
++++ b/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
+@@ -329,7 +329,9 @@ ENDIF ()
+ #
+ # Installation
+ #
+-IF (WIN32)
++IF (UNIX)
++    INSTALL(TARGETS powerlink ARCHIVE DESTINATION lib)
++ELSEIF (WIN32)
+     IF (CFG_X86_WINDOWS_DLL)
+         INSTALL(TARGETS openPOWERLINK RUNTIME DESTINATION bin)
+     ENDIF (CFG_X86_WINDOWS_DLL)
+--
+1.8.4
+
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
new file mode 100644
index 0000000..5babdd6
--- /dev/null
+++ b/package/openpowerlink/openpowerlink.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# openpowerlink
+#
+################################################################################
+
+OPENPOWERLINK_VERSION = V1.08.3
+OPENPOWERLINK_SOURCE = openPOWERLINK-$(OPENPOWERLINK_VERSION).zip
+OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V1.8.3
+
+OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
+OPENPOWERLINK_LICENSE_FILES = license.txt
+OPENPOWERLINK_INSTALL_STAGING = YES
+
+ifeq ($(BR2_i386),y)
+OPENPOWERLINK_ARCH = x86
+endif
+
+ifeq ($(BR2_x86_64),y)
+OPENPOWERLINK_ARCH = x86_64
+endif
+
+OPENPOWERLINK_CONF_OPT = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+OPENPOWERLINK_CONF_OPT += -DCMAKE_BUILD_TYPE=Debug
+else
+OPENPOWERLINK_CONF_OPT += -DCMAKE_BUILD_TYPE=Release
+endif
+
+OPENPOWERLINK_CONF_OPT += -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_LIBPCAP),y)
+#  use the user space stack (libpcap)
+OPENPOWERLINK_CONF_OPT += -DCFG_KERNEL_STACK=OFF
+OPENPOWERLINK_DEPENDENCIES = libpcap
+define OPENPOWERLINK_REMOVE_LIB
+	rm $(TARGET_DIR)/usr/lib/libpowerlink.a
+endef
+OPENPOWERLINK_POST_INSTALL_TARGET_HOOKS += OPENPOWERLINK_REMOVE_LIB
+else
+# use the kernel stack
+OPENPOWERLINK_CONF_OPT += -DCFG_KERNEL_STACK=ON \
+		-DCFG_KERNEL_DIR=$(LINUX_DIR) \
+		-DCMAKE_SYSTEM_VERSION=$(LINUX_VERSION)
+OPENPOWERLINK_DEPENDENCIES = linux
+endif
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_82573),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=82573
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_RTL8139),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=8139
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_8255x),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=8255x
+endif
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_MN),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_MN=ON
+else
+OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_MN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_CONSOLE=ON
+else
+OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_CONSOLE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_QT),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_QT=ON
+OPENPOWERLINK_DEPENDENCIES += qt
+else
+OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_QT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_CN_CONSOLE=ON
+else
+OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_CN_CONSOLE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_LINUX_KERNEL),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_LINUX_KERNEL=ON
+else
+OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_LINUX_KERNEL=OFF
+endif
+
+define OPENPOWERLINK_EXTRACT_CMDS
+	$(RM) -rf $(OPENPOWERLINK_DIR)
+	unzip -q -d $(BUILD_DIR)/ $(DL_DIR)/$(OPENPOWERLINK_SOURCE)
+	test -d $(OPENPOWERLINK_DIR) || \
+		mv $(BUILD_DIR)/$(subst .zip,,$(OPENPOWERLINK_SOURCE)) $(OPENPOWERLINK_DIR)
+endef
+
+$(eval $(cmake-package))
-- 
1.8.4
