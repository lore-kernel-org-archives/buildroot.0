Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF500C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A96D860873;
	Tue, 23 Jul 2024 21:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5od7q61e6jg; Tue, 23 Jul 2024 21:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B273260645
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B273260645;
	Tue, 23 Jul 2024 21:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6AD61BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C379E400F6
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROCZrVjleGKt for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:20:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CE4C400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CE4C400D0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CE4C400D0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:20:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42660b8dd27so43250975e9.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 14:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721769626; x=1722374426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+crUWZ5a64LaB4pSK3OeTdlL+U9ah+ZX7TWrYZwTXw=;
 b=U7Y66XnSQYNT2GoYozscIJR6HD/lngr5jxhgQyah2bMvWkxPSoWnEJGIznadv+G0V9
 WN1P0CfKjbqN+CcfXPv/CckmGnqMlrDY9v614VumNAP7Ddpzh0BZVqz6t+AiWoATSz9T
 GxR+CqIykFH9YLUMUTFc1MJV0w1iyHYqsq4WC2juf4PV6uUoEqTUsPp40u/b2Jtwebm7
 o1n7b0AVDdBsqkQy6MLayN+UYwFMUlGotzaUVAfNocDTrwkcvWciy+15aAGme1xPfwgu
 wxhBXdMvsI9Tbn5mOdMLkh7yZOZfvqwLn7PVSQBP4nf/FnFGRx1woL65uSqkQN0ZM4Yb
 Tq0g==
X-Gm-Message-State: AOJu0YxQVVMG2RO6Q/r0OkwVlVg+bzPnudAaOSYRCgrQzzQXbsG/3rWc
 R4VtabERS3c5lIP+0CSfP9s7pS0dIEzv2Sak8Ug9bg7kMuswaSodHEn2On0txT4=
X-Google-Smtp-Source: AGHT+IGln9rHrloHBFOU9a0Ba34eROc2WQc689nUs2Yv0PDQg9YSt90KMXot7X6ustH9IaRJphctug==
X-Received: by 2002:a05:600c:3ca6:b0:426:6a84:2087 with SMTP id
 5b1f17b1804b1-427dc57999amr84919445e9.34.1721769625477; 
 Tue, 23 Jul 2024 14:20:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f937348bsm1575705e9.18.2024.07.23.14.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 14:20:24 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:20:09 +0200
Message-ID: <20240723212011.23048-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721769626; x=1722374426; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X+crUWZ5a64LaB4pSK3OeTdlL+U9ah+ZX7TWrYZwTXw=;
 b=iHabPBw+4ZkhR5qIdHY2rVuRZ5DGTdhPoF66kg4/EcO+wyHa5um4svjAki3UoilJ67
 UGZhl2DiijurxS656A86ZZrH17oZL3uFTjUHCHhoNJidfvUHjZycrWhnI1lXmuAJm6vG
 VPTpqiZiMq+l4wUUCcVZrGSt/RgGZhoR9PeSoES9OiuOzb5DSiVIeXzcfk/AuhmiQ2On
 V0HkVlyKg2wcalCVA41rgRuIsekUXM+y6vdkGjxsF0Eu/YttPuSENKBgtc0EPQe7nacs
 bORAaIXC7oU5HQMuAe0cOD4kIxnW+Q70z+xgT1S42CtX4AmWaqrDaCCbGL+rVf8oSyxK
 mnaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iHabPBw+
Subject: [Buildroot] [PATCH 0/2] rpi-utils replaces rpi-userland
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
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
MzM0YWU5ZDVmYzlkYjdhYzkyZTU5ODUyMzc3ZGY2M2YxODQ4CgpSZWdhcmRzLApHYcOrbCBQT1JU
QVkgKDIpOgogIHBhY2thZ2UvcnBpLXV0aWxzOiBuZXcgcGFja2FnZQogIHBhY2thZ2UvcnBpLXVz
ZXJsYW5kOiBwYWNrYWdlIGlzIGRlcHJlY2F0ZWQKCiBwYWNrYWdlL3JwaS11c2VybGFuZC9Db25m
aWcuaW4gICB8IDExICsrKysrKysrKysrCiBwYWNrYWdlL3JwaS11dGlscy9Db25maWcuaW4gICAg
ICB8ICA5ICsrKysrKysrKwogcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhhc2ggfCAgMyAr
KysKIHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5tayAgIHwgMTYgKysrKysrKysrKysrKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9y
cGktdXRpbHMvcnBpLXV0aWxzLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3JwaS11
dGlscy9ycGktdXRpbHMubWsKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
