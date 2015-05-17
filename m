From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 17 May 2015 20:48:02 +0200
Subject: [Buildroot] [PATCH] package/libsigrok: blacklist CS powerpc
	toolchains
Message-ID: <1431888482-27125-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though BR2_PACKAGE_LIBSIGROKCXX is selected, the C++
binding is disabled due to lack of C++11 support in the toolchain.

Configure output:
Enabled language bindings:
 - C++............................. no (C++11 compiler required)

So disable libsigrok C++ binding and pulseview for CS powerpc toolchains.

Fixes:
http://autobuild.buildroot.net/results/737/737453011ac0d13ab197258171ffa0f81bc4c368/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libsigrok/Config.in | 2 ++
 package/pulseview/Config.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 93bd06f..cd44118 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -22,6 +22,8 @@ config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
 	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
+	# CS powerpc g++ are too old. libsigrokcxx needs C++11
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	help
 	  Build libsigrok C++ bindings as well.
 
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index df27cde..00cf37b 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	# CS powerpc g++ are too old. libsigrokcxx needs C++11
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
-- 
1.9.3
