Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D52C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFD2C4011F;
	Fri, 12 Jul 2024 20:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSmP2nCRtdTO; Fri, 12 Jul 2024 20:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89EB4404ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89EB4404ED;
	Fri, 12 Jul 2024 20:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E578A1BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D233F606F5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ou_1KeHkTU_v for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:12:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DA42606EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA42606EE
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DA42606EE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:12:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso13162225e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720815144; x=1721419944;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cGS/mKZgbMgQO57grQussUbPtnRbFsmbhYAH3BLqfPw=;
 b=RvzML0+pAGF0DTfOkYjouidcY6MvGDE8baGw2GwvneWyt2RaxWaUoyQQ4pbH+c5u4U
 0yC1f1RZ3rwF6z3Xiq6n1BsOa8M4CZnSfYB81dMF9uU+0xXFJx+PzwmxC0YOckoNKfRx
 23ImBRTH1gDOAlFJiVpMKmWQO66LVFe9BiKygyvVPpNg9hH06Doa1tUeB49AuyesyUfO
 /IkSPQjMRxmziZ0+GF3yxdF8F/32+UYMggMIi96jcuXuPHbF03zNlxQN2yEnpClRyert
 zdHZU1ARBz7SGeN4kl1EEmMN27n4DZd7s6p61B3CmU/NY1r65H1Ws2Ir0JUr+FVBX5TE
 gL3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB6YITahWxJbkexkUbEquiVanmvVf0wkfIXQLPwlBLHb+S9YNZ7ujeRhtSuIYSKl38tLO5rIQtygF6wuWWGxlepLBtrKTwvg==
X-Gm-Message-State: AOJu0YxikRN6T0SIg0sJqU6TCmwGc9H7522Bf2s4Gmf4IMkIllHETsuL
 aRZsFB+6L7AfJVzy+leQCmWhO+o/SpX5i4X/v1ClMU0FCQqH8fBdJouKfnykX74=
X-Google-Smtp-Source: AGHT+IGes3vbYfeh5Doq3kaEUZJCqSVUMEf+iDdAf0E0RogiX4NMhcJO6f9BFgLnpHyDji3irTldZw==
X-Received: by 2002:a05:600c:41c4:b0:426:62c5:4741 with SMTP id
 5b1f17b1804b1-426706c903emr78018855e9.2.1720815144553; 
 Fri, 12 Jul 2024 13:12:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde8904csm10815606f8f.49.2024.07.12.13.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:12:24 -0700 (PDT)
Message-ID: <4adad689-566e-450c-a12e-6cc681fb7309@smile.fr>
Date: Fri, 12 Jul 2024 22:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240707164602.320774-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr
In-Reply-To: <20240707164602.320774-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720815144; x=1721419944; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cGS/mKZgbMgQO57grQussUbPtnRbFsmbhYAH3BLqfPw=;
 b=xvJRfumULRK4ov9/NfCtLaAmHMT+k77hoTqK9blVYvC8afeUqvOm+X6Spaegsmc8nP
 023Gwp3qakNxHIgYMAgXKGHa+Lpgx26dGb2o0S+NPc8JHKjJBMBbLafBPRnYYCEV2TGk
 FAWHMpbAoM1T2GoJgDnBKhNqlMwk2OxNvpBnA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xvJRfumU
Subject: Re: [Buildroot] [PATCH 1/1] package/mediastreamer: fix patch fuzz
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwNy8wNy8yMDI0IMOgIDE4OjQ2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIG1lZGlhc3RyZWFtZXIgZmFp
bHMgdG8gYnVpbGQgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIEFwcGx5aW5nIDAwMDItVXNlLUFWX0lO
UFVUX0JVRkZFUl9QQURESU5HX1NJWkUtdG8tZGV0ZXJtaW5lLXBhZGRpbi5wYXRjaCB1c2luZyBw
YXRjaDoKPiAgICAgcGF0Y2hpbmcgZmlsZSBzcmMvdXRpbHMvZmZtcGVnLXByaXYuaAo+ICAgICBI
dW5rICMxIEZBSUxFRCBhdCAxMDIuCj4gICAgIDEgb3V0IG9mIDEgaHVuayBGQUlMRUQgLS0gc2F2
aW5nIHJlamVjdHMgdG8gZmlsZSBzcmMvdXRpbHMvZmZtcGVnLXByaXYuaC5yZWoKPiAKPiBUaGlz
IGNvbW1pdCByZWZyZXNoZXMgdGhlIHBhY2thZ2UgcGF0Y2ggb24gdGhlIGN1cnJlbnQgcGFja2Fn
ZSB2ZXJzaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIC4uLmUtQVZfSU5QVVRfQlVGRkVSX1BBRERJ
TkdfU0laRS10by1kZXRlcm1pbmUtcGFkZGluLnBhdGNoIHwgNiArKysrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9tZWRpYXN0cmVhbWVyLzAwMDItVXNlLUFWX0lOUFVUX0JVRkZFUl9QQURESU5HX1NJ
WkUtdG8tZGV0ZXJtaW5lLXBhZGRpbi5wYXRjaCBiL3BhY2thZ2UvbWVkaWFzdHJlYW1lci8wMDAy
LVVzZS1BVl9JTlBVVF9CVUZGRVJfUEFERElOR19TSVpFLXRvLWRldGVybWluZS1wYWRkaW4ucGF0
Y2gKPiBpbmRleCBmYzY2ZTlhOWY5MmQuLjlmZDNmZGEyZWNjZCAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL21lZGlhc3RyZWFtZXIvMDAwMi1Vc2UtQVZfSU5QVVRfQlVGRkVSX1BBRERJTkdfU0laRS10
by1kZXRlcm1pbmUtcGFkZGluLnBhdGNoCj4gKysrIGIvcGFja2FnZS9tZWRpYXN0cmVhbWVyLzAw
MDItVXNlLUFWX0lOUFVUX0JVRkZFUl9QQURESU5HX1NJWkUtdG8tZGV0ZXJtaW5lLXBhZGRpbi5w
YXRjaAo+IEBAIC0xOSw2ICsxOSw4IEBAIGh0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2NnaS1iaW4v
YnVncmVwb3J0LmNnaT9idWc9OTAxNzM1Cj4gIFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxi
ZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KPiAgW0ZhYnJpY2U6IHVwZGF0ZWQgZm9yIDQuMy4xXQo+
ICBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4KPiArW0RhcmlvOiBtYWtlIHRoZSBwYXRjaCB0byBiZSBhcHBsaWVkIHdpdGggZnV6eiBm
YWN0b3IgMF0KPiArU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hp
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ICAtLS0KPiAgIHNyYy91dGlscy9mZm1wZWctcHJpdi5o
ICAgICB8IDQgKysrKwo+ICAgc3JjL3ZpZGVvZmlsdGVycy9ub3dlYmNhbS5jIHwgNCArKy0tCj4g
QEAgLTI4LDggKzMwLDggQEAgZGlmZiAtLWdpdCBhL3NyYy91dGlscy9mZm1wZWctcHJpdi5oIGIv
c3JjL3V0aWxzL2ZmbXBlZy1wcml2LmgKPiAgaW5kZXggYzA3NDVhOWEuLmQ1OWVhMGUxIDEwMDY0
NAo+ICAtLS0gYS9zcmMvdXRpbHMvZmZtcGVnLXByaXYuaAo+ICArKysgYi9zcmMvdXRpbHMvZmZt
cGVnLXByaXYuaAo+IC1AQCAtMTAyLDYgKzEwMiwxMCBAQCBzdGF0aWMgaW5saW5lIGludCBhdmNv
ZGVjX2RlY29kZV92aWRlbzIoQVZDb2RlY0NvbnRleHQgKmF2Y3R4LCBBVkZyYW1lICpwaWN0dXJl
LAo+IC0gI2VuZGlmCj4gK0BAIC0xMTUsNiArMTE1LDEwIEBACj4gKyBleHRlcm4gIkMiIHsKPiAg
ICNlbmRpZgo+ICAgCj4gICsjaWZuZGVmIEFWX0lOUFVUX0JVRkZFUl9QQURESU5HX1NJWkUKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
