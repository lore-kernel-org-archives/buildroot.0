Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07838ECAAD5
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B4561114;
	Fri, 26 Aug 2022 13:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94B4561114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rs8J_ZuTnE1B; Fri, 26 Aug 2022 13:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB856110D;
	Fri, 26 Aug 2022 13:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAB856110D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71A861BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59E7C83EF9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E7C83EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8J3QxwdZfOm for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A706B82FA9
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A706B82FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id cu2so3376683ejb.0
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AMWy4BCiIiK9WtLbb447EAIhXfr6AeAYxS2ixZx06VU=;
 b=1gxgeSFFZquu4M4lmzcdVyHDNPWWXpS9yLpiZDBNtmBLARMm9q4FNsWeQvLAANH/Ym
 2IYF9AKdPN1qvY+zbBcbFa4lFJ25rELHNBXjmhFcZ+HFw5NTLYMqf14lVJ91PK+PLMCT
 KGka1aEvtPFxpgOpOuU2CaQwJzbfoTlZ65MyYCS4GXnOATheUaGhSRZfn7Illv8ympBA
 SJiwbJ/qT4YNmfxlQcG3bgSFM7K5RsWykgatznGSkWZpZUYmGIbDxOajh71dpKIfHmi2
 xO6JFmkV5ndQAA6CPcYHnMTKeEO3pbkP6rl0Qh+7VdjxTWuGwgC5tktIJsLziOixoQxa
 kgYg==
X-Gm-Message-State: ACgBeo0kJd0w4A/1HA0WzCqyP21/PmuOoXMwJmNuxk69T8oYsVZgMPd6
 dTWLon1ubpXWtzUG2oI+ZWHQe9p28XQY4G//
X-Google-Smtp-Source: AA6agR5TXZHkIrks/CxnzC7b1Yvc+mRm98jsxFu6Y/GIvpo3mHX+N8vwc+a7/lq71+UnZjM7cM6KjQ==
X-Received: by 2002:a17:907:7f0b:b0:731:b81a:1912 with SMTP id
 qf11-20020a1709077f0b00b00731b81a1912mr5550691ejc.8.1661522115448; 
 Fri, 26 Aug 2022 06:55:15 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:14 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:43 +0200
Message-Id: <20220826135503.20612-10-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AMWy4BCiIiK9WtLbb447EAIhXfr6AeAYxS2ixZx06VU=;
 b=okMbU0vwTiFPtKV589q7ch5Z1lpg+hMaI4PLKTu66s+r17w0I/cOERZpE8RFK/+cF5
 cwVVSGQCcDp2lsOW39qa4d0lmQGurlzyh+XiyiW+sOmOK1JXjkT94KeBo5Hrk51eWwjm
 bffMDI9g/FwpnExbmlck/R+u/RzUf531H5nKID1Sh35x53f3D2K7ea0g7rAsP2NXh3Y9
 WLJTNUBt8UgUOUFxsenjTeroViSMMzeYw5r30BD0tVsAIFqoOdJFJHdF182JgOC/nviK
 alSO3RTYDJFL2ZZo3/JEohau7ZEMQCsuXTq+GXyX2l5eJAZyL/Dnm5SglSidEGUKP874
 +0AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=okMbU0vw
Subject: [Buildroot] [PATCH v4 09/29] package/qt6/qt6base: add qt support
 for journald when using systemd
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a399f53e6c..31912f9462 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -112,6 +112,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_journald=ON
+QT6BASE_DEPENDENCIES += systemd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_journald=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
