Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A08C6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 21:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18FF80C9C;
	Mon, 13 Mar 2023 21:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D18FF80C9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZzjTBfP3Efn; Mon, 13 Mar 2023 21:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2492680C0D;
	Mon, 13 Mar 2023 21:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2492680C0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 676DF1BF282
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E9AE80C22
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E9AE80C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSIQTSBrc_1G for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 21:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8D7880C06
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 21:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8D7880C06
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 951628709A; Mon, 13 Mar 2023 21:51:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 19:47:06 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 7041f3f7bd2d869540de269a245fcb91c324d133
X-Git-Newrev: 3c92fe49e1a15b259d9278a16b75a69e493ff788
X-Patchwork-Hint: ignore
Message-Id: <20230313215149.951628709A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 support/dependencies/dependencies.sh: require MD5 perl package for netsurf
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c92fe49e1a15b259d9278a16b75a69e493ff788
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure:

Can't locate object method "hexhash" via package "MD5" at utils/git-testament.pl line 47

Fixes:
 - http://autobuild.buildroot.org/results/3dddcbbe7f6ecae5a2db6fac11fb659719452f73

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b83a9675cb81d4281594e5a59e7a8805e8561bd8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 1224220ac9..b99dca1294 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -299,6 +299,10 @@ if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules Math::BigRat"
 fi
 
+if grep -q ^BR2_PACKAGE_NETSURF=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules Digest::MD5"
+fi
+
 if grep -q ^BR2_PACKAGE_WHOIS=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules autodie"
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
