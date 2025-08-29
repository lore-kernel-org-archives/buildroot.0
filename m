Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C33CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BDAC614F7;
	Fri, 29 Aug 2025 10:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJVQqnjhxuVQ; Fri, 29 Aug 2025 10:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C2B5613DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C2B5613DD;
	Fri, 29 Aug 2025 10:52:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C90AA6C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF6264187E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FerCvTkDHNHi for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B16A41878
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B16A41878
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0908A87D37; Fri, 29 Aug 2025 10:52:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:49:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4dc68655682388c34339abcd76192718cf0786da
X-Git-Newrev: 90533b689941cfd92da9e1a2a1ed6c1b7246b25e
X-Patchwork-Hint: ignore
Message-Id: <20250829105211.0908A87D37@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/check-package: allow
 exception for global checks
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
