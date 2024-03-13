Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66091C54E60
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EDA640A83;
	Wed, 13 Mar 2024 09:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZaIb1vOHPOn; Wed, 13 Mar 2024 09:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B99B1415BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B99B1415BA;
	Wed, 13 Mar 2024 09:15:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D8101BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0471813B0
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzmKuAdm0Lth for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7388A81346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7388A81346
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7388A81346
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33e70d71756so364794f8f.1
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321269; x=1710926069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6nMNkaVEJIL1afMtFXRdnDZMI2ifB8VNZ91hHPYHT2k=;
 b=cPpZKlQo0YReUsJwVLMtWqaeuIZ8TGBNuaInWbaoha7ziJb+N3uuYnsPhK/z5+mJUl
 AdmnzOWe+a0AMq3G2PfxwrfosSzSOeNgj8XGD3ipy/S9+C5O16kRf/RgiikeJDcx2NiE
 b0eFj83Y/DRMip3Q9SloLX6gOj6vwxfoXaiW29+Eo8MdS8FToLohh05KHwDelUNQ5w1R
 /EUSvK17QF2878+y55UvcPMf9U647VPWgSzbFW357H4cYgtC4PDjaLVLupMReTrDO+si
 kAuAZtadHovNNJSgHnCFpnjyspCHcZ867ap8ScsfCyzvcK5Lu/3Ki4nwCUGWMBZl+czj
 6p0g==
X-Gm-Message-State: AOJu0YzTGPom8FsDVpqYUXvQBnxnftVL/+OrXPkbtzZw/YHcykpu4n+5
 riXYnkOXa3CXbafcbac0vEXJNaQIP8fSUUrODVONxxs0ArcApi4GB0DDC9hErlY=
X-Google-Smtp-Source: AGHT+IHa3goV0SxRTlSTnRhAGKnf+mSCO8dzSvw10swAAF9dv2iVrj29Pdog+5zXOXcu50wqsypdbQ==
X-Received: by 2002:adf:e008:0:b0:33d:c45:15ec with SMTP id
 s8-20020adfe008000000b0033d0c4515ecmr1700589wrh.32.1710321269520; 
 Wed, 13 Mar 2024 02:14:29 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:29 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:56 +0100
Message-Id: <20240313091412.20865-15-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321269; x=1710926069; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6nMNkaVEJIL1afMtFXRdnDZMI2ifB8VNZ91hHPYHT2k=;
 b=ljC8SdzKzAaCgkEZBx/5DakySig2A4X4+1VdyZSubnd9judWxljAlDGNf6FCp35JYv
 gw0DCtOZh2FAUoh6qj7HzySDTzeyzAfvGT69WPWx7ReCa6+vsMLWljZs3oX57CRhbXU2
 8bkNum8KjdfURNfyySooJPfwte5G9m2+hXFdN7ZEWpOAIXPsLyjlcRzyoAEHpRAAWPab
 oXdvvkM45TT1E/Faezr4I7kmg2BV0hZ2lmqgU29N0nSRMbXfru+xWcr8ejb+yTbs8q77
 65ns5JP73j9A42oiOHpfsOY0dLWcMm7+Tdp+0K8rU0yCkUlmCxkdth3UnMjuz43xWGil
 MXuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ljC8SdzK
Subject: [Buildroot] [PATCH 15/31] package/ifupdown: disable busybox ifup &
 ifdown
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ifupdown/ifupdown.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index 14c36db0d..c79ba81a1 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -33,4 +33,9 @@ define IFUPDOWN_MAKE_IP_IN_SBIN
 endef
 IFUPDOWN_POST_PATCH_HOOKS += IFUPDOWN_MAKE_IP_IN_SBIN
 
+define IFUPDOWN_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_IFUP)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_IFDOWN)
+endef
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
