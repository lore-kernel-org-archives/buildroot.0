Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC39ACA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 20:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96B841309;
	Sat, 23 Aug 2025 20:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gf0nN1cPElhx; Sat, 23 Aug 2025 20:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01E4D41572
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01E4D41572;
	Sat, 23 Aug 2025 20:26:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AAB5E4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C2ED413A2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eth4bQQoK5ML for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 20:26:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2701C41364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2701C41364
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2701C41364
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:26:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3c4e9efb88aso1690230f8f.2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 13:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755980795; x=1756585595;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lTV7WypKO6jxDhQjLBcxi71CDUuO4b9dKpsC0r5SSeQ=;
 b=JrXDdnSVKjz3kVPGdVHEqNvuX0Cf87dzKZuX7kdsyErumAjCPQ5/0gS7HbCxPMpPjm
 6r8DRe/pqpJ3mIlce7BFO8Z+DvP1wyIZ5wv07ukrj3CAufTFu9OZfQ2N4AHgMnN8AOD8
 YTOw7ETa1/o49gka7JLt2VVPlqZRs3L0jn63eIiq40P83fs1Jk6rH/oqsEPS+SBXGptH
 bY314Df0ZI+Qc64F0OrZnOr9kWSncALxtWefhD5BrQIZDui9BMzJtfHTfBQa1rKQYzsc
 9kRM2hIBgbyGaklEJ1HmxVf4qOGkzSF6X+24xi1yNO1ynMAsCgb6qaTQSlj2RvtQF+MF
 xYHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOn4EA7Lp9GwCSHiAahRpywdpp2D1KLCEna9zfjAcj5MDw0BftYgpN105xm5BlYIZnwkOqUObAd6o=@buildroot.org
X-Gm-Message-State: AOJu0YzU+bY20+aaVEARcmgmlX4O4uNTl5jrPjtz3XuCRoS/LplJ+k8x
 hkotivSNA15FimyL9DxeiZxRAv3xR5/84/85f+g+4o0SkgncthIvBbs8Em2HM5e1ugo=
X-Gm-Gg: ASbGnctFXqsBHGxJ1QgXwQSgqIzh3X6rFprHSqtaEqInLjivY2p96bbFs8Bo8ufLn0x
 Ie8SPFuaUL9N073JqtB6jJAUzQ5FjmLyOGSJfLVQRrblonSrRiZSDZgtpGa6mnoT5p1yFnY3642
 ahZuttCp35teqNCCRQ4kFqpehVSA4ekqyPf13Qgq0scft1qr4+xWaJ0IqZK1PixWtbZyMahqcaW
 tON2CUCIG9j44MCCcNpGFO4uJiXh6TEYJ9ZyaChR/9RscC7SGhGb8HOE8Qx3IVsqb2reEYWIADL
 hqssNWmaHMJqOh6zPzFLJbuWEO0K6APvy+V77dX5bc4L94gGfzeH3O1dTdI6GUREh80EJvSoVIT
 RkbJsulLNdJMftQxSrpNYLleavZK60u/HyNu8vOb2eqCCkkFZCgjppEUxt3BTNdRn57QPRjqm6T
 0eIPRHWxVIW/OesjH9F4DYo/0CfPQUwNNkM1SXWpIkEDBChSHHjlqwDBY0g3hw
X-Google-Smtp-Source: AGHT+IGTzW4Ce7m5cNcJ41vMiXzflJoMoh5VCJrDGXZA2A7BVeu06mc2ZWbE3v/JXr9pPZTlDV16Gg==
X-Received: by 2002:a5d:5f92:0:b0:3a5:8cdd:c174 with SMTP id
 ffacd0b85a97d-3c5dc4487e7mr5343573f8f.26.1755980794951; 
 Sat, 23 Aug 2025 13:26:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70f4269c6sm4776266f8f.29.2025.08.23.13.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 13:26:34 -0700 (PDT)
Message-ID: <1cd43c0e-2839-4f0b-8fbd-b47e44438edb@smile.fr>
Date: Sat, 23 Aug 2025 22:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250823105456.28057-1-ju.o@free.fr>
Content-Language: fr, en-US
In-Reply-To: <20250823105456.28057-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755980795; x=1756585595; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lTV7WypKO6jxDhQjLBcxi71CDUuO4b9dKpsC0r5SSeQ=;
 b=1qF40vVxlWQgGndzHVcNaITYAKy2pnb6TK6PA/KPKcQgGwrp9TqArOcwOerznpv5mk
 cXe6W7Rc+cbJqTJAPenirhKjjfIsl+dvx0FN2hfFR1F53JXgAzf+3U/A0Y0zZRAp4auZ
 hw25BKZHrwZbotMMX/ABNSWG3cMgix2M3fWpA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=1qF40vVx
Subject: Re: [Buildroot] [PATCH 1/1] support/misc/gitlab-ci.yml.in: check
 legal-info in test-pkg
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAyMy8wOC8yMDI1IMOgIDEyOjU0LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IFRoZSBzY3JpcHQgInV0aWxzL3Rlc3QtcGtnIiBpcyBzeXN0ZW1hdGlj
YWxseSBjaGVja2luZyBsZWdhbC1pbmZvLgo+IFNlZSBbMV0uIFRoaXMgaXMgdXNlZnVsIHRvIGNo
ZWNrIGFsbCBsaWNlbnNlIGhhc2hlcyBhcmUgdXAgdG8gZGF0ZS4KPiAKPiBUaGUgQnVpbGRyb290
IEdpdGxhYiBDSSBpbnRlZ3JhdGlvbiBoYXMgYW4gaWRlbnRpY2FsIHRlc3RpbmcKPiBjYXBhYmls
aXR5LiBJdCBpcyBmYXN0ZXIgYmVjYXVzZSBpdCBjYW4gcnVuIGFsbCBzdXBwb3J0ZWQgdG9vbGNo
YWluCj4gdGVzdCBidWlsZHMgaW4gcGFyYWxsZWwuIFNlZSBbMl0uCj4gCj4gSXQgd2FzIG9ic2Vy
dmVkIGluIFszXSB0aGF0IHRoZSBHaXRsYWIgQ0kgdGVzdC1wa2cgdmFyaWFudCBkb2VzIG5vdAo+
IGNoZWNrIGxlZ2FsLWluZm8uCj4gCj4gVGhpcyBjb21taXQgYWxpZ24gdGhlIEdpdGxhYiBDSSB0
ZXN0LXBrZyBiZWhhdmlvciB0byB0aGUKPiAidXRpbHMvdGVzdC1wa2ciIHNjcmlwdCBieSBhZGRp
bmcgYSAibWFrZSBsZWdhbC1pbmZvIiBjb21tYW5kLgo+IAo+IFsxXSBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjUuMDUvdXRpbHMvdGVzdC1wa2cj
TDE5NQo+IFsyXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9i
bG9iLzIwMjUuMDUvc3VwcG9ydC9taXNjL2dpdGxhYi1jaS55bWwuaW4jTDEyOQo+IFszXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvNzVlNjg4ODg3ZDk1OTQ4YzU3YTExNDE2ZGUz
MDQ3YjVAZnJlZS5mci8KClllcyB5b3UncmUgcmlnaHQuCgpJbiBhbm90aGVyIGhhbmQsIHB1c2hp
bmcgdGVzdC1wa2cgdGVzdGluZyBpbiBhIEdpdGxhYiBDSSB3aXRob3V0IGhhdmluZyBhbHJlYWR5
CnByZS10ZXN0ZWQgbG9jYWxseSB0aGUgbmV3IHBhY2thZ2Ugd2l0aCB0ZXN0LXBrZyBhbmQgdGhl
IGRlZmF1bHQgc3Vic2V0IG9mCnRvb2xjaGFpbnMgaXMgcHJvYmFibHkgYSB3YXN0ZSBvZiB0aW1l
IGFuZCByZXNzb3VyY2VzIFsxXSA6KQoKWzFdCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL3N1cHBvcnQvc2NyaXB0cy9nZW5lcmF0ZS1naXRs
YWItY2kteW1sP3JlZl90eXBlPWhlYWRzI0wxMDAKCkkgYmVsaWV2ZSBpdCdzIHNhZmUgdG8gbWVy
Z2UgaXQgaW4gbWFzdGVyIGJ1dCBJJ20gZmluZSB0b28gaWYgeW91IHByZWZlciBuZXh0LgoKQWNr
ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+IAo+IENjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4K
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQo+ICBz
dXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbiB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9taXNjL2dpdGxhYi1jaS55bWwu
aW4gYi9zdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbgo+IGluZGV4IGRiMjA2NDMyYWEuLjIz
NThmNTczYzggMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC9taXNjL2dpdGxhYi1jaS55bWwuaW4KPiAr
KysgYi9zdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbgo+IEBAIC0xMzUsNiArMTM1LDcgQEAg
YmVmb3JlX3NjcmlwdDoKPiAgICAgICAgICAtIG1ha2UgTz0ke09VVFBVVF9ESVJ9IHNhdmVkZWZj
b25maWcKPiAgICAgICAgICAtIGVjaG8gJ0J1aWxkIGJ1aWxkcm9vdCcKPiAgICAgICAgICAtICpy
dW5fbWFrZQo+ICsgICAgICAgIC0gbWFrZSBPPSR7T1VUUFVUX0RJUn0gbGVnYWwtaW5mbwo+ICAg
ICAgbmVlZHM6Cj4gICAgICAgICAgLSBwaXBlbGluZTogJFBBUkVOVF9QSVBFTElORV9JRAo+ICAg
ICAgICAgICAgam9iOiBnZW5lcmF0ZS1naXRsYWItY2kteW1sCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
