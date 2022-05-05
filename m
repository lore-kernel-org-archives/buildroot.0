Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3094BC433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC46610F5;
	Thu,  5 May 2022 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcR7KsBTa0xg; Thu,  5 May 2022 20:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4599C60BC4;
	Thu,  5 May 2022 20:40:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 680E61C1189
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 571C68407A
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTHz_nUdUzoJ for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:40:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B265484077
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CA96785B5E; Thu,  5 May 2022 20:29:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 May 2022 22:39:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e2482678f1604b9fefb17090d8dd9ade7df4625
X-Git-Newrev: d56925bc438bfc425919adc33adc9d0c2d9f2c7b
X-Patchwork-Hint: ignore
Message-Id: <20220505202953.CA96785B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zchunk: fix symbol conflict
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

commit: https://git.buildroot.net/buildroot/commit/?id=d56925bc438bfc425919adc33adc9d0c2d9f2c7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch to fix a symbol conflict issue.

Fixes:
 - http://autobuild.buildroot.net/results/225/22590a7038a40da3700d56c1f82f7dc74225702a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-zck-declare-write_data-as-static.patch    | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/zchunk/0002-zck-declare-write_data-as-static.patch b/package/zchunk/0002-zck-declare-write_data-as-static.patch
new file mode 100644
index 0000000000..3c48ab3d50
--- /dev/null
+++ b/package/zchunk/0002-zck-declare-write_data-as-static.patch
@@ -0,0 +1,34 @@
+From 477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 4 May 2022 16:32:48 -0600
+Subject: [PATCH] zck: declare write_data as static
+
+This needs to be declared static to avoid a symbol conflict:
+io.c:(.text+0xe8): multiple definition of `write_data'; src/zck.p/zck.c.o:zck.c:(.text+0x1f4): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.net/results/225/22590a7038a40da3700d56c1f82f7dc74225702a
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc]
+---
+ src/zck.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/zck.c b/src/zck.c
+index 7727479..83b2630 100644
+--- a/src/zck.c
++++ b/src/zck.c
+@@ -159,7 +159,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state) {
+ 
+ static struct argp argp = {options, parse_opt, args_doc, doc};
+ 
+-void write_data(zckCtx *zck, char *data, ssize_t in_size) {
++static void write_data(zckCtx *zck, char *data, ssize_t in_size) {
+     if(zck_write(zck, data, in_size) < 0) {
+         LOG_ERROR("%s", zck_get_error(zck));
+         exit(1);
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
