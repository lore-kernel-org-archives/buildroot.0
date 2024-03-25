Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B98FC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF34560906;
	Mon, 25 Mar 2024 23:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OajJi7LPsTnw; Mon, 25 Mar 2024 23:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C31A60A50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C31A60A50;
	Mon, 25 Mar 2024 23:45:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC6BB1BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9E5740C1F
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMdxpcMq3UPD for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 313B540C88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 313B540C88
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CF9383D8B; Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 00:10:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f2af48e7762d52841fbdf8909b4bc7dbf5f2171
X-Git-Newrev: cc38dde3575a4e69db9ad182f691542dc4aa4e06
X-Patchwork-Hint: ignore
Message-Id: <20240325234448.2CF9383D8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: bump version to
 3.19.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc38dde3575a4e69db9ad182f691542dc4aa4e06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 0005-skip-configuration-dependency-if-unit-tests-are-disa.patch, which
fixes gtk+-3.0 being an unconditional requirement.

Other changes:
Flutter 3.19.x made Wayland and X11 an unconditional requirement, resulting in
the following errors when compiling:

"""
../../flutter/third_party/swiftshader/src/WSI/libWaylandClient.hpp:18:10: fatal error: 'wayland-client.h' file not found
   18 | #include <wayland-client.h>
      |          ^~~~~~~~~~~~~~~~~~

../../flutter/third_party/swiftshader/src/WSI/WaylandSurfaceKHR.cpp:15:
../../flutter/third_party/swiftshader/src/WSI/WaylandSurfaceKHR.hpp:22:10: fatal error: 'wayland-client.h' file not found
   22 | #include <wayland-client.h>
      |          ^~~~~~~~~~~~~~~~~~
1 error generated.
[1369/11229] CC obj/flutter/third_party/sqlite/sqlite.sqlite3.o
"""

After raising an issue found here:
https://github.com/flutter/flutter/issues/144635 and after several hours of
searching, the problem is https://github.com/flutter/buildroot/commit/d01da2716
which hardcodes the following values if building for a Linux platform:
  - ozone_platform_x11 = true
  - ozone_platform_wayland = true

As upstream maintainers listed the above as low priority (P3), a simple fix is
to add two additional sed calls in FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP and
FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP which set ozone_platform_x11 and
ozone_platform_wayland to the appropriate values.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...uration-dependency-if-unit-tests-are-disa.patch | 32 ++++++++++++++++++++++
 package/flutter-engine/flutter-engine.mk           |  8 +++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch b/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
new file mode 100644
index 0000000000..125bfc6910
--- /dev/null
+++ b/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
@@ -0,0 +1,32 @@
+From 2252a85e59669b5826019f60a98b7a69939dacfd Mon Sep 17 00:00:00 2001
+From: Greg Spencer <gspencer@google.com>
+Date: Mon, 4 Mar 2024 12:30:41 -0800
+Subject: [PATCH] Skip configuration dependency if unit tests are disabled.
+
+Commit 88baf62f made gtk+-3.0 an unconditional requirement, see:
+
+Issue: https://github.com/flutter/flutter/issues/144421
+Upstream: Merged. https://github.com/flutter/engine/pull/51179
+
+Signed-off-by: Greg Spencer <gspencer@google.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ flutter/testing/BUILD.gn | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/flutter/testing/BUILD.gn b/flutter/testing/BUILD.gn
+index 9eac29452..a7d094695 100644
+--- a/flutter/testing/BUILD.gn
++++ b/flutter/testing/BUILD.gn
+@@ -51,7 +51,7 @@ source_set("testing") {
+ 
+   sources = [ "run_all_unittests.cc" ]
+ 
+-  if (is_linux) {
++  if (enable_unittests && is_linux) {
+     # So that we can call gtk_init in main().
+     configs += [ "//flutter/shell/platform/linux/config:gtk" ]
+   }
+-- 
+2.44.0
+
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index d08274f546..ff21e0949d 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.16.8
+FLUTTER_ENGINE_VERSION = 3.19.4
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -154,6 +154,9 @@ else
 define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
 		$(@D)/build_overrides/vulkan_headers.gni
+
+	$(SED) "s%ozone_platform_x11.*%ozone_platform_x11 = false%g" \
+		$(@D)/build/config/BUILDCONFIG.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 endif
@@ -164,6 +167,9 @@ else
 define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
 		$(@D)/build_overrides/vulkan_headers.gni
+
+	$(SED) "s%ozone_platform_wayland.*%ozone_platform_wayland = false%g" \
+		$(@D)/build/config/BUILDCONFIG.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
