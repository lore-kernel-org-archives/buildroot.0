Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32307C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC2883147;
	Sat,  4 Dec 2021 22:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMDONcHo2qC6; Sat,  4 Dec 2021 22:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4807681B72;
	Sat,  4 Dec 2021 22:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 645D71BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FBC24044C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTspior8itUz for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FC974041C
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:21:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u1so13670587wru.13
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 14:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xKfMVT6W8VVxh1C/T2lJyfbfV9AbhW6+4oZuO8tDNzg=;
 b=e6k6Ku75LLyGFl3B6sGy/uG07hqEioPRVXCd5+UyjB7gSP4KSbNpzpGEcUyrQdzurI
 rEVpsW5CsA9Xi4kS4a/UPhzOMt1+9c77b0urqbvWoD+h6zRabDEhRP8sNEpFD+vBanm9
 c1rzcxEphOCxPzXOUPr4s058NfPFlfKmi3VlxR88KTiVn/y9Fy67dC49ikl01jTlFiai
 Xvg7hF7282VNfJaH0m9RwniTbirYcUBLdCIaX74oq2yAV34xc26mWqhepcLM6WqD8kMl
 YlVlZoJUj35ymkiGuokMCrgnL/wDWr7VySmQM3AD9f00BpUET8Kxjd9wkLBA3LSL8Cny
 CIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xKfMVT6W8VVxh1C/T2lJyfbfV9AbhW6+4oZuO8tDNzg=;
 b=4Dj6FWi8rkYl9Ur6yrkacwGR7yF3xUhWHrs7SxPohmjj/QX/Dr2qtYLsnZQXuonyOy
 8jqyGv9hFvktCuh8VILDduBtPMHgxgJj77SLJ0tZYjFMc+Z8j4+UJZgUQanfVg369G4R
 Qc8WUfm4WbE5jJHMDcPf68pjQrOyqQ1k9kZ2nOpGaWnlFmEDCN2UqvzDtJghUfBR389B
 Y2qRi1HdjP5jjPgjrCCM+2Fcp3TSvgWNSxGzxBgEaJaQklaQao61uucXDWjwyZYsDqMD
 KvKvlRbNhSa88adghytbxCGGyQiQg/F9qdkQ0jh/pvFvlwU0KhTnP683i45KaNGkDMm5
 BjUg==
X-Gm-Message-State: AOAM530amyP2v2cBIRX4FEeh8PwGumZil5rxIZlTkhA9cKiN7dPaWn4N
 loYoSa4FzYYc7krKaThqbaAZnSjXCzVZ7Q==
X-Google-Smtp-Source: ABdhPJyojXGbw65rcIcTdVLunmfglgek9SNfXyuUzUP5wvFpmcuaPU4mHeD9Gf2c2mq4+HrvDe2fhA==
X-Received: by 2002:a05:6000:1105:: with SMTP id
 z5mr31554858wrw.615.1638656486368; 
 Sat, 04 Dec 2021 14:21:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o63sm6451876wme.2.2021.12.04.14.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 14:21:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 23:21:35 +0100
Message-Id: <20211204222135.2021817-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libatomic_ops: add
 LIBATOMIC_OPS_CPE_ID_VENDOR
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

cpe:2.3:a:libatomic_ops_project:libatomic_ops is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibatomic_ops_project%3Alibatomic_ops

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libatomic_ops/libatomic_ops.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 96b8e1a404..fb1e86f6bc 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -16,6 +16,7 @@ LIBATOMIC_OPS_AUTORECONF = YES
 # library, libatomic_ops_gpl.a."
 LIBATOMIC_OPS_LICENSE = MIT (main library) / GPL-2.0+ (gpl extension)
 LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt COPYING
+LIBATOMIC_OPS_CPE_ID_VENDOR = libatomic_ops_project
 
 LIBATOMIC_OPS_INSTALL_STAGING = YES
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
