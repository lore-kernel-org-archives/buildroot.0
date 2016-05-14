From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 14 May 2016 23:09:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/android-tools: fix host tools
	dependency
In-Reply-To: <1463260156-23406-1-git-send-email-s.martin49@gmail.com>
References: <1463260156-23406-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1463260156-23406-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host android-tools only makes sense when the target package is enable,
so make it available only when the android-tools is already part of the
target package selection.

This change fixes in a simpler way the missing selection on
BR2_PACKAGE_ANDROID_TOOLS and the missing dependency on BR2_USE_MMU.

This patch fixes the following kconfig warning:

  warning: (BR2_PACKAGE_HOST_ANDROID_TOOLS) selects BR2_PACKAGE_ANDROID_TOOLS_ADB which has unmet direct dependencies (BR2_PACKAGE_ANDROID_TOOLS && BR2_USE_MMU)

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/android-tools/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
index 4326014..7ac9636 100644
--- a/package/android-tools/Config.in.host
+++ b/package/android-tools/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_ANDROID_TOOLS
 	bool "host android-tools"
+	depends on BR2_PACKAGE_ANDROID_TOOLS
 	select BR2_PACKAGE_ANDROID_TOOLS_ADB if \
 		!BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	help
-- 
2.8.2
