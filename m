Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D04AC4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 16:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8BBA8194A;
	Fri, 25 Nov 2022 16:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8BBA8194A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bquOWxBrP08a; Fri, 25 Nov 2022 16:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1452821BE;
	Fri, 25 Nov 2022 16:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1452821BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE5281BF5DA
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8AD4820C8
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8AD4820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KnO-verl4vN0 for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 16:07:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B34B814B3
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B34B814B3
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 16:07:59 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id g26so2671299iob.11
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 08:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GOl1SFancUWBmaUskg9qalpFSV6K1zn9VYSj3ymI/84=;
 b=1Lk5lLB69eRWaE96NhQmpFj1Kf1t4bajm6FdphSl733TV0lu/4uzDLjodXyzLKQY0E
 LMH5ny/2frdaFH7S5pU2M/Qs5ndx2L85yaxDdysrpLM+gADzpkdegdN8m2rGeURDqVLN
 EZSsAaSXOX0mfwLrX+CEt0p1POwzNY51HBVKw7ly9k8PTVCzEWSvlv3Pa/61kk6DjY6P
 592QJ0P02PFurHLnqGH81j7njVgd41NJZrAWZnGGprW0UP80/F7rEBr3frCukLk71I1c
 e67kEzKA8vvEUkKIIFeJZMIRmcSFayLtsRZ1KMFKp6nghiQGWMs8M6strhap2VIFgScW
 qL2g==
X-Gm-Message-State: ANoB5plqh1QVyGWh1fXn6+JYMhElKGXUjtfv5Ps0+bsWZm0MsQGSXv3Z
 B6bf9KXpL67QfxefqLRsaC9OlX4pWhjv1Q==
X-Google-Smtp-Source: AA0mqf4Ucdc9HqEiClL5PUEQ8bokMe2gqvS1EDLEDdugduNItse9Wo/PGrAHOg2kaXdVB8RYselgew==
X-Received: by 2002:a6b:4111:0:b0:6b7:b0f0:f393 with SMTP id
 n17-20020a6b4111000000b006b7b0f0f393mr10777900ioa.200.1669392478262; 
 Fri, 25 Nov 2022 08:07:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 z28-20020a056638215c00b00363753f4730sm1497384jaj.91.2022.11.25.08.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 08:07:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 09:07:17 -0700
Message-Id: <20221125160724.1725476-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GOl1SFancUWBmaUskg9qalpFSV6K1zn9VYSj3ymI/84=;
 b=h7CAHzwp9T+DvdAdOVy+XBxAEwuT1TKdDT+eXTnhT3bkZGotgNvPcw6oeCBgbNSKK7
 cnQ/ow9PTn8AI560Wkkm/Vm8TJHrthebyXplSva2tm3b3gcXhrU0XC8+5bkF1a3m6NHG
 nc3POeHHtOU0ddhvn4tH2x8PKKdrk9u0hOpfTstY4FDav7aBXY3ISthrFgzC/bfnxz6W
 R3i7bD+C9ZhNPaH16Dltp+rhT7XO2uiVqCVOuP0KSWEK336lz3H1ZibJ91T5qRw10MSk
 Ji74NiI9qBIPw9wlVsVxyoQvLnJ3VPYPUIWKmG27kHlsKD1qirSPNiIfzHrG0UXgEUI9
 VJ0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h7CAHzwp
Subject: [Buildroot] [PATCH 1/8] package/flatbuffers: build position
 independent code
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upcoming tensorflow-lite package requires flatbuffers to be
built with position independent code.

Fixes:
/home/buildroot/buildroot/output/per-package/tensorflow-lite/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libflatbuffers.a(util.cpp.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN11flatbuffers11CharToUpperEc' which may bind externally can not be used when making a shared object; recompile with -fPIC

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/flatbuffers/flatbuffers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 9d286bf9e1..487d85ee1f 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -14,6 +14,7 @@ FLATBUFFERS_DEPENDENCIES = host-flatbuffers
 
 FLATBUFFERS_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="-std=c++11" \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 	-DFLATBUFFERS_BUILD_TESTS=OFF \
 	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
