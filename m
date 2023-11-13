Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EAEC4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 829FE41DDA;
	Mon, 13 Nov 2023 21:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829FE41DDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ck3xlo9kGrZY; Mon, 13 Nov 2023 21:53:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB9D541F37;
	Mon, 13 Nov 2023 21:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB9D541F37
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 229751BF954
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D1560A92
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0D1560A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Svus7nYR1Bbj for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:53:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1922460A7B
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1922460A7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07B2B8710D; Mon, 13 Nov 2023 21:53:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 22:51:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad0bb50dc717a2d9568b73e0f4a509cf6044ffb1
X-Git-Newrev: f1ee7015a48e7820e74dc99c58708a732e14c0aa
X-Patchwork-Hint: ignore
Message-Id: <20231113215304.07B2B8710D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/check-host-tar.sh:
 blacklist tar 1.35+
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1ee7015a48e7820e74dc99c58708a732e14c0aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU tar 1.35 changed the behaviour for the devmajor/devminor fields,
breaking the download hash validation.  For details, see:

https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
https://patchwork.ozlabs.org/project/buildroot/patch/20231018141155.533944-1-vfazio@gmail.com/

To work around this issue, blacklist tar 1.35+ similar to how we do it for
pre-1.27 versions so Buildroot falls back to building host-tar (which is
currently 1.34).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/check-host-tar.sh | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index b7d607a47a..7d6b3bf688 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -33,7 +33,12 @@ fi
 major_min=1
 minor_min=27
 
-if [ $major -lt $major_min ]; then
+# Maximal version = 1.34 (1.35 changed devmajor/devminor for files)
+# https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
+major_max=1
+minor_max=34
+
+if [ $major -lt $major_min -o $major -gt $major_max ]; then
 	# echo nothing: no suitable tar found
 	exit 1
 fi
@@ -43,5 +48,10 @@ if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
 	exit 1
 fi
 
+if [ $major -eq $major_max -a $minor -gt $minor_max ]; then
+	# echo nothing: no suitable tar found
+	exit 1
+fi
+
 # valid
 echo $tar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
