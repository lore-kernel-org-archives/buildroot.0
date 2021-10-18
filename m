Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A05C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:51:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CB36115A
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8CB36115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8811E4051B;
	Mon, 18 Oct 2021 19:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMvacXl6Mkpw; Mon, 18 Oct 2021 19:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC15404D7;
	Mon, 18 Oct 2021 19:50:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0E41BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46484404D7
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6nMpUTfoeZV for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:50:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ADBD403BB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:50:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 55C7087706; Mon, 18 Oct 2021 19:47:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:50:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f654d357c0743d69731975d60fa414014dacf55
X-Git-Newrev: 4a88df3e8f3690b8f9f9da1d207dd6d578604126
X-Patchwork-Hint: ignore
Message-Id: <20211018194750.55C7087706@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: fix bzip2 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a88df3e8f3690b8f9f9da1d207dd6d578604126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
21a56f9edbca8dd8b19567be6be2b32e44ebb860 which wrongly removed
the select on BR2_PACKAGE_BZIP2 from BR2_PACKAGE_PYTHON3_BZIP2:

Makefile:587: *** bzip2 is in the dependency chain of python3 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/041a2f9c536fce1a1acf6da0464855e4f1e1604f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 18b6d6367b..efc4dbb3d4 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -54,6 +54,7 @@ config BR2_PACKAGE_PYTHON3_BERKELEYDB
 
 config BR2_PACKAGE_PYTHON3_BZIP2
 	bool "bz2 module"
+	select BR2_PACKAGE_BZIP2
 	help
 	  bzip2 module for Python3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
