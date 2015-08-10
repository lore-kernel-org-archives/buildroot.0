From: Christian Stewart <christian@paral.in>
Date: Mon, 10 Aug 2015 15:08:36 -0700
Subject: [Buildroot] [PATCH v3 1/2] package/rtl8821au: fix kernel module
	configuration
Message-ID: <1439244517-19882-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rtl8821au package has a significant bug: the Makefile in the
upstream repository sets on default configuration values for i386 and
power management enabled, which assumes LITTLE_ENDIAN and ignores the
configuration done in the buildroot makefile. This patch removes these
default configuration settings from the upstream Makefile, removes an
unnecessary KVER variable, and fixes the EXTRA_CFLAGS configuration
setting.

Signed-off-by: Christian Stewart <christian@paral.in>

Conflicts:
	package/rtl8821au/rtl8821au.mk

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...e-default-powermanagement-and-i386-config.patch | 43 ++++++++++++++++++++++
 package/rtl8821au/rtl8821au.mk                     |  3 +-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 package/rtl8821au/0001-Remove-default-powermanagement-and-i386-config.patch

diff --git a/package/rtl8821au/0001-Remove-default-powermanagement-and-i386-config.patch b/package/rtl8821au/0001-Remove-default-powermanagement-and-i386-config.patch
new file mode 100644
index 0000000..6c1f8af
--- /dev/null
+++ b/package/rtl8821au/0001-Remove-default-powermanagement-and-i386-config.patch
@@ -0,0 +1,43 @@
+From e49c13919be05708a6918e204d7385284f00f73d Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 6 Aug 2015 10:53:34 -0700
+Subject: [PATCH v1 1/1] Remove default powermanagement and i386 config
+
+On default power management is enabled, as well as a bunch if i386
+related config options. This patch removes these options and adds the
+variable RTL8821AU_EXTRA_CFLAGS. This patch would likely not be
+accepted upstream because the repository is geared towards easy usage,
+so the defaults for power management and i386 configuration will likely
+stay.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ Makefile | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 65076c5..9b71bd5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,6 +5,8 @@ EXTRA_CFLAGS += -Wno-uninitialized
+ 
+ EXTRA_CFLAGS += -I$(src)/include
+ 
++EXTRA_CFLAGS += $(RTL8821AU_EXTRA_CFLAGS)
++
+ CONFIG_RTL8812A = y
+ CONFIG_RTL8821A = y
+ 
+@@ -16,9 +18,6 @@ CONFIG_RTL8821A = y
+ 
+ CONFIG_RTLWIFI_DEBUG = y
+ 
+-CONFIG_POWER_SAVING = y
+-CONFIG_PLATFORM_I386_PC = y
+-
+ export TopDIR ?= $(shell pwd)
+ 
+ RTLWIFI_FILES :=	debug.o \
+-- 
+2.1.4
+
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index eddb18e..ee3741c 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -11,8 +11,7 @@ RTL8821AU_LICENSE_FILES = COPYING
 
 RTL8821AU_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8812AU_8821AU=m \
-	KVER=$(LINUX_VERSION_PROBED) \
-	USER_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+	RTL8821AU_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
 
 define RTL8821AU_FIRMWARE_INSTALL
 	mkdir -p $(TARGET_DIR)/lib/firmware/rtlwifi/
-- 
2.1.4
