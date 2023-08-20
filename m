Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A382FEE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 15:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B9981E3E;
	Sun, 20 Aug 2023 15:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B9981E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NKgyrg-TUZT; Sun, 20 Aug 2023 15:26:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D6C981E3B;
	Sun, 20 Aug 2023 15:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D6C981E3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 858E41BF277
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 15:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C632416B0
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 15:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C632416B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-VD1kPLkMNZ for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 15:26:44 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1C1B416AE
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 15:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1C1B416AE
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 44A2CA4C00BA;
 Sun, 20 Aug 2023 17:26:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49784)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qXkK7-0005jw-2C;
 Sun, 20 Aug 2023 17:26:39 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 17:26:39 +0200
Message-Id: <20230820152639.3867011-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692545200;
 bh=Ffx1AYvK979NzIGWABMT35jN+zexE90hfS7QsRhLNdY=;
 h=From:To:Cc:Subject:Date:From;
 b=Tb/hly6ff+5vPDPc5shUEnzsIPsphEx4i4X4HBmKgBLjGetarJIZsyT/Z7nXDCIW9
 /c/mt4jOeNIpvi91IDPfpOykMYphbdBGlf4McCXLTeABrG+811smR9PXKBPMUHLVET
 FoiMb4268ZRWDz7/MRT+qfpnTR6l8wfEWbzIUboonNd0AHNOB4pVJ42L+q0SDz/UAk
 aAHzXips9JeMzsFnaeiq6Q7j9JT94kfBwwO7d1hSdLWpua6FPLQ/fMDXHoCMPe3CTx
 uBrBJqckMkkbxXqiupfygTGqq7NdeOp3MWELoQ9mKLFY/d1sqFAz7HpNEvw93+YGDP
 44z8bkqTw2pug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Tb/hly6f
Subject: [Buildroot] [PATCH 1/1] package/crun: fix linking with libargp
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/45f/45ff44284565c8e7deecfdc93995ec0ae4e89e2c/

The bug existed since the dependency to argp-standalone was added with
commit 0d9f268424558c37cd9538596358a537cd2f882d. The oldest build error
I could find occured on Nov, 9th, 2022:
http://autobuild.buildroot.net/results/ebe/ebea5d76c615d8509f87238d449e66da214fed73/

Please note that using $LIBS does not fix the problem.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/crun/crun.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 15438a44b3..9d904ccf1b 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -17,6 +17,7 @@ CRUN_CONF_OPTS = --disable-embedded-yajl
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 CRUN_DEPENDENCIES += argp-standalone
+CRUN_CONF_ENV += LDFLAGS=$(TARGET_NLS_LIBS)
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
