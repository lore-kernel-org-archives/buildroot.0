Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88782C71135
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 14:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CBD481119;
	Sat, 14 Jun 2025 14:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5zVrfPMY5mY; Sat, 14 Jun 2025 14:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 446CB810D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 446CB810D8;
	Sat, 14 Jun 2025 14:24:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D7D21A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 14:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F9B140A93
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 14:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kj7JKTK22DyX for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 14:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D00A140022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00A140022
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D00A140022
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 14:24:37 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so3190153f8f.3
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 07:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749911076; x=1750515876;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vi85IUfbNHm7dYothD6OX43gkp6/LmLYwhOhkkDEcTM=;
 b=p62myWsLFhzkNS98zRuNoKqLPTOSKAv+jIKZr+euPBV5kl0/k8eq5NO45ADdBfPHRR
 Ofmi5IxlkkoRBFE3dfwoCu4ZJ4CyqSJ/jSBv5sN6FO54k+NkNqLaYOYLXc3U1qJnI/D4
 AZWNsIhVFMJ/btR49uBofnGPdrfUxLPLRVdB3edz76Upe1TEyEzm0KVwzn3zilenO1Jj
 XW740fe8byNkm0GQAqHrb2qaBAZhpXUNxdU6MYS22riiK5bGRn2Njam8SfydWnlzudL2
 gaTLhsxF0m/SwrByMZfMoH/ct8r6JboCJHdZI/Qe3KAWjcICa2yOFoZaIm3vppjUVGS0
 QSNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyUYU5jwjJ6qL3gBEpMwV23xuEPNXPgn2bfOxDfUqkYJMCe9AlDkggYQwxn9Lt99UlMvFzwF1LhmQ=@buildroot.org
X-Gm-Message-State: AOJu0YzULrDimSJ5dv31oFVk/XOzJnej6y7lnZ3g1QaEJNKbc6bZAxeH
 nvhHexBlMxrTPPhpT9nW0Kx/4Bp8U9L72hqfHI3mYYha6Uu6QZyeRHNhxS8qKInEdzLU0/RtXVE
 9JQDx
X-Gm-Gg: ASbGncs7S6y6iT/GiueWgDqltPTN8VWBiIbgNc/2v7SrPJeXq4ohOK27+pVM3Bc9R2p
 qnMNjplH5dET11R0acJCQ4u331MEq/SRK7XBdaEsWbln6XCBPRhlORQhtl6XRs5Zbdzlru2xF7D
 RYQGj7ZCyn4L5u2ma2ban27ON63oFgG8iTg7mG6irOIsGk7EoOgcY9zqIQrpPk52s7y7k79OSGq
 m/SqMH/EACUx42nN1jKurA3rxwD6sUs872QkauJ5keZRfMwBkgFF4fqgFZ/9YVGa+/k+54Z9FhA
 V41QuZPWsYzP2XGR6UIT7q30hteiU6QTME7dqzqM5eh6ks+AQMRzE1UelQE2hASKfsZuXj3ZXV8
 D96Up9g31rCr4JB32QXjh0Wm9n2bf9m0QQBb8I0zKSKdVEviGvr82oWqqmaLaIHy2exNC7E+Xg2
 ie5J0jUeoM3RjOZj9UELwj5jk2
X-Google-Smtp-Source: AGHT+IHvMJJ3xzCR/54Dn2eQdkekqZl14RRsMO7sNvR67shsubmVOdgMa88LZL8PBSGvgiyRwogTbA==
X-Received: by 2002:a05:6000:18ac:b0:3a4:f6fe:5244 with SMTP id
 ffacd0b85a97d-3a572367b13mr3017034f8f.12.1749911075633; 
 Sat, 14 Jun 2025 07:24:35 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b4cc7bsm5236878f8f.86.2025.06.14.07.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jun 2025 07:24:35 -0700 (PDT)
Message-ID: <8c5e9527-cbf7-49c0-a933-0949d137dc34@smile.fr>
Date: Sat, 14 Jun 2025 16:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dick Olsson <hi@senzilla.io>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
Content-Language: fr, en-US
In-Reply-To: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749911076; x=1750515876; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vi85IUfbNHm7dYothD6OX43gkp6/LmLYwhOhkkDEcTM=;
 b=xbW5i0n0EpDGdCPp3l9yI4VSD+P2VXeWrOQhnsX39kYICxeX+1zKKPqOTpeKCVO1ap
 cTMnzzqDkQX+bCAVJ9idVnNTg75xrYuSe0mYlLbKeteK5UCKh9WDq/360sNPbiFpuf6i
 DvVKmjyhwhnULkgjIvzWxrleOJsAlrhYK78WE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=xbW5i0n0
Subject: Re: [Buildroot] [PATCH v2 0/9] LoongArch64 initial support
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

SGVsbG8gSmlheHVuLCBBbGwsCgpMZSAwNy8wNi8yMDI1IMOgIDIwOjEyLCBKaWF4dW4gWWFuZyBh
IMOpY3JpdMKgOgo+IEhpIGFsbCwKPiAKPiBUaGlzIHNlcmllcyBlbmFibGVkIExvb25nQXJjaDY0
IHN1cHBvcnQgdG8gYnVpbGRyb290Lgo+IAo+IEl0IGFkZGVkIExvb25nQXJjaCBiaXRzIHRvIHRv
b2xjaGFpbiBhbmQga2VybmVsICYgZ3J1YiBwYWNrYWdlcwo+IGFuZCB0aGVuIGludHJvZHVjZWQg
bmV3IGxvb25nYXJjaDY0LWVmaSBib2FyZCBhcyBhIGdlbmVyaWMgdGFyZ2V0LgoKSW4gYWRkaXRp
b24gdG8gdGhpcyBwYXRjaCBzZXJpZXMsIHlvdSBtYXkgd2FudCB0byBlbmFibGUgbG9vbmdhcmNo
NjQgc3VwcG9ydCBmb3IKdXRpbHMvdGVzdC1wa2cgc2NyaXB0IHRvIGVuYWJsZSBuZXcgcGFja2Fn
ZSB0ZXN0aW5nLgoKU2VlIGFyY2gtaW50ZXJuYWwtZ2xpYmMgY29uZmlnIGZpbGUgYXMgZXhhbXBs
ZToKJCBjYXQgc3VwcG9ydC9jb25maWctZnJhZ21lbnRzL2F1dG9idWlsZC9ici1hcmMtaW50ZXJu
YWwtZ2xpYmMuY29uZmlnCkJSMl9hcmNsZT15CkJSMl9hcmNoczM4PXkKQlIyX1RPT0xDSEFJTl9C
VUlMRFJPT1RfR0xJQkM9eQpCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9DWFg9eQoKQ2FuIHlvdSBl
eHBsYWluIGhvdyB0aGUgTG9vbmdBcmNoNjQgaW5pdGlhbCBzdXBwb3J0IHdhcyB0ZXN0ZWQgKHdo
aWNoIHBhY2thZ2VzCmhhdmUgYmVlbiBlbmFibGVkKT8KV2hhdCBhYm91dCB0aGUgRGViaWFuIG9y
IFlvY3RvIGxvb25nYXJjaCBzdXBwb3J0PwoKVGhlcmUgYXJlIG1hbnkgcGFja2FnZXMgd2l0aCBh
cmNoIHNwZWNpZmljIGFyY2hpdGVjdHVyZSBzdXBwb3J0IHRoYXQgbWF5IGJyZWFrCndpdGggbmV3
Y29tZXJzLgoKQ2FuIHlvdSBhbHNvIGhhdmUgYSBsb29rIHRvIEJSMl9QQUNLQUdFX3twYWNrYWdl
fV9BUkNIX1NVUFBPUlRTIG9wdGlvbiB0byBhZGQKQlIyX2xvb25nYXJjaDY0IHdoZW4gaXQncyBz
dXBwb3J0ZWQ/CkZvciBleGFtcGxlOiBCUjJfUEFDS0FHRV9TWVNURU1EX0FSQ0hfU1VQUE9SVFMK
CkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBQbGVhc2UgcmV2aWV3Lgo+IFRoYW5rcyEKPiAK
PiAtLS0KPiBTb3JyeSBmb3IgdGFraW5nIHNvIGxvbmcgdG8gZ2V0IGJhY2ssIEkgd2FzIHRyYXBw
ZWQgYnkgRURLMiBidWlsZAo+IHdoZW4gSSB3YXMgbWFraW5nIGluaXRpYWwgcmV2ZXJzaW9uIGFu
ZCBldmVudHVhbGx5IGxvc3QgdHJhY2suCj4gCj4gdjIgQWRkcmVzc2VkIG1vc3QgY29tbWVudHMg
aW4gdjEuCj4gCj4gVG86IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gQ2M6IEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IENjOiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gQ2M6IFRob21hcyBQZXRhenpvbmkgPHRo
b21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gQ2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxs
YS5pbz4KPiBTaWduZWQtb2ZmLWJ5OiBKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5j
b20+Cj4gCj4gLS0tCj4gSmlheHVuIFlhbmcgKDkpOgo+ICAgICAgIHBhY2thZ2UvZ2NjOiBJbnRy
b2R1Y2UgQlIyX0dDQ19UQVJHRVRfU0lNRCBvcHRpb24KPiAgICAgICBhcmNoOiBJbnRyb2R1Y2Ug
TG9vbmdBcmNoNjQKPiAgICAgICBwYWNrYWdlL2dsaWJjOiBFbmFibGUgTG9vbmdBcmNoNjQgc3Vw
cG9ydAo+ICAgICAgIHBhY2thZ2UvbXVzbDogRW5hYmxlIExvb25nQXJjaDY0IHN1cHBvcnQKPiAg
ICAgICBsaW51eDogSW50cm9kdWNlIHt2bWxpbnV4LCB2bWxpbnV6fS5lZmkga2VybmVsIGJpbmFy
eSBmb3JtYXQKPiAgICAgICBib290L2dydWIyOiBJbnRyb2R1Y2UgbG9vbmdhcmNoNjQtZWZpIHRh
cmdldAo+ICAgICAgIGJvYXJkL2xvb25nYXJjaDY0LWVmaTogSW50cm9kdWNlIHRoZSBuZXcgYm9h
cmQKPiAgICAgICBib290L2VkazI6IEFkZCBMb29uZ0FyY2g2NCBPVk1GIHN1cHBvcnQKPiAgICAg
ICBib2FyZC9xZW11OiBBZGQgbG9vbmdhcmNoNjQtdmlydC1lZmkgdmFyaWFudAo+IAo+ICBERVZF
TE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArKwo+
ICBhcmNoL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
OSArKysKPiAgYXJjaC9Db25maWcuaW4ubG9vbmdhcmNoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMjkgKysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvYXJjaC5tayAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgYm9hcmQvbG9vbmdhcmNoNjQt
ZWZpL2dlbmltYWdlLWVmaS5jZmcgICAgICAgICAgICAgfCAgMzMgKysrKysrCj4gIGJvYXJkL2xv
b25nYXJjaDY0LWVmaS9ncnViLmNmZyAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKPiAgLi4u
L3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2ggICAgICAgfCAgIDEgKwo+
ICBib2FyZC9sb29uZ2FyY2g2NC1lZmkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoICAgICB8ICAg
MiArCj4gIGJvYXJkL2xvb25nYXJjaDY0LWVmaS9wb3N0LWltYWdlLnNoICAgICAgICAgICAgICAg
IHwgICA1ICsKPiAgYm9hcmQvbG9vbmdhcmNoNjQtZWZpL3JlYWRtZS50eHQgICAgICAgICAgICAg
ICAgICAgfCAgMzQgKysrKysrCj4gIGJvYXJkL3FlbXUvbG9vbmdhcmNoNjQtdmlydC1lZmkvZ2Vu
aW1hZ2UuY2ZnICAgICAgIHwgIDMzICsrKysrKwo+ICBib2FyZC9xZW11L2xvb25nYXJjaDY0LXZp
cnQtZWZpL2dydWIuY2ZnICAgICAgICAgICB8ICAgNiArCj4gIGJvYXJkL3FlbXUvbG9vbmdhcmNo
NjQtdmlydC1lZmkvcG9zdC1pbWFnZS5zaCAgICAgIHwgICA1ICsKPiAgYm9hcmQvcWVtdS9sb29u
Z2FyY2g2NC12aXJ0LWVmaS9yZWFkbWUudHh0ICAgICAgICAgfCAgMzEgKysrKysKPiAgYm9vdC9l
ZGsyL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKystCj4g
IGJvb3QvZWRrMi9lZGsyLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2
ICsKPiAgYm9vdC9ncnViMi9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMTAgKysKPiAgYm9vdC9ncnViMi9ncnViMi5tayAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDkgKysKPiAgY29uZmlncy9sb29uZ2FyY2g2NF9lZmlfZGVmY29uZmlnICAgICAg
ICAgICAgICAgICAgfCAgMjIgKysrKwo+ICBjb25maWdzL3FlbXVfbG9vbmdhcmNoNjRfdmlydF9l
ZmlfZGVmY29uZmlnICAgICAgICB8ICAyMyArKysrCj4gIGxpbnV4L0NvbmZpZy5pbiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsrCj4gIGxpbnV4L2xpbnV4Lm1rICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsKPiAgcGFja2FnZS9nY2Mv
Z2NjLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwo+ICBwYWNrYWdl
L2dsaWJjL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gIHBh
Y2thZ2UvbXVzbC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsK
PiAgdG9vbGNoYWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvQ29uZmlnLmluICAgICAgICAgICAgfCAg
IDQgKwo+ICAuLi4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsg
ICB8ICAgNCArCj4gIHRvb2xjaGFpbi90b29sY2hhaW4td3JhcHBlci5jICAgICAgICAgICAgICAg
ICAgICAgIHwgICAzICsKPiAgMjggZmlsZXMgY2hhbmdlZCwgNDI1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogNTA4MGYwYWYxNjZkMmZmZjI2ZjBjNjYx
YjBjYzdkYTBiM2VhZGRkOAo+IGNoYW5nZS1pZDogMjAyNTA2MDctbG9vbmdhcmNoLThhYmU4ODI1
ODI0Mgo+IAo+IEJlc3QgcmVnYXJkcywKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
