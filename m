From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 14:25:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: needs threads
Message-ID: <20200421122527.3521778-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mbuffer unconditionally uses pthread.h and semaphore.h

Fixes:
 - http://autobuild.buildroot.org/results/2b2be32fac82f3b291f1304f977655ff8adc286a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbuffer/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mbuffer/Config.in b/package/mbuffer/Config.in
index 81e61877e3..2c0b24d151 100644
--- a/package/mbuffer/Config.in
+++ b/package/mbuffer/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_MBUFFER
 	bool "mbuffer"
 	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  mbuffer is a tool for buffering data streams with a large set
 	  of unique features.
 
 	  http://www.maier-komor.de/mbuffer.html
 
-comment "mbuffer needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "mbuffer needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.25.1
