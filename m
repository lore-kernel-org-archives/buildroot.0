Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F665C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:25:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA73B61212
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA73B61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98B3B61BD8;
	Sat, 11 Sep 2021 16:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0M1NveLu6biQ; Sat, 11 Sep 2021 16:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2B3661BE0;
	Sat, 11 Sep 2021 16:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2041BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62B6C40221
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dO43Zf9rEdBr for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:25:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2A0F40218
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631377517;
 bh=2nzyeB/F1fST1pG//SXRJY1TJud4kEcPrqhI4awupWY=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=MtMD0DSn5Rjv04oft+SldzrLuMW7eAmqXREI75bVaXn9gXj0B952rHZwyj9RVUWBJ
 AnHE2H2P46HMOarO6wSVKV3rr99e7EmkSbGZffo9koPCANWhAg63AzSGKEhdejzqNk
 mgoTdwvIvlif/dMGCCNWFhrRFaJ2MhmFOjzDxx5Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from NCC-5001D.lan ([83.130.82.162]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MnJhU-1moIDB1lau-00jGAU for
 <buildroot@buildroot.org>; Sat, 11 Sep 2021 18:25:17 +0200
From: Dagg Stompler <daggs@gmx.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 19:25:15 +0300
Message-Id: <20210911162515.29022-2-daggs@gmx.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911162515.29022-1-daggs@gmx.com>
References: <20210911162515.29022-1-daggs@gmx.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:OgMDC9xySpSqpuIzqDMxtQjaUK7zu0PcySFbh7kpCgv/S432CFX
 m/xKmTqSeyiFEe7bFnHkiEFkgbieUmWLz93s5lEaAX8o6JBS8ucD/1T0LHQ7ZXF1QedO5RP
 9WDyAO8AlQHBJKfSO4aWCSU06tfmQiEMUucTEhFr9z3rRtzhcDcxWc/LDS5Pqm9gJAec+h8
 Nq1TAK9mperW/rblur1ZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L1p6Qskn1Fc=:wRWZaFczEA9/x/Jlara8fA
 TNMtaPVBt3MA5SOThq8Y9uYR30AsHD3EmH6etBZHNSHFOLSVBuM+Xf55BEQ4ojBTqitLHRAKU
 +kwLCYs7KaRMdxDsPGhzSk1cpHpZkEl73KaWpOI4rJfVTEokbVRexlTBSvifaEjtoaxXOdGUL
 31TCWcoi7o036/UgeCdv16DkZwSVM96Y5gJ2e8fWCTFw6i8C/STsiCWARCcoX3XcYd+ymdn2b
 lx0PoHvj6s0g9kpk/K8rua2y8BNn0LMzjr5DIk7JGAoNQOetDCHJo4MCo+vmuem2EJa96dVmp
 b6lwcJljR4Dh9G1ifBB18NeAFZ7toLaAYJpfWE2WcJdT2Lhv37tQSUbgBxgjRSKiSkslUxjY5
 fwHyNc0a1tZ1+yYGwnTiwtZ7LRoTdSHxMr3+YZ8pWXLOFqEcreIYxivJRGIhRVDedPoVFaVSp
 DiJijUdwNNCq2doQMTYqF0c28MZIZq7Urc2cvvH+3EYU4oCseoNSWmxj/uNHBBRmVKWj5lwcf
 l5rk2a1S/1fZ8K6ZM7tlFRtNtyhQA36R+GnWDnS63vojVZ4w2/vd3cMvAiFZXsiVqLsk11OJv
 N8Iq86w4RSudZ5FF4QgzfkiToiPBo2fwqpPJYVPWLjzbKrWSZir8aTPcaJ4F+MHqBLfgRYMBJ
 5uj9Hi6OAz3scrD/IVBvL+29A1ahYRg6Pye3ES05zcvSwaLzyrzPzN0jZLk4/0eWnBCT4P0Tb
 LdiVV4sCbiDOsK/7Sdw3+Cb/jCSeDA00qf262fKzzxya7T8ezHfZSrwWIuha2KgaljTs2R3dJ
 yI4g7VHKmjTxrma/1PRXCROok0hGcDn3qPNnW6JSmZnZLcddsRs33bO3T6hjdFj8L+NhY+OX/
 bf75pWmzhchpfw5+k1ruSE+ajc57vvmYflxAfCp4lvYmDMYaNScat68hFjxl4o9KFPHHa9Qt+
 +GGowcSOJ6kBHemhsCnE6nSLtk3opKIU2E22TV56wPYw9peoyYJ5B8v/+livR48mmCJysd3up
 Xybi2y8zHTcgW9XtOpaVTD+0/E/A12TNvPtcGf20n0e7fLHpTWztFrK5jmuggbu1zrqsOI+nR
 +UM44jlcVV0/iU=
Subject: [Buildroot] [PATCH 2/2] genimae/odroidc2: increase image size to
 128M
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

as a result of BR2_TARGET_ROOTFS_EXT2_SIZE's increase to 124M, increase
the image size to 128M

Thanks to Yann E. MORIN <yann.morin.1998@free.fr> for pointing it out

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
index f49c1deaf3..4ef229024a 100644
--- a/board/hardkernel/odroidc2/genimage.cfg
+++ b/board/hardkernel/odroidc2/genimage.cfg
@@ -6,7 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
-	size = 64M
+	size = 128M
 }

 image sdcard.img {
--
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
