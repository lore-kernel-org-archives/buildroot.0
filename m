From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 23:25:53 +0200
Subject: [Buildroot] [git commit] package/libsigrok: blacklist CS powerpc
	toolchains
Message-ID: <20150520212607.CFA31819D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=914c950df3df6f4436ef43c235d970e009cdd2b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though BR2_PACKAGE_LIBSIGROKCXX is selected, the C++
binding is disabled due to lack of C++11 support in the toolchain.

Configure output:
Enabled language bindings:
 - C++............................. no (C++11 compiler required)

So disable libsigrok C++ binding and pulseview for CS powerpc toolchains.

Fixes:
http://autobuild.buildroot.net/results/737/737453011ac0d13ab197258171ffa0f81bc4c368/

[Thomas: use 'depends on !foo && !bar' instead of 'depends on !(foo ||
bar)', seems it looks more logical in this situation.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/Config.in |    5 +++++
 package/pulseview/Config.in |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 93bd06f..8bd7d99 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -22,12 +22,17 @@ config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
 	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
+	# CS powerpc g++ are too old. libsigrokcxx needs C++11
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	help
 	  Build libsigrok C++ bindings as well.
 
 comment "C++ bindings need a toolchain w/ C++"
 	depends on BR2_PACKAGE_LIBSIGROK
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 
 endif
 
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index df27cde..2fb844b 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -16,6 +16,9 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	# libsigrok
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
@@ -27,3 +30,5 @@ comment "pulseview needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
