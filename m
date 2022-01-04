Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B461C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 261F860BCF;
	Tue,  4 Jan 2022 18:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uiYeqAmyIxhP; Tue,  4 Jan 2022 18:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64C6D60C01;
	Tue,  4 Jan 2022 18:35:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 373E91BF9B2
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 520B940955
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WyLL1A6kiW4N for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 628814092E
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A7A378324A; Tue,  4 Jan 2022 18:28:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 19:10:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5390200a722132365c90e07790b9a24a06af7134
X-Git-Newrev: 0d628aa9521ce79ed2a41a65981c466819dad29e
X-Patchwork-Hint: ignore
Message-Id: <20220104182811.A7A378324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-rgb-led-matrix: fix musl build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d628aa9521ce79ed2a41a65981c466819dad29e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on musl raised since the addition of the
package in commit e821078031e14df69e5142f23e9cb7b5a1ea0e77:

text-scroller.cc: In function 'int main(int, char**)':
text-scroller.cc:220:3: error: 'uint' was not declared in this scope; did you mean 'rint'?
  220 |   uint frame_counter = 0;
      |   ^~~~
      |   rint

Fixes:
 - http://autobuild.buildroot.org/results/1a230bd46eac35081bdb6fe9aaacbb7b62ea6b73

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-utils-text-scroller.cc-replace-uint.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch b/package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch
new file mode 100644
index 0000000000..627415bac8
--- /dev/null
+++ b/package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch
@@ -0,0 +1,50 @@
+From a56338db0f003d5236f2ce98c73a591d64a70852 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 3 Jan 2022 22:57:11 +0100
+Subject: [PATCH] utils/text-scroller.cc: replace uint (#1383)
+
+Replace uint by uint64_t to avoid the following build failure on musl:
+
+text-scroller.cc: In function 'int main(int, char**)':
+text-scroller.cc:220:3: error: 'uint' was not declared in this scope; did you mean 'rint'?
+  220 |   uint frame_counter = 0;
+      |   ^~~~
+      |   rint
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1a230bd46eac35081bdb6fe9aaacbb7b62ea6b73
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/hzeller/rpi-rgb-led-matrix/commit/a56338db0f003d5236f2ce98c73a591d64a70852]
+---
+ utils/text-scroller.cc | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/utils/text-scroller.cc b/utils/text-scroller.cc
+index a64ba0c89..28d4f7182 100644
+--- a/utils/text-scroller.cc
++++ b/utils/text-scroller.cc
+@@ -21,6 +21,7 @@
+ #include <getopt.h>
+ #include <math.h>
+ #include <signal.h>
++#include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -217,12 +218,12 @@ int main(int argc, char *argv[]) {
+ 
+   struct timespec next_frame = {0, 0};
+ 
+-  uint frame_counter = 0;
++  uint64_t frame_counter = 0;
+   while (!interrupt_received && loops != 0) {
+     ++frame_counter;
+     offscreen_canvas->Fill(bg_color.r, bg_color.g, bg_color.b);
+     const bool draw_on_frame = (blink_on <= 0)
+-      || (frame_counter % (blink_on + blink_off) < (uint)blink_on);
++      || (frame_counter % (blink_on + blink_off) < (uint64_t)blink_on);
+ 
+     if (draw_on_frame) {
+       if (outline_font) {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
