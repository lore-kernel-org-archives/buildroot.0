Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FEFE7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86FFA80526;
	Thu,  9 Jan 2025 09:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rFjBTBJ8Qe0; Thu,  9 Jan 2025 09:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C89F80B14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C89F80B14;
	Thu,  9 Jan 2025 09:24:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EAD4942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5779C80C01
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Th5RWdGXSx-o for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AD0480B07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AD0480B07
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86B5F84239; Thu,  9 Jan 2025 09:24:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 09:09:52 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7d9899dbd12b989d643aeb7e9efdb0cdcb72cffa
X-Git-Newrev: 4724ca20aecba3b51be6b68ed2840e4add739bd6
X-Patchwork-Hint: ignore
Message-Id: <20250109092421.86B5F84239@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/get-developers:
 read patch from stdin when it's not a tty
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

commit: https://git.buildroot.net/buildroot/commit/?id=4724ca20aecba3b51be6b68ed2840e4add739bd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

It is very common that get-developers be used with its stdin a pipe from
git-show:
    git show |./utils-get-developers -

In this case, the '-' is superfluous: we can very easily deduce that the
user wants to read stdin as the patch.

So, if no other action was requested, and stdin is not a tty, use it as
the source of the patch, and thus '-' is then no longer required.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d10d22221f93c2a1f5950045a4f95fbb4984d685)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
