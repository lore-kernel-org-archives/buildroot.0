Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F816C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D4961107
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1D4961107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A486183A90;
	Thu,  5 Aug 2021 11:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycROUd_w6aGG; Thu,  5 Aug 2021 11:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 102AB83A6E;
	Thu,  5 Aug 2021 11:07:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCD161BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3251660A73
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5h9-MZA59t9l for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:07:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 059C960A7C
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:07:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8F5C88B79F; Thu,  5 Aug 2021 11:06:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 12:47:49 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 0898fde96832ade8b7143f64dd4a1ad7e37cb20f
X-Git-Newrev: cd2f7d0ab26655de585fbb21fd8cef7f0cc72cf1
X-Patchwork-Hint: ignore
Message-Id: <20210805110653.8F5C88B79F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/postgresql: add
 cflags_sl option to pg_config
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=cd2f7d0ab26655de585fbb21fd8cef7f0cc72cf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Some external packages call pg_config to determine the installed
PostgreSQL cflags_sl option. Add this output to Buildroots own
pg_config, so these packages correctly compile.

Default value is defined at src/template/linux as:

Extra CFLAGS for code that will go into a shared library
CFLAGS_SL="-fPIC"

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ed4cfbb7730b0172f1e503a279e214810eec049f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/pg_config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/pg_config b/package/postgresql/pg_config
index 3b0cb35f2c..099f1ee390 100644
--- a/package/postgresql/pg_config
+++ b/package/postgresql/pg_config
@@ -31,6 +31,10 @@ case "$1" in
   --cflags)
 	echo "@TARGET_CFLAGS@"
 	;;
+  --cflags_sl)
+	# defined at src/template/linux
+	echo "-fPIC"
+	;;
   --cc)
 	echo "@TARGET_CC@"
 	;;
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
