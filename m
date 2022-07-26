Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F4DC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26712422D4;
	Tue, 26 Jul 2022 17:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26712422D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anIm4t61Jxgl; Tue, 26 Jul 2022 17:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3EA141B9A;
	Tue, 26 Jul 2022 17:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3EA141B9A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5FF21BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFAD484751
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFAD484751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bei3XL7xV3jq for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:36:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B102D845B9
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B102D845B9
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:36:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso5992303wma.4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 10:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Plsybh67fxmNszI1v+W8nC7RjwyoGrxdrM/d1re38A=;
 b=mZ6F90/jUNTQXTXiZnmuaNOo8mYxxOAj3jqXWofuK85GDx2i3pZfqnx0Mtlku0hjJQ
 ODz4DPdHIrS1eh/Us391/jmCl4O3549z+qekLamikTrk/NCQhiL48M3FjoI+GsxTewKh
 0R6CSzy1sTfQkPrx1I97LFJlJh+1c+Y7dsxmkZF08TdEET7xCm5oL6YgZ6vhLSVW7lqI
 Ul2ICZwP80za2UjujZ5mWlD4T/plmv/ob0iWsgBpunQBBNTCB4uUXiBhTpO+0f++JiHm
 itmeRhFKRLMBHrK0ahEv0hyxgRS+qYYbSfxRVFotcwRvW/3zj4Grm/sQlMTinEkb6Y/X
 /aqA==
X-Gm-Message-State: AJIora84r0AqXbeghNV38rJ8pbtbW+CbZuszCSd+yTZaqEWtFPK5frVY
 um5ApSUlJfB0ROunjAmoyxTCoUhzREE=
X-Google-Smtp-Source: AGRyM1t15mFOEF2ib58e/5myyszzhu7ZYOvTt2mzyY8TVQwTDpBgTOe0UdZG5NhQ9zV/sHNNN0UH8g==
X-Received: by 2002:a05:600c:64a:b0:3a3:25d5:fa5 with SMTP id
 p10-20020a05600c064a00b003a325d50fa5mr183149wmm.125.1658856969658; 
 Tue, 26 Jul 2022 10:36:09 -0700 (PDT)
Received: from kali.home (2a01cb0680639d806be2c385179f3c58.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8063:9d80:6be2:c385:179f:3c58])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a05600c219800b003a2cf1535aasm18344927wme.17.2022.07.26.10.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:36:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 19:36:05 +0200
Message-Id: <20220726173605.24695-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Plsybh67fxmNszI1v+W8nC7RjwyoGrxdrM/d1re38A=;
 b=eEO2KgrLox77kA0AtND+VP+lSQ5P0xMCaMXKDlZ03mjpMSeC8TxquX4AC6QEOUhc2U
 pJ0O0Xzo7LVVQUv9ATciQtyLDbBCnekHF5pNJFTduHQeK61CD0U7IciXhEA7CYP++kuh
 4CMfW/82ijDfguxF350Psesf68UcE/ywjKOq7GA7VPYzwK5qZ4Wa6e5o3vEOZX0VAESh
 j7b5SLaszigawf2AqJyi827YImuQZENmjmnJ9yAkPbfdA39yHaW+rnaMxfNKotvDClku
 WO22rE08rH54janniYv2BxG+WSBWBjWzy8INIk49Iu9bGsX5Y7LEmjILa8OUq75da+lx
 aAvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eEO2KgrL
Subject: [Buildroot] [PATCH 1/1] package/ntpsec: needs host-bison
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ntpsec needs host-bison to avoid the following build failure raised
since the addition of the package in commit
27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:

Could not find the program ['bison']

Fixes:
 - http://autobuild.buildroot.org/results/3bb44312200122334b959dc48dd02fd591ab9949

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ntpsec/ntpsec.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 25ae69ebf6..a0d0662947 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -18,6 +18,7 @@ NTPSEC_CPE_ID_VERSION = $(NTPSEC_VERSION_MAJOR).$(NTPSEC_VERSION_MINOR)
 NTPSEC_CPE_ID_UPDATE = $(NTPSEC_VERSION_POINT)
 
 NTPSEC_DEPENDENCIES = \
+	host-bison \
 	host-pkgconf \
 	python3 \
 	libcap \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
