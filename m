Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43955C71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 10:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED31F408C8;
	Sat, 14 Jun 2025 10:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loI0m971DcBb; Sat, 14 Jun 2025 10:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B0A7408B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B0A7408B9;
	Sat, 14 Jun 2025 10:59:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCDE2177
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 10:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3014408B9
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 10:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ty9P4inuXJGl for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 10:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B856C4079F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B856C4079F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B856C4079F
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 10:59:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9055E19F72F;
 Sat, 14 Jun 2025 12:59:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Jun 2025 12:59:09 +0200
MIME-Version: 1.0
Date: Sat, 14 Jun 2025 12:59:09 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <20250611111640.702572-5-alex.bennee@linaro.org>
References: <20250611111640.702572-1-alex.bennee@linaro.org>
 <20250611111640.702572-5-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <39b12258dcb1ac7768d0579bb80647f0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749898752;
 bh=aIf1EWixBzUBiJ2tOMWSd72BNN+GdjvnWVdhGRVVsJM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E36YNROBj9L0Gsg/J95ITg+wBkzmMqJarQHYvOAzzzuKShNr+cZCKysJyIhcr+R7D
 qPo6jOCaYOJVQwunbUbqQK45YPxR4cuuZ2j64uAixtEDPdYhpBnBjBJ3S1dtGAhRhT
 v7hj+9FNY0iQxZ91LoKbtBP3cztsa7R5R6uNNTxyQkMqDTJ54CKGB9zhxZQPicWr80
 X8muI/ywjg/3ELfE/VDmHGAaWkxwXLCEp9ir+JQcNxiDfryi/11nSHjSyI54DYcLsr
 fD0ny6z/W2Z8fqGMcOckaLs/Pqdr5lND6dcwwO4MJzyA5DgvXRInkGtvQLLC1UiWde
 wbzGkARSNNCwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E36YNROB
Subject: Re: [Buildroot] [PATCH v6 4/5] package/vkmark: add vkmark
 benchmarking tool
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoISAgSSBoYXZlIGZldyBjb21tZW50cywgc2Vl
IGJlbG93LgoKT24gMTEvMDYvMjAyNSAxMzoxNiwgQWxleCBCZW5uw6llIHdyb3RlOgo+IFdlIGJ1
aWxkIGZyb20gYSByZWNlbnQgSEVBRCB0byBlbnN1cmUgd2UgaGF2ZSB0aGUgZml4ZXMgdG8gYmV0
dGVyCj4gaGFuZGxlIHRoZSBtaXNzaW5nIEtIUl9kaXNwbGF5IGV4dGVuc2lvbi4KClRyeWluZyB0
byBjb21waWxlIG9uIGEgaG9zdCB3aXRob3V0IHRoZSBmaWxlCi91c3Ivc2hhcmUvdnVsa2FuL3Jl
Z2lzdHJ5L3ZrLnhtbApvciBydW5uaW5nIHRoZSBydW50aW1lIHRlc3QgaW4gdGhlIGRvY2tlciBy
ZWZlcmVuY2UgaW1hZ2UgaXMgc3RpbGwKZmFpbGluZy4KClRoZSByb290IGNhdXNlIHNlZW1zIHRv
IHN0aWxsIGJlOgpodHRwczovL2dpdGh1Yi5jb20vdmttYXJrL3ZrbWFyay9pc3N1ZXMvNzUKClRo
ZXJlIGlzIGFsc28gdGhlIGZvbGxvd2luZyBvcGVuZWQgUFI6Cmh0dHBzOi8vZ2l0aHViLmNvbS92
a21hcmsvdmttYXJrL3B1bGwvNzYKCm1heWJlIHRob3NlIHBhdGNoZXMgY291bGQgYmUgYWRkZWQg
aW4gdGhpcyBuZXcgcGFja2FnZSBpbnRyb2R1Y3Rpb24sCmluIHRoZSBtZWFudGltZSB0aGlzIGdl
dHMgcmVzb2x2ZWQgdXBzdHJlYW0/Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPiAKPiAtLS0KClsuLi5dCgo+IGRpZmYgLS1naXQgYS8u
Y2hlY2twYWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+IGluZGV4IDVjYmJiZDM4
YmEuLjJmOGY3MTdhZWMgMTAwNjQ0Cj4gLS0tIGEvLmNoZWNrcGFja2FnZWlnbm9yZQo+ICsrKyBi
Ly5jaGVja3BhY2thZ2VpZ25vcmUKPiBAQCAtMTIwMyw2ICsxMjAzLDggQEAgCj4gcGFja2FnZS92
YWxncmluZC8wMDAxLXdvcmthcm91bmQtU0lHU0VHVi1vbi1QUEMucGF0Y2ggCj4gbGliX3BhdGNo
LlVwc3RyZWFtCj4gIAo+IHBhY2thZ2UvdmFsZ3JpbmQvMDAwMi1EZWZpbmUtUFRSQUNFX0dFVFNJ
R0lORk8tb24tUG93ZXJQQy13aGVuLW5vdC1hdmFpbGFiLnBhdGNoIAo+IGxpYl9wYXRjaC5VcHN0
cmVhbQo+ICAKPiBwYWNrYWdlL3Zib290LXV0aWxzLzAwMDEtQWRkLW1pc3NpbmctZGVmaW5pdGlv
bi1vZi1NVERfQ0hBUl9NQUpPUi5wYXRjaCAKPiBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2Fn
ZS92ZHIvMDAwMS1nZXRsb2FkYXZnLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICtwYWNrYWdl
L3ZrbWFyay8wMDAxLW1lc29uLXJlcGxhY2UtZGVwcmVjYXRlZC1nZXRfcGtnY29uZmlnX3Zhcmlh
YmxlLnBhdGNoIAo+IGxpYl9wYXRjaC5OdW1iZXJlZFN1YmplY3QgbGliX3BhdGNoLlVwc3RyZWFt
Cj4gK3BhY2thZ2UvdmttYXJrLzAwMDItbWVzb24tZml4LWNyb3NzLWNvbXBpbGF0aW9uLTUwLTc1
LnBhdGNoIAo+IGxpYl9wYXRjaC5OdW1iZXJlZFN1YmplY3QgbGliX3BhdGNoLlVwc3RyZWFtCgpJ
bnN0ZWFkIG9mIGFkZGluZyBleGNlcHRpb24gaGVyZSwgY291bGQgeW91IG1ha2Ugc3VyZSB0aGUg
cGF0Y2hlcyBmaWxlcwphcmUgcHJvcGVybHkgZm9ybWF0dGVkLCBwbGVhc2U/IFNlZToKaHR0cHM6
Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjX3dpdGhpbl9idWls
ZHJvb3QKCj4gIAo+IHBhY2thZ2UvdmxjLzAwMDEtRGlzYWJsZS1idWlsZGluZy1vZi1zdGF0aWNh
bGx5LWxpbmtlZC12bGMtYmluYXJ5LnBhdGNoIAo+IGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNr
YWdlL3ZsYy8wMDAyLWF1dG9tYWtlLWFkZC1zdWJkaXItb2JqZWN0cy1vcHRpb24ucGF0Y2ggCj4g
bGliX3BhdGNoLlVwc3RyZWFtCj4gIHBhY2thZ2UvdmxjLzAwMDMtYnVpbGQtdXNlLXBrZy1jb25m
aWctdG8tZ2V0LXRyZW1vci1saWJzLnBhdGNoIAo+IGxpYl9wYXRjaC5VcHN0cmVhbQoKQ291bGQg
eW91IHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBmaXhpbmcgdGhvc2UgaXNzdWVzIHBsZWFzZT8KCkJl
c3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
