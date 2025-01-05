Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C08C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8966FBD2;
	Fri, 28 Feb 2025 16:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHkm6s3ISjVb; Fri, 28 Feb 2025 16:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E94EC6FC13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E94EC6FC13;
	Fri, 28 Feb 2025 16:50:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04AED1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B73E42EE8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fonVF8zrou_n for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C6442954
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10C6442954
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0739B84C4E; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jan 2025 14:09:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b4214c1cea2dd5740e4cadc0fb4c4a8670ea92ae
X-Git-Newrev: cdcb3f56e8d5b5f51cd12721feaf8679953547b1
X-Patchwork-Hint: ignore
Message-Id: <20250228162958.0739B84C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/get-developers: don't
 offload parse_args()
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdcb3f56e8d5b5f51cd12721feaf8679953547b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Offloading parser.parse_args() to a helper function does not bring much,
if at all; it even is restrictive: indeed, we can't use parser.error()
to report errors and thus have to resort to a canned print+return
sequence...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/get-developers | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index 9ab5c4503f..33980366d6 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -5,7 +5,7 @@ import getdeveloperlib
 import sys
 
 
-def parse_args():
+def __main__():
     parser = argparse.ArgumentParser()
     parser.add_argument('patches', metavar='P', type=argparse.FileType('r'), nargs='*',
                         help='list of patches (use - to read patches from stdin)')
@@ -23,11 +23,7 @@ def parse_args():
                         const=True, help='validate syntax of DEVELOPERS file')
     parser.add_argument('-d', dest='filename', action='store', default=None,
                         help='override the default DEVELOPERS file (for debug)')
-    return parser.parse_args()
-
-
-def __main__():
-    args = parse_args()
+    args = parser.parse_args()
 
     # Check that only one action is given
     action = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
