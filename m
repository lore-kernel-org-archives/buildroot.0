Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8B8C433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 06:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 025A8410E1;
	Fri, 14 Oct 2022 06:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025A8410E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LEdhMn3jGJ9f; Fri, 14 Oct 2022 06:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8572409FC;
	Fri, 14 Oct 2022 06:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8572409FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF2ED1BF20D
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7C2740C57
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7C2740C57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcbofO6FbrSI for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 06:59:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2064B400F1
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2064B400F1
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 06:59:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z97so5599527ede.8
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 23:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++8WfDXWBEVLYyz/rmJeGaXhPPJS0AXQAVb++6tWMms=;
 b=uYYuxiCMKbCx9J6GfBSepsBkefPbiLXh0hZDiKGLw61WVXoCHJMQk5jq5fYPvH4QjZ
 9qc95j1pEuRXdHvQfwmwpzP3a+hw1n2WefpTNCexAd1//y/T8VzLwnx9OKo4dIW23ZU/
 5CP8ORkl/CQgTqDhspSt4BnDnL/FQJkkWr6zsrX2q+JncoJH/9qHiQy0eChWowisFyRf
 1CYYXinB2aIcymYxPdbeAvLStlRwmMgIRFccF9ydE8skyL8PadOJ+WJwxDVbC62iAGN0
 GE+8ONFDjrLXMR/tf/QtX36L6hFXxrRUBktbLhq2x6aiLgm7u71txvVg5MSJanG2o+wl
 nQeA==
X-Gm-Message-State: ACrzQf0Q4wPyjrrNKISzdpQvV71mm3cUm9wtmiWh0TPzyMykiyciQ0xL
 5IKyHun1DHkHLngPYl3+x0Irn6xBbUNpdg==
X-Google-Smtp-Source: AMsMyM5Shlc8HQz3jesFm90bNu8Ds0RE0VHF+3lkBJhYgiNsTACXRd+BxyjJQ2AEjvxBe/7CnlXCww==
X-Received: by 2002:a05:6402:84d:b0:454:f41d:6ccf with SMTP id
 b13-20020a056402084d00b00454f41d6ccfmr3028097edz.129.1665730745012; 
 Thu, 13 Oct 2022 23:59:05 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 u13-20020aa7d54d000000b00458478a4295sm1285550edr.9.2022.10.13.23.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 23:59:04 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 08:58:56 +0200
Message-Id: <20221014065900.3311604-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014065900.3311604-1-angelo@amarulasolutions.com>
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++8WfDXWBEVLYyz/rmJeGaXhPPJS0AXQAVb++6tWMms=;
 b=h4OLWFQzwGFM88W8sbwNt3EzcfCibMs5CxR08iLDK6plQNt/uMb/Sy9Bgd20K+NurJ
 ax/V1M6jv08KLOP4y0vf3Q0wqulUl1j5UiBoq1g4nJqxMChY1aprX5TsX6KEgBM9TpBM
 yFglqiAM2SU/hSzKO/EhmquZ3WdG0MTkfG92Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=h4OLWFQz
Subject: [Buildroot] [PATCH v2 1/5] linux: enable CONFIG_EXTRA_FIRMWARE_DIR
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CONFIG_EXTRA_FIRMWARE_DIR must point to the directory where firmware
file from CONFIG_EXTRA_FIRMWARE will be taken to be embedded to the
kernel.
The option is removed if CONFIG_EXTRA_FIRMWARE is not used, but it
defaults to a sensible value when used.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index efdc21eff2..9a909c7d7b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -408,6 +408,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
+	# The kernel CONFIG_EXTRA_FIRMWARE feature requires to have the firmware full
+	# path for locating firmware file.
+	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,"$(STAGING_DIR)/lib/firmware")
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
