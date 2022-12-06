Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E17EC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC0E041762;
	Tue,  6 Dec 2022 22:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC0E041762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AmokPXwMag3S; Tue,  6 Dec 2022 22:03:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A12B241731;
	Tue,  6 Dec 2022 22:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A12B241731
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6961BF37E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A48481E50
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A48481E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fh4YOFjuqiRl for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:03:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03E8E81E4E
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03E8E81E4E
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:03:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h11so25444754wrw.13
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 14:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TZ1Z4i/ELIG2X31BIsYOs+ykohLE4ORlMRsbltG8xF4=;
 b=7H4UHKeMwowkeO0LMxzedlHYdQymnFACJeMCyPgECepVBb2II4R3q5BW4k4RiaumHe
 WI5/7fjbq3GyOvEu8eRMCQXAPjt5MNqx8OG3YE3380qfJki5FAKtDiSWYBCMPuV7NZUi
 wBRZjeugw4wQkiTwSmTafMK8HOSc+amwqkTBd1CK+gbl2hFOKryeRQH2eCbAKmasxN7s
 aXOUaNSDT6EfZlV3zMN+YXNCOLsWu/MbbTYs+v95GMBrXgEs41m8u2O7KuR6kyWlccu2
 JqmCS5wlQfLxPOzPlXxM2aJTHDz8XFgRM9pOT9klgKyLJyWi2LgQVaOvHiHobtGwtFjm
 kkwA==
X-Gm-Message-State: ANoB5plt+DPBmE9pXE7vjN07w6YTJ/znnc53CBh/gcIRX1wIortfOsNj
 UUcoGjKUQZnL9LIY5F4zm4aS+fQSRwA=
X-Google-Smtp-Source: AA0mqf7DOpYqYhtPcj1XXhrOcMZpmGpRIkDdOCQ08YUPO6w4DSw4g+oyd3pB2CnXk28wqoGvLlf3yQ==
X-Received: by 2002:a5d:5a8c:0:b0:242:5d58:3422 with SMTP id
 bp12-20020a5d5a8c000000b002425d583422mr7327149wrb.22.1670364197690; 
 Tue, 06 Dec 2022 14:03:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e25-20020a05600c4b9900b003cf4ec90938sm20746923wmp.21.2022.12.06.14.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 14:03:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Dec 2022 23:03:11 +0100
Message-Id: <20221206220311.1350707-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TZ1Z4i/ELIG2X31BIsYOs+ykohLE4ORlMRsbltG8xF4=;
 b=GKdT7u3J8nS3nyakR+xMp3Z0qs+8N1oKpTh93cObSYkBgi52gyR/5tkvqmSojS8o20
 Bsx2EqxY23TNO+S3iCC/l1LK5PPzrTAAhoq9Mc4WiOQq9xOEp38DgfRnEHrrYKDTkrlj
 /PEZkDhC1xD8z9xuv4IoEvX6P/jzdniXK2grL17olESn9C8QiusryYwdtHJCocBk+CMY
 5ne3IGvnD4f7Rbyrsah9MNxcaN044ILBnM+6lFEuzC4EvjJVzm67+19TxdJgaycf1ApV
 oFV6H+W3G6u0aCZ9UFFCbZfABlcnEgJ+ug528sJSRt7yZcIauCql8IPBEVjTAE+hP+YE
 g4Zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GKdT7u3J
Subject: [Buildroot] [PATCH 1/1] package/sscep: requires blowfish support in
 openssl
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable blowfish in openssl to fix the following build failure raised
since the addition of the package in commit
72fa60dc102679f51b228336ec38f5af78ff7646:

src/sscep.c: In function 'get_cipher_alg':
src/sscep.c:123:24: warning: implicit declaration of function 'EVP_bf_cbc'; did you mean 'EVP_sm4_cbc'? [-Wimplicit-function-declaration]
  123 |                 return EVP_bf_cbc();
      |                        ^~~~~~~~~~
      |                        EVP_sm4_cbc

Fixes:
 - http://autobuild.buildroot.org/results/55d2c481d8c148fb3bb61c1331340bcd71274553

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sscep/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sscep/Config.in b/package/sscep/Config.in
index 4b9039c9b2..2e5e29f7c8 100644
--- a/package/sscep/Config.in
+++ b/package/sscep/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SSCEP
 	bool "sscep"
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  SSCEP is a client-only implementation of the SCEP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
