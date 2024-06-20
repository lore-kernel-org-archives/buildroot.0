Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25505C2BA1A
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 11:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8B7743511;
	Thu, 20 Jun 2024 11:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISHf5B4XRdNo; Thu, 20 Jun 2024 11:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12BE743513
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12BE743513;
	Thu, 20 Jun 2024 11:09:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A11161BF425
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 11:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F7EA82FF9
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 11:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0-HRKVx5Qtg for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 11:09:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 75B2E81CBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B2E81CBA
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75B2E81CBA
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:09:19 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6fb341a7f2so93307066b.1
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 04:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718881757; x=1719486557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8wHhpRiGnd2dze3xy/uLV7tlEDZV5iQYEWO2aSn9hoo=;
 b=IPNwG9VAxgSW2mPT7ZkRBJIpGOxYQO/PEQZWod5MXLD4CIG66DuLoU13oDHXJ+NOYC
 7mWGJMWH60syE1Bb9eie4GVOZGI6unZMcc1Lplnn5O/JDoIhzibB7nSt0JOvcxm/wyov
 ePjkB6tD2p1+S/uBCJoJUJPwOrYt939FY2ZDR/e8151lyMIhOqB93ihYqW4igG7vkNK6
 mFpRjbctG2rRCChdDq48tvbWdR3TJ82L8/txcTcnYkltmgExdFh78A2nYFLL5a535UGy
 +Wb2naJ+EcNBQlJDPilbKoaM2DLvbrFAkQ1vJwp3g9L/Olc1nhdE+wfba3hvro009AIm
 lhDA==
X-Gm-Message-State: AOJu0YyhSZcCmKIN1h1Cs8qAZdqysmtf+ax/WOIEcGIoivJtLGTpfwF5
 qT01AphUT57WZgQJ0Ocx3bPwhk+HirxDMqMgD8SwlUcjkkiJuSTrzFzfBeIWCZYnScfaOh3Ijl9
 LDoQ3fiTkOXZ2RR3VX43M/gKWqzdpNca1mjDeCttuYlbsJWq4bT5URKkYNAkyVQRW7gA6z1JFWb
 7c2HET2pEx+3gGBuvJGH5IJn/4KgjZTkj6/d4I6QI0odF6KrbT5Ig38jr8qug=
X-Google-Smtp-Source: AGHT+IEYZD2DKhgmJ0qhHrcw+Dv/9r1JQ/BEl0YFnWIdVTnJ4aJV94iECB1ayHNVnbgVJzu11Sr4MQ==
X-Received: by 2002:a17:907:765c:b0:a6f:a54:1598 with SMTP id
 a640c23a62f3a-a6fab779292mr330829466b.49.1718881756762; 
 Thu, 20 Jun 2024 04:09:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8109:8abb:b200:db1c:afe7:dfe5:258d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdd63sm756615566b.124.2024.06.20.04.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:09:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 13:08:21 +0200
Message-ID: <20240620110905.1205820-3-gero.schwaericke@grandcentrix.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620110905.1205820-1-gero.schwaericke@grandcentrix.net>
References: <20240620110905.1205820-1-gero.schwaericke@grandcentrix.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1718881757; x=1719486557; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wHhpRiGnd2dze3xy/uLV7tlEDZV5iQYEWO2aSn9hoo=;
 b=QjfWhgkBGpKrjxE/VBhzHVttITagOjXIZyUCHpJDx9E0FRG4EUFpSbx4RAk1M9Dt5e
 dMUBPJtuOkQLc7spZ4FZL9sw1Flux9QQN4fTvoJ5tprrZV+ObRbXPA7LsWe82Orr2Jfv
 paGthOOHCh4yW2NXUmYLFgtxj/B5hnKZFmhuVDaWibDNzwh4GReqDu5FpJQvRhN6nNpt
 3n59fYyzxU6Y8zLvEKWfiBFYDRIQepsjVkQ0TpKP3JS054pKAE8DTc5PL9br8qCweMB8
 RZlpakHkKXBRoy3bUuAB5XVB5iGiZd2EM1V/TF38j/IGg6UOFN4X/i0NdIV/m00TBkG9
 IVzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=QjfWhgkB
Subject: [Buildroot] [PATCH 2/2] board/ti/am64x-sk: update custom hashes
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
dGVkLWZpcm13YXJlLmhhc2ggICAgfCAyICstCiAuLi4vdGkvYW02NHgtc2svcGF0Y2hlcy90aS1r
My1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2ggIHwgMyArKy0KIGJvYXJkL3RpL2FtNjR4
LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0K
IDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJt
LXRydXN0ZWQtZmlybXdhcmUuaGFzaCBiL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvYXJtLXRy
dXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaAppbmRleCA4ZjYwODY0ZmJm
Li43NDk0ZTA0ZWFkIDEwMDY0NAotLS0gYS9ib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL2FybS10
cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKKysrIGIvYm9hcmQvdGkv
YW02NHgtc2svcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2Fy
ZS5oYXNoCkBAIC0xLDIgKzEsMiBAQAotIyBMb2NhbGx5IGNvbXB1dGVkOgorIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKIHNoYTI1NiAgYmEyMTU0MDRmZTlkYjI2ZTVmMmNlZjNmZGNlMTdiN2M4ZWQzNDRh
MmExZDU5MmRkMDFhNWYxYzVlNzJjZmRiZCAgYXJtLXRydXN0ZWQtZmlybXdhcmUtbHRzLXYyLjEw
LjQudGFyLmd6CmRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL3RpLWszLXI1
LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCBiL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMv
dGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCmluZGV4IGRiYjQ0Mjg3MzguLjk3
YTJiNGVhZjkgMTAwNjQ0Ci0tLSBhL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvdGktazMtcjUt
bG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCisrKyBiL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNo
ZXMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCkBAIC0xICsxLDIgQEAKLXNo
YTI1NiAgYjk5NjExZjFlZDIzN2JmMzU0MWJkYzg0MzRiNjhjOTZhNmUwNTk2NzA2MWY5OTI0NDNj
YjMwYWFiZWJlZjViMyAgdS1ib290LTIwMjQuMDEudGFyLmJ6MgorIyBMb2NhbGx5IGNhbGN1bGF0
ZWQKK3NoYTI1NiAgMThhODUzZmUzOWZhZDdhZDAzYTkwY2MyZDQyNzVhZWFlZDZkYTY5NzM1ZGVm
YWMzNDkyYjgwNTA4ODQzZGQ0YSAgdS1ib290LTIwMjQuMDQudGFyLmJ6MgpkaWZmIC0tZ2l0IGEv
Ym9hcmQvdGkvYW02NHgtc2svcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoIGIvYm9hcmQvdGkvYW02
NHgtc2svcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoCmluZGV4IDBlMTcxYzU2ZjUuLjk3YTJiNGVh
ZjkgMTAwNjQ0Ci0tLSBhL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFz
aAorKysgYi9ib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKQEAgLTEs
MiArMSwyIEBACi0jIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIGI5OTYxMWYxZWQyMzdiZjM1
NDFiZGM4NDM0YjY4Yzk2YTZlMDU5NjcwNjFmOTkyNDQzY2IzMGFhYmViZWY1YjMgIHUtYm9vdC0y
MDI0LjAxLnRhci5iejIKKyMgTG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIDE4YTg1M2ZlMzlm
YWQ3YWQwM2E5MGNjMmQ0Mjc1YWVhZWQ2ZGE2OTczNWRlZmFjMzQ5MmI4MDUwODg0M2RkNGEgIHUt
Ym9vdC0yMDI0LjA0LnRhci5iejIKLS0gCjIuNDUuMgoKCi0tIAoKCgrigJPigJPigJMKCgpncmFu
ZGNlbnRyaXggR21iSCB8IEEgVm9kYWZvbmUgQ29tcGFuecKgwrfCoEhvbHptYXJrdCAxwqDCt8Kg
NTA2NzYgCipDb2xvZ25lKsKgfMKgUGhvZW5peHNlZXN0cmFzc2UgMTjCoMK3wqA0NDI2MyAqRG9y
dG11bmQqwqDCt8KgR2VybWFueQp8wqBpbiAKPGh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21w
YW55L2dyYW5kY2VudHJpeD4gfCBwaG9uZTogKzQ5LTIyMS02NzctODYwLTAgCnzCoGVtYWlsOiBo
ZWxsb0BncmFuZGNlbnRyaXgubmV0IDxtYWlsdG86aGVsbG9AZ3JhbmRjZW50cml4Lm5ldD4KCgpn
cmFuZGNlbnRyaXggY2FyZXMgYWJvdXTCoHByaXZhY3kgCjxodHRwczovL2dyYW5kY2VudHJpeC5u
ZXQvZGUvcGFnZXMvcHJpdmFjeW1haWwvPgoKQW10c2dlcmljaHQgS8O2bG4gfCBIUkIgwqAKNzAx
MTkgfCBHZXNjaMOkZnRzZsO8aHJlcjogTS4gS3LDtm1lcizCoCBSLiBIw6RuZWwgfCBVU3QuLUlk
TnIuOiBERTI2NjMzMzk2OQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
