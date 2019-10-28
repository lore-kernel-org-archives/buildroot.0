From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Oct 2019 23:40:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/alljoyn*: Remove alljoyn suite
 packages
In-Reply-To: <13c8249f-52ee-308d-988e-899843f774d6@smile.fr>
References: <20191027233917.123833-1-titouan.christophe@railnova.eu>
 <20191028212038.GC2892@scaer>
 <13c8249f-52ee-308d-988e-899843f774d6@smile.fr>
Message-ID: <20191028224038.GD2892@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2019-10-28 23:17 +0100, Romain Naour spake thusly:
> Le 28/10/2019 ? 22:20, Yann E. MORIN a ?crit?:
> > Titouan, All,
> > 
> > On 2019-10-28 00:39 +0100, Titouan Christophe spake thusly:
> >> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> 
> Can you explain why you want to remove theses packages?
> Indeed there is no activity since 2 years, is it unmaintained ?

See the thread about that:
    http://lists.busybox.net/pipermail/buildroot/2019-October/264360.html

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> >> ---
> >>  DEVELOPERS                                    |  4 -
> >>  package/Config.in                             |  4 -
> > 
> > You forgot to add the removed packages to Config.in.legacy...
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> >>  package/alljoyn-base/Config.in                | 51 -----------
> >>  package/alljoyn-base/alljoyn-base.hash        |  2 -
> >>  package/alljoyn-base/alljoyn-base.mk          | 91 -------------------
> >>  package/alljoyn-tcl-base/Config.in            | 18 ----
> >>  .../alljoyn-tcl-base/alljoyn-tcl-base.hash    |  2 -
> >>  package/alljoyn-tcl-base/alljoyn-tcl-base.mk  | 45 ---------
> >>  package/alljoyn-tcl/Config.in                 | 20 ----
> >>  package/alljoyn-tcl/alljoyn-tcl.hash          |  2 -
> >>  package/alljoyn-tcl/alljoyn-tcl.mk            | 43 ---------
> >>  ...1-UARTStreamLinux-fix-build-on-sparc.patch | 56 ------------
> >>  package/alljoyn/Config.in                     | 24 -----
> >>  package/alljoyn/alljoyn.hash                  |  2 -
> >>  package/alljoyn/alljoyn.mk                    | 67 --------------
> >>  15 files changed, 431 deletions(-)
> >>  delete mode 100644 package/alljoyn-base/Config.in
> >>  delete mode 100644 package/alljoyn-base/alljoyn-base.hash
> >>  delete mode 100644 package/alljoyn-base/alljoyn-base.mk
> >>  delete mode 100644 package/alljoyn-tcl-base/Config.in
> >>  delete mode 100644 package/alljoyn-tcl-base/alljoyn-tcl-base.hash
> >>  delete mode 100644 package/alljoyn-tcl-base/alljoyn-tcl-base.mk
> >>  delete mode 100644 package/alljoyn-tcl/Config.in
> >>  delete mode 100644 package/alljoyn-tcl/alljoyn-tcl.hash
> >>  delete mode 100644 package/alljoyn-tcl/alljoyn-tcl.mk
> >>  delete mode 100644 package/alljoyn/0001-UARTStreamLinux-fix-build-on-sparc.patch
> >>  delete mode 100644 package/alljoyn/Config.in
> >>  delete mode 100644 package/alljoyn/alljoyn.hash
> >>  delete mode 100644 package/alljoyn/alljoyn.mk
> >>
> >> diff --git a/DEVELOPERS b/DEVELOPERS
> >> index f41ac5f096..4a40c89f69 100644
> >> --- a/DEVELOPERS
> >> +++ b/DEVELOPERS
> >> @@ -803,10 +803,6 @@ F:	package/libmaxminddb/
> >>  F:	package/openzwave/
> >>  
> >>  N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >> -F:	package/alljoyn/
> >> -F:	package/alljoyn-base/
> >> -F:	package/alljoyn-tcl/
> >> -F:	package/alljoyn-tcl-base/
> >>  F:	package/boinc/
> >>  F:	package/cairo/
> >>  F:	package/duktape/
> >> diff --git a/package/Config.in b/package/Config.in
> >> index a1ac5069aa..521f7512e5 100644
> >> --- a/package/Config.in
> >> +++ b/package/Config.in
> >> @@ -1563,10 +1563,6 @@ endmenu
> >>  
> >>  menu "Networking"
> >>  	source "package/agentpp/Config.in"
> >> -	source "package/alljoyn/Config.in"
> >> -	source "package/alljoyn-base/Config.in"
> >> -	source "package/alljoyn-tcl/Config.in"
> >> -	source "package/alljoyn-tcl-base/Config.in"
> >>  	source "package/azmq/Config.in"
> >>  	source "package/azure-iot-sdk-c/Config.in"
> >>  	source "package/batman-adv/Config.in"
> >> diff --git a/package/alljoyn-base/Config.in b/package/alljoyn-base/Config.in
> >> deleted file mode 100644
> >> index 8556d66c60..0000000000
> >> --- a/package/alljoyn-base/Config.in
> >> +++ /dev/null
> >> @@ -1,51 +0,0 @@
> >> -config BR2_PACKAGE_ALLJOYN_BASE
> >> -	bool "alljoyn-base"
> >> -	depends on BR2_USE_MMU # alljoyn
> >> -	depends on !BR2_STATIC_LIBS
> >> -	depends on BR2_INSTALL_LIBSTDCPP
> >> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> >> -	depends on BR2_USE_WCHAR # alljoyn
> >> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # alljoyn
> >> -	select BR2_PACKAGE_ALLJOYN
> >> -	select BR2_PACKAGE_OPENSSL
> >> -	select BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL if \
> >> -		!BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION && \
> >> -		!BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING
> >> -	help
> >> -
> >> -	  AllJoyn Base Services are common services used by many
> >> -	  devices, providing a set of interfaces for different devices
> >> -	  to interact and interoperate with one another.
> >> -
> >> -	  https://allseenalliance.org
> >> -
> >> -if BR2_PACKAGE_ALLJOYN_BASE
> >> -
> >> -config BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL
> >> -	bool "controlpanel"
> >> -	help
> >> -	  Enable AllJoyn Control Panel base service which allows
> >> -	  devices to advertise a virtual control panel to be
> >> -	  controlled remotely.
> >> -
> >> -config BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION
> >> -	bool "notification"
> >> -	help
> >> -	  Enable AllJoyn Notification base service which allows
> >> -	  text-based notifications to be sent and received by devices
> >> -	  on the AllJoyn network. Also supports audio and images via
> >> -	  URLs.
> >> -
> >> -config BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING
> >> -	bool "onboarding"
> >> -	help
> >> -	  Enable AllJoyn Onboarding base service which provides a
> >> -	  consistent way to bring a new device onto the Wi-Fi network.
> >> -
> >> -endif # BR2_PACKAGE_ALLJOYN_BASE
> >> -
> >> -comment "alljoyn-base needs a toolchain w/ C++, threads, wchar, dynamic library"
> >> -	depends on BR2_USE_MMU
> >> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> >> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> >> -		!BR2_USE_WCHAR || BR2_STATIC_LIBS
> >> diff --git a/package/alljoyn-base/alljoyn-base.hash b/package/alljoyn-base/alljoyn-base.hash
> >> deleted file mode 100644
> >> index dbec3a3539..0000000000
> >> --- a/package/alljoyn-base/alljoyn-base.hash
> >> +++ /dev/null
> >> @@ -1,2 +0,0 @@
> >> -# Locally computed:
> >> -sha256	742f724b3a06c8fc4039591dba24871755728221ca5dc4afb78ebd9a7e3beb44	alljoyn-base-16.04.00.tar.gz
> >> diff --git a/package/alljoyn-base/alljoyn-base.mk b/package/alljoyn-base/alljoyn-base.mk
> >> deleted file mode 100644
> >> index 64ba647ab0..0000000000
> >> --- a/package/alljoyn-base/alljoyn-base.mk
> >> +++ /dev/null
> >> @@ -1,91 +0,0 @@
> >> -################################################################################
> >> -#
> >> -# alljoyn-base
> >> -#
> >> -################################################################################
> >> -
> >> -ALLJOYN_BASE_REV = 16.04
> >> -ALLJOYN_BASE_VERSION = $(ALLJOYN_BASE_REV).00
> >> -ALLJOYN_BASE_SITE = \
> >> -	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_BASE_REV)
> >> -# See https://allseenalliance.org/alliance/ip-policy
> >> -ALLJOYN_BASE_LICENSE = ISC
> >> -
> >> -ALLJOYN_BASE_DEPENDENCIES = host-python host-scons alljoyn openssl
> >> -ALLJOYN_BASE_INSTALL_STAGING = YES
> >> -
> >> -ALLJOYN_BASE_CRYPTO = openssl
> >> -
> >> -# AllJoyn can be compiled in debug or release mode. By default,
> >> -# AllJoyn is built in debug mode.
> >> -ALLJOYN_BASE_VARIANT = release
> >> -
> >> -ALLJOYN_BASE_BINDINGS = c,cpp
> >> -
> >> -# By setting openwrt for OS and CPU, AllJoyn cross-compilation can be finely
> >> -# tuned through TARGET_xxx options. All TARGET_xxx variables must be defined
> >> -# otherwise compilation will fail.
> >> -# CROSS_COMPILE option should not be used as it works only for linux/ARM.
> >> -ALLJOYN_BASE_OS = openwrt
> >> -ALLJOYN_BASE_CPU = openwrt
> >> -
> >> -# AllJoyn install everything in this relative path
> >> -ALLJOYN_BASE_DISTDIR = \
> >> -	build/$(ALLJOYN_OS)/$(ALLJOYN_CPU)/$(ALLJOYN_VARIANT)/dist
> >> -
> >> -ALLJOYN_BASE_SCONS_OPTS = \
> >> -	-j$(PARALLEL_JOBS) \
> >> -	V=1 \
> >> -	OS=$(ALLJOYN_BASE_OS) \
> >> -	CPU=$(ALLJOYN_BASE_CPU) \
> >> -	VARIANT=$(ALLJOYN_BASE_VARIANT) \
> >> -	BR=off \
> >> -	CRYPTO=$(ALLJOYN_BASE_CRYPTO) \
> >> -	BINDINGS=$(ALLJOYN_BASE_BINDINGS) \
> >> -	ALLJOYN_DISTDIR="$(STAGING_DIR)"\
> >> -	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
> >> -	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
> >> -	TARGET_LINKFLAGS="$(TARGET_LINKFLAGS)" \
> >> -	TARGET_CC="$(TARGET_CC)" \
> >> -	TARGET_CXX="$(TARGET_CXX)" \
> >> -	TARGET_LD="$(TARGET_LD)" \
> >> -	TARGET_LINK="$(TARGET_CXX)" \
> >> -	TARGET_AR="$(TARGET_AR)" \
> >> -	TARGET_RANLIB="$(TARGET_RANLIB)" \
> >> -	TARGET_PATH="$(BR_PATH)"
> >> -
> >> -ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL), y)
> >> -ALLJOYN_BASE_TARGETS += controlpanel
> >> -endif
> >> -
> >> -ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION), y)
> >> -ALLJOYN_BASE_TARGETS += notification
> >> -endif
> >> -
> >> -ifeq ($(BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING), y)
> >> -ALLJOYN_BASE_TARGETS += onboarding
> >> -endif
> >> -
> >> -define ALLJOYN_BASE_BUILD_CMDS
> >> -	$(foreach target,$(ALLJOYN_BASE_TARGETS),\
> >> -		cd $(@D)/$(target); $(HOST_DIR)/bin/python2 $(SCONS) $(ALLJOYN_BASE_SCONS_OPTS)
> >> -	)
> >> -endef
> >> -
> >> -define ALLJOYN_BASE_INSTALL_STAGING_CMDS
> >> -	$(foreach target,$(ALLJOYN_BASE_TARGETS),\
> >> -		cp -a $(@D)/$(target)/$(ALLJOYN_BASE_DISTDIR)/*/lib/lib* \
> >> -			$(STAGING_DIR)/usr/lib/
> >> -		cp -a $(@D)/$(target)/$(ALLJOYN_BASE_DISTDIR)/*/inc/* \
> >> -			$(STAGING_DIR)/usr/include/
> >> -	)
> >> -endef
> >> -
> >> -define ALLJOYN_BASE_INSTALL_TARGET_CMDS
> >> -	$(foreach target,$(ALLJOYN_BASE_TARGETS),\
> >> -		cp -a $(@D)/$(target)/$(ALLJOYN_BASE_DISTDIR)/*/lib/lib* \
> >> -			$(TARGET_DIR)/usr/lib/
> >> -	)
> >> -endef
> >> -
> >> -$(eval $(generic-package))
> >> diff --git a/package/alljoyn-tcl-base/Config.in b/package/alljoyn-tcl-base/Config.in
> >> deleted file mode 100644
> >> index ebc3370afb..0000000000
> >> --- a/package/alljoyn-tcl-base/Config.in
> >> +++ /dev/null
> >> @@ -1,18 +0,0 @@
> >> -config BR2_PACKAGE_ALLJOYN_TCL_BASE
> >> -	bool "alljoyn-tcl-base"
> >> -	depends on !BR2_STATIC_LIBS
> >> -	depends on BR2_TOOLCHAIN_HAS_THREADS # alljoyn-tcl
> >> -	select BR2_PACKAGE_ALLJOYN_TCL
> >> -	help
> >> -	  AllJoyn Base Services are common services used by many
> >> -	  devices, providing a set of interfaces for different devices
> >> -	  to interact and interoperate with one another.
> >> -
> >> -	  Thin Client Library is designed to bring the benefits of the
> >> -	  AllJoyn distributed programming environment to embedded
> >> -	  systems.
> >> -
> >> -	  https://allseenalliance.org
> >> -
> >> -comment "alljoyn-tcl-base needs a toolchain w/ threads and dynamic library"
> >> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> >> diff --git a/package/alljoyn-tcl-base/alljoyn-tcl-base.hash b/package/alljoyn-tcl-base/alljoyn-tcl-base.hash
> >> deleted file mode 100644
> >> index 882839d7de..0000000000
> >> --- a/package/alljoyn-tcl-base/alljoyn-tcl-base.hash
> >> +++ /dev/null
> >> @@ -1,2 +0,0 @@
> >> -# Locally computed:
> >> -sha256	741f7a71929ccd6a66bf75d2b03affc62411e229b70bb89399be9b1b2ce40629	alljoyn-base_tcl-16.04.00.tar.gz
> >> diff --git a/package/alljoyn-tcl-base/alljoyn-tcl-base.mk b/package/alljoyn-tcl-base/alljoyn-tcl-base.mk
> >> deleted file mode 100644
> >> index f8ef5a3e10..0000000000
> >> --- a/package/alljoyn-tcl-base/alljoyn-tcl-base.mk
> >> +++ /dev/null
> >> @@ -1,45 +0,0 @@
> >> -################################################################################
> >> -#
> >> -# alljoyn-tcl-base
> >> -#
> >> -################################################################################
> >> -
> >> -ALLJOYN_TCL_BASE_REV = 16.04
> >> -ALLJOYN_TCL_BASE_VERSION = $(ALLJOYN_TCL_BASE_REV).00
> >> -ALLJOYN_TCL_BASE_SOURCE = alljoyn-base_tcl-$(ALLJOYN_TCL_BASE_VERSION).tar.gz
> >> -ALLJOYN_TCL_BASE_SITE = \
> >> -	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_TCL_BASE_REV)
> >> -# See https://allseenalliance.org/alliance/ip-policy
> >> -ALLJOYN_TCL_BASE_LICENSE = ISC
> >> -
> >> -ALLJOYN_TCL_BASE_DEPENDENCIES = host-python host-scons alljoyn-tcl
> >> -ALLJOYN_TCL_BASE_INSTALL_STAGING = YES
> >> -
> >> -# AllJoyn Base Thin Core can be compiled in debug or release mode. By default,
> >> -# AllJoyn Base Thin Core is built in debug mode.
> >> -ALLJOYN_TCL_BASE_VARIANT = release
> >> -
> >> -ALLJOYN_TCL_BASE_SCONS_OPTS = \
> >> -	-j$(PARALLEL_JOBS) \
> >> -	V=1 \
> >> -	VARIANT=$(ALLJOYN_TCL_BASE_VARIANT) \
> >> -	CC="$(TARGET_CC)" \
> >> -	CXX="$(TARGET_CXX)" \
> >> -	AJTCL_DIST=$(STAGING_DIR) \
> >> -	WS=off
> >> -
> >> -define ALLJOYN_TCL_BASE_BUILD_CMDS
> >> -	cd $(@D); $(HOST_DIR)/bin/python2 $(SCONS) $(ALLJOYN_TCL_BASE_SCONS_OPTS)
> >> -endef
> >> -
> >> -define ALLJOYN_TCL_BASE_INSTALL_STAGING_CMDS
> >> -	cp -a $(@D)/dist/lib/lib* $(STAGING_DIR)/usr/lib/
> >> -	cp -a $(@D)/dist/include/* $(STAGING_DIR)/usr/include/
> >> -endef
> >> -
> >> -# Only install AllJoyn Base Thin Core dynamic libraries into target directory
> >> -define ALLJOYN_TCL_BASE_INSTALL_TARGET_CMDS
> >> -	cp -a $(@D)/dist/lib/lib*.so* $(TARGET_DIR)/usr/lib/
> >> -endef
> >> -
> >> -$(eval $(generic-package))
> >> diff --git a/package/alljoyn-tcl/Config.in b/package/alljoyn-tcl/Config.in
> >> deleted file mode 100644
> >> index fe54af08d4..0000000000
> >> --- a/package/alljoyn-tcl/Config.in
> >> +++ /dev/null
> >> @@ -1,20 +0,0 @@
> >> -config BR2_PACKAGE_ALLJOYN_TCL
> >> -	bool "alljoyn-tcl"
> >> -	depends on !BR2_STATIC_LIBS
> >> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> >> -	help
> >> -	  The AllJoyn framework defines a common way for devices and
> >> -	  apps to communicate with one another regardless of brands,
> >> -	  categories, transports, and OSes. Developers write
> >> -	  applications that discover nearby devices, and communicate
> >> -	  with each other directly and through the cloud, unleashing
> >> -	  new possibilities in the Internet of Things.
> >> -
> >> -	  AllJoyn Thin Core Library (AJTCL) is designed to bring the
> >> -	  benefits of the AllJoyn distributed programming environment
> >> -	  to embedded systems.
> >> -
> >> -	  https://allseenalliance.org
> >> -
> >> -comment "alljoyn-tcl needs a toolchain w/ threads and dynamic library"
> >> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> >> diff --git a/package/alljoyn-tcl/alljoyn-tcl.hash b/package/alljoyn-tcl/alljoyn-tcl.hash
> >> deleted file mode 100644
> >> index 208d676c8b..0000000000
> >> --- a/package/alljoyn-tcl/alljoyn-tcl.hash
> >> +++ /dev/null
> >> @@ -1,2 +0,0 @@
> >> -# Locally computed:
> >> -sha256	da13614a9db79067937b744a87328fed84d99ba62e3de19b0ddc4a83e4b2447e	ajtcl-16.04.00a-src.tar.gz
> >> diff --git a/package/alljoyn-tcl/alljoyn-tcl.mk b/package/alljoyn-tcl/alljoyn-tcl.mk
> >> deleted file mode 100644
> >> index 8981ead378..0000000000
> >> --- a/package/alljoyn-tcl/alljoyn-tcl.mk
> >> +++ /dev/null
> >> @@ -1,43 +0,0 @@
> >> -################################################################################
> >> -#
> >> -# alljoyn-tcl
> >> -#
> >> -################################################################################
> >> -
> >> -ALLJOYN_TCL_REV = 16.04
> >> -ALLJOYN_TCL_VERSION = $(ALLJOYN_TCL_REV).00a
> >> -ALLJOYN_TCL_SOURCE = ajtcl-$(ALLJOYN_TCL_VERSION)-src.tar.gz
> >> -ALLJOYN_TCL_SITE = \
> >> -	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_TCL_REV)
> >> -# See https://allseenalliance.org/alliance/ip-policy
> >> -ALLJOYN_TCL_LICENSE = ISC
> >> -
> >> -ALLJOYN_TCL_DEPENDENCIES = host-python host-scons
> >> -ALLJOYN_TCL_INSTALL_STAGING = YES
> >> -
> >> -# AllJoyn Thin Core can be compiled in debug or release mode. By default,
> >> -# AllJoyn Thin Core is built in debug mode.
> >> -ALLJOYN_TCL_VARIANT = release
> >> -
> >> -ALLJOYN_TCL_SCONS_OPTS = \
> >> -	-j$(PARALLEL_JOBS) \
> >> -	V=1 \
> >> -	VARIANT=$(ALLJOYN_TCL_VARIANT) \
> >> -	CC="$(TARGET_CC)" \
> >> -	CXX="$(TARGET_CXX)"
> >> -
> >> -define ALLJOYN_TCL_BUILD_CMDS
> >> -	cd $(@D); $(HOST_DIR)/bin/python2 $(SCONS) $(ALLJOYN_TCL_SCONS_OPTS)
> >> -endef
> >> -
> >> -define ALLJOYN_TCL_INSTALL_STAGING_CMDS
> >> -	cp -a $(@D)/dist/lib/lib* $(STAGING_DIR)/usr/lib/
> >> -	cp -a $(@D)/dist/include/* $(STAGING_DIR)/usr/include/
> >> -endef
> >> -
> >> -# Only install AllJoyn Thin Core dynamic libraries into target directory
> >> -define ALLJOYN_TCL_INSTALL_TARGET_CMDS
> >> -	cp -a $(@D)/dist/lib/lib*.so* $(TARGET_DIR)/usr/lib/
> >> -endef
> >> -
> >> -$(eval $(generic-package))
> >> diff --git a/package/alljoyn/0001-UARTStreamLinux-fix-build-on-sparc.patch b/package/alljoyn/0001-UARTStreamLinux-fix-build-on-sparc.patch
> >> deleted file mode 100644
> >> index efca67feae..0000000000
> >> --- a/package/alljoyn/0001-UARTStreamLinux-fix-build-on-sparc.patch
> >> +++ /dev/null
> >> @@ -1,56 +0,0 @@
> >> -From b8e35cf95184ff18bcf923f900439f56c93609db Mon Sep 17 00:00:00 2001
> >> -From: Romain Naour <romain.naour@gmail.com>
> >> -Date: Sat, 16 Jul 2016 15:23:41 +0200
> >> -Subject: [PATCH] UARTStreamLinux: fix build on sparc
> >> -
> >> -Some of the serial port highest speed are not defined on SPARC, so
> >> -alljoyn should not use them, so we add a patch to fix that.
> >> -
> >> -From:
> >> -https://git.buildroot.org/buildroot/commit/?id=c5e96d8935016456bea342db170ae6a139a8470f
> >> -
> >> -Fixes:
> >> -http://autobuild.buildroot.net/results/e5b/e5b30b5e0d86b44b97410d434b771e1fb7b18de0
> >> -
> >> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> >> ----
> >> - common/os/posix/UARTStreamLinux.cc | 8 ++++++++
> >> - 1 file changed, 8 insertions(+)
> >> -
> >> -diff --git a/common/os/posix/UARTStreamLinux.cc b/common/os/posix/UARTStreamLinux.cc
> >> -index c193b70..ae81d9d 100644
> >> ---- a/common/os/posix/UARTStreamLinux.cc
> >> -+++ b/common/os/posix/UARTStreamLinux.cc
> >> -@@ -111,21 +111,29 @@ QStatus UART(const qcc::String& devName, uint32_t baud, uint8_t databits, const
> >> -         speed = B2000000;
> >> -         break;
> >> - 
> >> -+#ifdef B2500000
> >> -     case 2500000:
> >> -         speed = B2500000;
> >> -         break;
> >> -+#endif
> >> - 
> >> -+#ifdef B3000000
> >> -     case 3000000:
> >> -         speed = B3000000;
> >> -         break;
> >> -+#endif
> >> - 
> >> -+#ifdef B3500000
> >> -     case 3500000:
> >> -         speed = B3500000;
> >> -         break;
> >> -+#endif
> >> - 
> >> -+#ifdef B4000000
> >> -     case 4000000:
> >> -         speed = B4000000;
> >> -         break;
> >> -+#endif
> >> - 
> >> -     default:
> >> -         QCC_LogError(ER_BAD_ARG_2, ("Invalid baud %d", baud));
> >> --- 
> >> -2.5.5
> >> -
> >> diff --git a/package/alljoyn/Config.in b/package/alljoyn/Config.in
> >> deleted file mode 100644
> >> index 781d91bbe9..0000000000
> >> --- a/package/alljoyn/Config.in
> >> +++ /dev/null
> >> @@ -1,24 +0,0 @@
> >> -config BR2_PACKAGE_ALLJOYN
> >> -	bool "alljoyn"
> >> -	depends on BR2_USE_MMU # fork()
> >> -	depends on !BR2_STATIC_LIBS
> >> -	depends on BR2_INSTALL_LIBSTDCPP
> >> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> >> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> >> -	depends on BR2_USE_WCHAR
> >> -	select BR2_PACKAGE_LIBCAP
> >> -	help
> >> -	  The AllJoyn framework defines a common way for devices and
> >> -	  apps to communicate with one another regardless of brands,
> >> -	  categories, transports, and OSes. Developers write
> >> -	  applications that discover nearby devices, and communicate
> >> -	  with each other directly and through the cloud, unleashing
> >> -	  new possibilities in the Internet of Things.
> >> -
> >> -	  https://allseenalliance.org
> >> -
> >> -comment "alljoyn needs a toolchain w/ C++, threads, wchar and dynamic library"
> >> -	depends on BR2_USE_MMU
> >> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> >> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> >> -		!BR2_USE_WCHAR || BR2_STATIC_LIBS
> >> diff --git a/package/alljoyn/alljoyn.hash b/package/alljoyn/alljoyn.hash
> >> deleted file mode 100644
> >> index 47dd0d4de4..0000000000
> >> --- a/package/alljoyn/alljoyn.hash
> >> +++ /dev/null
> >> @@ -1,2 +0,0 @@
> >> -# Locally computed:
> >> -sha256	fc437d96cf1213f18048240b5d12a374b31894d21830a0a6ccf562ffa13425d5	alljoyn-16.04.00a-src.tar.gz
> >> diff --git a/package/alljoyn/alljoyn.mk b/package/alljoyn/alljoyn.mk
> >> deleted file mode 100644
> >> index d05705c429..0000000000
> >> --- a/package/alljoyn/alljoyn.mk
> >> +++ /dev/null
> >> @@ -1,67 +0,0 @@
> >> -################################################################################
> >> -#
> >> -# alljoyn
> >> -#
> >> -################################################################################
> >> -
> >> -ALLJOYN_REV = 16.04
> >> -ALLJOYN_VERSION = $(ALLJOYN_REV).00a
> >> -ALLJOYN_SOURCE = alljoyn-$(ALLJOYN_VERSION)-src.tar.gz
> >> -ALLJOYN_SITE = https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_REV)
> >> -# See https://allseenalliance.org/alliance/ip-policy
> >> -ALLJOYN_LICENSE = ISC
> >> -
> >> -ALLJOYN_DEPENDENCIES = host-python host-scons libcap
> >> -ALLJOYN_INSTALL_STAGING = YES
> >> -
> >> -# AllJoyn can be compiled in debug or release mode. By default, AllJoyn is built
> >> -# in debug mode.
> >> -ALLJOYN_VARIANT = release
> >> -
> >> -ALLJOYN_BINDINGS = c,cpp
> >> -
> >> -# By setting openwrt for OS and CPU, AllJoyn cross-compilation can be finely
> >> -# tuned through TARGET_xxx options. All TARGET_xxx variables must be defined
> >> -# otherwise compilation will fail.
> >> -# CROSS_COMPILE option should not be used as it works only for linux/ARM.
> >> -ALLJOYN_OS = openwrt
> >> -ALLJOYN_CPU = openwrt
> >> -
> >> -# AllJoyn installs everything in this relative path
> >> -ALLJOYN_DISTDIR = build/$(ALLJOYN_OS)/$(ALLJOYN_CPU)/$(ALLJOYN_VARIANT)/dist/
> >> -
> >> -ALLJOYN_SCONS_OPTS = \
> >> -	-j$(PARALLEL_JOBS) \
> >> -	V=1 \
> >> -	OS=$(ALLJOYN_OS) \
> >> -	CPU=$(ALLJOYN_CPU) \
> >> -	VARIANT=$(ALLJOYN_VARIANT) \
> >> -	BR=off \
> >> -	CRYPTO=builtin \
> >> -	BINDINGS=$(ALLJOYN_BINDINGS) \
> >> -	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
> >> -	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
> >> -	TARGET_LINKFLAGS="$(TARGET_LINKFLAGS)" \
> >> -	TARGET_CC="$(TARGET_CC)" \
> >> -	TARGET_CXX="$(TARGET_CXX)" \
> >> -	TARGET_LD="$(TARGET_LD)" \
> >> -	TARGET_LINK="$(TARGET_CXX)" \
> >> -	TARGET_AR="$(TARGET_AR)" \
> >> -	TARGET_RANLIB="$(TARGET_RANLIB)" \
> >> -	TARGET_PATH="$(BR_PATH)"
> >> -
> >> -define ALLJOYN_BUILD_CMDS
> >> -	cd $(@D); $(HOST_DIR)/bin/python2 $(SCONS) $(ALLJOYN_SCONS_OPTS)
> >> -endef
> >> -
> >> -define ALLJOYN_INSTALL_STAGING_CMDS
> >> -	cp -a $(@D)/$(ALLJOYN_DISTDIR)/*/lib/lib* $(STAGING_DIR)/usr/lib/
> >> -	cp -a $(@D)/$(ALLJOYN_DISTDIR)/*/inc/* $(STAGING_DIR)/usr/include/
> >> -endef
> >> -
> >> -# Only install alljoyn dynamic libraries into target directory
> >> -define ALLJOYN_INSTALL_TARGET_CMDS
> >> -	cp -a $(@D)/$(ALLJOYN_DISTDIR)/*/lib/lib*.so* $(TARGET_DIR)/usr/lib/
> >> -endef
> >> -
> >> -$(eval $(generic-package))
> >> -- 
> >> 2.21.0
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
