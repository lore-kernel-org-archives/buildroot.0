Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D0EC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 10:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E05ED4071A;
	Thu, 25 Jul 2024 10:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GghiUiuLe_n3; Thu, 25 Jul 2024 10:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93A6E4071C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93A6E4071C;
	Thu, 25 Jul 2024 10:17:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0D01BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B253813DC
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMsxhWJdyVWA for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 10:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFC51813B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFC51813B0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFC51813B0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 10:17:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-369f68f63b1so418882f8f.2
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 03:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721902650; x=1722507450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cyGZHGNBS/plcSXWjFo6l54FPiztUut2Dpn5tbIf+uU=;
 b=UbFP/G54uyTym9Y6iNqk/saUTswAHah9DR9ovTyW5B2CZotb7bMhQKuO6n9+2w+8di
 Gj8hVuAVYa+sCW+Gu1KFt6Em4bp6WYSP8prr6eVdmBCxM/NSnIMn3rEBjgiYLTv8wIVR
 2uTlEZnvhNK54BYCJ0hCK/jyUNKPWR04lscTarjfpSrn32nw/oRpeMaBgvsFEJRvvxOX
 ME+El8f0nMqlT/toIXmYxgLsVTET2w4mVxc5qLjniD1NzurObGTZLon5lr313ptl32ar
 2hHxWrO3xc3eOuUctnfYoV4UTAZfjVboLoBSRLdflR6U+SBA/h+I4utj4EZaqlJ7xT9M
 wvKg==
X-Gm-Message-State: AOJu0Yw3tD5Ohl2B7TgCakpG2ssg93FBlNaB1zrCMFHPovN+SncP9bCU
 1n8CJorHR+zbhriKsGothDWhUdIURiZDsYDJK2LLXoD4iz129zE3eC2a7rHS+54=
X-Google-Smtp-Source: AGHT+IGPLopJLRruLXWj4QaqZ3NWJS8qbAaPXEVy7FG6KX+RyBAmu+9hQCjQtzjSMO2CBGxpws9VdA==
X-Received: by 2002:a5d:42d1:0:b0:368:6f30:ddf1 with SMTP id
 ffacd0b85a97d-36b36443dfcmr1083098f8f.59.1721902650246; 
 Thu, 25 Jul 2024 03:17:30 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b3686fdc5sm1629603f8f.114.2024.07.25.03.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 03:17:29 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 12:17:09 +0200
Message-ID: <20240725101711.2443524-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721902650; x=1722507450; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cyGZHGNBS/plcSXWjFo6l54FPiztUut2Dpn5tbIf+uU=;
 b=IqZhVSsKuF1hqvG4A2kSPLiNuWe0K8P/e12PDzhr/jjtTLqFYSkhC+WFNiV1CsOHO8
 Jwxt8H4Ikavi6VuFB37ZzM2uNRQMse7nWRLge0hr+sBmducwZx9E2TvFz6/SIMxmzz/N
 XP4cadPnNRaWWzXhBOZ2wB8NBoDwB4oYu3Kw0X2KdmTBD0qbZeo7nOiknqCsUYaCR9aX
 9MBt4Ya2FEmvredL22S19udeJgtBjS2PdgEyfExoqUR8MAwIEDUUEjhp/yktzPREaUG3
 kuqRCBJokM7xZoi2IsPq2vAycyGhSwfpKj8IU4LuhyS3Uhh+e3Ya8BvJNnbeFJhxEaF2
 u6sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IqZhVSsK
Subject: [Buildroot] [PATCH v2 0/2] rpi-utils replaces rpi-userland
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGUgcGFja2FnZSBycGktdXNlcmxhbmQgaGFzIGJlZW4gbWFya2VkIGFzIGFuY2ll
bnQgYW5kIGRlcHJlY2F0ZWRbMV0KbmluZS1tb250aCBhZ28uCgpUaGlzIHBhdGNoIHNlcmllcyBh
ZGRzIGl0cyByZXBsYWNpbmcgcGFja2FnZSBycGktdXRpbHMgKGZpcnN0IHBhdGNoKSwKYW5kIGl0
IGFkZHMgdGhlIG1lc3NhZ2UgaW4gdGhlIHJwaS11c2VybGFuZCBoZWxwIChzZWNvbmQgcGF0Y2gp
LgoKVGVsbCBtZSBpZiB0aGUgcGFja2FnZSBzaG91bGQgZ28gaW4gdGhlIGxlZ2FjeSB0aGluZy4K
ClsxXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL3VzZXJsYW5kL2NvbW1pdC85NmE3
MzM0YWU5ZDVmYzlkYjdhYzkyZTU5ODUyMzc3ZGY2M2YxODQ4CgpDaGFuZ2VzIHNpbmNlIHYxOgog
LSBBZGQgbXlzZWxmIHRvIERFVkVMT1BFUlMgKHJwaS11dGlscykKIC0gQWRkIG1pc3NpbmcgZW50
cnkgaW4gcGFja2FnZXMvQ29uZmlnLmluIChycGktdXRpbHMpCiAtIEFkZCBuZWVkZWQgY29tbWVu
dCBmb3IgZ2xpYmMvbXVzbCB0b29sY2hhaW5zIHdpdGggZHluYW1pYyBsaWJyYXJ5CiAgIChycGkt
dXRpbHMpCiAtIEFkZCBkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfVUNMSUJDIChycGkt
dXRpbHMpCgpSZWdhcmRzLApHYcOrbCBQT1JUQVkgKDIpOgogIHBhY2thZ2UvcnBpLXV0aWxzOiBu
ZXcgcGFja2FnZQogIHBhY2thZ2UvcnBpLXVzZXJsYW5kOiBwYWNrYWdlIGlzIGRlcHJlY2F0ZWQK
CiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25m
aWcuaW4gICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3JwaS11c2VybGFuZC9Db25maWcu
aW4gICB8IDExICsrKysrKysrKysrCiBwYWNrYWdlL3JwaS11dGlscy9Db25maWcuaW4gICAgICB8
IDE0ICsrKysrKysrKysrKysrCiBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMuaGFzaCB8ICAz
ICsrKwogcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rICAgfCAxOCArKysrKysrKysrKysr
KysrKysKIDYgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcnBpLXV0aWxzL3JwaS11dGlscy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9y
cGktdXRpbHMvcnBpLXV0aWxzLm1rCgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
