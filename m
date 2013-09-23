From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 23 Sep 2013 13:09:09 +0200 (CEST)
Subject: [Buildroot] [PATCH v2 1/1] openpowerlink: new package
In-Reply-To: <1924490682.7359027.1379933482308.JavaMail.root@openwide.fr>
Message-ID: <615967893.7359315.1379934549708.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
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

 package/Config.in                                  |    1 +
 package/openpowerlink/Config.in                    |  107 ++++++++++++++++++++
 .../openpowerlink-0001-fix-demo-mn-qt.patch        |   22 ++++
 package/openpowerlink/openpowerlink.mk             |   91 +++++++++++++++++
 4 files changed, 221 insertions(+)
 create mode 100644 package/openpowerlink/Config.in
 create mode 100644 package/openpowerlink/openpowerlink-0001-fix-demo-mn-qt.patch
 create mode 100644 package/openpowerlink/openpowerlink.mk

diff --git a/package/Config.in b/package/Config.in
index 1dd60d1..aac0c12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -309,6 +309,7 @@ source "package/ofono/Config.in"
 source "package/on2-8170-modules/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
+source "package/openpowerlink/Config.in"
 source "package/owl-linux/Config.in"
 source "package/parted/Config.in"
 source "package/pciutils/Config.in"
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
new file mode 100644
index 0000000..b93e431
--- /dev/null
+++ b/package/openpowerlink/Config.in
@@ -0,0 +1,107 @@
+comment "openpowerlink requires thread support in toolchain"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OPENPOWERLINK
+        bool "openpowerlink"
+        depends on BR2_TOOLCHAIN_HAS_THREADS
+        depends on BR2_i386 || BR2_x86_64
+        help
+          openPOWERLINK is an Open Source Industrial Ethernet
+          stack implementing the POWERLINK protocol for Managing Node
+          (MN, POWERLINK Master) and Controlled Node (CN, POWERLINK Slave).
+
+          It is provided by SYSTEC electronic (http://www.systec-electronic.com),
+          B&R (http://www.br-automation.com) and
+          Kalycito (http://www.kalycito.com).
+
+          https://sourceforge.net/projects/openpowerlink/
+
+if BR2_PACKAGE_OPENPOWERLINK
+
+choice
+        prompt "stack implementation"
+
+config BR2_PACKAGE_OPENPOWERLINK_LIBPCAP
+        bool "userspace stack"
+        select BR2_PACKAGE_LIBPCAP
+        help
+          The Linux userspace implementation of the openPOWERLINK stack provides all
+          functions for a software based POWERLINK solution running as Linux userspace
+          application. The stack uses the libpcap library for accessing the network
+          interface and is therefore totally independant of the used network card and
+          driver.
+
+config BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
+        bool "kernel stack"
+        depends on BR2_LINUX_KERNEL
+        help
+          The openPOWERLINK stack may be implemented as Linux kernel module.
+          This solution provides the best performance, but is limited to the available
+          openPOWERLINK network drivers.
+          You may select BR2_PACKAGE_PCIUTILS for lscpi, and BR2_PACKAGE_PROCPS for ps command.
+          These commands are used in EplLoad and EplUndload scripts.
+
+endchoice
+
+if BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
+
+choice
+        prompt "select Ethernet Powerlink Driver"
+
+config BR2_PACKAGE_OPENPOWERLINK_82573
+        bool "Intel 82573"
+
+config BR2_PACKAGE_OPENPOWERLINK_8255x
+        bool "Intel 8255x"
+
+config BR2_PACKAGE_OPENPOWERLINK_RTL8139
+        bool "Realtek RTL-8139"
+
+endchoice
+
+endif
+
+choice
+        prompt "Select MN/CN mode"
+
+        config BR2_PACKAGE_OPENPOWERLINK_MN
+        bool "MN"
+        help
+          Enable Managing Node mode
+
+        config BR2_PACKAGE_OPENPOWERLINK_CN
+        bool "CN"
+        help
+          Enable Controlled Node mode
+
+endchoice
+
+menu "openpowerlink demos"
+
+config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE
+        bool "console MN demo"
+        depends on BR2_PACKAGE_OPENPOWERLINK_MN
+
+config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_QT
+        bool "qt MN demo"
+        depends on BR2_PACKAGE_OPENPOWERLINK_MN
+        select BR2_PACKAGE_QT
+        select BR2_PACKAGE_QT_STL
+
+config BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE
+        bool "console CN demo"
+        depends on !BR2_PACKAGE_OPENPOWERLINK_MN
+
+config BR2_PACKAGE_OPENPOWERLINK_DEMO_LINUX_KERNEL
+        bool "kernel demo"
+        depends on BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
+
+endmenu
+
+config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
+        string "debug level for openpowerlink stack"
+        default "0xEC000000L"
+        help
+          Debug level to be used for openPOWERLINK debugging functions.
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
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
new file mode 100644
index 0000000..5b87a42
--- /dev/null
+++ b/package/openpowerlink/openpowerlink.mk
@@ -0,0 +1,91 @@
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
1.7.10.4
