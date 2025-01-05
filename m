Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307BFE77199
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 13:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5D6408D1;
	Sun,  5 Jan 2025 13:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75CZe3mVCM2p; Sun,  5 Jan 2025 13:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B07BE408C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07BE408C9;
	Sun,  5 Jan 2025 13:20:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4008F1E
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 13:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88E5D408D1
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 13:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVAf0zSOcRdO for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 13:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA59F408C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA59F408C9
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 13:20:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A12AA83A92; Sun,  5 Jan 2025 13:20:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jan 2025 14:09:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35f381b93e52895179569876b23a509c9a7e0225
X-Git-Newrev: d10d22221f93c2a1f5950045a4f95fbb4984d685
X-Patchwork-Hint: ignore
Message-Id: <20250105132006.A12AA83A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/get-developers: read patch from
 stdin when it's not a tty
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=d10d22221f93c2a1f5950045a4f95fbb4984d685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is very common that get-developers be used with its stdin a pipe from
git-show:
    git show |./utils-get-developers -

In this case, the '-' is superfluous: we can very easily deduce that the
user wants to read stdin as the patch.

So, if no other action was requested, and stdin is not a tty, use it as
the source of the patch, and thus '-' is then no longer required.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/get-developers | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/get-developers b/utils/get-developers
index 8e5796beaf..b45e617bff 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -42,7 +42,9 @@ def __main__():
     if action > 1:
         parser.error("Cannot do more than one action")
     if action == 0:
-        parser.error("No action specified")
+        if sys.stdin.isatty():
+            parser.error("No action specified")
+        args.patches.append(sys.stdin)
 
     devs = getdeveloperlib.parse_developers(args.filename)
     if devs is None:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
