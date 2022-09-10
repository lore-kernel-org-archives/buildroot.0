Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B71ECAAD5
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 10:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D398D828EF;
	Sat, 10 Sep 2022 10:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D398D828EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVILK-ywbdqZ; Sat, 10 Sep 2022 10:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 081F980BFA;
	Sat, 10 Sep 2022 10:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 081F980BFA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D65011BF859
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 10:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2178842EB
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 10:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2178842EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXLzhGWdMkyT for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 10:18:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5966842E9
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 10:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5966842E9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8FF5282E77; Sat, 10 Sep 2022 10:18:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Sep 2022 12:09:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49f661e5484cf5965564f78511d5201a45bb0d24
X-Git-Newrev: 0d3a3e61ee45ceaea7555301f9bffcc6de79e746
X-Patchwork-Hint: ignore
Message-Id: <20220910101824.8FF5282E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/pkg-autotools.mk: only
 pass --runstatedir=/run if supported"
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d3a3e61ee45ceaea7555301f9bffcc6de79e746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit cc9d55e19f564afc5a36be482329c43637252a6f.

This unfortunately still breaks with packages having additional configure
scripts in subdirectories where the toplevel script supports --runstatedir,
but some of the children do not.

Fixes:
http://autobuild.buildroot.net/results/c60/c607d8062e17aa6871e30a3ad90cbd0b1b921ae1/
http://autobuild.buildroot.net/results/eef/eefa67773ccc44f3b06894bccc62af97ec15dcdb/

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 968662ddc6..b6224b349d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -187,7 +187,7 @@ define $(2)_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
-		`grep -q -e '--runstatedir' configure && printf '%s' --runstatedir=/run` \
+		runstatedir=/run \
 		--program-prefix="" \
 		--disable-gtk-doc \
 		--disable-gtk-doc-html \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
