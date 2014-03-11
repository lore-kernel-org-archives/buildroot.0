From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:34:44 +0100
Subject: [Buildroot] [git commit] pcsc-lite: not available for static builds
Message-ID: <20140311223920.640549BEEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad8c327053f3736881e1ef6d7b394b3a500ed8fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package requires dlopen and checks for it in the configure phase.
If it's not present, then the build process is stopped.

Fixes:
   http://autobuild.buildroot.net/results/34b/34b83c3ea4a8aac6aeda225e5859bd318b13a676/

[Peter: propagate deps to reverse dependencies, merge toolchain comments]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccid/Config.in       |    5 +++--
 package/pcsc-lite/Config.in  |    5 +++--
 package/strongswan/Config.in |    1 +
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index e960986..e3c71f8 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -4,11 +4,12 @@ config BR2_PACKAGE_CCID
 	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_USE_MMU # pcsc-lite
+	depends on !BR2_PREFER_STATIC_LIB # pcsc-lite
 	help
 	  PC/SC driver for USB CCID smart card readers
 
 	  http://pcsclite.alioth.debian.org/ccid.html
 
-comment "ccid needs a toolchain w/ threads"
+comment "ccid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index aab42e8..bd715be 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PCSC_LITE
 	bool "pcsc-lite"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Middleware to access smart card using SCard API (PC/SC).
 
@@ -28,6 +29,6 @@ config BR2_PACKAGE_PCSC_LITE_EMBEDDED
 
 endif
 
-comment "pcsc-lite needs a toolchain w/ threads"
+comment "pcsc-lite needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index d53da64..0daedda 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -91,6 +91,7 @@ if BR2_PACKAGE_STRONGSWAN_EAP
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
 	bool "Enable EAP-SIM smart card backend"
+	depends on !BR2_PREFER_STATIC_LIB # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 
 endif
