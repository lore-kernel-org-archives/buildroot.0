From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Sep 2013 18:06:32 +0200
Subject: [Buildroot] [PATCHv2 06/14] gcc: move C++ support option next to
	Fortran/Objective-C
In-Reply-To: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378138000-12739-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option to enable C++ support was still located in
toolchain/toolchain-buildroot/Config.in.2, with misc other toolchain
options. It seems more logical to have this option with the other
options to select the languages supported by the cross-compiler, so we
move it next to the Fortran/Objective-C options in
package/gcc/Config.in.host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host                | 13 +++++++++++++
 toolchain/toolchain-buildroot/Config.in.2 | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a7dbbb6..dbf0f20 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -112,6 +112,19 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	  include. Those options are applied for all of the gcc
 	  initial, gcc intermediate and gcc final passes.
 
+config BR2_TOOLCHAIN_BUILDROOT_CXX
+	bool "Enable C++ support"
+	select BR2_INSTALL_LIBSTDCPP
+	depends on !(BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && \
+		     BR2_TOOLCHAIN_BUILDROOT_LOCALE)
+	help
+	  Enable this option if you want your toolchain to support the
+	  C++ language and you want C++ libraries to be installed on
+	  your target system.
+
+comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
+	depends on BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && BR2_TOOLCHAIN_BUILDROOT_LOCALE
+
 config BR2_INSTALL_OBJC
 	bool "Enable Objective-C support"
 	depends on !BR2_avr32
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index bf27e6b..1371c31 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -4,19 +4,6 @@ if BR2_TOOLCHAIN_BUILDROOT
 
 comment "Toolchain Options"
 
-config BR2_TOOLCHAIN_BUILDROOT_CXX
-	bool "Enable C++ support"
-	select BR2_INSTALL_LIBSTDCPP
-	depends on !(BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && \
-		     BR2_TOOLCHAIN_BUILDROOT_LOCALE)
-	help
-	  Enable this option if you want your toolchain to support the
-	  C++ language and you want C++ libraries to be installed on
-	  your target system.
-
-comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
-	depends on BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && BR2_TOOLCHAIN_BUILDROOT_LOCALE
-
 config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	bool "Enable stack protection support"
 	help
-- 
1.8.1.2
