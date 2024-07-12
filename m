Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3272EC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F9180E3A;
	Fri, 12 Jul 2024 19:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1bJUOTzeR8m; Fri, 12 Jul 2024 19:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C88AC80E62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C88AC80E62;
	Fri, 12 Jul 2024 19:59:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14E9E1BF232
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F64D80E62
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RR3KYyb9yd-K for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:59:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7C7880E3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7C7880E3A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7C7880E3A
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:59:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4267300145eso18659735e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720814350; x=1721419150;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VphpcNXWPGnec2Ro4okqf4gwZhOG9goNPHwm2O+pDPo=;
 b=deq3f2FSUoyolnbUx7hTXU6uTCT0fNmfPYfTWVTVbeMtLMZzVH84gkye4uQ+QXvvOp
 IaPHR1IQcUGjXKVDZn9YuyCf8AOivFPw85CMeUaoki0aL21mFZjsIFTHaJ5gnMTAig7b
 D2qmSJK24yZFmWCKnbYh+5ts6ak6fyGxSXQ1PNoqz1vYcfBQnc2ZIQ26EFi249fklwnV
 UEg1s0IrUjyap3aj7/shBePW3R+RqWgHWh7wNy0WsUhy6Nmy1w3hSvscydS8IWvYS2Yx
 0ADPgeRtDReQKMGamF70Ng3KdBQeqjEUx+VukmhV05Y9I6dpGwd8wlmuVFgwogY+e5ho
 YxUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY6BfmtqNM76dj4HgLHTDiInep655ecgppeRaz/S+AhJgH2FNYGMjN7pFmC3pgLfdZvqC8nek8K75nz5m9Bkt5OixFQXnz0Q==
X-Gm-Message-State: AOJu0YxSRUtm53i5Ws/zz3uPpNGBkO6HY9hnicmLGP1uxzmbLEIDTGu3
 cHiXdGF5f6ZYGTmAsLADINdaLOh4YE8AZhdEmc0yjkJJMR29ZR8HsaLC+FwG5RQ=
X-Google-Smtp-Source: AGHT+IFjypg5RWHMC4C8cvRlVIAPmPd6+oaySw4NxYW/tXEGJCtL182stqCTG8JW43v4bw/a3jBzjg==
X-Received: by 2002:adf:ee0d:0:b0:367:dc45:55ab with SMTP id
 ffacd0b85a97d-367dc455642mr9442171f8f.25.1720814350629; 
 Fri, 12 Jul 2024 12:59:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab7d4sm10884601f8f.113.2024.07.12.12.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:59:10 -0700 (PDT)
Message-ID: <ba140928-592e-45fc-9379-3e854ce1461c@smile.fr>
Date: Fri, 12 Jul 2024 21:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240705195231.3430104-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20240705195231.3430104-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720814350; x=1721419150; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VphpcNXWPGnec2Ro4okqf4gwZhOG9goNPHwm2O+pDPo=;
 b=BRyIjJBDMgq73MSAbdnaQ7gbqx2fGbOcbfFLaZAy8hbLbgGNaSnLNBd7NH9VR9AoAT
 CKns//CjDoRn/H3lFzuLbuGMnJlpH+mqprDgYUpZTC2R6yu70xrkyFmh6mEr6Cv9kM+K
 AY4LDGGZHSAZLLMOPUHYCvC/QfswwXSgfQ8VQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=BRyIjJBD
Subject: Re: [Buildroot] [PATCH 1/1] package/libsvgtiny: update the patches
 to be applied with fuzz 0
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

SGVsbG8gRGFyaW8sCgpMZSAwNS8wNy8yMDI0IMOgIDIxOjUyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIGxpYnN2Z3RpbnkgZmFpbHMg
dG8gYnVpbGQgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIEFwcGx5aW5nIDAwMDQtQnVpbGQtSW5jbHVk
ZS1ncGVyZi1nZW5lcmF0ZWQtY29kZS1kaXJlY3RseS5wYXRjaCB1c2luZyBwYXRjaDoKPiAgICAg
cGF0Y2hpbmcgZmlsZSBzcmMvTWFrZWZpbGUKPiAgICAgSHVuayAjMSBGQUlMRUQgYXQgMS4KPiAg
ICAgMSBvdXQgb2YgMSBodW5rIEZBSUxFRCAtLSBzYXZpbmcgcmVqZWN0cyB0byBmaWxlIHNyYy9N
YWtlZmlsZS5yZWoKPiAKPiBUaGlzIGNvbW1pdCByZWZyZXNoZXMgdGhlIHBhY2thZ2UgcGF0Y2gg
b24gdGhlIGN1cnJlbnQgcGFja2FnZSB2ZXJzaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KCk5vdGU6IHRo
ZSBmaXJzdCBwYXRjaCAwMDAxLWRpc2FibGUtZGVidWctcHJpbnRmcy5wYXRjaCBwcm9kdWNlIHNv
bWUgaHVua3MgKC0xCm9mZnNldCkuCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCBy
ZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICAuLi4wMDA0LUJ1aWxkLUluY2x1ZGUtZ3BlcmYtZ2Vu
ZXJhdGVkLWNvZGUtZGlyZWN0bHkucGF0Y2ggfCA4ICsrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlic3ZndGlueS8wMDA0LUJ1aWxkLUluY2x1ZGUtZ3BlcmYtZ2VuZXJhdGVkLWNvZGUtZGly
ZWN0bHkucGF0Y2ggYi9wYWNrYWdlL2xpYnN2Z3RpbnkvMDAwNC1CdWlsZC1JbmNsdWRlLWdwZXJm
LWdlbmVyYXRlZC1jb2RlLWRpcmVjdGx5LnBhdGNoCj4gaW5kZXggYzE3NDI2ZmYwNTFiLi5iNTQ0
M2U5OTEyMTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJzdmd0aW55LzAwMDQtQnVpbGQtSW5j
bHVkZS1ncGVyZi1nZW5lcmF0ZWQtY29kZS1kaXJlY3RseS5wYXRjaAo+ICsrKyBiL3BhY2thZ2Uv
bGlic3ZndGlueS8wMDA0LUJ1aWxkLUluY2x1ZGUtZ3BlcmYtZ2VuZXJhdGVkLWNvZGUtZGlyZWN0
bHkucGF0Y2gKPiBAQCAtMTEsNiArMTEsOCBAQCBzdmd0aW55LmMgaW5zdGVhZCwgd2hpY2ggaXMg
dGhlIG9ubHkgcGxhY2UgaXRzIHVzZWQuCj4gIFtSZXRyaWV2ZWQgZnJvbToKPiAgaHR0cHM6Ly9z
b3VyY2UubmV0c3VyZi1icm93c2VyLm9yZy9saWJzdmd0aW55LmdpdC9jb21taXQvc3JjP2lkPTQz
OTBmMWM4NGU4ZmVlNTFmYzIyNDY4ODIxZTZmYzE1OGU3ODMwNTNdCj4gIFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICtbRGFyaW86
IG1ha2UgdGhlIHBhdGNoIHRvIGJlIGFwcGxpZWQgd2l0aCBmdXp6IGZhY3RvciAwXQo+ICtTaWdu
ZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cj4gIC0tLQo+ICAgc3JjL01ha2VmaWxlICAgICAgICAgICB8IDEzICsrKysrKystLS0t
LS0KPiAgIHNyYy9jb2xvcnMuZ3BlcmYgICAgICAgfCAgOCAtLS0tLS0tLQo+IEBAIC00NCw3ICs0
Niw3IEBAIGluZGV4IGE5Nzk3MjAuLmZiOGE3MmYgMTAwNjQ0Cj4gICsKPiAgK0NMRUFOX0lURU1T
IDo9ICQoRElSKWF1dG9nZW5lcmF0ZWRfY29sb3JzLmMKPiAgIAo+IC0gaW5jbHVkZSAkKE5TQlVJ
TEQpL01ha2VmaWxlLnN1YmRpcgo+ICsgaW5jbHVkZSBidWlsZC9tYWtlZmlsZXMvTWFrZWZpbGUu
c3ViZGlyCj4gIGRpZmYgLS1naXQgYS9zcmMvY29sb3JzLmdwZXJmIGIvc3JjL2NvbG9ycy5ncGVy
Zgo+ICBpbmRleCA5NmQ1YjllLi5hODM2Nzg3IDEwMDY0NAo+ICAtLS0gYS9zcmMvY29sb3JzLmdw
ZXJmCj4gQEAgLTY4LDcgKzcwLDcgQEAgZGlmZiAtLWdpdCBhL3NyYy9zdmd0aW55LmMgYi9zcmMv
c3ZndGlueS5jCj4gIGluZGV4IDQ2NjFhNTguLmJiZWZiODggMTAwNjQ0Cj4gIC0tLSBhL3NyYy9z
dmd0aW55LmMKPiAgKysrIGIvc3JjL3N2Z3RpbnkuYwo+IC1AQCAtMjAsNiArMjAsOSBAQAo+ICtA
QCAtMTcsNiArMTcsOSBAQAo+ICAgI2luY2x1ZGUgInN2Z3RpbnkuaCIKPiAgICNpbmNsdWRlICJz
dmd0aW55X2ludGVybmFsLmgiCj4gICAKPiBAQCAtODIsNyArODQsNyBAQCBkaWZmIC0tZ2l0IGEv
c3JjL3N2Z3RpbnlfaW50ZXJuYWwuaCBiL3NyYy9zdmd0aW55X2ludGVybmFsLmgKPiAgaW5kZXgg
MTU4ZDIzMC4uNmJmNWQ2NCAxMDA2NDQKPiAgLS0tIGEvc3JjL3N2Z3RpbnlfaW50ZXJuYWwuaAo+
ICArKysgYi9zcmMvc3ZndGlueV9pbnRlcm5hbC5oCj4gLUBAIC0xMDIsOSArMTAyLDQgQEAgdm9p
ZCAqc3ZndGlueV9saXN0X2dldChzdHJ1Y3Qgc3ZndGlueV9saXN0ICpsaXN0LAo+ICtAQCAtODcs
OSArODcsNCBAQAo+ICAgdm9pZCAqc3ZndGlueV9saXN0X3B1c2goc3RydWN0IHN2Z3RpbnlfbGlz
dCAqbGlzdCk7Cj4gICB2b2lkIHN2Z3RpbnlfbGlzdF9mcmVlKHN0cnVjdCBzdmd0aW55X2xpc3Qg
Kmxpc3QpOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
