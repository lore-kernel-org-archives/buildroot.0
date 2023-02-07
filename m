Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFD8C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DEAB40A12;
	Tue,  7 Feb 2023 14:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DEAB40A12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyouX2cY-hoZ; Tue,  7 Feb 2023 14:32:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E414140A83;
	Tue,  7 Feb 2023 14:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E414140A83
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3AB61BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CFCD60F48
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CFCD60F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCfkuLbIipNb for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A954860B9A
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A954860B9A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id n13so11159594wmr.4
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=leFM5YFabhGSGVx4dHrYfQwhmbA8UNwl1oePDsoyFFY=;
 b=lIcs1nbx9A2XPlBe6x6NBJyu1OLP5D4asYNzbX5o0uhooQtaYX2BvYzIk08lSGGFVe
 Y7PUaWD8pQecyRfGt/hFDc1JfMH9LvAkn7KdDbj1cnW5TglQOmARp9NUgAlzDFleZxwV
 n5171L2a5JMuAQC7bhrXU9y5RsF4ZEupxIEjU6aMNcc7Mzs8kat0L5MDHWPp2Smxc/Zh
 EKheM30JWecGry3gRvXbBZMY1sO41rkqgKoQUr3D2tAgEF2NAnNAXDhvxe1ebs0uP2Sf
 iJaxfKGEf5dk9rPbFc8TkMMuvvBuJ9ilhsegZIjWoyLjZvExVyxZuu/qo0AeOlYWTaDH
 yAzQ==
X-Gm-Message-State: AO0yUKVA0vtv8/nJolOdFF9ImqugLkQ0ifCaPPSmWdS/3CzXTrC+GCN2
 UIKtJ97rCxG3xogTingqq/Q+2hpi9I2XQwDRq/URsA==
X-Google-Smtp-Source: AK7set9pqG8Ci32VjPrOFsX3kuSB+ErYPks0hrzyTEVpORDkMRvWFOtql9JfH2KR+fASzxbCJ92g6w==
X-Received: by 2002:a05:600c:30d3:b0:3dc:19d1:3c1f with SMTP id
 h19-20020a05600c30d300b003dc19d13c1fmr3420025wmn.30.1675780220649; 
 Tue, 07 Feb 2023 06:30:20 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:20 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:30:04 +0100
Message-Id: <20230207143006.2681335-11-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leFM5YFabhGSGVx4dHrYfQwhmbA8UNwl1oePDsoyFFY=;
 b=pJmsuZk9IoI4Bf0iRJImFjjFzd4xLjm5pfPKlSlxoOUdU0+JVJMspc/DClPTJOdif2
 MWoIDHTEcq1K+r1FAlYZBROddKKsqvSkF7p28cgNF4hwooCw3GMhwNVEDHJ762FlhTgM
 y3u6qxZzG+lhbfMoWYB6QMcyWko41rEtnr5Vk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pJmsuZk9
Subject: [Buildroot] [PATCH v5 10/12] package/qt6/qt6base: add support for
 kms
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index be17b63c6a..8830e15388 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -184,6 +184,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
+QT6BASE_DEPENDENCIES += libdrm
+else
+QT6BASE_CONF_OPTS += -DFEATURE_kms=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
 QT6BASE_DEPENDENCIES += fontconfig
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
