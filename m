Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3A8D1CA01
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDB6080FAE;
	Mon,  4 Nov 2024 22:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7dLsUe7Qmwb; Mon,  4 Nov 2024 22:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C253180BEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C253180BEC;
	Mon,  4 Nov 2024 22:09:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC8BF723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 808BF403B0
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9AqlL5QRHZE for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F3944039D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F3944039D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F3944039D
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:08:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4314b316495so40340885e9.2
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 14:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730758137; x=1731362937;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H+wKFvGIWOG37VG+7lJv1HsEHJVNR6hSsNR+f7Alu/M=;
 b=iMFeXeoDVhZQktNPM2zZnyQaRI4GzUHw+ExKGZrfgb6jRU4wOeKrHOIlcgALvupUQr
 J1NQN686SJhwxQ4EqXxXI8tFV2md36DafKJMWnFgN6AadBB/xAtS5LXJqS7vPLgmYC6M
 qQMVwGOKsqbAEwBiiV1hTIMRjVbzS9+QtvYbRiRb7C1dzLp2wFjJZzim32bvBV/ASmKt
 gIee+51Zp+8KUHiWSu+dvF2nVPJF9plGlcYS7p3cB/LPVYDglGNRitt/RiFlO6sJUlud
 YsqRXyaO6owHLDWJT/aD1IslQgls6Bnfa+TgP+8UqYdic+XNhYrSPIpw5sOSsPCXlsQN
 j9DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqGVbsn7K6KirCMwCrwQr151CcJYdnTPhcumnzr0SENsJlHDMCFd7oNH1VSKyqheMLq7jCYCB9G4E=@buildroot.org
X-Gm-Message-State: AOJu0Yy3H+WYiDAIfIKzkgztaYUnXN4w1nkU9Iber+d2lsjZKsDX/SDe
 UqNlaNJ/CyP/lM0CciUgQkBDmgYM+KcowrGQYsxxlwpTJO/j6XmMDdlnfPqGd2w=
X-Google-Smtp-Source: AGHT+IF/7j0TsoSC0pfGjCekHnG9cedRo4VRpWOOyXiyZGOuVahZPZhQ7c70yjLkj+NYbAkhvJUfXw==
X-Received: by 2002:a05:600c:3b0e:b0:431:5f9e:3f76 with SMTP id
 5b1f17b1804b1-4327b6fd2b0mr145208955e9.16.1730758137161; 
 Mon, 04 Nov 2024 14:08:57 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5bf429sm162880915e9.12.2024.11.04.14.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 14:08:56 -0800 (PST)
Message-ID: <ed5bfa34-10fc-49c5-a1b4-2408a4483cec@smile.fr>
Date: Mon, 4 Nov 2024 23:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20241031213348.2057705-1-ju.o@free.fr>
Content-Language: fr, en-US
In-Reply-To: <20241031213348.2057705-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730758137; x=1731362937; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H+wKFvGIWOG37VG+7lJv1HsEHJVNR6hSsNR+f7Alu/M=;
 b=uAiVv69kLqN+Z5h9afFUiJZ0Mkpu95ULicxBV7KyT03G4Q+Z6/EaJH6y+LWABVX1jd
 sYC/QM5i4ZX49/UCNP+yKttpuh3GwaR+we5maDVa+x6Qpu2M12ShKqQRjjtrPfrr4VpA
 M+M7QtCB5RhemwK1QJ3Px9JIjrpjlHK2nuBZs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=uAiVv69k
Subject: Re: [Buildroot] [PATCH v3 0/8] *** Fixes for
 qemu_aarch64_sbsa_defconfig ***
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

SGVsbG8gSnVsaWVuLAoKTGUgMzEvMTAvMjAyNCDDoCAyMjozMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGlzIHYzIG9mIHRoZSBzZXJpZXMgZXh0ZW5kcyB0aGUgdjIgcG9zdGVkIGF0
Ogo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/
c2VyaWVzPTQzMDAxNSZzdGF0ZT0qCj4gYnkgYWRkZGluZyBuZXcgcGF0Y2hlcyB0byBmaXggcnVu
dGltZSB0ZXN0cy4KPiAKPiBJIG9ubHkgYWRkZWQgY29tbWVudHMgaW4gdGhlIGNvbW1pdCBsb2cg
aW4gcGF0Y2ggIzMgYW5kICM0Lgo+IAo+IE5vdGUgdGhhdCB0aGUgQnVpbGRyb290IG1haWxpbmcg
bGlzdCBtYXkgYWx0ZXIgdGhlIGVkazIgcGFja2FnZQo+IHBhdGNoIGJ5IGNvbnZlcnRpbmcgQ1It
TEYgbmV3bGluZXMuCj4gCj4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgYWxzbyBhdmFpbGFibGUgYXQ6
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2NvbW1pdHMvZml4X2Vk
azJfdGVzdHMvCj4gCj4gVGhpcyBzZXJpZXMgd2FzIHRlc3RlZCB3aXRoIGNvbW1hbmRzOgo+IAo+
ICAgICBtYWtlIHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwo+ICAgICBtYWtlCj4gICAgIG91
dHB1dC9pbWFnZXMvc3RhcnQtcWVtdS5zaAo+IAo+ICAgICB1dGlscy9kb2NrZXItcnVuIG1ha2Ug
Y2hlY2stcGFja2FnZQo+IAo+ICAgICB1dGlscy9kb2NrZXItcnVuIHN1cHBvcnQvdGVzdGluZy9y
dW4tdGVzdHMgXAo+ICAgICAgICAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCj4gICAgICAgICB0
ZXN0cy5ib290LnRlc3RfZWRrMgo+IAo+ICAgICB1dGlscy9kb2NrZXItcnVuIHN1cHBvcnQvdGVz
dGluZy9ydW4tdGVzdHMgXAo+ICAgICAgICAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCj4gICAg
ICAgICB0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1YkFBcmNoNjRFRkkKPiAKPiAgICAgdXRp
bHMvZG9ja2VyLXJ1biBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwKPiAgICAgICAgIC1kIGRs
IC1vIG91dHB1dF9mb2xkZXIgXAo+ICAgICAgICAgdGVzdHMucGFja2FnZS50ZXN0X2Z3dHMKClRo
YW5rIHlvdSBmb3IgeW91ciBoZWxwIGZvciB0aGlzIHZlcnNpb24gYnVtcCBhbmQgYWRkaXRpb25h
bCB0ZXN0aW5nIGFuZAppbXByb3ZlbWVudCEKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gCj4gSnVsaWVuIE9saXZhaW4gKDUpOgo+ICAgc3Vw
cG9ydC90ZXN0aW5nOiBkaXNhYmxlIHRlc3RzIHVzaW5nIGVkazIgb24gYWFyY2g2NCBhcmNoaXRl
Y3R1cmUKPiAgIHN1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weTogYWRkIGJ1aWxkIGhv
c3QgZGlyIHRvIHFlbXUgc2VhcmNoCj4gICAgIHBhdGgKPiAgIHN1cHBvcnQvdGVzdGluZzogdGVz
dF9lZGsyOiB1cGRhdGUgYW5kIHJlLWVuYWJsZSB0aGUgdGVzdAo+ICAgc3VwcG9ydC90ZXN0aW5n
OiB0ZXN0X2Z3dHM6IHVwZGF0ZSBhbmQgcmUtZW5hYmxlIHRoZSB0ZXN0Cj4gICBzdXBwb3J0L3Rl
c3Rpbmc6IHRlc3RfZ3J1YjogdXBkYXRlIGFuZCByZS1lbmFibGUgdGhlIHRlc3QKPiAKPiBSb21h
aW4gTmFvdXIgKDMpOgo+ICAgY29uZmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWc6IHVw
ZGF0ZSBBVEYgdG8gdjIuMTEKPiAgIGJvb3QvZWRrMjogYnVtcCB0byB2ZXJzaW9uIGVkazItc3Rh
YmxlMjAyNDA1Cj4gICBjb25maWdzL3FlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZzogc3dpdGNo
IHRvIG5lb3ZlcnNlLW4xIChhcm12OC4yYSkKPiAKPiAgYm9hcmQvcWVtdS9hYXJjaDY0LXNic2Ev
cmVhZG1lLnR4dCAgICAgICAgICAgIHwgICAyICstCj4gIC4uLi9hcm0tdHJ1c3RlZC1maXJtd2Fy
ZS5oYXNoICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIC4uLm9EeGUtYWRkLWZlYXR1cmUtUENE
LXRvLXJlbWFwLWZyYW1lYi5wYXRjaCB8IDEyOSArKysrKysrKysrKysrKysrKysKPiAgYm9vdC9l
ZGsyL2VkazIuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGJvb3Qv
ZWRrMi9lZGsyLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBjb25m
aWdzL3FlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZyAgICAgICAgICAgfCAgIDcgKy0KPiAgcGFj
a2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5oYXNoICAgIHwgICAyICstCj4gIHBh
Y2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9ybXMubWsgICAgICB8ICAgMiArLQo+ICBz
dXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkgICAgICAgICAgICAgfCAgIDYgKy0KPiAg
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9lZGsyLnB5ICAgICAgIHwgICA2ICstCj4g
IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rlc3RfZ3J1Yi5weSAgICAgICB8ICAgMiArCj4g
IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZnd0cy5weSAgICB8ICAgNCArLQo+
ICAxMiBmaWxlcyBjaGFuZ2VkLCAxNTIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L2VkazIvMDAwMS1Pdm1mUGtnLVFlbXVWaWRlb0R4ZS1h
ZGQtZmVhdHVyZS1QQ0QtdG8tcmVtYXAtZnJhbWViLnBhdGNoCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
