Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5A01088E65
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 02:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C9E41765;
	Thu, 19 Mar 2026 02:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNyBXm4BFf0m; Thu, 19 Mar 2026 02:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A063840F62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773887381;
	bh=JQOVZeY05n6RbRRXNr3l8LUWmBFKgMH8OH12dTz+K2s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAYn2+xki1hosJyb7rs82WkTG7/FWT4CVxnkcZAwwspEXER3wit+NyAMgQ5NwMiqN
	 wank5fAixNuSu/gb+4ic03YghsjCNaEtt52/MTJPW0qWWdZbEFgY/kcE3Vj18v0pgU
	 kDhzXlTPy3PiEKkKwpuS8SeI0i9v9UoyYcd1FWQhQ79T2uLc6eFvasU5/WWwA20svp
	 qLRlgERX5fFPYcQkn8k8gK6r5rAG5BxoaIe22pbNPxnRGiBj5wAxwjCHDfbInabSXL
	 DLOSZ4H7sp0GGBzXQL/5Ehsn0UbpXxe9wzXqnNSbs7Vp1PCjSggUtqLClWGM09Ho0M
	 BMCbt2isPuljA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A063840F62;
	Thu, 19 Mar 2026 02:29:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE2101B6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 02:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF51660E9A
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 02:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8W8mdCJCXTb for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 02:29:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2360A60E72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2360A60E72
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2360A60E72
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 02:29:38 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-50917e02472so5524911cf.2
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 19:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773887377; x=1774492177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+UKcC686lbqmJQ+RHMa0RfQQE6SStzhJPuDbtijek0A=;
 b=YPWLHiX6AfvShYNgvhE/sCbS7NUTiQbeGiWnSfkn5oNKTC1gwcLHy6ZeXzqv5HGsc4
 kw7VDIKQ+w4dnxZTQ2CLQ1evN4d0xnVt4Zbr+R8k+YRwCmXh1A+XmA1FYP31k9nNrPQw
 vOBjyUAh2B7H1F211gcUuRdxohQftuhuppuAwu2TCdP1JF2VJgnKJuniffyQssnoym+g
 r5AxppG0IsCxiA4wt6XUjI5tPgG11XZHUPZyr97DEe3DMnvV9Y0RtjTSRX+WI8k7N5co
 quSAPjWJzbAOb1M2GoPafl5HmUlaDJdVk6eDC2uIyEjTMMQ/zvajMSjYF5MYdHp3TkG1
 Cwwg==
X-Gm-Message-State: AOJu0YxN2SmuSFV6Qu0Ogd3jT/GaReH1y/kfAFj53cI8T8dIxLcsqAo7
 Pmzh7VIc4rIOMYz57Cn5SugEyuYwMHwMosnx/5qE/Z5EJDaNhZSdsMmqjG4sj81r
X-Gm-Gg: ATEYQzzPn2x9YEurv8siaCoaajdYLW2CV2Pc3nZmq8MoOs0yuhqlAiv62phEBOUBREq
 64aoficjVlQfZ2asSIspan6P4UZZknUAMfVSkJvFJDFWIqJpv9W9hbYxNroIAq1mwWKzsnUGkrI
 gcSeuPuGTFj1KAY8hgkTGuIkRv4xEjs6W9xQNhraqGhfJd4SIupeDGvpoazSTwoXhY4ctDJVg80
 hY2tYiGnfmqJ+Y2DIG01a7yOfIOOy2gRq1V9YydaNDkTdgv/9ku5I6uIOoolSFP9YaNZyvgjCR3
 IqSBDvEWJpEQV/lzeXAhGPITCUpoy8U8mjaHoWquinX/sYKVaRtbdXgSnrwZpg7ZzwE40dgoooB
 VzzxYxl3/rWeG0kuJcesZBlxpeCY7mN8g4G9BNHH0hWInA/Rh6w2yGQcj7o55s58YY/QpNFYGgs
 Oc/47Vpaamf3PFC6a45HIgAA==
X-Received: by 2002:a05:622a:316:b0:509:17e4:cefe with SMTP id
 d75a77b69052e-50b14863dcdmr77060281cf.36.1773887376901; 
 Wed, 18 Mar 2026 19:29:36 -0700 (PDT)
Received: from adicarlo.nyc ([2603:7000:4000:24ab:21e:4fff:feac:60a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50b135d523bsm35806611cf.27.2026.03.18.19.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 19:29:35 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id 43027A98245;
 Wed, 18 Mar 2026 22:29:35 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id 43D5794; Wed, 18 Mar 2026 22:29:35 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Wed, 18 Mar 2026 22:29:06 -0400
Message-ID: <20260319022906.47253-2-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
References: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773887377; x=1774492177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UKcC686lbqmJQ+RHMa0RfQQE6SStzhJPuDbtijek0A=;
 b=hQvEAIuXZzkyXml2LkqVfy+dKmU3wKEj+nmJDZ/Kb9jSqoqx35A4eAoQm3jR5hhTJP
 YzfP3zR3LL+HaxsjghtwwIO1uLeo5Vm9D5Y09lqym7zmeo9GUj/TTFwYba5NUrdnX3dR
 EK0eewO56iBW+QYJe+EooiCPg1Vix1k5W2iVHnIabj7HKbgNgR7PTJLrw7v7SbwxgpTs
 soJjudX0qpzjvNQdOIY/coE17W8j7by8stj1PpfFiy88e+xsMFTQvudhE48Mq7T2sN33
 Nw3gS8lYfSix9CqFjb+IXjq3m6K2vzw21lMZsclZKjX+iXUIOdOxq9O+JT93g9U2k2Ja
 uBwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hQvEAIuX
Subject: [Buildroot] [PATCH 2/2] package/gstreamer1/gst1-plugins-bad: enable
 drm if buildroot package is enabled, adding it as a proper dep
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

Signed-off-by: Adam Di Carlo <a.p.dicarlo@gmail.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index adfb407386..3c596eb2fc 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -60,6 +60,13 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Ddrm=enabled
+GST1_PLUGINS_BASE_DEPENDENCIES += libdrm
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Ddrm=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
 GST1_PLUGINS_BASE_GL_API_LIST = opengl
 GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
