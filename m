From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 22:47:28 +0200
Subject: [Buildroot] [git commit] android-tools: adb/adbd sub options use
	fork(), need MMU
Message-ID: <20160511204933.7AEC981F33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30706f9252021283374903c078e4380e7ee0c985
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/d87/d87a4bd35cedca94ef6266a06ba05dda103d49ce/
http://autobuild.buildroot.org/results/a83/a8312469b4da6142f0ae67a5eeaf255da351a379/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/android-tools/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 2517370..84f18e8 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_ANDROID_TOOLS
 	bool "android-tools"
+	# adb/adbd needs mmu
 	select BR2_PACKAGE_ANDROID_TOOLS_ADBD if \
 	      !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT && \
-	      !BR2_PACKAGE_ANDROID_TOOLS_ADB
+	      !BR2_PACKAGE_ANDROID_TOOLS_ADB && \
+	      BR2_USE_MMU
+	select BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT if \
+	      !BR2_USE_MMU
 	help
 	  This package contains the fastboot and adb utilities, that
 	  can be used to interact with target devices using of these
@@ -21,6 +25,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 
 config BR2_PACKAGE_ANDROID_TOOLS_ADB
 	bool "adb"
+	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -30,6 +35,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADB
 
 config BR2_PACKAGE_ANDROID_TOOLS_ADBD
 	bool "adbd"
+	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
