Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3149EC54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF9084150C;
	Wed, 13 Mar 2024 09:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yuw-wflXuCWa; Wed, 13 Mar 2024 09:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 751AC41713
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 751AC41713;
	Wed, 13 Mar 2024 09:16:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF0731BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B31B81497
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ybGi6c03V4dT for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BA49813F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BA49813F2
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BA49813F2
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:39 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-413ebcf1b3cso1038655e9.1
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321277; x=1710926077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27ZMiKcqOd1+HxGibPwVGlCnH0i/7wh4eDw/NHh6AdQ=;
 b=naamCWWrgN+h7wWRB3Q/GdGxAGL38pFuyiuR03EWctQc9cOkNv0aCKgU16+IqQR1v0
 kd0323uBoxmRKOa9NpGUhTzujG9omIsHagCNKJVBCQ8YpOOOCUBOTprxPuCEP+d2x0NH
 DOgNzNnqm8Z8HXLp09E3ums+klqkS9BMMhFBewN0LqIerXJSvwcl5ynb+Tms5TgUw0aD
 c2oTpb7iQHTUlaXVKN2O0d8eymdyRczp6N5Ew0BwdgCsbWYfOIL3T9ymLUAUmBhXreTj
 mecjqUgFiIziAW9FybAms1Ynzv8elhpy8cR7CpR/GrI+2QgNyhG2/LleR/6kWCefxjPO
 T/mw==
X-Gm-Message-State: AOJu0YxfW3L4v5B1yuAHPl706V4qb/uxg8/Mf0+zKQeFjxDxj5RBAidg
 klstesgtPicIgyAXidqqbj/pAb5EWB0uh4SroXj1l1oKbUbiIRPg1F3QR2Aef9w=
X-Google-Smtp-Source: AGHT+IEyUsenYsBctgEJJefWVR/NcSJEvwVq/0kRG8lWgAg0u5ff/4E+iqOWIGC9c3siwlJtcBBVLA==
X-Received: by 2002:a05:600c:35cc:b0:413:1ad1:78e9 with SMTP id
 r12-20020a05600c35cc00b004131ad178e9mr10160858wmq.7.1710321277659; 
 Wed, 13 Mar 2024 02:14:37 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:37 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:10 +0100
Message-Id: <20240313091412.20865-29-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321277; x=1710926077; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27ZMiKcqOd1+HxGibPwVGlCnH0i/7wh4eDw/NHh6AdQ=;
 b=BrSTFQDCg6VsRtYMBFUVqTEMI3Lhyn0M3fJ2GMjNbDJjo+vPF4VBzs14eMPmrKRm0C
 imvyx2MUCmGSgEgQmzq7AjbpsPvAC6hUEMcksKdMySfA7FcFBzx2E4m5B4DIT8NefPAq
 R71NSjvITLI6B5tjLCobMBIFj3Ro9nD+TWPrqqqyQNz8++Fz7TGKwigUSGnhmsT0QOi4
 kRkNPBDjr/Er4Y5bAbiTOY2MR1qc+/+uGwWg0Tpw1JbI2ANolwkOEKxkPIHXL8MLcgqu
 H2f1E1F4QGS1SmsDUVOT8Jfb9WffuDK/C+6a8peewFIZyujJeNejGa1jjrLaVeihp06p
 kIAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BrSTFQDC
Subject: [Buildroot] [PATCH 29/31] package/wget: disable busybox wget
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
 package/wget/wget.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index d2d308796..24cda15fe 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -72,4 +72,8 @@ else
 WGET_CONF_OPTS += --disable-pcre --disable-pcre2
 endif
 
+define WGET_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_WGET)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
