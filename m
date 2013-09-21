From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 21 Sep 2013 10:17:24 +0200
Subject: [Buildroot] [PATCH 1/1] Openpowerlink: new package
In-Reply-To: <681556336.7308664.1379724486354.JavaMail.root@openwide.fr>
References: <1165322922.7308619.1379724109699.JavaMail.root@openwide.fr>
 <681556336.7308664.1379724486354.JavaMail.root@openwide.fr>
Message-ID: <CAAXf6LWRhU6D4CgKkrvNA_s3T_CbRvnQaaX=wPZJTDPzgP5vfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Sep 21, 2013 at 2:48 AM, Romain Naour <romain.naour@openwide.fr> wrote:
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/Config.in                                  |  1 +
>  package/openpowerlink/Config.in                    | 92 +++++++++++++++++++++
>  .../openpowerlink-FIX-demo_mn_qt.patch             | 27 +++++++
>  package/openpowerlink/openpowerlink.mk             | 93 ++++++++++++++++++++++
>  4 files changed, 213 insertions(+)
>  create mode 100644 package/openpowerlink/Config.in
>  create mode 100644 package/openpowerlink/openpowerlink-FIX-demo_mn_qt.patch
>  create mode 100644 package/openpowerlink/openpowerlink.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e1dfd5d..fdf9b55 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -912,6 +912,7 @@ endmenu
>  menu "Real-Time"
>  source "package/xenomai/Config.in"
>  source "package/rtai/Config.in"
> +source "package/openpowerlink/Config.in"
>  endmenu
>
>  menu "Shell and utilities"
> diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
> new file mode 100644
> index 0000000..42a6099
> --- /dev/null
> +++ b/package/openpowerlink/Config.in
> @@ -0,0 +1,92 @@
> +comment "openpowerlink requires thread support in toolchain"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +config BR2_PACKAGE_OPENPOWERLINK
> +       bool "Openpowerlink"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_i386 || BR2_x86_64
> +       help
> +         openPOWERLINK is an Open Source Industrial Ethernet
> +         stack implementing the POWERLINK protocol for Managing Node
> +         (MN, POWERLINK Master) and Controlled Node (CN, POWERLINK Slave).
> +
> +         It is provided by SYSTEC electronic (http://www.systec-electronic.com),
> +         B&R (http://www.br-automation.com) and
> +         Kalycito (http://www.kalycito.com).
> +
> +if BR2_PACKAGE_OPENPOWERLINK
> +
> +choice
> +       prompt "Openpowerlink mode"
> +
> +config BR2_PACKAGE_OPENPOWERLINK_LIBPCAP
> +       bool "userspace stack"
> +       select BR2_PACKAGE_LIBPCAP
> +
> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
> +       bool "kernel stack"
> +       depends on BR2_LINUX_KERNEL
> +       help
> +         You may select BR2_PACKAGE_PCIUTILS for lscpi, and BR2_PACKAGE_PROCPS for ps command.
> +         These commands are used in EplLoad and EplUndload scripts.
> +
> +endchoice
> +
> +if BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
> +
> +choice
> +       prompt "Select Ethernet Powerlink Driver"
> +
> +config BR2_PACKAGE_OPENPOWERLINK_82573
> +       bool "Intel 82573"
> +
> +config BR2_PACKAGE_OPENPOWERLINK_8255x
> +       bool "Intel 8255x"
> +
> +config BR2_PACKAGE_OPENPOWERLINK_RTL8139
> +       bool "Realteck RTL-8139"
> +
> +endchoice
> +
> +endif
> +
> +choice
> +       prompt "Select MN/CN mode"
> +
> +       config BR2_PACKAGE_OPENPOWERLINK_MN
> +       bool "MN"
> +       help
> +         Enable Managing Node mode
> +
> +       config BR2_PACKAGE_OPENPOWERLINK_CN
> +       bool "CN"
> +       help
> +         Enable Controlled Node mode
> +
> +endchoice
> +
> +# Powerlink Demos
> +config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE
> +       bool "Console MN demo"
> +       depends on BR2_PACKAGE_OPENPOWERLINK_MN
> +
> +config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_QT
> +       bool "QT MN demo"
> +       depends on BR2_PACKAGE_OPENPOWERLINK_MN
> +       select BR2_PACKAGE_QT
> +       select BR2_PACKAGE_QT_STL
> +
> +config BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE
> +       bool "Console CN demo"
> +       depends on !BR2_PACKAGE_OPENPOWERLINK_MN
> +
> +config BR2_PACKAGE_OPENPOWERLINK_DEMO_LINUX_KERNEL
> +       bool "Kernel demo"
> +       depends on BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
> +
> +config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
> +       string "Debug level for EPL"
> +       help
> +         default value: 0xEC000000L
> +
> +endif
> diff --git a/package/openpowerlink/openpowerlink-FIX-demo_mn_qt.patch b/package/openpowerlink/openpowerlink-FIX-demo_mn_qt.patch
> new file mode 100644
> index 0000000..a71298d
> --- /dev/null
> +++ b/package/openpowerlink/openpowerlink-FIX-demo_mn_qt.patch
> @@ -0,0 +1,27 @@
> +From 8658075bd7c49a7481e8f6d0d7a13b0651e1dfd7 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Wed, 18 Sep 2013 23:33:04 +0200
> +Subject: [PATCH 1/1] [FIX] demo_mn_qt: add EplDebug.c in demo_sources list
> +
> +demo_mn_qt use EplGetEmergErrCodeStr()
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + Examples/X86/Generic/demo_mn_qt/CMakeLists.txt | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt b/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt
> +index 9db2f7f..48ae9eb 100644
> +--- a/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt
> ++++ b/Examples/X86/Generic/demo_mn_qt/CMakeLists.txt
> +@@ -78,6 +78,7 @@ SET(DEMO_SOURCES src/EplApi.cpp
> +                  src/MainWindow.cpp
> +                  src/NodeState.cpp
> +                  ${POWERLINK_SOURCE_DIR}/ObjDicts/${OBJDICT}/EplApiProcessImageSetup.c
> ++                 ${POWERLINK_SOURCE_DIR}/EplStack/EplDebug.c
> +     )
> +
> + # The TRACE macros need trace.c on the Windows platform
> +--
> +1.8.4
> +
> diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
> new file mode 100644
> index 0000000..ac28de9
> --- /dev/null
> +++ b/package/openpowerlink/openpowerlink.mk
> @@ -0,0 +1,93 @@
> +################################################################################
> +#
> +# openPOWERLINK
> +#
> +################################################################################
> +
> +OPENPOWERLINK_VERSION = V1.08.3
> +OPENPOWERLINK_SOURCE = openPOWERLINK-$(OPENPOWERLINK_VERSION).zip
> +OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V1.8.3
> +
> +OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
> +OPENPOWERLINK_LICENSE_FILES = license.txt
> +OPENPOWERLINK_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_i386),y)
> +OPENPOWERLINK_ARCH = x86
> +endif
> +
> +ifeq ($(BR2_x86_64),y)
> +OPENPOWERLINK_ARCH = x86_64
> +endif
> +
> +OPENPOWERLINK_CONF_OPT = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
> +OPENPOWERLINK_CONF_OPT += -DCMAKE_BUILD_TYPE=Debug
> +OPENPOWERLINK_CONF_OPT += -DCMAKE_INSTALL_PREFIX=/usr/
> +
> +OPENPOWERLINK_DEBUG_LEVEL = $(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))
> +
> +ifeq ($(OPENPOWERLINK_DEBUG_LEVEL),)
> +OPENPOWERLINK_CONF_OPT += -DCFG_DEBUG_LVL=0xEC000000L
> +else
> +OPENPOWERLINK_CONF_OPT += -DCFG_DEBUG_LVL=$(OPENPOWERLINK_DEBUG_LEVEL)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_LIBPCAP),y)
> +#  use the user space stack (libpcap)
> +OPENPOWERLINK_CONF_OPT += -DCFG_KERNEL_STACK=OFF
> +OPENPOWERLINK_DEPENDENCIES = libpcap
> +else
> +# use the kernel stack
> +OPENPOWERLINK_CONF_OPT += -DCFG_KERNEL_STACK=ON
> +OPENPOWERLINK_CONF_OPT += -DCFG_KERNEL_DIR=$(LINUX_DIR)
> +OPENPOWERLINK_CONF_OPT += -DCMAKE_SYSTEM_VERSION=$(LINUX_VERSION)
> +OPENPOWERLINK_DEPENDENCIES = linux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_82573),y)
> +OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=82573
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_RTL8139),y)
> +OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=8139
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_8255x),y)
> +OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=8255x
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_MN),y)
> +OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_MN=ON
> +else
> +OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_MN=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE),y)
> +OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_CONSOLE=ON
> +else
> +OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_CONSOLE=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_QT),y)
> +OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_QT=ON
> +OPENPOWERLINK_DEPENDENCIES += qt
> +else
> +OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_QT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE),y)
> +OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_CN_CONSOLE=ON
> +else
> +OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_CN_CONSOLE=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_LINUX_KERNEL),y)
> +OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_LINUX_KERNEL=ON
> +else
> +OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_LINUX_KERNEL=OFF
> +endif
> +
> +define OPENPOWERLINK_EXTRACT_CMDS
> +       $(RM) -rf $(OPENPOWERLINK_DIR)
> +       unzip -q -d $(BUILD_DIR)/ $(DL_DIR)/$(OPENPOWERLINK_SOURCE)
> +       test -d $(OPENPOWERLINK_DIR) || \
> +               mv $(BUILD_DIR)/$(subst .zip,,$(OPENPOWERLINK_SOURCE)) $(OPENPOWERLINK_DIR)
> +endef
> +
> +$(eval $(cmake-package))
> --
> 1.8.4
>

Hmm, that test didn't seem to work.
This test is from Gmail on desktop, just to be double-check that that
is OK. Sorry for the spam by the way, don't know a better way to check
it, because the gmail web interface does not show any bad line
wrapping...

Best regards,
Thomas
