Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45625C021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 20:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C77161AF1;
	Thu, 13 Feb 2025 20:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZ5Xa2_OojNx; Thu, 13 Feb 2025 20:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B981F61B17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B981F61B17;
	Thu, 13 Feb 2025 20:02:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43E53C2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 20:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D6086080C
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 20:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAhdUKE21hVW for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 20:02:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9B0F60808
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9B0F60808
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9B0F60808
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 20:01:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ab7e9254bb6so208109766b.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 12:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739476917; x=1740081717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1qoSDDm62q1knq4Dk7G9pHzxBG/Pc7j8/mLV5HpkVug=;
 b=hnWIoDNqTJkrkog9UI1fM3AR6vKnept0GDjIagZqeYQpOVOwEGveqnHS7mEQCXjIAx
 v8JRJ/uK+ime3noc/j3lIDSnt2u8FMH6cx72KXEpACK4kW4Rzu4vep9gpCzBCT1zFZ8v
 7g7qaiw691C+/c6ujAAyJlLSKsWIcyk/Oe3FNFsfg0KVBeYUuIyC+bFi+QibcIe5RISO
 8b6bN1oy1RhwUGXElC4qar2hwlGq/IrR8tqwUebzg69GSrB0uQt2JDZ87KyhwYlMbN0T
 l5H5/Pm0xawhZwn4RLWOlhcIxPdpF6QqatS+f3ObiCnnjyvpqb6r4xDQQYpvxEF1gdn/
 eqXQ==
X-Gm-Message-State: AOJu0Yzz0YHt9REGyytDlLoeGBfJMqlicJEgqm3Rck0CBAQt1QJlucky
 d+9qbaudcr1bkAnpHMRV02oua2BQt14r620853dua3jeTWGTWT0ZumlVi+yvLop/D0N+ngjCvmQ
 S
X-Gm-Gg: ASbGncu4zuQmXPV72eijmRa8SWJOIZiE3h39Jy4VtNs9thzyS0yyFJR3lKxAhz4kfYU
 WoB1YR0U+4jkIXIjDhJKmkIzhMykdo66rdFRyfCGHdh5yQSZF0q0J1AzNJUN8E+5pe9//DkYc7q
 aaJBeJWEwKzTqhM1TfqEzgZ9LqjY5QSZivKgdshzhWmFfZOQY+ceRZx0G/Tijrsxmhbnm6WVbRi
 3oAJAEfdfeZ40iC3jH5mi43zTXdZmyKVMMk1f6UYU/vZJdWQ5A5MIPCRilHvvlI7YAOnG0Rn1NN
 h7dIPoIMTC5L/U//uHftBl5JOyPGtRebZqu4bwXFGYs=
X-Google-Smtp-Source: AGHT+IFW8ADf/LYTJPuzf1PMocFIK0oUIsXe49IYPr6DeXnkgusi+Gv1O6rl8auOU75WeUJhAyn1qg==
X-Received: by 2002:a17:906:2b05:b0:ab8:95f8:b5e4 with SMTP id
 a640c23a62f3a-ab895f8f962mr580989066b.41.1739476916743; 
 Thu, 13 Feb 2025 12:01:56 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532575cesm189981666b.43.2025.02.13.12.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 12:01:55 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Gao Xiang <hsiangkao@aol.com>
Date: Thu, 13 Feb 2025 21:01:50 +0100
Message-ID: <20250213200151.4113457-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1739476917; x=1740081717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1qoSDDm62q1knq4Dk7G9pHzxBG/Pc7j8/mLV5HpkVug=;
 b=SfjnP9+tRda3v8Dc4tEz95jckoFc45hj7eLpwgCLx5ss0CG6zqDbYF4LwrEqGi/V1g
 dZF8MxH76qmhz90oO8S2heLT0r7ZUlAi6wFhkOSt97EkF3AVwQ7/2IRnW71b5Tv8cewl
 qRUYh2K/0HaMlvOEvzqMr+dL/z04/SiVbTVOIBmdp2vzIeNDQZo5jReEEc5rQbvAhdJ4
 I68VS7TIHG4LTA/pRz9RIIr8QMtWyVhiGulJApJsV9ZD0ZLCY7lKD9PuR7SQdh2vwxRA
 YlbjCu2T7Lt6V4ycBhPhxGnik5c2DVRSUid0JoWXDAacX1+X2/Xfuaqgw8A8SWLikeLw
 tZiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=SfjnP9+t
Subject: [Buildroot] [PATCH 1/1] package/erofs-utils: bump to version 1.8.5
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

QnVtcCB0byBsYXRlc3QgbWFpbnRlbmFuY2UgcmVsZWFzZSBjb250YWluaW5nIHZhcmlvdXMgZml4
ZXMgYW5kIHBlcmZvcm1hbmNlCmltcHJvdmVtZW50cywgZm9yIGRldGFpbHMgc2VlIHRoZSBjaGFu
Z2Vsb2c6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hp
YW5nL2Vyb2ZzLXV0aWxzLmdpdC90cmVlL0NoYW5nZUxvZz9oPXYxLjguNQoKU2lnbmVkLW9mZi1i
eTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgotLS0KIHBhY2thZ2UvZXJvZnMtdXRp
bHMvZXJvZnMtdXRpbHMuaGFzaCB8IDIgKy0KIHBhY2thZ2UvZXJvZnMtdXRpbHMvZXJvZnMtdXRp
bHMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHMuaGFz
aCBiL3BhY2thZ2UvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHMuaGFzaAppbmRleCAzYjhhNWRjM2Rh
Li4wNGJkZDU1N2Y4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxz
Lmhhc2gKKysrIGIvcGFja2FnZS9lcm9mcy11dGlscy9lcm9mcy11dGlscy5oYXNoCkBAIC0xLDUg
KzEsNSBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIDNjNWNjMDM2MDNlYTA4YmE5YWU1
ZTA0MjBlZWFlYTVmZjE3ZWQyOWUyMjgwNjg1MzEwMzU2Y2JmMjUzMDRlODUgIGVyb2ZzLXV0aWxz
LTEuOC4zLnRhci5negorc2hhMjU2ICBjZDg2MTEyNzBlOWM4NmZlMDYyZjY0NzEwM2NhNmFkYTll
ZDcxMGU0NDMwZmRkNTk2MGQ1MTQ3Nzc5MTkyMDBkICBlcm9mcy11dGlscy0xLjguNS50YXIuZ3oK
IHNoYTI1NiAgMGRmMDQyZGUyOWI0NDg4NzM1NWRiODZjNzk3MDhhNDQ4OWNlNmU2NjY2ZjZlMzNh
ZDAyMDQwMjkzZjA5ZTZhMiAgQ09QWUlORwogc2hhMjU2ICBhNDAwZjg1ZGQwNmQyMzBmMWIzMDhj
ZGU0MjkwYTUzZjM0NWI2ZTMyMGEzNzZiNzkwNGIzMWM1MWMyZmQ0YjFhICBMSUNFTlNFUy9BcGFj
aGUtMi4wCiBzaGEyNTYgIGZlZWUzYjMxNTdkY2RmNzhkNGY1MGVkZWZiZDVkZDdhZGY4YjZkNTJj
MTFiZmFhYTc0NmE4NWEzNzMyNTY3MTMgIExJQ0VOU0VTL0dQTC0yLjAKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHMubWsgYi9wYWNrYWdlL2Vyb2ZzLXV0aWxzL2Vy
b2ZzLXV0aWxzLm1rCmluZGV4IDkzMGI0MGY2ZjEuLmJmZGNmZTU4ZWIgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHMubWsKKysrIGIvcGFja2FnZS9lcm9mcy11dGls
cy9lcm9mcy11dGlscy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLUVST0ZTX1VUSUxTX1ZFUlNJT04gPSAxLjguMworRVJPRlNfVVRJTFNfVkVSU0lPTiA9
IDEuOC41CiBFUk9GU19VVElMU19TSVRFID0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQveGlhbmcvZXJvZnMtdXRpbHMuZ2l0L3NuYXBzaG90CiBFUk9GU19V
VElMU19MSUNFTlNFID0gR1BMLTIuMCssIEdQTC0yLjArIG9yIEFwYWNoZS0yLjAgKGxpYmVyb2Zz
KQogRVJPRlNfVVRJTFNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgTElDRU5TRVMvQXBhY2hlLTIu
MCBMSUNFTlNFUy9HUEwtMi4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
