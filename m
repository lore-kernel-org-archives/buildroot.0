From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:33:50 +0200
Subject: [Buildroot] [git commit] package/android-tools: fix the select logic
Message-ID: <20160515193406.20638801C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0d995cafd0c664f436bc9d082a3bb14b683dd75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The android-tools Config.in.host has some logic to ensure that at
least one of its sub-options is enabled. However, this logic
incorrectly uses the sub-option names from the *target* android-tools
package, while it should be using the ones from the *host*
android-tools package.

Fixes the following kconfig warning:

  warning: (BR2_PACKAGE_HOST_ANDROID_TOOLS) selects BR2_PACKAGE_ANDROID_TOOLS_ADB which has unmet direct dependencies (BR2_PACKAGE_ANDROID_TOOLS && BR2_USE_MMU)

Reported-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/android-tools/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
index 4326014..993c4c9 100644
--- a/package/android-tools/Config.in.host
+++ b/package/android-tools/Config.in.host
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_ANDROID_TOOLS
 	bool "host android-tools"
-	select BR2_PACKAGE_ANDROID_TOOLS_ADB if \
-		!BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
+	select BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB if \
+		!BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
 	help
 	  This package contains the fastboot and adb utilities, that
 	  can be used to interact with target devices using of these
