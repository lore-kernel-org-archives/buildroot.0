From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:51:48 -0300
Subject: [Buildroot] [PATCH] crda: needs dynamic library support
Message-ID: <1404305508-30330-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d75/d752a8d53ad9219b60113075c91c4dcc3e4027c1/

Even if the build system were fixed to deal with that it's only really
useful for systemd/udev scenarios with require dynamic libs as well.
For static scenarios people should look at using
CONFIG_CFG80211_INTERNAL_REGDB in the kernel.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/crda/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/crda/Config.in b/package/crda/Config.in
index 0e0eb7f..f67ea77 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CRDA
 	bool "crda"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
 	# regdb is a runtime dependency
@@ -17,6 +18,6 @@ config BR2_PACKAGE_CRDA
 
 	  http://linuxwireless.org/en/developers/Regulatory/CRDA
 
-comment "crda needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "crda needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
 	depends on !BR2_nios2
-- 
1.8.5.5
