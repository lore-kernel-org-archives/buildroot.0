From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Mar 2014 12:10:33 +0000
Subject: [Buildroot] [PATCH] pcsc-lite: not available for static builds
Message-ID: <1394453433-18449-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package requires dlopen and checks for it in the configure phase.
If it's not present, then the build process is stopped.

Fixes:
   http://autobuild.buildroot.net/results/34b/34b83c3ea4a8aac6aeda225e5859bd318b13a676/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pcsc-lite/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index aab42e8..24981bd 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PCSC_LITE
 	bool "pcsc-lite"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Middleware to access smart card using SCard API (PC/SC).
 
@@ -31,3 +32,6 @@ endif
 comment "pcsc-lite needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "pcsc-lite needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
-- 
1.7.1
