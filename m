Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5832C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF4E784B2C;
	Fri, 28 Feb 2025 16:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2foDZpqYq9Y; Fri, 28 Feb 2025 16:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8699184B25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8699184B25;
	Fri, 28 Feb 2025 16:50:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4232A94F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E272E42EE6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLdTiWc0xoXr for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BB934250C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BB934250C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40FD286612; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jan 2025 14:09:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3177ecd26096ab305c51620eb29b0e639f3133e9
X-Git-Newrev: 717f1fdaeb460c71f673a6ad6e82d16af878c188
X-Patchwork-Hint: ignore
Message-Id: <20250228162958.40FD286612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/get-developers: add
 option to report Cc: lines
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

commit: https://git.buildroot.net/buildroot/commit/?id=717f1fdaeb460c71f673a6ad6e82d16af878c188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It is very common to use the output of get-developers to add cc: lines
in the commit log.

Add an option so that get-developers reports Cc: lines ready to be
pasted in a commit log. That new option behaves similarly to the
existing -e option: it only affects the output when parsing a patch.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/get-developers | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index 3253ce5d6b..83c573bf23 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -17,6 +17,8 @@ def __main__():
                         help='find developers in charge of these files')
     parser.add_argument('-c', dest='check', action='store_const',
                         const=True, help='list files not handled by any developer')
+    parser.add_argument('--cc', action="store_true",
+                        help='list affected developers as CC: lines ready to be pasted in a commit log')
     parser.add_argument('-e', dest='email', action='store_const',
                         const=True, help='only list affected developer email addresses')
     parser.add_argument('-v', dest='validate', action='store_const',
@@ -99,9 +101,9 @@ def __main__():
                     matching_devs.add(dev.name)
 
         matching_devs = sorted(matching_devs)
-        if args.email:
+        if args.email or args.cc:
             for dev in matching_devs:
-                print(dev)
+                print(f"{'Cc: ' if args.cc else ''}{dev}")
         else:
             result = "--to buildroot@buildroot.org"
             for dev in matching_devs:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
