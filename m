Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CF5C19F2B
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 21:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB189409D4;
	Tue,  2 Aug 2022 21:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB189409D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgnYm6P_QXHm; Tue,  2 Aug 2022 21:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA454098A;
	Tue,  2 Aug 2022 21:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA454098A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0051BF28F
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3608B8176C
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3608B8176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xkm3tlgwk8i2 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 21:21:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8328681570
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8328681570
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 21:21:04 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z132so11662447iof.0
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 14:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=0SIXQb4fvAPmCLF8GF4qk9x4KbY0tYiR8pBAtSyyUTA=;
 b=RuWpgTm9ynNCToNQEeuEXhuuZnt2ndlswKyGky/ebq9V5t1ikGOqeIOPqAs+x4JFmZ
 iATD+jSEMmU23/w50tJQSlIIc6SFVIYUhE42xCJH/5saxDVC0HM6IyVLmvEcMZnXdpoQ
 87rajnl+VnR58/KOqwuCMqovD9PIzi4+WdCiF+9r933tmY/MGAc8WTzXytQzd/A7vrCb
 RVwpJ8zsc3Y1TpoWSv6kiGGLVAglbWjt+lu1tZYqhLtCmBSj+XVZPdAPEL//Xn97aVJ9
 ReHLcLliKocrmdBTKaI049NQpUd9FTOk2f1jF8nuBCHrUHknxq+Csyj2gDc/TQQkLWqa
 1mpw==
X-Gm-Message-State: AJIora9ULfEKGLsrSGRUfui2O7mQ8CKlOfUL+lJJuSr0ndxN4Twb9IZd
 puL30tgSNmUs2rfZ4RH0DSEceGMRK8ivOjgD
X-Google-Smtp-Source: AGRyM1tBwcLRii3T4zAP3X3Bq+FjuTx4lqpf2/InrQKLiJtjbkutTxsYwyvKBNN8DJPg5EWle4MWXQ==
X-Received: by 2002:a05:6638:1394:b0:341:4d18:3d41 with SMTP id
 w20-20020a056638139400b003414d183d41mr9431694jad.90.1659475263489; 
 Tue, 02 Aug 2022 14:21:03 -0700 (PDT)
Received: from jupiter.lan (24-212-229-25.cable.teksavvy.com. [24.212.229.25])
 by smtp.gmail.com with ESMTPSA id
 t35-20020a05663834a300b0034286f87e45sm832680jal.51.2022.08.02.14.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 14:21:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 17:20:05 -0400
Message-Id: <20220802212005.1644270-1-kyle@balena.io>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=balena.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=0SIXQb4fvAPmCLF8GF4qk9x4KbY0tYiR8pBAtSyyUTA=;
 b=d/wYs0logMBXYu7Cedh846mi6eSfIegzuv/TrN2FfcwEdQ/fkFRk+7OhSbas+Yy1+9
 3BftCvaRNJQwqkHF8RQ0MW4BFNcMrO+l1K5L5bty4eKvGM21WM52U4Q2DqPPJwF5IEV5
 wV2vZQM6kZ62oMzY817Gh6/aoSGYoEYkh8XkIa/IzmTMXlnjqxJMMJ3cpLYiSWhHFUZa
 8iSXXXMU/13bvIB6uULDiVFxDhxJtLLL2aPyu7fTDNn4ilD3Y8nVF34oKzlOqV2gYIOz
 6zTVyyLEGoPjaiUgVRMr+6OhmnEBqEo7C7zXZ7/XbD8q8W2Jn+TVIdGpr0jGQnwd1DlW
 eGGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=balena.io header.i=@balena.io
 header.a=rsa-sha256 header.s=google header.b=d/wYs0lo
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.16.2
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
From: Kyle Harding via buildroot <buildroot@buildroot.org>
Reply-To: Kyle Harding <kyle@balena.io>
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kyle Harding <kyle@balena.io>
---
 package/unbound/unbound.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 68087cc28e..8bfe48df9f 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.0.tar.gz.sha256
-sha256  6701534c938eb019626601191edc6d012fc534c09d2418d5b92827db0cbe48a5  unbound-1.16.0.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.2.tar.gz.sha256
+sha256  2e32f283820c24c51ca1dd8afecfdb747c7385a137abe865c99db4b257403581  unbound-1.16.2.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
