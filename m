Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1576CC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 13:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C40A8606DF;
	Sun,  5 Jul 2026 13:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_2xhR3zIe38; Sun,  5 Jul 2026 13:13:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE364606E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783257209;
	bh=HpOhgseuwrW8aTp0ANCmxBG4jTe8yDPYsdi/693RhAY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kSglEXH/VvSy70MwxQ0I69wZmvTDbvHGPg768jGAuFOZ4TjNMxHue/bC1g3JG4reP
	 0zZGSZ5/KTxBBpJvBdNHpI9vV4wlmD2/+KExwMjtygXoHghmPBz/j2qFJWTtXuq3u1
	 eZks+ozHIuklIqBC9KPSro46djn4x6AJi/tge8fo/tPfLpbEscx8KStyW5+5Oq0gAF
	 HMRra69e0BMIEcJ+xaXezDAATWsih8qhCPrZH+qIaMTfl5/h+pW6d+X9zANXCzeqi2
	 xjBUdyGIDZfXtuQ6ODUdSDvPtbOys1yB0AceVGc7+veo6DxCfzk5Puan9bjhp78w4g
	 52h3bVlz006rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE364606E3;
	Sun,  5 Jul 2026 13:13:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5788B2A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 13:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48E43406A9
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 13:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id homClwrxFf4j for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 13:13:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2071240681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2071240681
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2071240681
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 13:13:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-493d28b1930so13002825e9.0
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 06:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783257204; x=1783862004;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KD7/ewfS4nah6MUhn0SClvqLjl8ggmmLIYAx44+TPMM=;
 b=pSyVDII6mkgSDcuYvW3RPMh3i8pilTRONBhbeFsHzNvdIJ55QvGitr8uCmnik4iczC
 qIHS6VggHCb/bytEwBq5Nwyi1f9Cfifxn5DnvOs8/VXF+/0gT/v3kzgMiMzy1VmT0yOo
 GDUZhwZIoUlnLW+6xOk/unYKPfVfX0o58oyRLgOpGKVLesew3xotiZXIC3J0f0zSL8Tr
 /+vnue8B1tZ7Tg062sTjXpQvCO06OLjNZSo7LhaI/9iU50AOQ1Mszx+CH4YXJU3r51fM
 BOViR/GBQUn4yskyBbv2c9WQlf/IuGEZVoizIBDP0u5oXy8pavtJw5PxnkO6OiMpnanD
 IiRQ==
X-Gm-Message-State: AOJu0YwTBqYnjh7zVO9wapLtG5GoIjMGCdbEze1P7in7rlYpfjrNUNgq
 yLC6LpejnVDOs06vusbRfyhQi/1zZfqrN+tihfoNmN4jZIHm56gG4jLR12/YfOZqp+w=
X-Gm-Gg: AfdE7cnRZIXSemw66oyyI4o8r6ZyKoXvonBlJsT2SrX6ume1l00eXLuTg8WTIZ/3iaj
 s3QzCZwBo4aPi41MYz1Vgj5SJ7iL2dT/bDdIB4D7QQCw7/mBlzH4SKUHwWeagbwX8IpmLjCXo16
 6hQYykdZfCOVjkS1eGwwkNlXFvYqlUaEprpFtucuANpH+YpfptWb1fnrbcT7w/wiouF4kvM+UWU
 UFhua4L38OYMOdhOLNkDiwJA4H2rEFuq77LlDenr2x/cVdHWHEojWD8WmN3zllwCVZR9DbOLAeE
 qfGpndujVBU4clVydlj79sUpp0mmfe5aGotsbVWnTa9NbIfaNefYSGiUmcKCmhAKF3oTk3kAQM2
 2cUYdGvpCWB8iflvqtRcVZHbwu/0wCcfOO9Fr0vZ4XUaV3YDgbUj5LiCHoY8ljHbnKminOjaGtg
 Wvi5HV0lfdlXOi/Jc5abxM5xxhS/NArO9ucWdm3cq4s1Pl5HLWMqnEU6X1LV0ylJdO18eO5oU88
 P/Ae6S32ekLxYYE0j++2MxaOG/HGu1APjuo/EN0ntqqidbbwVoXAgqnl0fsUQa6OQ==
X-Received: by 2002:a05:600c:46c9:b0:490:e19b:bd99 with SMTP id
 5b1f17b1804b1-493d11faa18mr62676485e9.30.1783257203655; 
 Sun, 05 Jul 2026 06:13:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:5e89:44d0:fdb4:16c6?
 (2a01cb0594a2a2005e8944d0fdb416c6.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:5e89:44d0:fdb4:16c6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bfe7427dsm213197025e9.2.2026.07.05.06.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2026 06:13:23 -0700 (PDT)
Message-ID: <8f10f165-d52b-4bee-9690-8fb72f10ebfd@smile.fr>
Date: Sun, 5 Jul 2026 15:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>,
 Andreas Ziegler <br025@umbiko.net>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Guenther Harrasser <Guenther.Harrasser@mobileye.com>,
 Chris Packham <judge.packham@gmail.com>
References: <20260212110116.2451538-1-jimmy.wesolowski@mobileye.com>
 <20260311173338.167112-1-jimmy.wesolowski@mobileye.com>
 <0692703c261f86d7f708093b729ec3a8@umbiko.net>
 <DB9PR09MB4987B815ED04AC03B664F8B1F644A@DB9PR09MB4987.eurprd09.prod.outlook.com>
Content-Language: fr
In-Reply-To: <DB9PR09MB4987B815ED04AC03B664F8B1F644A@DB9PR09MB4987.eurprd09.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783257204; x=1783862004; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KD7/ewfS4nah6MUhn0SClvqLjl8ggmmLIYAx44+TPMM=;
 b=vsE8/VajUCk95Regluf31fNGKJdjYcz3/3XS8TEh0xUHGUqSkAncNBFehTJTJBMLcz
 NgF3ULLYRWl5UVBi7j7YVYIhoi419unUsRVqk2TcLQC/FHsZb5m+6aY2X1RuViOC5mva
 EJEwT8gIvHzvpPticqKsS6ylQ8UmtgOpitlsA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=vsE8/Vaj
Subject: Re: [Buildroot] [PATCH v4] package/coremark: use USE_PTHREAD when
 possible, allow custom CFLAGS
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

SGVsbG8gSmltbXksIEFuZHJlYXMsIEFsbCwKCkxlIDEyLzAzLzIwMjYgw6AgMDk6MTQsIEppbW15
IFdlc29sb3dza2kgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IEhpIEFuZHJlYXMsIEFMTCwK
PiAKPiAKPiBJIGFtIHNvcnJ5IGluZGVlZC4KPiBJIHJlYWxpemVkIHRoYXQgaGF2aW5nIHRoZSBg
LWxwdGhyZWFkYCBpbiB0aGUgY3VzdG9tIGZsYWdzIGRpZCBub3QgbWFrZSBzZW5zZSwgc2luY2UK
PiB0aGUgYC1EVVNFX1BUSFJFQURgIGlzIGFkZGVkIGF1dG9tYXRpY2FsbHkuCj4gSSBob3BlIGl0
IGlzIHRoZSBsYXN0IGNoYW5nZSBmb3IgdGhpcyBwYXRjaCEKCldpdGhvdXQgc2V0dGluZyAtRE1V
TFRJVEhSRUFEIHRvIGEgdmFsdWUgb3RoZXIgdGhhdCAxLCBzZXR0aW5nIG9uZSBvZiB0aGUgZmxh
ZwpVU0VfRk9SSywgVVNFX1NPQ0tFVCwgVVNFX1BUUkVBRCBpcyBtb290LgoKU2luY2UgdGhlIGNv
cmVtYXJrIGJ1aWxkIHN5c3RlbSBpcyAic3BlY2lhbCIsIEkgd291bGQgYXZvaWQgYW55IHVzZXIg
Y3VzdG9tIGZsYWcKYW5kIGludHJvZHVjZSBhIGNob2ljZSBpbiB0aGUgbWVudWNvbmZpZy4KCkkn
bGwgbWFyayB0aGlzIHBhdGNoICJDaGFuZ2VzIHJlcXVlc3RlZCIgaW4gcGF0Y2h3b3JrLgoKQmVz
dCByZWdhcmRzLApSb21haW4KCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBGcm9tOiBBbmRyZWFzIFppZWdsZXIgPGJyMDI1
QHVtYmlrby5uZXQ+Cj4gU2VudDogMTIgTWFyY2ggMjAyNiAwODoxMQo+IFRvOiBKaW1teSBXZXNv
bG93c2tpCj4gQ2M6IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnOyBHdWVudGhlciBIYXJyYXNzZXI7
IENocmlzIFBhY2toYW0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0XSBwYWNrYWdlL2NvcmVtYXJr
OiB1c2UgVVNFX1BUSFJFQUQgd2hlbiBwb3NzaWJsZSwgYWxsb3cgY3VzdG9tIENGTEFHUwo+IAo+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgYW55IGxpbmtzIG9yIG9wZW4gYW55IGF0dGFj
aG1lbnRzIHVubGVzcyB5b3UgdHJ1c3QgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBp
cyBzYWZlLgo+IAo+IEhpIEppbW15LCBBTEwKPiAKPiBTb3JyeSBmb3IgYW5vdGhlciBpdGVyYXRp
b24gOi0oCj4gCj4gT24gMjAyNi0wMy0xMSAxNzozMywgSmltbXkgRHVyYW5kIFdlc29sb3dza2kg
d3JvdGU6Cj4+IFRoaXMgcGFzc2VzIC1EVVNFX1BUSFJFQUQgdG8gY29yZW1hcmsgQ0ZMQUdTCj4+
IEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRCBpcyBzZXQsIGFuZCBhbGxvd3MgcGFzc2luZyBhbnkg
YWRkaXRpb25hbAo+PiBjdXN0b20KPj4gb25lcyBkZWZpbmVkIGluIHRoZSBCdWlsZHJvb3QgY29u
ZmlndXJhdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmltbXkgRHVyYW5kIFdlc29sb3dza2kg
PGppbW15Lndlc29sb3dza2lAbW9iaWxleWUuY29tPgo+Pgo+PiAtLS0KPj4gQ2hhbmdlcyB2MSAt
PiB2MjoKPj4gICAtIGRvIG5vdCBhZGQgbWlwcy1pNjUwMCB0aHJvdWdoIGEgcGF0Y2gsIGJ1dCBj
b3B5IGl0IHRocm91Z2ggcnN5bmMKPj4gICAgIGluIFBPU1RfRVhUUkFDVF9IT09LUyAoc3VnZ2Vz
dGVkIGJ5Cj4+ICAgICBBbmRyZWFzIFppZWdsZXIgPGJyMDI1QHVtYmlrby5uZXQ+KQo+PiAgIC0g
YWxsb3cgc3BlY2lmeWluZyBhIHBvcnQgZGlyZWN0b3J5IHRvIHVzZSB0aHJvdWdoIGtjb25maWcs
IHN1Y2ggYXMKPj4gICAgIG1pcHMtaTY1MDAuIFRoZSBkZWZhdWx0IHN0YXlzIGxpbnV4IGZvciAz
Mi1iaXRzIGFyY2hpdGVjdHVyZSwKPj4gICAgIGxpbnV4NjQgZm9yIDY0Lgo+PiAgIC0gYWxsb3cg
cGFzc2luZyBleHRyYSBQT1JUX0NGTEFHUyB0aHJvdWdoIGtjb25maWcgIChzdWdnZXN0ZWQgYnkK
Pj4gICAgIEFuZHJlYXMgWmllZ2xlciA8YnIwMjVAdW1iaWtvLm5ldD4pCj4+Cj4+IENoYW5nZXMg
djIgLT4gdjM6Cj4+ICAgLSBkbyBub3QgaW5jbHVkZSB0aGUgbWlwcy1pNjUwMCBmaWxlcyBhcyB0
aGV5IGFyZSByZWR1bmRhbnQgd2l0aAo+PiAgICAgdGhlIGxpbnV4IHBvcnQuIChzdWdnZXN0ZWQg
YnkgQW5kcmVhcyBaaWVnbGVyIDxicjAyNUB1bWJpa28ubmV0PikKPj4gICAtIGZpeCBpbmRlbnRh
dGlvbiBpbiBDb25maWcuaW4gYW5kIGNvcmVtYXJrLm1rCj4+ICAgLSBkcm9wIHRoZSBhYmlsaXR5
IHRvIHBhc3MgY3VzdG9tIHBvcnQgKG5vIGxvbmdlciBuZWNlc3NhcnkpLgo+PiAgIC0gYWRhcHQg
dGhlIG5hbWUgYW5kIGRlc2NyaXB0aW9uIG9mIHRoZSBwYXRjaCBhY2NvcmRpbmdseS4KPj4gICAt
IGF1dGhvciBhbmQgc2lnbmVkLW9mZi1ieSByZXNldCBkdWUgdG8gcGF0Y2ggc2lnbmlmaWNhbnQg
Y2hhbmdlcy4KPj4KPj4gQ2hhbmdlcyB2MyAtPiB2NDoKPj4gICAtIGFkZCAtbHB0aHJlYWQgaW4g
Q0ZMQUdTIChzaW5jZSBvbmx5IENGTEFHUyBhcmUgdXNlZCB0byBjb21waWxlCj4+ICAgICBhbmQg
bGluaykuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppbW15IER1cmFuZCBXZXNvbG93c2tpIDxqaW1t
eS53ZXNvbG93c2tpQG1vYmlsZXllLmNvbT4KPj4gLS0tCj4+ICBwYWNrYWdlL2NvcmVtYXJrL0Nv
bmZpZy5pbiAgIHwgMTAgKysrKysrKysrKwo+PiAgcGFja2FnZS9jb3JlbWFyay9jb3JlbWFyay5t
ayB8IDE0ICsrKysrKysrKysrLS0tCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NvcmVtYXJrL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvY29yZW1hcmsvQ29uZmlnLmluCj4+IGluZGV4IGYwZTEzZWRhNjMu
LjJmM2I2Zjk1NTEgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvY29yZW1hcmsvQ29uZmlnLmluCj4+
ICsrKyBiL3BhY2thZ2UvY29yZW1hcmsvQ29uZmlnLmluCj4+IEBAIC02LDMgKzYsMTMgQEAgY29u
ZmlnIEJSMl9QQUNLQUdFX0NPUkVNQVJLCj4+ICAgICAgICAgdXNlZCBpbiBlbWJlZGRlZCBzeXN0
ZW1zCj4+Cj4+ICAgICAgICAgaHR0cHM6Ly93d3cuZWVtYmMub3JnL2NvcmVtYXJrLwo+PiArCj4+
ICtpZiBCUjJfUEFDS0FHRV9DT1JFTUFSSwo+PiArY29uZmlnIEJSMl9QQUNLQUdFX0NPUkVNQVJL
X1BPUlRfQ0ZMQUdTX0VYVFJBCj4+ICsgICAgIHN0cmluZyAiY29yZW1hcmsgcG9ydCBleHRyYSBD
RkxBR1MiCj4+ICsgICAgIGRlZmF1bHQgIiIKPj4gKyAgICAgaGVscAo+PiArICAgICAgIEFkZGl0
aW9uYWwgQ0ZMQUdTIHRvIHBhc3MgdG8gQ29yZU1hcmsgcGxhdGZvcm0gc3BlY2lmaWMgcG9ydC4K
Pj4gKyAgICAgICBBbnkgYWRkaXRpb25hbCBmbGFncyBpbmRpY2F0ZWQgaGVyZSB3aWxsIGJlIGFk
ZGVkIHRvIHRoZQo+PiArICAgICAgIENGTEFHU19QT1JUIHZhcmlhYmxlLgo+PiArZW5kaWYKPj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvY29yZW1hcmsvY29yZW1hcmsubWsKPj4gYi9wYWNrYWdlL2Nv
cmVtYXJrL2NvcmVtYXJrLm1rCj4+IGluZGV4IDllYTg2OTNlNzEuLjM4ZDhjZTk5ZWMgMTAwNjQ0
Cj4+IC0tLSBhL3BhY2thZ2UvY29yZW1hcmsvY29yZW1hcmsubWsKPj4gKysrIGIvcGFja2FnZS9j
b3JlbWFyay9jb3JlbWFyay5tawo+PiBAQCAtOSwxNCArOSwyMiBAQCBDT1JFTUFSS19TSVRFID0g
JChjYWxsCj4+IGdpdGh1YixlZW1iYyxjb3JlbWFyayx2JChDT1JFTUFSS19WRVJTSU9OKSkKPj4g
IENPUkVNQVJLX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4+ICBDT1JFTUFSS19MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRS5tZAo+Pgo+PiArQ09SRU1BUktfQ0ZMQUdTID0gXAo+PiArICAgICAkKFRBUkdF
VF9DRkxBR1MpIFwKPj4gKyAgICAgJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX0NPUkVNQVJL
X1BPUlRfQ0ZMQUdTX0VYVFJBKSkKPiAKPiBRc3RyaXAgdW5mb3J0dW5hdGVseSByZW1vdmVzIF9h
bGxfIGRvdWJsZSBxdW90ZXMgZnJvbSB0aGUgc3RyaW5nLgo+IEVzY2FwZWQgc3RyaW5ncywgYXMg
aW4KPiAKPiBCUjJfUEFDS0FHRV9DT1JFTUFSS19QT1JUX0NGTEFHU19FWFRSQT0iLURVU0VfQ0xP
Q0s9MQo+IC1ETUVNX0xPQ0FUSU9OPSdcXFwiTFBERFI0LTMyMDBcXFwiJyIKPiAKPiAoZW50ZXJl
ZCBhcyAtRFVTRV9DTE9DSz0xIC1ETUVNX0xPQ0FUSU9OPSdcIkxQRERSNC0zMjAwXCInKSB0aHVz
IGdldAo+IG1hbmdsZWQgYW5kIGNvbmZ1c2UgR0NDLiBSdW5uaW5nIHRoZSBzdHJpbmcgdGhyb3Vn
aCAnZWNobycgd29ya3MsIGl0Cj4ganVzdCByZW1vdmVzIHRoZSBvdXRlciBxdW90YXRpb24uCj4g
Cj4gKyAgICAgICAkKHNoZWxsIGVjaG8gJChCUjJfUEFDS0FHRV9DT1JFTUFSS19QT1JUX0NGTEFH
U19FWFRSQSkpCj4gCj4+ICsKPj4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyks
eSkKPj4gK0NPUkVNQVJLX0NGTEFHUyArPSAtRFVTRV9QVEhSRUFEIC1scHRocmVhZAo+PiArZW5k
aWYgIyBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTPXkKPj4gKwo+PiAgZGVmaW5lIENPUkVNQVJL
X0JVSUxEX0NNRFMKPj4gICAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgQ0M9IiQoVEFS
R0VUX0NDKSIgLUMgJChARCkgXAo+PiAtICAgICAgICAgICAgIFBPUlRfQ0ZMQUdTPSIkKFRBUkdF
VF9DRkxBR1MpIiBcCj4+ICsgICAgICAgICAgICAgUE9SVF9DRkxBR1M9IiQoQ09SRU1BUktfQ0ZM
QUdTKSIgXAo+PiAgICAgICAgICAgICAgIFBPUlRfRElSPWxpbnV4JChpZiAkKEJSMl9BUkNIX0lT
XzY0KSw2NCkgRVhFPSBsaW5rCj4+IC1lbmRlZgo+PiArZW5kZWYgIyBDT1JFTUFSS19CVUlMRF9D
TURTCj4+Cj4+ICBkZWZpbmUgQ09SRU1BUktfSU5TVEFMTF9UQVJHRVRfQ01EUwo+PiAgICAgICAk
KElOU1RBTEwpIC1EICQoQEQpL2NvcmVtYXJrICQoVEFSR0VUX0RJUikvdXNyL2Jpbi9jb3JlbWFy
awo+PiAtZW5kZWYKPj4gK2VuZGVmICMgQ09SRU1BUktfSU5TVEFMTF9UQVJHRVRfQ01EUwo+Pgo+
PiAgJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKPj4gLS0KPj4gMi40My4wCj4gCj4gS2luZCBy
ZWdhcmRzLAo+IEFuZHJlYXMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
