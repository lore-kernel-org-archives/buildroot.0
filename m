Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84ADC43334
	for <buildroot@archiver.kernel.org>; Thu, 14 Jul 2022 21:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C8161094;
	Thu, 14 Jul 2022 21:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27C8161094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-V7oa34NiX8; Thu, 14 Jul 2022 21:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ECD761076;
	Thu, 14 Jul 2022 21:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ECD761076
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1E7A1BF36A
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 21:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B3EC425A6
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 21:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B3EC425A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKffE8QQpvyB for <buildroot@lists.busybox.net>;
 Thu, 14 Jul 2022 21:29:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3EB425A0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E3EB425A0
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 21:29:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v14so4244871wra.5
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 14:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yC+AtNkPMMQX4kVXT0/A3YAPvCnHQQ3JJqdMcQKStBM=;
 b=hR/tnzOgMaGWe0cv/TgIPJVliegEjIAnTpGDCQPf/Ji7jFfSJ5E9ciBKUwVXL6bwMy
 puWOBvqMJrxwwEZmQmPosLUd3OyHIpksR1T528KpSsqljksoU3ST7dHXjcryh1DnyEwF
 J74ujUARhTNCI2pnq6oxD1+TTfJv6GaDmKwF4JDKzZCvn5Rn+KHRZ4ixvhEPSM8fYeZK
 z5ykdFgUhLTSA9BeQLWlSWR8z8NMEzClAKXENnyfrJVwlTo7TyGVtt3Ofi2UIryFUkn3
 KtEhoSH2e4KywYqSKfHr2o+VprIw3Det5YRmUMkSREnKjFCS9ts3c+VdEq8qMS8Zh6dA
 jZjw==
X-Gm-Message-State: AJIora/7BcSHj5K33Soi+ljwQtRC6l0CckUMePQGfmVVARDDd82Ri5t9
 QzIhS8wcbNXNE4RWS6TRUM9MEG7GRuE=
X-Google-Smtp-Source: AGRyM1vbMrFBP5LtTkF8993CEehB1A4bDBBR0pa/QOddZTgQG3caQyBZSQOw5izuk/r7z11t77n7/A==
X-Received: by 2002:adf:f211:0:b0:21d:6f1a:b857 with SMTP id
 p17-20020adff211000000b0021d6f1ab857mr10296751wro.614.1657834160932; 
 Thu, 14 Jul 2022 14:29:20 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 az4-20020a05600c600400b003a2ebb087fbsm3318335wmb.0.2022.07.14.14.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 14:29:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Jul 2022 23:26:10 +0200
Message-Id: <20220714212610.15762-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yC+AtNkPMMQX4kVXT0/A3YAPvCnHQQ3JJqdMcQKStBM=;
 b=k4Yqm9CtvlI1py+lDWbU1lZjhUV46Ja4Cqr4zd4UfK/1kSp6noQzHAidCcdfx4rLc4
 H165pwVVezPLGwDMkprUdbRFTOBv3RBopm4O4pYssQO59NzKTmii21NFvQM5hi+ktX3X
 d7TOJh7GT6KEe81gxLjUzr4amXTNqYGtr7jgLaXCKBQtUHd3AgkQGcIoGwBptybSC7Vk
 DL1AnEG87WiGHrleD1+QsoimrPjW8+AdnBY5w12tRB1xp/3CaTvb3tdVy1/+bsKx7raI
 RmG+rlExrMX/qO/HLpgp/buAmX4au6DrjahDLFD6Y7vJ7Er2jPeNokb6nGe5wYejNsrF
 gCyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k4Yqm9Ct
Subject: [Buildroot] [PATCH 1/1] package/i2pd: add I2PD_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:i2pd:i2pd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ai2pd%3Ai2pd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/i2pd/i2pd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index f960c298af..acced51dac 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -8,6 +8,7 @@ I2PD_VERSION = 2.42.1
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
+I2PD_CPE_ID_VENDOR = i2pd
 I2PD_SUBDIR = build
 I2PD_DEPENDENCIES = \
 	boost \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
