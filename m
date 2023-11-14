Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFD0C4332F
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 07:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 577134173A;
	Tue, 14 Nov 2023 07:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 577134173A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKATipER15Eo; Tue, 14 Nov 2023 07:58:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86ECE4194C;
	Tue, 14 Nov 2023 07:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86ECE4194C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 813FD1BF364
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 07:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A91482015
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 07:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A91482015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSEOK2M_c10a for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 07:57:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B7582013
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 07:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B7582013
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F78687139; Tue, 14 Nov 2023 07:57:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Nov 2023 08:55:53 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 22d5a2c93c7ba52a9afa746c52adc8943ca5abb5
X-Git-Newrev: de2dd1b99e587dec489ae602c13b7065cae9c0ef
X-Patchwork-Hint: ignore
Message-Id: <20231114075753.6F78687139@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 support/dependencies/check-host-tar.sh: blacklist tar 1.35+
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

commit: https://git.buildroot.net/buildroot/commit/?id=de2dd1b99e587dec489ae602c13b7065cae9c0ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

GNU tar 1.35 changed the behaviour for the devmajor/devminor fields,
breaking the download hash validation.  For details, see:

https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
https://patchwork.ozlabs.org/project/buildroot/patch/20231018141155.533944-1-vfazio@gmail.com/

To work around this issue, blacklist tar 1.35+ similar to how we do it for
pre-1.27 versions so Buildroot falls back to building host-tar (which is
currently 1.34).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f1ee7015a48e7820e74dc99c58708a732e14c0aa)
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
