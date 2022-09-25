Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC15C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 08:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2658F83388;
	Sun, 25 Sep 2022 08:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2658F83388
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZmX3PH6YuDM; Sun, 25 Sep 2022 08:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 435838333E;
	Sun, 25 Sep 2022 08:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 435838333E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 813D51BF9A3
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 569FF60A80
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 569FF60A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCW4Bl9I_Df5 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:20:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 561C660773
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 561C660773
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 445AB85FCD; Sun, 25 Sep 2022 08:20:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 10:19:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5708c5b04f09f49a99c2c9d7a1894d24bce6a3e7
X-Git-Newrev: cf0ddc89705af989393b1601bbf57d567a9a1b13
X-Patchwork-Hint: ignore
Message-Id: <20220925082044.445AB85FCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: improve
 0001-add-qemu-wrapper-support.patch to fix build issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf0ddc89705af989393b1601bbf57d567a9a1b13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit 79da2534737bd090b7000beed68d225618606e53,
present since NodeJS 16.0.0, another call to the torque tool is done
in tools/v8_gypfiles/v8.gyp, but our patch to wrap calls to such tools
under Qemu forgot this addition. Due to this, the build of NodeJS is
broken since the bump to v16 in Buildroot commit
07408779cc068041a2da6838fe077d1a679f1736 ("package/nodejs: bump to
16.15.0"). This issue is not visible in the autobuilders as it was
hidden by a previous build issue, itself fixed by "package/nodejs: fix
'Duplicate v8 target errors when cross-compiling' error".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/0001-add-qemu-wrapper-support.patch | 37 ++++++++++++++--------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/package/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/0001-add-qemu-wrapper-support.patch
index 1368ca5a38..8d09601158 100644
--- a/package/nodejs/0001-add-qemu-wrapper-support.patch
+++ b/package/nodejs/0001-add-qemu-wrapper-support.patch
@@ -1,4 +1,4 @@
-From fa09fa3ad6a21ae0b35fb860f76d1762e5f29972 Mon Sep 17 00:00:00 2001
+From c6103ceab64b73c1a25ece3315ea8f52507c2bfe Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Mon, 27 Sep 2021 12:55:09 -0700
 Subject: [PATCH] add qemu-wrapper support
@@ -17,15 +17,15 @@ host-builds.
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- node.gyp                 | 4 ++--
- tools/v8_gypfiles/v8.gyp | 8 ++++----
- 2 files changed, 6 insertions(+), 6 deletions(-)
+ node.gyp                 |  4 ++--
+ tools/v8_gypfiles/v8.gyp | 10 +++++-----
+ 2 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/node.gyp b/node.gyp
-index 8ba0dfeb..c77f6f7d 100644
+index 74e9f9cc2e..c3eaab6c92 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -491,7 +491,7 @@
+@@ -295,7 +295,7 @@
                'action_name': 'run_mkcodecache',
                'process_outputs_as_sources': 1,
                'inputs': [
@@ -34,7 +34,7 @@ index 8ba0dfeb..c77f6f7d 100644
                ],
                'outputs': [
                  '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
-@@ -516,7 +516,7 @@
+@@ -320,7 +320,7 @@
                'action_name': 'node_mksnapshot',
                'process_outputs_as_sources': 1,
                'inputs': [
@@ -44,10 +44,10 @@ index 8ba0dfeb..c77f6f7d 100644
                'outputs': [
                  '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
-index 48ec392b..f9bb0fbe 100644
+index 39b96803c7..9321982ea4 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -220,7 +220,7 @@
+@@ -68,7 +68,7 @@
          {
            'action_name': 'run_torque_action',
            'inputs': [  # Order matters.
@@ -56,7 +56,16 @@ index 48ec392b..f9bb0fbe 100644
              '<@(torque_files)',
            ],
            'outputs': [
-@@ -351,7 +351,7 @@
+@@ -99,7 +99,7 @@
+             '<@(torque_outputs_inc)',
+           ],
+           'action': [
+-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
++            @MAYBE_WRAPPER@ '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
+             '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
+             '-v8-root', '<(V8_ROOT)',
+             '<@(torque_files_without_v8_root)',
+@@ -211,7 +211,7 @@
          {
            'action_name': 'generate_bytecode_builtins_list_action',
            'inputs': [
@@ -65,7 +74,7 @@ index 48ec392b..f9bb0fbe 100644
            ],
            'outputs': [
              '<(generate_bytecode_builtins_list_output)',
-@@ -533,7 +533,7 @@
+@@ -395,7 +395,7 @@
              ],
            },
            'inputs': [
@@ -74,7 +83,7 @@ index 48ec392b..f9bb0fbe 100644
            ],
            'outputs': [
              '<(INTERMEDIATE_DIR)/snapshot.cc',
-@@ -1448,7 +1448,7 @@
+@@ -1503,7 +1503,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
@@ -83,6 +92,6 @@ index 48ec392b..f9bb0fbe 100644
            ],
            'outputs': [
              '<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.cc',
---
-2.31.1
+-- 
+2.37.3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
