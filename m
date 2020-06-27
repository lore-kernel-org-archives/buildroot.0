From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 16:26:07 +0200
Subject: [Buildroot] [git commit] package/mraa: fix toolchain requirements
Message-ID: <20200627143807.893FD82983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e49e31e1a3b64d0913fadba6e2df082e6499419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New version of mraa has some extra toolchain requirements, added
dependency on !BR2_STATIC_LIBS and BR2_INSTALL_LIBSTDCPP

Fixes:
- http://autobuild.buildroot.net/results/f2829a0aff5bd6f73a837c813f20de5df33c7606
- http://autobuild.buildroot.net/results/b4434724ac810b35913a5e49b43e27e0418b5b9c
- http://autobuild.buildroot.net/results/6c7f19ea9757b483c3c7fe35d72ce9f9304f5919
- http://autobuild.buildroot.net/results/1c2bbeda09a695af2e53b0f72a116e6abef94b23
- http://autobuild.buildroot.net/results/7ea000298a4806040d9ec6140097eb3036440ee9

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mraa/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/mraa/Config.in b/package/mraa/Config.in
index cdd7b9e8f1..1181965b86 100644
--- a/package/mraa/Config.in
+++ b/package/mraa/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_MRAA
 	bool "mraa"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	help
@@ -10,5 +12,6 @@ config BR2_PACKAGE_MRAA
 
 	  http://iotdk.intel.com/docs/master/mraa
 
-comment "mraa needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "mraa needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
