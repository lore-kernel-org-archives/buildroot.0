From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  7 Dec 2019 21:40:42 +0100
Subject: [Buildroot] [PATCH v1] acsccid: needs locale
Message-ID: <20191207204042.28294-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needs locale/iconv since the bump from 1.1.4 to 1.1.7 [1]
including upstream commit [2].

Fixes:
  http://autobuild.buildroot.net/results/829b69ca27671bd4612f39733149ea278f5f6b2d

  ifdhandler.c:60:10: fatal error: iconv.h: No such file or directory
   #include <iconv.h>

[1] https://git.buildroot.net/buildroot/commit/?id=6c6a37b2901459425ebe83e30123e4c9a2e7b6cf
[2] https://github.com/acshk/acsccid/commit/5672d821ba96deb6c0c11060e4de0c9dab9b21c7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/acsccid/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
index 90624ee797..90bf63a0c4 100644
--- a/package/acsccid/Config.in
+++ b/package/acsccid/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ACSCCID
 	bool "acsccid"
+	depends on BR2_ENABLE_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite, libusb
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
@@ -13,7 +14,7 @@ config BR2_PACKAGE_ACSCCID
 
 	  http://acsccid.sourceforge.net/
 
-comment "acsccid needs a toolchain w/ threads, dynamic library"
+comment "acsccid needs a toolchain w/ threads, dynamic library, locale"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
-- 
2.24.0
