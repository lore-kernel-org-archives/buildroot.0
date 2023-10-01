Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076CCE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 13:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0C7B40AF4;
	Sun,  1 Oct 2023 13:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0C7B40AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id snetJtwRdsIs; Sun,  1 Oct 2023 13:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2F87402E4;
	Sun,  1 Oct 2023 13:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2F87402E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3A541BF39F
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 13:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BA0641B37
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 13:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA0641B37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jp45k1BwBdaa for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 13:11:55 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40E0841A43
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 13:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40E0841A43
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9a648f9d8e3so2246057166b.1
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 06:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696165913; x=1696770713;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XBmPzW05z1fL33QWeCmW92mD8F+afS9PpsHuotISBMc=;
 b=RR8MHNV7HGNIpY410Nf7guJ6H9hE42A2ZDMG6jz1LAHQEqj/VBdon2H8Oer0O5Y501
 EweoPJcqUOSgkQZ14P8shqQR8NKeZQJTs2/77kgfe8Bo2RWPwGqZITARRMOdkY7dLsjw
 K/nL4u0pto/HO0N8Bi3yjPJ1UAEdcliUU5spfosDYuEiLNxVVnHtmuC3XP8643AzQNnx
 s8fgwQK0/Y4fQMY3cbtXlmRhepwKS6l1h9lBJC5EkMgmPyAK7skgyXiin6uRcSk2ZhYF
 9mc1uZFF0Dki59kpAXCkwAQ/jJG8PWszHLldc00FYpCckuWn52OSOlxC/sKgEFzdaK0/
 FCEQ==
X-Gm-Message-State: AOJu0Yy/k0GU/tGWuLeNsSX5qxinLDsT1N/LvtEJl7p2fIGfRq5jG+1r
 yJHYdPA4RL/WjKA5ZyGGEzE7vQ==
X-Google-Smtp-Source: AGHT+IGsxDJ9s/NuhTXieq0pD12rn3PEsFlw/tOXFA1UJX9saVX0Ox73etHdJ6t/hdXomgem/fhVbg==
X-Received: by 2002:a17:907:7712:b0:9a5:7759:19c0 with SMTP id
 kw18-20020a170907771200b009a5775919c0mr8238264ejc.64.1696165913264; 
 Sun, 01 Oct 2023 06:11:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b004065d72ab19sm5210768wms.0.2023.10.01.06.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 06:11:52 -0700 (PDT)
Message-ID: <30d37b76-9de3-6726-2b94-25f2c9dfb1f9@smile.fr>
Date: Sun, 1 Oct 2023 15:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: fr, en-US
To: Frank Hunleth <fhunleth@troodon-software.com>, buildroot@buildroot.org
References: <20221212153705.1807269-1-fhunleth@troodon-software.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20221212153705.1807269-1-fhunleth@troodon-software.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696165913; x=1696770713;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XBmPzW05z1fL33QWeCmW92mD8F+afS9PpsHuotISBMc=;
 b=tv38BWaGDg1tRP3IRIvXdX4T/odXemD5K2uzvvmh+UZDgjktFGr6lewon4KR+wKp7a
 uGxDeAenY4M4rAnuff5hKbon6doOq2SWLKNaNwxPmNf6k3DTNKtD/x1l8LgJAuGYiVZd
 UZBl7oC1xzGxYH3pasPT7KKcOhabY5BogN/NtVT9BQhMVI9ELyqQFuuDfFcIRJGA8J1d
 1RBT2tGP7b3JpZH++HywwJQWqOTNgga9sWEl3Apvqjx91Cn0FEqPnVNOvooDnOVEBnjw
 iZPFVwhO+jkRX8PakDWj7xzq4MES9Uqb4U096Yrz1I0DdDQKp2igslbEjc0mN7e/HHJX
 rutw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=tv38BWaG
Subject: Re: [Buildroot] [PATCH 1/1] toolchain-external: refine support
 library search to lib directory
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbmssCgpMZSAxMi8xMi8yMDIyIMOgIDE2OjM3LCBGcmFuayBIdW5sZXRoIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGlzIGZpeGVzIGFuIGlzc3VlIHdoZXJlIGdjYyBzdXBw
b3J0IGxpYnJhcmllcyBsaWtlIGxpYnN0ZGMrKy5zbyBhbmQKPiBsaWJhdG9taWMuc28gd2VyZSBu
b3QgY29waWVkIHRvIHRoZSB0YXJnZXQgZm9yIGEgQ3Jvc3N0b29sLU5HIFJJU0MtVgo+IGdsaWJj
IHRvb2xjaGFpbi4KPiAKPiBUaGUgQ3Jvc3N0b29sLU5HJ3MgdG9vbGNoYWluJ3Mgc3lzcm9vdCBs
b29rcyBsaWtlIHRoaXMgKHRyaW1tZWQpOgo+IAo+IHN5c3Jvb3QKPiDilJzilIDilIAgbGliCj4g
4pSCwqDCoCDilJzilIDilIAgbGQtbGludXgtcmlzY3Y2NC1scDY0ZC5zby4xCj4g4pSCwqDCoCDi
lJzilIDilIAgbGliYXRvbWljLmEKPiDilILCoMKgIOKUnOKUgOKUgCBsaWJhdG9taWMuc28gLT4g
bGliYXRvbWljLnNvLjEuMi4wCj4g4pSCwqDCoCDilJzilIDilIAgbGliYXRvbWljLnNvLjEgLT4g
bGliYXRvbWljLnNvLjEuMi4wCj4g4pSCwqDCoCDilJzilIDilIAgbGliYXRvbWljLnNvLjEuMi4w
Cj4g4pSCwqDCoCDilJzilIDilIAgbGliZ2NjX3Muc28KPiDilILCoMKgIOKUnOKUgOKUgCBsaWJn
Y2Nfcy5zby4xCj4g4pSCwqDCoCDilJzilIDilIAgbGlic3RkYysrLmEKPiDilILCoMKgIOKUnOKU
gOKUgCBsaWJzdGRjKysuc28gLT4gbGlic3RkYysrLnNvLjYuMC4yOQo+IOKUgsKgwqAg4pSc4pSA
4pSAIGxpYnN0ZGMrKy5zby42IC0+IGxpYnN0ZGMrKy5zby42LjAuMjkKPiDilILCoMKgIOKUnOKU
gOKUgCBsaWJzdGRjKysuc28uNi4wLjI5Cj4g4pSCwqDCoCDilJTilIDilIAgbGlic3VwYysrLmEK
PiDilJzilIDilIAgbGliNjQKPiDilILCoMKgIOKUlOKUgOKUgCBscDY0ZAo+IOKUgsKgwqAgICAg
IOKUnOKUgOKUgCBsaWJhbmwuc28uMQo+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBsaWJjLnNvLjYK
PiDilILCoMKgICAgICDilJzilIDilIAgbGliZGwuc28uMgo+IOKUgsKgwqAgICAgIOKUnOKUgOKU
gCBsaWJtLnNvLjYKPiDilILCoMKgICAgICDilJzilIDilIAgbGlibnNsLnNvLjEKPiDilILCoMKg
ICAgICDilJzilIDilIAgbGlicHRocmVhZC5zby4wCj4g4pSCwqDCoCAgICAg4pSc4pSA4pSAIGxp
YnJlc29sdi5zby4yCj4g4pSCwqDCoCAgICAg4pSc4pSA4pSAIGxpYnJ0LnNvLjEKPiDilILCoMKg
ICAgICDilJzilIDilIAgbGlidGhyZWFkX2RiLnNvLjEKPiDilILCoMKgICAgICDilJTilIDilIAg
bGlidXRpbC5zby4xCj4gCj4gV2l0aG91dCB0aGlzIHBhdGNoLCBvbmx5IHRoZSBmaWxlcyBpbiBg
bGliNjQvbHA2NGRgIGFyZSBjb3BpZWQgdG8gdGhlCj4gdGFyZ2V0IHNpbmNlIHRoaXMgaXMgdGhl
ICRBUkNIX0xJQl9ESVIuICRTVVBQT1JUX0xJQl9ESVIgaXMgZW1wdHkgc2luY2UKPiBsaWJzdGRj
KysuYSBpcyBpbiB0aGUgc3lzcm9vdC4gSXQncyBqdXN0IG5vdCB1bmRlciAkQVJDSF9MSUJfRElS
Lgo+IAo+IEJhc2VkIG9uIHRoZSBjb21tZW50cywgaXQgbG9va3MgbGlrZSAkU1VQUE9SVF9MSUJf
RElSIHdhcyBpbnRlbmRlZCBmb3IKPiB0aGUgY2FzZSB3aGVuIHRoZSBzdXBwb3J0IGxpYnJhcmll
cyB3ZXJlIHNvbWV3aGVyZSBjb21wbGV0ZWx5IG91dHNpZGUgb2YKPiB0aGUgc3lzcm9vdC4gQW55
d2hlcmUgb3V0c2lkZSBvZiAkQVJDSF9MSUJfRElSIHdvdWxkIHNlZW0gdG8gaGF2ZSB0aGUKPiBz
YW1lIGVmZmVjdCBvZiBiZWluZyBtaXNzZWQgYnkgdGhlIGNvcHksIHRob3VnaC4KPiAKPiBTZWUg
dGhlIGZvbGxvd2luZyBsaW5rIGZvciB0aGUgUklTQy1WIENyb3NzdG9vbC1ORyBjb25maWd1cmF0
aW9uOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9jcm9zc3Rvb2wtbmcvY3Jvc3N0b29sLW5nL2Jsb2Iv
N2Y4MDQ0N2M1ZjY2ZjU4OGU1N2ViM2RhMDg3YjI3ZWIyYjBjOGVlYy9zYW1wbGVzL3Jpc2N2NjQt
dW5rbm93bi1saW51eC1nbnUvY3Jvc3N0b29sLmNvbmZpZwo+IAo+IFNpZ25lZC1vZmYtYnk6IEZy
YW5rIEh1bmxldGggPGZodW5sZXRoQHRyb29kb24tc29mdHdhcmUuY29tPgo+IC0tLQo+ICB0b29s
Y2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0
ZXJuYWwubWsgYi90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0
ZXJuYWwubWsKPiBpbmRleCAyOTliNjAwOGFhLi40MDcwY2ZkYzFmIDEwMDY0NAo+IC0tLSBhL3Rv
b2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tawo+ICsr
KyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5t
awo+IEBAIC00MzUsNyArNDM1LDcgQEAgZGVmaW5lIFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxM
X1NZU1JPT1RfTElCUwo+ICAJQVJDSF9TWVNST09UX0RJUj0iJChjYWxsIHRvb2xjaGFpbl9maW5k
X3N5c3Jvb3QsJChUT09MQ0hBSU5fRVhURVJOQUxfQ0MpICQoVE9PTENIQUlOX0VYVEVSTkFMX0NG
TEFHUykpIiA7IFwKQVJDSF9TWVNST09UX0RJUiBzaG91bGQgYmUgYSBmdWxsIHBhdGggbGlrZQoK
LzwuLi4+L2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYWFyY2g2NC1ub25lLWxpbnV4LWdudS9saWJj
LwoKPiAgCUFSQ0hfTElCX0RJUj0iJChjYWxsIHRvb2xjaGFpbl9maW5kX2xpYmRpciwkKFRPT0xD
SEFJTl9FWFRFUk5BTF9DQykgJChUT09MQ0hBSU5fRVhURVJOQUxfQ0ZMQUdTKSkiIDsgXAoKQVJD
SF9MSUJfRElSIGlzIGp1c3QgdGhlIG5hbWUgb2YgdGhlIGxpYiBkaXJlY3RvcnkgKGxpYjY0IG9y
IGxpYikKCmxpYjY0Cgo+ICAJU1VQUE9SVF9MSUJfRElSPSIiIDsgXAo+IC0JaWYgdGVzdCBgZmlu
ZCAkJHtBUkNIX1NZU1JPT1RfRElSfSAtbmFtZSAnbGlic3RkYysrLmEnIHwgd2MgLWxgIC1lcSAw
IDsgdGhlbiBcCj4gKwlpZiB0ZXN0IGBmaW5kICQke0FSQ0hfTElCX0RJUn0gLW5hbWUgJ2xpYnN0
ZGMrKy5hJyB8IHdjIC1sYCAtZXEgMCA7IHRoZW4gXAoKU28gaW4gdGhpcyBjb250ZXh0LCB0aGlz
IGNoYW5nZSBzZWVtcyBub3QgY29ycmVjdCAoaXQgcHJvYmFibHkgYnJlYWtzIG90aGVyCnRvb2xj
aGFpbnMpLgoKQ2FuIHlvdSBkb3VibGUgY2hlY2s/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
IAkJTElCU1REQ1BQX0FfTE9DQVRJT049JCQoTEFORz1DICQoVE9PTENIQUlOX0VYVEVSTkFMX0ND
KSAkKFRPT0xDSEFJTl9FWFRFUk5BTF9DRkxBR1MpIC1wcmludC1maWxlLW5hbWU9bGlic3RkYysr
LmEpIDsgXAo+ICAJCWlmIFsgLWUgIiQke0xJQlNURENQUF9BX0xPQ0FUSU9OfSIgXTsgdGhlbiBc
Cj4gIAkJCVNVUFBPUlRfTElCX0RJUj1gcmVhZGxpbmsgLWYgJCR7TElCU1REQ1BQX0FfTE9DQVRJ
T059IHwgc2VkIC1yIC1lICdzOmxpYnN0ZGNcK1wrXC5hOjonYCA7IFwKPiAtLQo+IDIuMzQuMQo+
IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
