Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849FCC55172
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 10:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43831405C0;
	Tue,  4 Aug 2026 10:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n92mfI0s4NJl; Tue,  4 Aug 2026 10:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 620D2406EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785839957;
	bh=vEwGriG8x+/uGCgTZfxwm+vQMTzpKoNSoklflhRtmIc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CLxH8jYDWL8IPgUO6bsrZGhYVpb/QeWnyPRaY1337ox9CdblfPAlEYrxkTmeyUVME
	 rmRE3ErymJpSkE8ZvIURr/wdAVvFH/ORJIQTeYvt0lBxOBN1avA5UNk9CSmEEgCDY7
	 meerqrBk6p+hjrRaRdIqv9q+mC0Iwg4hyRzS1UOpfuvNf/AV2nVEKdc6xeajFCLFIx
	 U1Hlw47ebeFGOu2NrqzEE2m3H9CI5is74Om/vZKpjJVLaBhhREqcmQYD11bYyx3mPd
	 dMVO4tGZrzyT3uXMyPcEDDwBy+m3dMpgBV066QtSee3nMMkU0nmQDPamz3cyzU9NJI
	 ZpICIx2QwMfqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 620D2406EC;
	Tue,  4 Aug 2026 10:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D2D4350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E89540071
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8q1n1UWDyxNv for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 10:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 720174005F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 720174005F
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 720174005F
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:39:14 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-51e4ba1cfb4so25905131cf.0
 for <buildroot@buildroot.org>; Tue, 04 Aug 2026 03:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785839953; x=1786444753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sH8J8LtkBRMti2wkM5Xs8IhTiP+RjKxbruBEK9VJr1M=;
 b=rXRpm4u2DokSnZjy8zKNYGQoGDMAGB8u0iWj7LYwE7/iusUi5medc5xADpcge2gnxs
 iCz9ukJOgPU9dxNvDsukW9qmTAi7eXUztrBRTKLgDc+/Ew6d8YuUSkClNdoCQ8fGRT/V
 AZjE7sIPLVgx0ZpcxUHWRS+5l9W0rtLY4i3t1/QwyevB+brv2wQ1jIbbhPr5UgAJwI4O
 KfcYZA8FEVObzKDayiBCvhk/kfTfPsW/S58KYSeoVsdPyfAfca+7yiFirwD6gc6QH1y1
 vhm++FzXybj029eRM2EUCUtissYkjiTyKT47CmX3pz4QH/FxDAF6GJn1iuF/BXsiaZwc
 zuiQ==
X-Gm-Message-State: AOJu0Yy7XcRPNPr7o+jI7O8V8uV9z6A5xaYvMw4C03KAc/cDfsD75ahF
 L2hHsLcuivAADFhU1fk5Nz+REbQDCq4Nr4rP2y76XviK9pe8459t/+Gxi2ep0BqWoB4=
X-Gm-Gg: AR+sD11VrmKAeMCXV/MhsHK1zMKarposuEI8r3f7E4QACwfeRKkMe2jteEEUluy/DNP
 k4y8JpIuHdIM3ZkqVrdiTKcNeJxfBxwZBf2ONF23RwSOZqcdP7XUDEJSn7tVDl7+KrBrz5ZQNnx
 nJAu9NpVU2wnYLu86twHPVNmf/jkn4All3H3RKqPBqp4Y9jn4S1amtQPeDZhmWI1FOQg9RJrUdo
 zp3lJ9DnOXz+EhC1U+JXxD5qj2ZlCM3piyYDv8bY6DHpfUq21do5cEX2aTIyOmEOyFy4fRuPstm
 lSgHN7yjnRDuDTguSLbZAaxkPW8cHBPAh3J/xrLeYfNuSI2DdcdlkySIcpz3lUlVUKGLf9swP/E
 oBxr6b8kmnVWabSPUYpUhA5urgfGkf5em47OXvp6JDZfu1xkd6+guvBeunLADerUgBd+kyo/ItB
 cCc7YRaWNHNgay8alKN1q3a1QHoOvhXHTuoht1O5N9rVb2AJJFumDs2MKE89DCiWw6+VtuziqxF
 DXddT1mYXXr/yoDAkuumoH0/A==
X-Received: by 2002:ac8:690e:0:b0:52b:4f1a:5ff0 with SMTP id
 d75a77b69052e-52b566db1abmr294652241cf.19.1785839953001; 
 Tue, 04 Aug 2026 03:39:13 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52b4e7edd06sm79871711cf.2.2026.08.04.03.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 03:39:12 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Tue,  4 Aug 2026 06:38:54 -0400
Message-ID: <20260804103854.429758-3-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260804103854.429758-1-alseycmiller@gmail.com>
References: <20260804103854.429758-1-alseycmiller@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785839953; x=1786444753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sH8J8LtkBRMti2wkM5Xs8IhTiP+RjKxbruBEK9VJr1M=;
 b=DnClpy65B+DqrTSTdn/MJgVYBVDXXnwFUNqQ4se92TOqj5sFzt5QLp9C4+pNGPLdqZ
 /WWu13D0I69Ar3gXlIi3CyKD2y1G5yCtAslQVh18lfWZw5qwYu8kjFzzcuJhpSPuKolV
 Eh+gi2oaWVWsX9Yu03wIIwP3P2NYXyhg4NWM7x3TOJuKdJUEiT1PcxuZJJYwe/Vasgg1
 nZk8onD9FCAihfunW/xy1eRFYRIFOZ4XyDYFLYwbrSEm64Nn4zDFCgT1620j2Rl/ik25
 uAgM3VBYSh3dWw8HVft54VOcRMzK+Wdm8h7kCMiOwOWoFRHSUGpH1LjM9JALQMJK97Vs
 J2hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DnClpy65
Subject: [Buildroot] [PATCH 2/2] package/pipewire: add support for the LC3
 bluetooth codec
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

The bluez5 plugin can encode and decode LC3 (Bluetooth LE Audio) when
built against liblc3, but the meson option was unconditionally disabled.
Enable it when BR2_PACKAGE_LIBLC3 is set, using the same conditional
idiom as the neighbouring opus and aac codecs.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/pipewire/pipewire.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index c5127b9a9d..9f66db0f55 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -20,7 +20,6 @@ PIPEWIRE_CONF_OPTS += \
 	-Dspa-plugins=enabled \
 	-Daudiomixer=enabled \
 	-Daudioconvert=enabled \
-	-Dbluez5-codec-lc3=disabled \
 	-Dbluez5-codec-lc3plus=disabled \
 	-Dcontrol=enabled \
 	-Daudiotestsrc=enabled \
@@ -129,6 +128,12 @@ PIPEWIRE_DEPENDENCIES += fdk-aac
 else
 PIPEWIRE_CONF_OPTS += -Dbluez5-codec-aac=disabled
 endif
+ifeq ($(BR2_PACKAGE_LIBLC3),y)
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-lc3=enabled
+PIPEWIRE_DEPENDENCIES += liblc3
+else
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-lc3=disabled
+endif
 else
 PIPEWIRE_CONF_OPTS += -Dbluez5=disabled
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
