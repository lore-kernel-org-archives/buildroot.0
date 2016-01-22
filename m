From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jan 2016 10:56:37 -0300
Subject: [Buildroot] [PATCH] strongswan: unavailable for static builds
Message-ID: <1453470997-30629-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uses dlopen in plugin_loader (not optional), fixes:
http://autobuild.buildroot.net/results/601/601d8dc1654d8733db49b195139e12437663034c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strongswan/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index aa9dc90..a8a9b9f 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -1,13 +1,14 @@
-comment "strongswan needs a toolchain w/ threads"
+comment "strongswan needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 menuconfig BR2_PACKAGE_STRONGSWAN
 	bool "strongswan"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  strongSwan is an OpenSource IPsec implementation for the
 	  Linux operating system. It is based on the discontinued
-- 
2.4.10
