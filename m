Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CB4C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 14:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6563E40231;
	Wed, 31 Jul 2024 14:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oFRsEk96owD; Wed, 31 Jul 2024 14:58:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4813440E1B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4813440E1B;
	Wed, 31 Jul 2024 14:58:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12A4B1BF4E3
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 14:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F335B406ED
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 14:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTno5HVHlkA3 for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 14:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E030A4081E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E030A4081E
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E030A4081E
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 14:58:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42812945633so38532795e9.0
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 07:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722437884; x=1723042684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bJmN5xS+yq0Bs1MgaXxO2jLvYfsASs3W2I82NGAp+C4=;
 b=BhN4LClY92WC4qBF3ua/Q/pcppo/KsgKQjZqVmxc4yqM99BMZ8i87IslKRMMfcFYPE
 bMqX6I6SBZySyHFrjl+G2VbsWUygoQHvxf8PcYg971tSk5/qXiYo34AAC3/LRm3DdxzF
 fJjIis/CqZY0OpNxp1jTBV61kDfI6gtv8zfVY7g+l+FlwQfcuAF7w4Kgj1g7gGfBXJho
 L1WNiqXTJVCvXkSWjkPxkl2mwjUsOdsDfRhivW+X00YpaqCpsTeFfdUUael/xIdp9ObF
 U3tZsiyrPjtcPUeOdCk7N7dDQ0P3ztzCx7Bp69saTzftVVF/Rxyi3GNlUirTQcl12CCV
 7weQ==
X-Gm-Message-State: AOJu0Yynwr37lBYPQwcYWSj/we4LNztcoPmGevErV6upDmE3eqiI/PkJ
 B2uSDGx+xE9fHtUH3Rb7xs1pX5B80MVu8Wg9jbhba0OYHXRsuEmDWcxM08JTIGt6MQ==
X-Google-Smtp-Source: AGHT+IHZulYUg9pHXKBbSNunb9QciOICJvEqt7C3/0TXyJLmDG6Qe8gqdqt5PHKsETTfh8enbGFtSA==
X-Received: by 2002:a05:600c:358f:b0:426:6667:5c42 with SMTP id
 5b1f17b1804b1-42811d6c471mr94626175e9.4.1722437883631; 
 Wed, 31 Jul 2024 07:58:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282b8adc7dsm24322905e9.14.2024.07.31.07.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 07:58:03 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 16:57:54 +0200
Message-ID: <20240731145754.330678-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722437884; x=1723042684; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bJmN5xS+yq0Bs1MgaXxO2jLvYfsASs3W2I82NGAp+C4=;
 b=lYip5kayGPKqsNlqYDqj3icMCTCqx22KQgcX90Qn66JUNsGqInvOrTsDiClzXrAlYt
 y7ZwW0xQMUjNnDHvkHwneJ7O5d4A0zIb0ca0LL0S38yQQUN4/NL2WTXd8atZykY2PCw5
 ZCCwjlBh5jhavuKyfVnpWQfI4F0xux3HAGDWAkG5zDOlY0sRun0v7i3unuUmtTCGs70u
 nIOL7Q0LTZveLlPbKDDrEB65bAC/GkvWZCz9HUzEPV3j5y4SxjG3ZmyRj9zmBi9Tv5rA
 pipLXm1pfQbzGEmylhwZpJmMSRSYfwVQKdmfbsv+3zwUlNYmDSiglhAjj+82Le7TEv/V
 v5vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lYip5kay
Subject: [Buildroot] [PATCH 1/1] package/qt5webengine: add missing opus
 dependency
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhY2thZ2Ugb3B1cyBpcyBzZWxlY3RlZCBidXQgaXQgaXMgbm90IGxpc3RlZCBpbiB0aGUg
ZGVwZW5kZW5jaWVzLgoKVGhpcyBhZGRzIG9wdXMgdG8gUVQ1V0VCRU5HSU5FX0RFUEVOREVOQ0lF
Uy4KCkZpeGVzOgoKCSQgbWFrZSBxdDV3ZWJlbmdpbmUKCSguLi4pCglFUlJPUjogRmVhdHVyZSAn
d2ViZW5naW5lLXN5c3RlbS1vcHVzJyB3YXMgZW5hYmxlZCwgYnV0IHRoZSBwcmUtY29uZGl0aW9u
ICdjb25maWcudW5peCAmJiBsaWJzLndlYmVuZ2luZS1vcHVzJyBmYWlsZWQuCgpTaWduZWQtb2Zm
LWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0KIHBhY2thZ2UvcXQ1
L3F0NXdlYmVuZ2luZS9xdDV3ZWJlbmdpbmUubWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NXdlYmVuZ2luZS9xdDV3ZWJl
bmdpbmUubWsgYi9wYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUvcXQ1d2ViZW5naW5lLm1rCmluZGV4
IDUyOWE4M2RmNmMuLmY4NGYwNTZlOTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcXQ1L3F0NXdlYmVu
Z2luZS9xdDV3ZWJlbmdpbmUubWsKKysrIGIvcGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lL3F0NXdl
YmVuZ2luZS5tawpAQCAtNzgsNiArNzgsNyBAQCBRVDVXRUJFTkdJTkVfREVQRU5ERU5DSUVTICs9
IFwKIAlsaWJ2cHggXAogCWxpYnhtbDIgXAogCWxpYnhzbHQgXAorCW9wdXMgXAogCXNuYXBweSBc
CiAJd2VicAogCi0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
