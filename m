Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42387C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 11:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53E9B43501;
	Thu, 20 Jun 2024 11:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vu77u_nTVM3j; Thu, 20 Jun 2024 11:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29A4C4350A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29A4C4350A;
	Thu, 20 Jun 2024 11:09:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0BE71BF425
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 11:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD7EA42E2E
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 11:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rk0M3rTKxhRr for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 11:09:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43AF942E2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43AF942E2B
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43AF942E2B
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:09:18 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a6fb507fef3so85840166b.2
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 04:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718881755; x=1719486555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2t3lanZrvyQGyvDzlVvZBbIEFpsj2QB4IyIm+7lpzM=;
 b=XsHNHezaINgLCK/XyEZIHhLDF28lbwu2d7uzZO6J6ZF3qmGA99Ll3OWPrXkuAvcy0O
 OCwMAfJG+y8KR8GEdl2gTSCpkEHEc+a0HaPxdpk8+8zgVSCDuzhE79vQP/cDQgF83ARm
 m2qqln+B7PmOAmpqFQIBF0qy+Pp59GlJmEhZMtoklBWgXVV4yv/RWUJcwsjg/zAq3/7g
 0UZgnq801p+6bkKioE4Aft3mLMdi1RTHphpAMA+iadEvhkgkO0iYVnxR+dAqLLmCwIHM
 xLhLZQkz2swjvjgga613+WQWKII6FG6ZxNja68l84AbQIV1ywkC+XcY86ZOguKV2CQlg
 AGxg==
X-Gm-Message-State: AOJu0YxTvgps1q3N0mvUAKdEetIEuAq4RE4g287rwAqoCOLElQXKfPeT
 i3MsS9MRCyZhhOHu0K1DMeS4RzJ75NyJ9LkcV4eYn3lFTdZXr6nW7qNhH3dGdEeTTuE7uRePLQP
 kacGbZp8778ZBGANqAQ6Yoyh6iAoLxyq2MaKnabf8JrVMqH0nuErGWsTRZsWeP9VlFO4SlafFzc
 DQPqLNRwZ7z+/xj/yGW9lSVVndXZFXsbHQc9ahgaf3fwFxj4jt9xGBHRJ+gaw=
X-Google-Smtp-Source: AGHT+IG2OzxdSeY0vyHxtFKDN5CeYDZUQpxnk3dO9G2BPy9oVHPBgL6Rnz61Sji0ke/hmI2zCo63uQ==
X-Received: by 2002:a17:906:454c:b0:a6f:2448:a274 with SMTP id
 a640c23a62f3a-a6fab7792f7mr288779866b.59.1718881755616; 
 Thu, 20 Jun 2024 04:09:15 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8109:8abb:b200:db1c:afe7:dfe5:258d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdd63sm756615566b.124.2024.06.20.04.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:09:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 13:08:20 +0200
Message-ID: <20240620110905.1205820-2-gero.schwaericke@grandcentrix.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620110905.1205820-1-gero.schwaericke@grandcentrix.net>
References: <20240620110905.1205820-1-gero.schwaericke@grandcentrix.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1718881755; x=1719486555; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2t3lanZrvyQGyvDzlVvZBbIEFpsj2QB4IyIm+7lpzM=;
 b=u5itXz0d+GnyfFe8984YEY+A5xujNcDVIV9D1FMBb3CLmcLJYr6QfySLJeMUNkNWXb
 zx+X/XKfmhrHlHg+wo57csCpc29TvCvZbAEL0C87G4B/g0U1pp2toRF9ovcxdnBIjaJ6
 UCyS0h8NvBqKMq8YrdOxuptG0Vlw2ag9Mg8qOx6ibqGj0jdxBgMC76wA92HhYTawQWF4
 MHomudASq2ET8rd+1nBZ1SmRy2o/PFtcdosJJcDhCaMxreOoaj4c6S+VyD8rgYmPRo1L
 XJiv4/5O/w7fLwFPoHGdiQJhloGBxr2c42Oylq0RrSSIi/lQ2iMD0c8pCS3FvmlkHmEc
 k8KQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=u5itXz0d
Subject: [Buildroot] [PATCH 1/2] board/ti/am62x-sk: update custom hashes
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Gero=20Schw=C3=A4ricke?=
 <gero.schwaericke@grandcentrix.net>
Cc: Xuanhao Shi <X15000177@gmail.com>,
 =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>,
 Bryan Brattlof <bb@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogR2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBncmFuZGNl
bnRyaXgubmV0PgotLS0KIC4uLi9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVz
dGVkLWZpcm13YXJlLmhhc2ggICAgfCAyICstCiAuLi4vdGkvYW02Mngtc2svcGF0Y2hlcy90aS1r
My1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2ggIHwgNCArKy0tCiBib2FyZC90aS9hbTYy
eC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2ggICAgICAgICAgICAgICAgICAgIHwgNCArKy0t
CiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2Fy
bS10cnVzdGVkLWZpcm13YXJlLmhhc2ggYi9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL2FybS10
cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKaW5kZXggOGY2MDg2NGZi
Zi4uNzQ5NGUwNGVhZCAxMDA2NDQKLS0tIGEvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9hcm0t
dHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCisrKyBiL2JvYXJkL3Rp
L2FtNjJ4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdh
cmUuaGFzaApAQCAtMSwyICsxLDIgQEAKLSMgTG9jYWxseSBjb21wdXRlZDoKKyMgTG9jYWxseSBj
YWxjdWxhdGVkCiBzaGEyNTYgIGJhMjE1NDA0ZmU5ZGIyNmU1ZjJjZWYzZmRjZTE3YjdjOGVkMzQ0
YTJhMWQ1OTJkZDAxYTVmMWM1ZTcyY2ZkYmQgIGFybS10cnVzdGVkLWZpcm13YXJlLWx0cy12Mi4x
MC40LnRhci5negpkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy90aS1rMy1y
NS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2ggYi9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVz
L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaAppbmRleCAwZTE3MWM1NmY1Li45
N2EyYjRlYWY5IDEwMDY0NAotLS0gYS9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3RpLWszLXI1
LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaAorKysgYi9ib2FyZC90aS9hbTYyeC1zay9wYXRj
aGVzL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaApAQCAtMSwyICsxLDIgQEAK
LSMgTG9jYWxseSBjb21wdXRlZDoKLXNoYTI1NiAgYjk5NjExZjFlZDIzN2JmMzU0MWJkYzg0MzRi
NjhjOTZhNmUwNTk2NzA2MWY5OTI0NDNjYjMwYWFiZWJlZjViMyAgdS1ib290LTIwMjQuMDEudGFy
LmJ6MgorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgMThhODUzZmUzOWZhZDdhZDAzYTkw
Y2MyZDQyNzVhZWFlZDZkYTY5NzM1ZGVmYWMzNDkyYjgwNTA4ODQzZGQ0YSAgdS1ib290LTIwMjQu
MDQudGFyLmJ6MgpkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy91Ym9vdC91
Ym9vdC5oYXNoIGIvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoCmlu
ZGV4IDBlMTcxYzU2ZjUuLjk3YTJiNGVhZjkgMTAwNjQ0Ci0tLSBhL2JvYXJkL3RpL2FtNjJ4LXNr
L3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAorKysgYi9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVz
L3Vib290L3Vib290Lmhhc2gKQEAgLTEsMiArMSwyIEBACi0jIExvY2FsbHkgY29tcHV0ZWQ6Ci1z
aGEyNTYgIGI5OTYxMWYxZWQyMzdiZjM1NDFiZGM4NDM0YjY4Yzk2YTZlMDU5NjcwNjFmOTkyNDQz
Y2IzMGFhYmViZWY1YjMgIHUtYm9vdC0yMDI0LjAxLnRhci5iejIKKyMgTG9jYWxseSBjYWxjdWxh
dGVkCitzaGEyNTYgIDE4YTg1M2ZlMzlmYWQ3YWQwM2E5MGNjMmQ0Mjc1YWVhZWQ2ZGE2OTczNWRl
ZmFjMzQ5MmI4MDUwODg0M2RkNGEgIHUtYm9vdC0yMDI0LjA0LnRhci5iejIKLS0gCjIuNDUuMgoK
Ci0tIAoKCgrigJPigJPigJMKCgpncmFuZGNlbnRyaXggR21iSCB8IEEgVm9kYWZvbmUgQ29tcGFu
ecKgwrfCoEhvbHptYXJrdCAxwqDCt8KgNTA2NzYgCipDb2xvZ25lKsKgfMKgUGhvZW5peHNlZXN0
cmFzc2UgMTjCoMK3wqA0NDI2MyAqRG9ydG11bmQqwqDCt8KgR2VybWFueQp8wqBpbiAKPGh0dHBz
Oi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55L2dyYW5kY2VudHJpeD4gfCBwaG9uZTogKzQ5LTIy
MS02NzctODYwLTAgCnzCoGVtYWlsOiBoZWxsb0BncmFuZGNlbnRyaXgubmV0IDxtYWlsdG86aGVs
bG9AZ3JhbmRjZW50cml4Lm5ldD4KCgpncmFuZGNlbnRyaXggY2FyZXMgYWJvdXTCoHByaXZhY3kg
CjxodHRwczovL2dyYW5kY2VudHJpeC5uZXQvZGUvcGFnZXMvcHJpdmFjeW1haWwvPgoKQW10c2dl
cmljaHQgS8O2bG4gfCBIUkIgwqAKNzAxMTkgfCBHZXNjaMOkZnRzZsO8aHJlcjogTS4gS3LDtm1l
cizCoCBSLiBIw6RuZWwgfCBVU3QuLUlkTnIuOiBERTI2NjMzMzk2OQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
