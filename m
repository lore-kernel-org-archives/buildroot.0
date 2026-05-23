Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6ADCD5BAC
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12147811FE;
	Sat, 23 May 2026 15:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnWRSsgisi_g; Sat, 23 May 2026 15:19:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB04E8119C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779549579;
	bh=z611fvxhCUhKx6RE5X0BUn66e5+TKixE4G9e2wo7ViU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=GFTyxBFpywQdjnPytiIGnGEHUYiKkreQ3lrxfe4LfMMgQgj1Y7I5m+BYvF//D7sAJ
	 q1WfSeUADlswb29u+U+a7AL/GMoUZHk66wFtJPtLHMvL7vvfc/C3+U18TSPsh2heAy
	 jTnb1lq+MqxgZ1Q7p4IOvy3nO/9Azt4y3DO+OVhNoJ0qLypXxuj5X/mcIdNWNm0T59
	 eoF4JI7PU8Crn0+tJrd34gsGfvO1bQi2PPEO4u0Y5THu1SHDuYDVlG88oHuYfBMk5B
	 kJE6rfzoGZZhvOUW5yKrwaQOVEGhAQP4iftFNC1GREB9BaAYtTSW8GVPbSyfd2XkcK
	 WpbXdQOETlO2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB04E8119C;
	Sat, 23 May 2026 15:19:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4245B282
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2042C8119C
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Id_nr2sxaphK for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B45F681183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B45F681183
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B45F681183
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKyI-1wtNeP3sAy-00O1Qv; Sat, 23
 May 2026 17:19:34 +0200
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 15:19:09 +0000
Message-ID: <20260523151911.10285-7-and@gmx.li>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523151911.10285-1-and@gmx.li>
References: <20260523151911.10285-1-and@gmx.li>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SE76mWK76wIqKUkf0nzi+bJLzZk+xxz5opLPd3B5VN/TPsI9wnU
 uBKK3g1htXDbfmIqvLK0kPCTfYeQFCi9JUrg9U4Hyy6dCqHYBhxljqnysh7e0/mR/Kvs/hw
 29eVA/+mrzRPJI3BHBRPthesZYYa1DKLFwc6mg5K4LqJBWbLed4RO3xHFhlnqgnsRW290ER
 ITMiLKV8bjmk8AGv7kLBQ==
UI-OutboundReport: notjunk:1;M01:P0:j0+azDjo8iI=;PZU+GLfCpeWAnCLR4qLJHdf43lt
 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
 0xG+7SqGYKNwrFFbpE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779549574; x=1780154374; i=and@gmx.li;
 bh=Uv86Hq25y/DDuplVUTa7Vl0B4WSaWOvW0uZaY1VwoZQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ug6T7B8DKftDFQIRvgw9WqkxZR+bZqBxCV1wJKTRbqF8oFUXfTRpDrJdeL0mVDDr
 u+9JwikJeqyErlcHnZ3/YdLe7JmwKRuVXCOb7uToF1Da+0Jx2wxsdAoPw6C9n9ede
 8PzDwnPQeD5jgpyWhrG/QcaZLoAsMWf02swO1BiQjdHpQMhMqaicw6zSfhAkmjZBh
 e8lD7a0fun2JAp/EhjXcVXy209CIMHayCMGN5GMA/xfjXKtLVb8Ha+5m7VS9oBDyU
 Vw6zkv7N6DOgi3Oa9TxRZpCIsLW0rxqBIexHH7gC/Ha686gDMLM91VAs9igPvYQWH
 XxfQyEhLY/P0NdLTbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=Ug6T7B8D
Subject: [Buildroot] [PATCH/next v2 7/9] package/nfs-utils: remove lvm2
 !BR2_STATIC_LIBS reason
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/nfs-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 295ce28e..0f836bd5 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -27,7 +27,7 @@ if BR2_PACKAGE_NFS_UTILS
 
 config BR2_PACKAGE_NFS_UTILS_NFSV4
 	bool "NFSv4/NFSv4.1"
-	depends on !BR2_STATIC_LIBS # keyutils, lvm2
+	depends on !BR2_STATIC_LIBS # keyutils
 	select BR2_PACKAGE_KEYUTILS
 	select BR2_PACKAGE_LVM2
 	help
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
