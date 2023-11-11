Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC758C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 18:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C6641F00;
	Sat, 11 Nov 2023 18:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C6641F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJDWryhskc_f; Sat, 11 Nov 2023 18:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE63B41EDA;
	Sat, 11 Nov 2023 18:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE63B41EDA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16C871BF2AF
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 18:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0B598258D
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 18:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0B598258D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPs-mvHEdMYZ for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 18:59:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 128DF82560
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 18:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 128DF82560
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E68A38702F; Sat, 11 Nov 2023 18:59:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 19:58:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ed9e2b0550d3e16e15462508c0b5d3de304fcac
X-Git-Newrev: b692b285d9e0dab2fc44ec7dfeb75d6a6b21b2b3
X-Patchwork-Hint: ignore
Message-Id: <20231111185915.E68A38702F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-c: fix build with gcc 5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b692b285d9e0dab2fc44ec7dfeb75d6a6b21b2b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 5 raised since bump to version
0.17 in commit 725580a26ecbd554567880e95b8533b2c9baa5f9:

/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c: In function 'json_pointer_result_get_recursive':
/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c:193:25: error: 'idx' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    res->index_in_parent = idx;
                         ^

Fixes:
 - http://autobuild.buildroot.org/results/523b35a979d59121fe4e18c38171792b06233940

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-json_pointer.c-initialize-idx.patch       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/json-c/0001-json_pointer.c-initialize-idx.patch b/package/json-c/0001-json_pointer.c-initialize-idx.patch
new file mode 100644
index 0000000000..3dbe0b4067
--- /dev/null
+++ b/package/json-c/0001-json_pointer.c-initialize-idx.patch
@@ -0,0 +1,37 @@
+From 7ff7eab603611c65b3110dcb1b0caf5cc68b07a3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 8 Nov 2023 22:42:48 +0100
+Subject: [PATCH] json_pointer.c: initialize idx
+
+Fix the following build failure with gcc 5:
+
+/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c: In function 'json_pointer_result_get_recursive':
+/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c:193:25: error: 'idx' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+    res->index_in_parent = idx;
+                         ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/523b35a979d59121fe4e18c38171792b06233940/
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/json-c/json-c/pull/839
+---
+ json_pointer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/json_pointer.c b/json_pointer.c
+index 89e9e21..0ac8aaa 100644
+--- a/json_pointer.c
++++ b/json_pointer.c
+@@ -158,7 +158,7 @@ static int json_pointer_result_get_recursive(struct json_object *obj, char *path
+                                              struct json_pointer_get_result *res)
+ {
+ 	struct json_object *parent_obj = obj;
+-	size_t idx;
++	size_t idx = 0;
+ 	char *endp;
+ 	int rc;
+ 
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
