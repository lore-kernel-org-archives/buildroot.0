From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jul 2020 08:08:04 +0200
Subject: [Buildroot] [git commit] package/mraa: fix architecture
Message-ID: <20200725062158.3CFEF8100B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76d9049a2a75c036ad28f6e63b35190d49f6ea82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mraa supports aarch64 since version 0.9.0 and
https://github.com/eclipse/mraa/commit/47ec54c3330de176ed0b8e3254e81d9451fb866a

mips is supported since version 1.9.0 and
https://github.com/eclipse/mraa/commit/6770be911ba18b25ff284eeac80390e4111f602f

Moreover, BUILD_ARCH must be passed otherwise build will fail on i686
and arm

Fixes:
 - http://autobuild.buildroot.org/results/8e99eb282668f6f83f43c5be45112d82936e3408
 - http://autobuild.buildroot.org/results/75ba0840da6eb4907847ef05adeec2df109c9937

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mraa/Config.in | 10 +++++++++-
 package/mraa/mraa.mk   | 13 +++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/mraa/Config.in b/package/mraa/Config.in
index 1181965b86..745b235cb3 100644
--- a/package/mraa/Config.in
+++ b/package/mraa/Config.in
@@ -1,9 +1,16 @@
+config BR2_PACKAGE_MRAA_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+
 config BR2_PACKAGE_MRAA
 	bool "mraa"
+	depends on BR2_PACKAGE_MRAA_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	help
 	  mraa is a C/C++ library with bindings to javascript & python
 	  to interface with the IO on Galileo, Edison & other
@@ -13,5 +20,6 @@ config BR2_PACKAGE_MRAA
 	  http://iotdk.intel.com/docs/master/mraa
 
 comment "mraa needs a toolchain w/ C++, threads, dynamic library"
+	depends on BR2_PACKAGE_MRAA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS
diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
index 23413de08e..9397f12cfd 100644
--- a/package/mraa/mraa.mk
+++ b/package/mraa/mraa.mk
@@ -10,10 +10,23 @@ MRAA_LICENSE = MIT
 MRAA_LICENSE_FILES = COPYING
 MRAA_INSTALL_STAGING = YES
 
+ifeq ($(BR2_i386),y)
+MRAA_ARCH = i386
+else ifeq ($(BR2_x86_64),y)
+MRAA_ARCH = x86_64
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+MRAA_ARCH = arm
+else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+MRAA_ARCH = aarch64
+else ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+MRAA_ARCH = mips
+endif
+
 # USBPLAT only makes sense with FTDI4222, which requires the ftd2xx library,
 # which doesn't exist in buildroot
 
 MRAA_CONF_OPTS += \
+	-DBUILDARCH=$(MRAA_ARCH) \
 	-DBUILDSWIG=OFF \
 	-DUSBPLAT=OFF \
 	-DFTDI4222=OFF \
