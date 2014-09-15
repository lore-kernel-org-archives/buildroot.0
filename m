From: Matt Weber <Matthew.Weber@rockwellcollins.com>
Date: Mon, 15 Sep 2014 09:17:30 -0500
Subject: [Buildroot] [PATCH 1/1] omniorb: limit to glibc toolchains
Message-ID: <1410790650-61308-1-git-send-email-Matthew.Weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resolves autobuilder failure where the omniorb package doesn't
correctly detect the OS because the configure script doesn't have
an option for uclinux support.  This results in a pthread create
assertion when it attempts to figure-out the correct C library
posix calls.

http://autobuild.buildroot.net/results/fbe6c722b92fe4ddf7ac36a8fe1be3a3891c11fd/

Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>
---
 package/omniorb/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
index b8c4e0a..703cb64 100644
--- a/package/omniorb/Config.in
+++ b/package/omniorb/Config.in
@@ -1,9 +1,10 @@
 
-comment "omniORB needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "omniORB needs a glibc toolchain w/ C++, threads"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OMNIORB
 	bool "omniorb"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-- 
1.9.1
