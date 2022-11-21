Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AADC4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 22:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B6BA60F58;
	Mon, 21 Nov 2022 22:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B6BA60F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MowXT-K287v9; Mon, 21 Nov 2022 22:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFF9C60F2E;
	Mon, 21 Nov 2022 22:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFF9C60F2E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C020C1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 22:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8BC1405E9
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 22:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8BC1405E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebhi35R8fBop for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 22:50:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F2C40179
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91F2C40179
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 22:50:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x5so18058352wrt.7
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 14:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QmWX3N8yEOl3AqhdXck6feisaGn8K9xrko5QVUGTCu0=;
 b=K5X3h/Rx/huxiF0H/14/mRWRBhb8KL97ZBlmpl1qXye3EI0wUIRVcl6f5N72h+9AH8
 Yk+DVKrNXZMlfEJSexuVS18wAxyhWET7ZEk0/VmwLpCN40WtS3/HIJDIu5ofzbSe38id
 YDB4qo/UK/4kMG5o55pb+0reJ7CvYDH/lXV0H/Re6q2APfxdJA4QpMkJoY99XCRbTIlf
 5XwxhNLkkDTJ7m8kbBNMUdz25jDhMxw3kp58cZLDhF0udklecl3JwmT/tLtG3w43awVF
 y+EgxpmTOu7fq5E3M1NIfQCwX75j86YJGs0rXUXbmcHTtKbi2Xg/GiKcSoJsualas218
 qQTA==
X-Gm-Message-State: ANoB5pktRbIe2gIJb+NWfBUcpJZfVe/d+h74MVS3s5YeTg5m5gza1te/
 IfpZ6TAD0OxduYkFK87eB6OxAidH+L5NGw==
X-Google-Smtp-Source: AA0mqf603pmMB88UYFoTCQ5M+OzmoX0iUB9jFynny7cxRpqWaSY9jlMF0mFOTmx8lEVL5obpaTwQwA==
X-Received: by 2002:a5d:4ec5:0:b0:241:d782:9047 with SMTP id
 s5-20020a5d4ec5000000b00241d7829047mr3781437wrv.681.1669071000436; 
 Mon, 21 Nov 2022 14:50:00 -0800 (PST)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:2488:d453:b017:99a])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003c6c182bef9sm24704877wmo.36.2022.11.21.14.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 14:49:59 -0800 (PST)
From: Anisse Astier <anisse@astier.eu>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 23:49:55 +0100
Message-Id: <20221121224955.951056-1-anisse@astier.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QmWX3N8yEOl3AqhdXck6feisaGn8K9xrko5QVUGTCu0=;
 b=KXAMxWjFi7TbNYg6GCPKounq3e6fRfHnKlSZpofmqFr73m3lMq7JjBXTV8XEO+gugw
 IV2STbejK7DZ77V5jjIFu26rvbG+MTBF76NaUHuEGe/gKXzpi52E7ykhYDzhGQrSZCsD
 0rWU9kyVGW4bk4jScVftadlUUoIzJ+UYKtpC4pqIgfaC8fGu7MEnkKLpJILmqF3EVOuV
 ZojDhV/nwVOFRCD6t9Pa9+s261nVn+MVet/9q20Ce+BxJuRKBLgoijBEYsyBQEaNNHd7
 U2NeaGTqrCifh505zW8P3nh52xFnXR8+sD1sfpzMeSF9nRUqHbkH3jR8LdoY9ZTUNJYx
 JZWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=astier-eu.20210112.gappssmtp.com
 header.i=@astier-eu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=KXAMxWjF
Subject: [Buildroot] [PATCH v2] package/go: disable cgo support with static
 libs
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
Cc: Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGdvIHN0ZGxpYiAicGx1Z2luIuKAr3BhY2thZ2UgcmVsaWVzIG9uIGRsZmNuLmggd2hpY2gg
aXNuJ3QgYXZhaWxhYmxlCndoZW4gd2UgaGF2ZSBCUjJfU1RBVElDX0xJQlM9eS4KClRoaXMgc2hv
dWxkIGZpeCB0aGlzIGJ1aWxkIGVycm9yIGZyb20gYXV0b2J1aWxkZXJzOgoKL2J1aWxkcm9vdC9i
dWlsZC9ob3N0LWdvLTEuMTkuMy9zcmMvcGx1Z2luL3BsdWdpbl9kbG9wZW4uZ286MTE6MTA6IGZh
dGFsIGVycm9yOiBkbGZjbi5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiAgIDExIHwgI2lu
Y2x1ZGUgPGRsZmNuLmg+CgpTaWduZWQtb2ZmLWJ5OiBBbmlzc2UgQXN0aWVyIDxhbmlzc2VAYXN0
aWVyLmV1PgotLS0KIHBhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QgfCAxICsKIHBhY2thZ2UvZ28v
Z28ubWsgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QgYi9w
YWNrYWdlL2dvL0NvbmZpZy5pbi5ob3N0CmluZGV4IGRlZDAyZDNiM2EuLjllNzlhN2RmZDUgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QKKysrIGIvcGFja2FnZS9nby9Db25m
aWcuaW4uaG9zdApAQCAtMjMsNiArMjMsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9HT19U
QVJHRVRfQ0dPX0xJTktJTkdfU1VQUE9SVFMKIAkjIEdvIGRvZXNuJ3Qgc3VwcG9ydCBDR08gbGlu
a2luZyBvbiBNSVBTNjR4IHBsYXRmb3JtcwogCSMgU2VlOiBodHRwczovL2dpdGh1Yi5jb20va2Fy
YWxhYmUveGdvL2lzc3Vlcy80NgogCWRlcGVuZHMgb24gIUJSMl9taXBzNjQgJiYgIUJSMl9taXBz
NjRlbAorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUwogCiAjIEhvc3QgZ28gcGFja2FnZXMg
c2hvdWxkIGRlcGVuZCBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPX0hPU1RfQVJDSF9TVVBQT1JUUwog
Y29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfR09fSE9TVF9BUkNIX1NVUFBPUlRTCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2dvL2dvLm1rIGIvcGFja2FnZS9nby9nby5tawppbmRleCBmZDRjYWEyZTVhLi5k
NTRiZThjZDc4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2dvL2dvLm1rCisrKyBiL3BhY2thZ2UvZ28v
Z28ubWsKQEAgLTg3LDcgKzg3LDcgQEAgSE9TVF9HT19UQVJHRVRfRU5WID0gXAogIyBzZXQsIGJ1
aWxkIGluIGNnbyBzdXBwb3J0IGZvciBhbnkgZ28gcHJvZ3JhbXMgdGhhdCBtYXkgbmVlZCBpdC4g
IE5vdGUgdGhhdAogIyBhbnkgdGFyZ2V0IHBhY2thZ2UgbmVlZGluZyBjZ28gc3VwcG9ydCBtdXN0
IGluY2x1ZGUKICMgJ2RlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUycgaW4gaXRz
IGNvbmZpZyBmaWxlLgotaWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19USFJFQURTKSx5KQoraWZl
cSAoJChCUjJfVE9PTENIQUlOX0hBU19USFJFQURTKTokKEJSMl9TVEFUSUNfTElCUykseTopCiBI
T1NUX0dPX0NHT19FTkFCTEVEID0gMQogZWxzZQogSE9TVF9HT19DR09fRU5BQkxFRCA9IDAKLS0g
CjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
