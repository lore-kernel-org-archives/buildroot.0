Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00494C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 13:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3A1D40A88;
	Mon,  3 Jun 2024 13:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jq1dGtFmfPhU; Mon,  3 Jun 2024 13:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3E2840A8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3E2840A8A;
	Mon,  3 Jun 2024 13:33:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43BCC1BF3DE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D57B82142
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGTxpWGvxv4g for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 13:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B40181E35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B40181E35
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B40181E35
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 13:33:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eaac465915so11815501fa.1
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 06:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717421585; x=1718026385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HReN6KFre5hJ/ETpaQqA6UqhVbVNJwvVXAji+DlIVU=;
 b=s9L9BOVoGgHwrSk5N8GCvJUx0do7raPDXnmS3RQElzSfdqWgjZWpahDRjTDTndskC4
 xIxdMwyZkfzX0R9QVWvPQakgOa+kUhtgru6rKZBxHuz7O1IIO7Z2WbhCHNJGq02I7Bhq
 CoW9llMO/2LZmXBBxN8Z4IL8RbMbqRQe5jHvHArMSyWJWah0wUbVEDQdH3FyJa65Ph2H
 1GMdKtKYQXzSjjNljkn0MFc6Dh95f60jVRBaYcGtD/MOC5rM9v/pin5bA3qLLVvRwVHD
 XynuaewS5/g8/CnY8Dm5QLqZg195xKjcyyzxKYSYB5qZR9E+e9R1T9FtdoQQHhdFMSTD
 b2sg==
X-Gm-Message-State: AOJu0YxODhZIpmjzQfGDGmwhu7lGd3zj+SGNG5HluCqHchu4oK7JQfs+
 0jZcvq8WwspZ0yWtkWr5S68ZvZFMGc+98GyX+wRJTSwuEWY14SfOG80U6jf8eWi2y1umz7+z0p8
 MUN8=
X-Google-Smtp-Source: AGHT+IEun3h0s9A8ZMs3E98m6uDnEpaI3W3PvdoTTP/B8KPtlbHZzIv5ENDwd/CgP80NXUx31elMeA==
X-Received: by 2002:a2e:9c8c:0:b0:2e8:60e2:3c8d with SMTP id
 38308e7fff4ca-2ea9512b0f8mr53842771fa.12.1717421584605; 
 Mon, 03 Jun 2024 06:33:04 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd062ea98sm8763240f8f.71.2024.06.03.06.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 06:33:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 15:32:42 +0200
Message-ID: <20240603133243.78324-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717421585; x=1718026385; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4HReN6KFre5hJ/ETpaQqA6UqhVbVNJwvVXAji+DlIVU=;
 b=YDNT2nvs2cA9/HJ7Ho302FCLBNqYqJ6Ukcp2KIlj5zR5WBBcSU3wbBIkGHGP//16+u
 xOdCAPnfm3BxeLOnvEa9SRwDwX4sprqFqkWGLAz+g3Wv637p5WFXNnGRzV63SO0oN/hU
 sAiyL55O0BeEcfs4BtL9O9cs3QrbRUJ7fFRAss5dn/ynWeU2I2M29w5GHKzavcX9ShDr
 XZ3V53s3g1sHzZc2fmmsFKakEqJ0ymP/0Gl13ytHhtmu1K44j+KH87SLWt5/QjuL7UqM
 5pbDmX8UAxKvLuyLQrr/ok6zAi7hLRzyt4ljTuvYvourThJkGbuqPIFKUj2Y3Cg+kYUm
 VcqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YDNT2nvs
Subject: [Buildroot] [PATCH 1/1] docs/manual: document python-aiohttp needed
 for pkg-stats
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIGRvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS5hZG9jIHwgMyArKysKIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9wcmVyZXF1aXNp
dGUuYWRvYyBiL2RvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS5hZG9jCmluZGV4IDI2MmE1MTUzZjUu
LmFiNjA5YzEyYmUgMTAwNjQ0Ci0tLSBhL2RvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS5hZG9jCisr
KyBiL2RvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS5hZG9jCkBAIC05NiwzICs5Niw2IEBAIGNvcnJl
c3BvbmRpbmcgdG9vbCBvbiB0aGUgaG9zdCBzeXN0ZW06CiAqIEdyYXBoIGdlbmVyYXRpb24gdG9v
bHM6CiAqKiArZ3JhcGh2aXorIHRvIHVzZSAnZ3JhcGgtZGVwZW5kcycgYW5kICc8cGtnPi1ncmFw
aC1kZXBlbmRzJwogKiogK3B5dGhvbi1tYXRwbG90bGliKyB0byB1c2UgJ2dyYXBoLWJ1aWxkJwor
CisqIFBhY2thZ2Ugc3RhdGlzdGljcyB0b29scyAoJ3BrZy1zdGF0cycpOgorKiogK3B5dGhvbi1h
aW9odHRwKwotLSAKMi40MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
