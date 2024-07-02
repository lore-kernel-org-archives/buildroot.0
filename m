Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D7AC3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F1F81132;
	Tue,  2 Jul 2024 19:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzbnFDEzvkaz; Tue,  2 Jul 2024 19:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B4B83F62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B4B83F62;
	Tue,  2 Jul 2024 19:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFD461BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B72383F62
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYIsAoGj_wDb for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BF4881132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BF4881132
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BF4881132
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:43:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so24899435e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719949381; x=1720554181;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cW6BV8/tmv1IfR03YEcxd6XFPIW4V0xP3NpMNnMuIOs=;
 b=xDB3JaXsXsuBFNJ4NKh/vbZfCUa3D22q6MMkH3Dm9rrYJ6kU8xRgBxXEv/5fSH8tHI
 CXJ8su9hNOswbenogwvSxeyisKd2XpEOO+N5G9YJjY+cCBtj0uGY2lbzw3jsWlIqtlIx
 l5tkhBB3OsCY7+evR87MMKRXzGJU/xolspXEVOO7tTpFrFAwt8T36c+qjXaJZ14TSoiA
 ZZCVbU9sSGlItFQ3MUgvFiNL98RO+3qvsNm+yXQveZ8KZAqE/LpL/POiXAVa9ft6C8yT
 y6NA6pgzeHSNkC3vig2x82WhF4ZcI84PotErcjnUwdpG3AUVaX41FvTMFxBYiFGjoFbN
 hnFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiT2kA7k+7oNdUpWyi1XT2YIrLahn/8Y4vEZIpkewV9JFnLCQF9vfyPkAEWAqmScbIxmGFMPeSMBzWlK92eSVBD6W+ml6VAg==
X-Gm-Message-State: AOJu0YyBQeTEzJvQkUpN49i1W6/STJUJAb+elkR6DfkcfieLxqUCESqT
 SZn1B4nm6igsHUpLBWOEARRtLVJJaqyAUL6+gptB8rVRz9L7Q2mIaouLyhscG30=
X-Google-Smtp-Source: AGHT+IGkYyppOS2DtAGMqtkU9dm/mFvtUTU92qyqxQL9NvojiH2tlpmYWYzlJ9JfMUPhxC1sP8vd2A==
X-Received: by 2002:adf:f248:0:b0:367:1696:9cf4 with SMTP id
 ffacd0b85a97d-3677572fa8fmr8097137f8f.57.1719949380694; 
 Tue, 02 Jul 2024 12:43:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55e61sm207344085e9.20.2024.07.02.12.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:43:00 -0700 (PDT)
Message-ID: <7eda7c55-3f37-4109-a34f-4edafe3a695b@mind.be>
Date: Tue, 2 Jul 2024 21:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702191319.2460210-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702191319.2460210-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719949381; x=1720554181; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cW6BV8/tmv1IfR03YEcxd6XFPIW4V0xP3NpMNnMuIOs=;
 b=AHw06+ktEEfljVg1lGXxS4Xhb7OLF5Y/IZCG5HY1WyytdFFll0SwtbEFsLH6QECG0Y
 Y4qutQusrhk9H6SJDlojGYtEa+W3+CmJuau1FpphAyr7JGlJ3ft7kUzP9F2zelKktWbw
 g2MlilRsIw1d03Ue5x7WORE88vxS+kFcBN29lH2zzmgBfbNIJQl6py3JnNe0DvmXlhd4
 hExZD7edbP9AEDcnOI81BrQ7H1WofA0/hbZ0HVGA2NnDD/1ZyoeizwLcR+a3kH5fUDxW
 zdvJwIAOtJLt4wO3P50GC6V76WpyCcPEqy1r2UxHyLqCivIRhpUIMMyFElNqOqydEEq1
 ELpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AHw06+kt
Subject: Re: [Buildroot] [PATCH 1/1] package/libnfs: update the patches to
 be applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMi8wNy8yMDI0IDIxOjEzLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiBDb21taXQgOGY4
OGE2NDRlZDdkNiAoInN1cHBvcnQvc2NyaXB0cy9hcHBseS1wYXRjaGVzLnNoOiBzZXQgdGhlIG1h
eGltdW0KPiBmdXp6IGZhY3RvciB0byAwIikgcmVkdWNlZCB0aGUgZnV6eiBmYWN0b3IuCj4gCj4g
RHVlIHRvIHRoaXMgY2hhbmdlLCBsaWJuZnMgZmFpbHMgdG8gYnVpbGQgd2l0aCBvdXRwdXQ6Cj4g
Cj4gICAgICBBcHBseWluZyAwMDAxLUZpeC1pbmNsdWRlLXN5cy10aW1lLmgucGF0Y2ggdXNpbmcg
cGF0Y2g6Cj4gICAgICBwYXRjaGluZyBmaWxlIGluY2x1ZGUvbmZzYy9saWJuZnMuaAo+ICAgICAg
SHVuayAjMSBGQUlMRUQgYXQgMjQuCj4gICAgICAxIG91dCBvZiAxIGh1bmsgRkFJTEVEIC0tIHNh
dmluZyByZWplY3RzIHRvIGZpbGUgaW5jbHVkZS9uZnNjL2xpYm5mcy5oLnJlago+IAo+IFRoaXMg
Y29tbWl0IHJlZnJlc2hlcyB0aGUgcGFja2FnZSBwYXRjaCBvbiB0aGUgY3VycmVudCBwYWNrYWdl
IHZlcnNpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFj
Y2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
ICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvbGlibmZzLzAwMDEtRml4LWlu
Y2x1ZGUtc3lzLXRpbWUuaC5wYXRjaCB8IDYgKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xp
Ym5mcy8wMDAxLUZpeC1pbmNsdWRlLXN5cy10aW1lLmgucGF0Y2ggYi9wYWNrYWdlL2xpYm5mcy8w
MDAxLUZpeC1pbmNsdWRlLXN5cy10aW1lLmgucGF0Y2gKPiBpbmRleCBjMzc3OWYxM2EyNjIuLjAz
MTkzZDZkNzFhMSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYm5mcy8wMDAxLUZpeC1pbmNsdWRl
LXN5cy10aW1lLmgucGF0Y2gKPiArKysgYi9wYWNrYWdlL2xpYm5mcy8wMDAxLUZpeC1pbmNsdWRl
LXN5cy10aW1lLmgucGF0Y2gKPiBAQCAtMTYsNiArMTYsOCBAQCBVcHN0cmVhbTogaHR0cHM6Ly9n
aXRodWIuY29tL3NhaGxiZXJnL2xpYm5mcy9pc3N1ZXMvMjcyCj4gICBTaWduZWQtb2ZmLWJ5OiBK
w7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJlZGRlZC5yb2Nrcz4KPiAgIFtGYWJyaWNlOiB1
cGRhdGUgZm9yIDUuMC4yXQo+ICAgU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9u
dGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gK1tEYXJpbzogbWFrZSB0aGUgcGF0Y2ggdG8gYmUg
YXBwbGllZCB3aXRoIGZ1enogZmFjdG9yIDBdCj4gK1NpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFj
Y2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAgIC0tLQo+ICAgIGlu
Y2x1ZGUvbmZzYy9saWJuZnMuaCB8IDUgLS0tLS0KPiAgICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxl
dGlvbnMoLSkKPiBAQCAtMjQsOCArMjYsOCBAQCBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9uZnNjL2xp
Ym5mcy5oIGIvaW5jbHVkZS9uZnNjL2xpYm5mcy5oCj4gICBpbmRleCAwOWRjZjFjLi5iNmRiNThj
IDEwMDc1NQo+ICAgLS0tIGEvaW5jbHVkZS9uZnNjL2xpYm5mcy5oCj4gICArKysgYi9pbmNsdWRl
L25mc2MvbGlibmZzLmgKPiAtQEAgLTI0LDEyICsyNCw3IEBACj4gLSAjZGVmaW5lIF9MSUJORlNf
SF8KPiArQEAgLTI4LDEyICsyOCw3IEBACj4gKyAjZW5kaWYKPiAgICAKPiAgICAjaW5jbHVkZSA8
c3RkaW50Lmg+Cj4gICAtI2lmIGRlZmluZWQoX19BTkRST0lEX18pIHx8IGRlZmluZWQoQVJPUykg
fHwgZGVmaW5lZChfX1BQVV9fKSBcCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
