Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4E8C433FE
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 18:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8413C83312;
	Tue, 11 Oct 2022 18:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8413C83312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liW6eu1LdJgc; Tue, 11 Oct 2022 18:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95EDD83054;
	Tue, 11 Oct 2022 18:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95EDD83054
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D92B1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9476A418CE
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9476A418CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id um6Wx8va-WCj for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FF92418D0
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF92418D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D83286BD2; Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Oct 2022 20:15:49 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: a712b5f61b54a72d5bdc4076a85f76011fd8a50f
X-Git-Newrev: 3a3521a38060070b25f5e1af849d8c2a76c4c512
X-Patchwork-Hint: ignore
Message-Id: <20221011185356.4D83286BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/nodejs: improve
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a3521a38060070b25f5e1af849d8c2a76c4c512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit cf0ddc89705af989393b1601bbf57d567a9a1b13)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
