From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 22:03:30 +0200
Subject: [Buildroot] [git commit] android-tools: needs thread support
Message-ID: <20160515200421.4438E8183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=247592ed00adadcdcb14948ada2bc7fdd5aa20a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both adb and adbd use <pthread.h>, and fastboot needs thread due to
its dependency on libselinux, so we put the dependency in the
top-level android-tools Config.in option.

Fixes:

  http://autobuild.buildroot.net/results/bafadedc0ae91f8a1e26d14f30b37d6bb9486816/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/android-tools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 9be3f40..35bb8af 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_ANDROID_TOOLS
 	# has some complicated dependencies, we simply make the whole
 	# package not available on noMMU platforms.
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ANDROID_TOOLS_ADBD if \
 	      !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT && \
 	      !BR2_PACKAGE_ANDROID_TOOLS_ADB
@@ -53,3 +54,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADBD
 	  implementing the ADB protocol.
 
 endif
+
+comment "android-tools needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
