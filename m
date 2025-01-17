Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1818C02188
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC7C241A3B;
	Fri, 17 Jan 2025 10:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFhM5kOatZBR; Fri, 17 Jan 2025 10:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A498F41DE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A498F41DE7;
	Fri, 17 Jan 2025 10:50:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7781B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A37296FB7D
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhTqElIfyTXr for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67ACB6FB6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67ACB6FB6D
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67ACB6FB6D
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so3301479e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111005; x=1737715805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ci/Qr+H742SdODpfSRYap3hhCEL2XZWl6EmLR17ZoPE=;
 b=FsdZFwld/GneWIiNHNXqg/oi9Kz8DT+txYXfLnuieHatz0LU5+vynxRl1nCv7G2tfE
 cAUidW+Ylv0fiAzH5eeuJQCwUJ5FIBKIxK7OAlji0J/KNhWnoozEU5jf9ajDI3zWw+pD
 ot2POUWlodHc2xsf8Hy7nYYMSSthwx+yJbGKcEbic7CNNkefocT7UiE26/0D53DLhTe6
 Ct1VwAptkAtJrgzcVhwBy7DNXdT/HWV+h8xC5iwj93iaKkrqzjWV/EXVvI6z0JuLG2/p
 kXi+GH9gYsP6fDEi6OPvpuiCM03b1IGg6jfL3AfwuutdQJ3sv3WLKCbhsonmKXoWi/dW
 t+BA==
X-Gm-Message-State: AOJu0Yxc4tbtCYn1V0pTqeujxrkLKoVHsDyldKpAbVAYTQ96tuAH67mv
 bnNUGzL21ydRc1Hj2605HmI8mbM6dgU/zZl7zy7DrbN2nCQUGeAGG4XZng==
X-Gm-Gg: ASbGncseR6TrmFxbiVIv2KRf4nkyZkiXu/LT74C+C4PIcGJmYspoEMVUSa9wrN7ZaXQ
 YCTd7cXo2TErL9o9lrjEvpJoI/mUV1VWeYHh1xDsumtyqJ6Z0EIIIFcGkaR1Ngr4XJJfRRD9jeu
 5ptHa5qi/01QbKck7kxdJTXxVlEbX/+0h5XGylmvG012c4XLO7A/x6B5sqgMcH5TqBb4fDd0Stn
 cyLoHiyH9xOyqqY6DsaQ2DmA8/SfcpdyHCu1daWTd43/2OmuCRMQJPC5AXljFNwJvGf9wiwvHJI
 sA0yAejK+6k=
X-Google-Smtp-Source: AGHT+IFviK/UovIgEmWN63KWZO/LSRDDNlwB03xznjKNXDq3g7Ua7sO3+DPLpueFJFDf8yYyTZx9nA==
X-Received: by 2002:a05:6512:3ca1:b0:542:8d92:158a with SMTP id
 2adb3069b0e04-5439bf8daeemr679479e87.10.1737111004937; 
 Fri, 17 Jan 2025 02:50:04 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:50:03 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:52 +0100
Message-ID: <20250117104911.613221-12-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111005; x=1737715805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ci/Qr+H742SdODpfSRYap3hhCEL2XZWl6EmLR17ZoPE=;
 b=IVXBLgBx15KHD7zSmQnOFzwbSSMY63rHYb43OnMlaB085pN/uSD8w7BmPg1nyaiHkj
 BDXoe/nrA0gguPZRzE5ZjkvVRHgjV+d7TNaTp6SoGi29sD1T39t120ylZoB4QoGUCL+7
 7uSb3UtXEKmM5MnWa6G7zfihx1xyR+C6fP0Mn9NzPFCOb4ADdU9Zvti3QbI3fNFDAzTn
 vSlWo6ScKN7KSNpILTr0FI52wUpthm3oaep2pCAl6+lwAXDB/r67FdwaSdohCDRTvz9u
 LQUOZMQFn1YAxq+UZGKRmCUNbLEz5kXaoUsAZixkDZ/3inN+afUYErj/RumXsDPNP7k2
 O4Eg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IVXBLgBx
Subject: [Buildroot] [PATCH 12/19] package/qt6/qt6multimedia: remove useless
 comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 1f02d0a5a5..fa30475ad4 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -109,7 +109,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
 
-# for spatialaudio quick3d module
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=ON
 QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
