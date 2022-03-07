Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FAE7829DB;
	Mon,  7 Mar 2022 21:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Syv31PHu1Qi1; Mon,  7 Mar 2022 21:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D203382998;
	Mon,  7 Mar 2022 21:11:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DFB81BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DF4682998
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYvuh-cJYlAY for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7BE582980
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 04A3C82DF0; Mon,  7 Mar 2022 21:02:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:07:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1ef4c1d9ad1b0fc5c94cbb7aa85347243006b64
X-Git-Newrev: 3539f45ca09558a22fb5816baae9088c34490380
X-Patchwork-Hint: ignore
Message-Id: <20220307210211.04A3C82DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: host-go is also a
 build dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=3539f45ca09558a22fb5816baae9088c34490380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, host-go is a download dependency, because we need go for the
vendoring during the download step.

However, when using a package in override-srcdir, there is no download
step, so host-go is not pulled in as a dependency, which will break the
build of a single package from scratch.

We fix that by adding host-go as a standard dependency too.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 69eae02830..ddefdf1214 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -47,8 +47,10 @@ $(2)_BUILD_OPTS += \
 	-trimpath \
 	-p $(PARALLEL_JOBS)
 
-# Target packages need the Go compiler on the host.
+# Target packages need the Go compiler on the host at download time (for
+# vendoring), and at build and install time.
 $(2)_DOWNLOAD_DEPENDENCIES += host-go
+$(2)_DEPENDENCIES += host-go
 
 $(2)_BUILD_TARGETS ?= .
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
