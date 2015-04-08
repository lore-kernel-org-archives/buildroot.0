From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:07:23 +0200
Subject: [Buildroot] [git commit] libsigrok: mark libsigrokcxx as broken
Message-ID: <20150408190813.7E4BD819C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41e81b7ae149319950814efe3c39acb1200167d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires doxygen to generate the C++ bindings, which doesn't have a
package in Buildroot. Until this gets resolved, mark libsigrokcxx and
its reverse dependency pulseview as broken to avoid build failures in
the autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/Config.in |    3 +++
 package/pulseview/Config.in |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 93bd06f..bd37319 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -22,12 +22,15 @@ config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
 	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
+	# requires doxygen, which isn't packaged in Buildroot
+	depends on BROKEN
 	help
 	  Build libsigrok C++ bindings as well.
 
 comment "C++ bindings need a toolchain w/ C++"
 	depends on BR2_PACKAGE_LIBSIGROK
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BROKEN
 
 endif
 
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index de899af..e0f1bcf 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BROKEN # libsigrokcxx
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
@@ -25,3 +26,4 @@ comment "pulseview needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on BROKEN # libsigrokcxx
