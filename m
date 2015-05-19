From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 19 May 2015 13:09:57 +0200
Subject: [Buildroot] [PATCH v2] package/libsigrok: blacklist CS powerpc
	toolchains
Message-ID: <1432033797-9842-1-git-send-email-romain.naour@openwide.fr>
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
v2: Propagate the dependency to the Config.in's comment for pulseview
    and libsigrok packages. (Thomas Petazzoni)
---
 package/libsigrok/Config.in | 3 +++
 package/pulseview/Config.in | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 93bd06f..65f2400 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -22,12 +22,15 @@ config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
 	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
+	# CS powerpc g++ are too old. libsigrokcxx needs C++11
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	help
 	  Build libsigrok C++ bindings as well.
 
 comment "C++ bindings need a toolchain w/ C++"
 	depends on BR2_PACKAGE_LIBSIGROK
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 
 endif
 
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index df27cde..6a572c2 100644
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
@@ -27,3 +29,4 @@ comment "pulseview needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
-- 
1.9.3
