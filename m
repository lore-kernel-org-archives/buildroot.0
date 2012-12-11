From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Dec 2012 07:39:00 -0300
Subject: [Buildroot] [PATCH] ortp: requires threads
Message-ID: <1355222340-6759-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/4252c2f0f85c27af0d814d8c9a4a5b4d74f4dac1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linphone/Config.in      |    5 +++--
 package/mediastreamer/Config.in |    5 +++--
 package/ortp/Config.in          |    4 ++++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 1a6cfdb..a2866a6 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LINPHONE
 	select BR2_PACKAGE_ORTP
 	select BR2_PACKAGE_MEDIASTREAMER
 	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
@@ -23,5 +24,5 @@ config BR2_PACKAGE_LINPHONE
 
 	  http://www.linphone.org/
 
-comment "linphone requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "linphone requires a toolchain with threads and C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index 2e1af93..477d4fa 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer"
 	select BR2_PACKAGE_ORTP
 	depends on BR2_INSTALL_LIBSTDCPP # until fixed
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
 	help
 	  Mediastreamer is a powerful and lightweighted streaming
 	  engine specialized for voice/video telephony applications.
@@ -12,5 +13,5 @@ config BR2_PACKAGE_MEDIASTREAMER
 
 	  http://www.linphone.org/eng/documentation/dev/mediastreamer2.html
 
-comment "mediastreamer requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "mediastreamer requires a toolchain with threads and C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ortp/Config.in b/package/ortp/Config.in
index 39d9c9a..ab9cab4 100644
--- a/package/ortp/Config.in
+++ b/package/ortp/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_ORTP
 	bool "oRTP"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  oRTP, a Real-time Transport Protocol (RTP,RFC3550) library
 
 	  http://www.linphone.org/eng/documentation/dev/ortp.html
+
+comment "ortp requires a toolchain with threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.8.6
