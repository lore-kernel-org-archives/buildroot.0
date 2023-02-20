Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CADC6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A2A819CC;
	Mon, 20 Feb 2023 20:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A2A819CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53sw4tLh8BTt; Mon, 20 Feb 2023 20:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D79F818D0;
	Mon, 20 Feb 2023 20:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D79F818D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC2AD1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7457400D1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7457400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MCKMZH6EhAN for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:36:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEED5400AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEED5400AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE2A886429; Mon, 20 Feb 2023 20:36:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:36:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8c4b360fd40e5b266c851588a81aff102afaec7
X-Git-Newrev: d77d1c98240bf9c7c9062a67d68b1e548af42e5d
X-Patchwork-Hint: ignore
Message-Id: <20230220203633.CE2A886429@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speechd: fix build with help2man
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d77d1c98240bf9c7c9062a67d68b1e548af42e5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with help2man raised since the addition
of the package in commit 9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:

LC_ALL=C help2man -n "speech synthesis daemon" --output=speech-dispatcher.1 ./speech-dispatcher
help2man: can't get `--help' info from ./speech-dispatcher
Try `--no-discard-stderr' if option outputs to stderr

Fixes:
 - http://autobuild.buildroot.org/results/cc1817efb4a5d54ffd2e7ac2f4fc773535f70972

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/speechd/speechd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index 46c0672f59..dee94a6752 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -12,6 +12,7 @@ SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
 SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
+SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
 SPEECHD_CONF_OPTS = --without-kali
 
 # fix missing config.rpath (needed for autoreconf) in the codebase
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
