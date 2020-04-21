From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2020 18:42:49 +0200
Subject: [Buildroot] [git commit] package/mbuffer: needs threads
Message-ID: <20200421163049.44F877FFAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e63ae34df0c09e4941ad648d886b843aa0cc1dd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mbuffer unconditionally uses pthread.h and semaphore.h

Fixes:
 - http://autobuild.buildroot.org/results/2b2be32fac82f3b291f1304f977655ff8adc286a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
