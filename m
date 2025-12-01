Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D881D116F1
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 14:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 738C360FD3;
	Mon,  1 Dec 2025 14:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXFlNpAE9jAb; Mon,  1 Dec 2025 14:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3462D60F04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3462D60F04;
	Mon,  1 Dec 2025 14:48:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20A491A9
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E4CA405F6
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYVMJZ3hCWuc for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 14:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E5FA4037B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E5FA4037B
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E5FA4037B
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:48:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-37d96f97206so20287831fa.3
 for <buildroot@buildroot.org>; Mon, 01 Dec 2025 06:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764600509; x=1765205309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SY7POXE8PtVis5iLUVBMlA9lTIUSZYD13Ete4lwnKUY=;
 b=ghlzu8kM9+y0CKVK0kRitxW08W+T0ZIPrO4Xg0bnR2FCq+ROmM1XAo3waQtIYjndox
 h+PBGeTgv3wmHIA42fnA7Altv4WMpaTp6OHpptk7ZItLT5uyBhO/pPa7n+0zip7wRXDF
 uoJke8TuQhKgxlRv6MjFGT3F20q1BBQEAlMEpSrGX/lmgdtgB18xCLAbPKnQvJDq2BBL
 JYQ8ZyGEYhPFqrggqvaafVf6nxsJp91VDVpO9Ig8f2onITqiG51CdcahNKWgJJ3ZXZn5
 0O5Hj6xDs0EkOcEksJAmsnfKkn0WpFAdU24yV7uOoLkqslF/3oX7YqhITl8HvuU/7Dp2
 j4fA==
X-Gm-Message-State: AOJu0Yy3llq5uWwOjfd4aSSjeFczr4pRg3zLcHXDvrtOZkAJNis/piMX
 Kl2RGltEM3/UPV4CAAg7D6dmiZ0YHviHREiFpY2Qp0TYpH4EEOTYrjeYRCHAxQ==
X-Gm-Gg: ASbGnctSi5iEdd/ZzrSJPvVRAnV9sAUg1fc614llAwRxpiBtbId0vC6WGozOg/45rOO
 i2rbSuLbvqq56r8eL1fNRJzO4lPJavCVudjNq9Mow1zZjWR4mot4aserNfmFBwLVHJHo3SuTf6O
 082QPblIRrYkkQNasIaTtI/IIJI66CrqYUEYT1hEaK8LBeBPnnlopHJJs60LWZHPpQkWU3lpBcn
 8Lu8fGJhbmELObISmabpSNSfjOzc3jPKDJ/gT0/srWCumBBdtPTGoNCVqd3eSVsXAqiDFX9A1EB
 /K+xv5drnX7tEvKGG9u/4JjiJxVXczzdTaZBNcKznaOsazbUxBEJDZGjX5mGIcXsTyTJcT+nDfX
 DDGCo8i8DJVsbTqFT6VyiRqlc7caqCMJutR1GP1/CuGl8wHybrLeX7ZfFUp98fZ6SVSGL83Xafz
 4UFS8=
X-Google-Smtp-Source: AGHT+IE/LiAyZV+G4ZGKPpRZztWlqXp5PnhPy/YqkgPZPUel2j2cdCW/Yk40Jse0Db9Ae0dJmxSbXg==
X-Received: by 2002:a05:651c:25c5:10b0:37b:a4e2:43fa with SMTP id
 38308e7fff4ca-37cd92bf090mr85290761fa.43.1764600508435; 
 Mon, 01 Dec 2025 06:48:28 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:3ef2:5482:bc9d:e21b])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37d2368e543sm28487831fa.7.2025.12.01.06.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 06:48:28 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon,  1 Dec 2025 15:48:19 +0100
Message-ID: <20251201144819.193967-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201144819.193967-1-maxime@leroys.fr>
References: <20251201144819.193967-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764600509; x=1765205309; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SY7POXE8PtVis5iLUVBMlA9lTIUSZYD13Ete4lwnKUY=;
 b=hJE4BDFxMbnNrN5F9yIR0iKLFE5F/7tKiYmGqdbHB7x6lD8nFAAiP79g9eHqSQ5fE8
 g0jNq+LoR/Mb/ZgjEcfUM5lOuJF7Dz5AUdQuVnCc38b2XQN5PPb6TqdWAFpCQVgJrPIQ
 eU1x6ONSrO/wxx/I66GROVSZTevdjlHwYsY4Yz0sWnUTnpk040vpS9aTN/WxMJPEIQ7Q
 HAxNBKztKqf5blpYHWAmBv0Bpx7N/f2xFX+UBuTRSX5FTrqJWcDle1q7vpbCNPhhmFGy
 4b0VhxwIWcC0Hfux2t08VEpMdLjtbeU9OPBloLsEZdRSKzsLOcU0mEmbM7FZU5OtxTOn
 dgng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hJE4BDFx
Subject: [Buildroot] [PATCH 2/2] frr: install headers on staging
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgRlJSIDEwLjUsIGhlYWRlciBmaWxlcyBjYW4gYmUgcHJvcGVybHkgaW5zdGFsbGVkIFsx
XS4gRW5hYmxlIHRoZWlyCmluc3RhbGxhdGlvbiBpbiBCdWlsZHJvb3Qgc28gdGhhdCBwYWNrYWdl
cyBkZXBlbmRpbmcgb24gRlJS4oCZcyBoZWFkZXJzCmNhbiBidWlsZCBhZ2FpbnN0IHRoZW0uCgpX
aXRoIHRoZXNlIGhlYWRlcnMgYXZhaWxhYmxlLCB0aGUgR3JvdXQgcGFja2FnZSBjYW4gYnVpbGQg
aXRzIHplYnJhCmRwbGFuZSBwbHVnaW4sIHdoaWNoIGFsbG93cyBGUlIgdG8gY29uZmlndXJlIHRo
ZSBHcm91dCByb3V0ZXIgaW5zdGVhZCBvZgp0aGUga2VybmVsIGZvciBwYWNrZXQgcHJvY2Vzc2lu
Zy4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vRlJSb3V0aW5nL2Zyci9wdWxsLzE5MzUxClNpZ25l
ZC1vZmYtYnk6IE1heGltZSBMZXJveSA8bWF4aW1lQGxlcm95cy5mcj4KLS0tCiBwYWNrYWdlL2Zy
ci9mcnIubWsgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9mcnIvZnJyLm1rIGIvcGFja2FnZS9mcnIvZnJyLm1rCmluZGV4IDkyODJl
MTNmYmQuLjllYzJiZDNmZWUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJyL2Zyci5taworKysgYi9w
YWNrYWdlL2Zyci9mcnIubWsKQEAgLTEwMCw2ICsxMDAsOCBAQCBpZmVxICgkKEJSMl9UT09MQ0hB
SU5fSEFTX0xJQkFUT01JQykseSkKIEZSUl9DT05GX0VOViArPSBMSUJTPS1sYXRvbWljCiBlbmRp
ZgogCitGUlJfSU5TVEFMTF9TVEFHSU5HID0gWUVTCisKIGRlZmluZSBIT1NUX0ZSUl9JTlNUQUxM
X0NNRFMKIAkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkvbGliL2NsaXBweSAkKEhPU1RfRElS
KS9iaW4vY2xpcHB5CiBlbmRlZgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
