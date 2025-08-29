Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D87CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A6B28065A;
	Mon,  8 Sep 2025 14:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IshwAdkyz7SU; Mon,  8 Sep 2025 14:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1E5806E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B1E5806E9;
	Mon,  8 Sep 2025 14:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1354A279
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68CD64004F
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otlte8kLE8cs for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B253340054
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B253340054
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A340680DA7; Mon,  8 Sep 2025 14:16:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:49:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dc68655682388c34339abcd76192718cf0786da
X-Git-Newrev: 90533b689941cfd92da9e1a2a1ed6c1b7246b25e
X-Patchwork-Hint: ignore
Message-Id: <20250908141629.A340680DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: allow exception for
 global checks
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90533b689941cfd92da9e1a2a1ed6c1b7246b25e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package has a mechanism for a specific file to make an exception
to a specific checker, by preceding the offending line with
"check-package ... <checker class>". However, this is not possible for
the global checks that are done in the checker's after() function.

Allow exceptions for the global checks by writing the same
"check-package ... <checker class>" comment on the last line of the
file.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/check-package | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 8781d21d8f..aa10280f4d 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -276,6 +276,8 @@ def check_file_using_lib(fname):
         return nwarnings, nlines
 
     for name, cf in objects:
+        if cf.disable.search(lastline):
+            continue
         warn, fail = print_warnings(cf.after(), name in xfail)
         if fail > 0:
             failed.add(name)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
