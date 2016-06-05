From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:19:36 +0200
Subject: [Buildroot] [git commit] package/openpowerlink: enable
	openpowerlink PCIe driver support
Message-ID: <20160605202804.B720281E86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1bc98f396778c9fd8c884527787eb538212f398
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, disable error=date-time for kernel >= 3.14 and fix musl build.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Disable-Werror-date-time-for-kernel-3.14.patch | 35 +++++++++++++++
 ...6-PCIe-Fix-name-of-sched_priority-element.patch | 52 ++++++++++++++++++++++
 package/openpowerlink/Config.in                    | 16 +++++++
 package/openpowerlink/openpowerlink.mk             | 25 ++++++++++-
 4 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/package/openpowerlink/0005-PCIe-Driver-Disable-Werror-date-time-for-kernel-3.14.patch b/package/openpowerlink/0005-PCIe-Driver-Disable-Werror-date-time-for-kernel-3.14.patch
new file mode 100644
index 0000000..eb61f93
--- /dev/null
+++ b/package/openpowerlink/0005-PCIe-Driver-Disable-Werror-date-time-for-kernel-3.14.patch
@@ -0,0 +1,35 @@
+From cfd85e15957305b461a3553afe1710590b9e01cd Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 4 Jun 2016 01:14:24 +0200
+Subject: [PATCH] PCIe Driver: Disable Werror=date-time for kernel >= 3.14
+
+Avoid a build error due to __DATE__ and __TIME___ being used in
+oplk driver. Just disable the warning with -Wno-date-time.
+
+See da76c94059ed799689ad3283ddcb32d5ace175a0
+
+Upstream status: pending
+https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/123
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ drivers/linux/drv_kernelmod_pcie/CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/drivers/linux/drv_kernelmod_pcie/CMakeLists.txt b/drivers/linux/drv_kernelmod_pcie/CMakeLists.txt
+index d16e2fb..9b119e7 100644
+--- a/drivers/linux/drv_kernelmod_pcie/CMakeLists.txt
++++ b/drivers/linux/drv_kernelmod_pcie/CMakeLists.txt
+@@ -45,6 +45,9 @@ MESSAGE(STATUS "CMAKE_SYSTEM_PROCESSOR is ${CMAKE_SYSTEM_PROCESSOR}")
+ STRING(TOLOWER "${CMAKE_SYSTEM_NAME}" SYSTEM_NAME_DIR)
+ STRING(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" SYSTEM_PROCESSOR_DIR)
+ 
++# Since 3.14 kernel Werror=date-time is automatically used if the compiler supports it.
++SET(MODULE_DEFS "${MODULE_DEFS} -Wno-date-time")
++
+ ################################################################################
+ # Configuration options
+ 
+-- 
+2.5.5
+
diff --git a/package/openpowerlink/0006-PCIe-Fix-name-of-sched_priority-element.patch b/package/openpowerlink/0006-PCIe-Fix-name-of-sched_priority-element.patch
new file mode 100644
index 0000000..8e622b2
--- /dev/null
+++ b/package/openpowerlink/0006-PCIe-Fix-name-of-sched_priority-element.patch
@@ -0,0 +1,52 @@
+From 98a4d9b805300511ee87596803a02a5a9376b806 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 4 Jun 2016 11:47:41 +0200
+Subject: [PATCH] PCIe: Fix name of sched_priority element
+
+commit 6212747994ff00c06d7285777ea194e725e62011 and
+3d18c96d3f3be40fc87effba1c982d9607f33712 already removed
+__sched_priority since it's non POSIX compliant.
+
+Upstream status: Pending
+https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/124
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ stack/src/user/event/eventucal-linuxpcie.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/stack/src/user/event/eventucal-linuxpcie.c b/stack/src/user/event/eventucal-linuxpcie.c
+index 1eceb8a..b287d5c 100644
+--- a/stack/src/user/event/eventucal-linuxpcie.c
++++ b/stack/src/user/event/eventucal-linuxpcie.c
+@@ -162,11 +162,11 @@ tOplkError eventucal_init(void)
+     if (pthread_create(&instance_l.kernelEventThreadId, NULL, k2uEventFetchThread, NULL) != 0)
+         goto Exit;
+ 
+-    schedParam.__sched_priority = KERNEL_EVENT_FETCH_THREAD_PRIORITY;
++    schedParam.sched_priority = KERNEL_EVENT_FETCH_THREAD_PRIORITY;
+     if (pthread_setschedparam(instance_l.kernelEventThreadId, SCHED_FIFO, &schedParam) != 0)
+     {
+         DEBUG_LVL_ERROR_TRACE("%s(): couldn't set K2U thread scheduling parameters! %d\n",
+-                              __func__, schedParam.__sched_priority);
++                              __func__, schedParam.sched_priority);
+     }
+ 
+ #if (defined(__GLIBC__) && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 12)
+@@ -177,11 +177,11 @@ tOplkError eventucal_init(void)
+     if (pthread_create(&instance_l.processEventThreadId, NULL, eventProcessThread, NULL) != 0)
+         goto Exit;
+ 
+-    schedParam.__sched_priority = EVENT_PROCESS_THREAD_PRIORITY;
++    schedParam.sched_priority = EVENT_PROCESS_THREAD_PRIORITY;
+     if (pthread_setschedparam(instance_l.processEventThreadId, SCHED_FIFO, &schedParam) != 0)
+     {
+         DEBUG_LVL_ERROR_TRACE("%s(): couldn't set event process thread scheduling parameters! %d\n",
+-                              __func__, schedParam.__sched_priority);
++                              __func__, schedParam.sched_priority);
+     }
+ 
+ #if (defined(__GLIBC__) && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 12)
+-- 
+2.5.5
+
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index e6b41c3..0b68ca8 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -68,6 +68,18 @@ config BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
 	  build and install a Linux kernel module openPOWERLINK
 	  driver.
 
+config BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB
+	bool "kernel-space PCIe driver"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_OPENPOWERLINK_MN # MN support only
+	help
+	  Compile openPOWERLINK application library which contains the
+	  interface to a Linux kernel PCIe interface driver. The kernel
+	  part of the openPOWERLINK stack is located on an external PCIe
+	  device. The status/control and data exchange between the
+	  application and kernel stack is handled by the PCIe interface
+	  driver.
+
 comment "openpowerlink kernel stack needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
@@ -97,6 +109,10 @@ endchoice
 
 endif # BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
 
+config BR2_PACKAGE_OPENPOWERLINK_KERNEL_PCIE_DRIVER
+	depends on BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB
+	bool "PCIe Powerlink Driver"
+
 menu "demos"
 
 config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 3ac4ccb..53c636c 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -59,6 +59,17 @@ OPENPOWERLINK_CONF_OPTS += \
 	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
 	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=$(OPENPOWERLINK_CN_ONOFF) \
 	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB),y)
+OPENPOWERLINK_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_PCIEINTF=$(OPENPOWERLINK_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
+	-DCFG_COMPILE_LIB_CN=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
 endif
 
 OPENPOWERLINK_CONF_OPTS += \
@@ -66,17 +77,19 @@ OPENPOWERLINK_CONF_OPTS += \
 
 #### OPLK KERNEL DRIVERS ####
 
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB)$(BR2_PACKAGE_OPENPOWERLINK_KERNEL_PCIE_DRIVER),y)
 OPENPOWERLINK_DEPENDENCIES += linux
 
 OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_KERNEL_DRIVERS=ON \
 	-DCFG_KERNEL_DIR="$(LINUX_DIR)" \
 	-DCMAKE_SYSTEM_VERSION="$(LINUX_VERSION)" \
 	-DCFG_OPLK_MN="$(OPENPOWERLINK_MN_ONOFF)" \
 	-DMAKE_KERNEL_ARCH="$(KERNEL_ARCH)" \
 	-DMAKE_KERNEL_CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
+endif
 
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
+OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_DRIVERS=ON
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_82573),y)
 OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=82573
 else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_8255x),y)
@@ -88,6 +101,14 @@ OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8111
 else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8139),y)
 OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8139
 endif
+else
+OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_DRIVERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_PCIE_DRIVER),y)
+OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_PCIE_DRIVERS=ON
+else
+OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_PCIE_DRIVERS=OFF
 endif
 
 #### OPLK PCAP DAEMON ####
