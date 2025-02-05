Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98960C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 21:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43A6060FC2;
	Wed,  5 Feb 2025 21:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1TleHdnGoGX; Wed,  5 Feb 2025 21:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18BFB61103
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18BFB61103;
	Wed,  5 Feb 2025 21:11:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28CA2CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1753E402CE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0Aa7pL7CwDU for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 21:11:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61971412D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61971412D7
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61971412D7
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:11:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so1349675e9.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 13:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738789899; x=1739394699;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CNvyCOLbHuGiLSVkCYb+6YehVWgU6SWq9F5QqgLSK58=;
 b=eQ5cFERcUcQglObZf20r+sBJnSksS1eM63W4TZYwUJKdGgMJZopSTEDd/hUhnft7Iu
 cRSCC9czxPXMQO1GnfpgSQxYk8Ir7oj0MxfVRg7uYXs3GRLDuegxuffp8vz1vgOztCzf
 PDUJ59ZDpscoG/SqIP8AxyFCK4F8WN+QxdJDgufZHZ87sQhNXL72QsuINb0CpnYoGPGE
 fV6RLqd56jQLIiJRArbPZfSz9vpUlFtJBwi5bzJ25l5zH+UKnPmCJ6Bmyam1WwsYPlOW
 pFlg69KnsrcRK7DZbuOOi3e5CcvLcl2/ST4vA/HaMN/y4pIzT9b0FDnVMp6puTmQC4tp
 lJew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXora36e1QOE8PMQ/ovPU+6DkphMBOAn1XKuX/Yham6OiXctUPb0WyEW/1XtiU5Y17KZwgvetfGWZg=@buildroot.org
X-Gm-Message-State: AOJu0Yw4XyWog62KnYlfu5RXUuJfwHN/sTsW0pxDEWaCJFLeMdlax9Yt
 IwDm/XHuI7WNbViNV6AeUke/oY0PSoMYBfJZH3EaSQu7LoVVqm78Tp88luYFjCixtGN1KGghZtQ
 f
X-Gm-Gg: ASbGncs4G6Azr8sDd0tE6TiboIHjJVjqgknPme/O7wxqSDliHNu3+jn8MJIRwxvtSUq
 U3aWi5LoADn5DSucFeH6rGLceA4wuEWfdhvuu6968VOzjF4qiozlj3xK1dgEVV3iyqZn79crh8W
 wEQfSgM4Aymg80/h5N5V1uM3Cl6U4c3nrNrgcozUhCTRt5K1Tfz8qWWd37f8Yjt8xIfHKNxtFPT
 N2/D5mpfIi8IbxqmVHW3Z84Lc6TbUU0Ro5+S745cWQMWdelnMTIsIpMjFWfVQ9TWA9KhdY02mNk
 +MnZYANfBLd2iGc92hCwm8+EQaNHbXGKq/FA+g+1nRLOgdzVsv8HaDCnAJsB2IFO74WfN/6FVXD
 mbwA06UrKjsI58M67wDNa9MPFyasx5HvedMntGrHNo9PW3g==
X-Google-Smtp-Source: AGHT+IFHLOOVdRJtbVwpiSfqxHNu779ra/VoxvTbn9P3MdN3pWg+4BpnGaCRqbb7YjI/7TzIYfuaGQ==
X-Received: by 2002:a5d:64a1:0:b0:38d:ac2d:6dbc with SMTP id
 ffacd0b85a97d-38db48badc5mr3176735f8f.17.1738789899232; 
 Wed, 05 Feb 2025 13:11:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38daf27bbf5sm5125150f8f.48.2025.02.05.13.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 13:11:38 -0800 (PST)
Message-ID: <ccd124e2-3849-4d02-a431-160bc9797bc3@mind.be>
Date: Wed, 5 Feb 2025 22:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <20250205140740.3085885-1-james.hilliard1@gmail.com>
 <038c5a04-9245-4722-88f3-f27016f1fdc3@mind.be>
Content-Language: en-GB
In-Reply-To: <038c5a04-9245-4722-88f3-f27016f1fdc3@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738789899; x=1739394699; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CNvyCOLbHuGiLSVkCYb+6YehVWgU6SWq9F5QqgLSK58=;
 b=D+ojZncoL0gk/zRKdl/Hva+/TQFpEcMMHe6PoXwWtdB66TmK5WRUm+CqMERJL60DEP
 s64aicinQ353l3VRSXePS2mZa7A0g2Lxg9PYIPhL1eyRoXcny8y/ymUb86QvHiHIzoVX
 8LBzQSBwqfkAJ7r4QXHZHGAA6LvjJDA66DgAdQEJVam7rOO20CubnXltj3uNiDY4hBjG
 /67lNSVXqoB8z+kxT9UQL/1NgkTcd8/Yvr7EH9StcpI1e7TiMMJqbQfoJHugqJhUn/ZF
 DzZRoslhhT+8NPl65PPpj0XWJdXOmuUfsXE9OCFvo4swdT63DXe0EAZHsuDHC4k1gx0u
 4yzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D+ojZnco
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: fix protoc version checking
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA1LzAyLzIwMjUgMjI6MDksIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwNS8wMi8yMDI1IDE1OjA3LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4gQmFja3BvcnQgcGF0
Y2hlcyBmaXhpbmcgcHJvdG9jIHZlcnNpb24gY2hlY2tpbmcuCj4+Cj4+IEZpeGVzOgo+PiBjaGVj
a2luZyBwcm90b2MgdmVyc2lvbi4uLiBleHByOiBzeW50YXggZXJyb3I6IHVuZXhwZWN0ZWQgYXJn
dW1lbnQgJzInCj4+IGNvbmZpZ3VyZTogZXJyb3I6IHByb3RvYyB2ZXJzaW9uIHRvbyBvbGQgbGli
cHJvdG9jIDI4LjEgPCAyLjMuMAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8
amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IMKgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KCiDCoFN0aWxsIGFwcGxpZWQgLSBob3dldmVyLCBoYXZlIHlvdSB0ZXN0ZWQgdGhpcz8gbGli
YWJzZWlsIHJlcXVpcmVzIEMrKzE0LCBhbmQgCm9sYSBhZGRzIC1zdGQ9Z251KysxMSwgc28gaXQg
aXMgc3RpbGwgYnJva2VuLi4uCgoKIMKgUmVnYXJkcywKIMKgQXJub3V0CgoKPgo+IMKgUmVnYXJk
cywKPiDCoEFybm91dAo+Cj4+IC0tLQo+PiDCoCAuLi4tcHJvdG9jLXZlcnNpb24tY2hlY2tpbmct
c2luY2UtdjIwLngucGF0Y2ggfCAzNSArKysrKysrKysrKysrKysrKysrCj4+IMKgIC4uLnJlY3Rs
eS1tYXRjaC1tdWx0aS1kaWdpdC1tYWpvci12ZXJzaS5wYXRjaCB8IDI4ICsrKysrKysrKysrKysr
Kwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IAo+PiBwYWNrYWdlL29sYS8wMDAyLUZpeC1wcm90b2MtdmVyc2lvbi1jaGVja2lu
Zy1zaW5jZS12MjAueC5wYXRjaAo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgCj4+IHBhY2thZ2Uv
b2xhLzAwMDMtUHJvdG9jLWNoZWNrLWNvcnJlY3RseS1tYXRjaC1tdWx0aS1kaWdpdC1tYWpvci12
ZXJzaS5wYXRjaAo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vbGEvMDAwMi1GaXgtcHJvdG9j
LXZlcnNpb24tY2hlY2tpbmctc2luY2UtdjIwLngucGF0Y2ggCj4+IGIvcGFja2FnZS9vbGEvMDAw
Mi1GaXgtcHJvdG9jLXZlcnNpb24tY2hlY2tpbmctc2luY2UtdjIwLngucGF0Y2gKPj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uZWU5OGM1NTY5ZAo+PiAtLS0gL2Rl
di9udWxsCj4+ICsrKyBiL3BhY2thZ2Uvb2xhLzAwMDItRml4LXByb3RvYy12ZXJzaW9uLWNoZWNr
aW5nLXNpbmNlLXYyMC54LnBhdGNoCj4+IEBAIC0wLDAgKzEsMzUgQEAKPj4gK0Zyb20gZDQ0MTRm
ZWVmZDk1YWRmOWM5MWQ3ZWFmMWU5NDM4MDI5NmMzNWY3YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKPj4gK0Zyb206IFBldGVyIE5ld21hbiA8cGV0ZXJuZXdtYW5AdXNlcnMubm9yZXBseS5naXRo
dWIuY29tPgo+PiArRGF0ZTogRnJpLCA3IEp1bCAyMDIzIDE1OjU3OjM1ICswMTAwCj4+ICtTdWJq
ZWN0OiBbUEFUQ0hdIEZpeCBwcm90b2MgdmVyc2lvbiBjaGVja2luZywgc2luY2UgdjIwLnggKGNo
ZXJyeSBwaWNrZWQgZnJvbQo+PiArIGNvbW1pdCAyZTU1YWE4ODc1NjcxOGQ4YWI0YTRjOGZkZTk3
ZDYyMDU0MmMyYzk4KQo+PiArCj4+ICtTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFt
ZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPj4gK1Vwc3RyZWFtOiAKPj4gaHR0cHM6Ly9naXRodWIu
Y29tL09wZW5MaWdodGluZ1Byb2plY3Qvb2xhL2NvbW1pdC9kNDQxNGZlZWZkOTVhZGY5YzkxZDdl
YWYxZTk0MzgwMjk2YzM1ZjdhCj4+ICstLS0KPj4gKyBjb25maWcvb2xhLm00IHwgOSArKysrKysr
Ky0KPj4gKyAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
ICsKPj4gK2RpZmYgLS1naXQgYS9jb25maWcvb2xhLm00IGIvY29uZmlnL29sYS5tNAo+PiAraW5k
ZXggZjgzOGFiNzBhLi41MWI2YzgyNWMgMTAwNjQ0Cj4+ICstLS0gYS9jb25maWcvb2xhLm00Cj4+
ICsrKysgYi9jb25maWcvb2xhLm00Cj4+ICtAQCAtNDQsNyArNDQsMTQgQEAgaWYgdGVzdCAteiAi
JFBST1RPQyIgOyB0aGVuCj4+ICvCoMKgIEFDX01TR19FUlJPUihbY2Fubm90IGZpbmQgJ3Byb3Rv
YycgcHJvZ3JhbV0pOwo+PiArIGVsaWYgdGVzdCAtbiAiJDEiIDsgdGhlbgo+PiArwqDCoCBBQ19N
U0dfQ0hFQ0tJTkcoW3Byb3RvYyB2ZXJzaW9uXSkKPj4gKy3CoCBbcHJvdG9jX3ZlcnNpb249YCRQ
Uk9UT0MgLS12ZXJzaW9uIDI+JjEgfCBncmVwICdsaWJwcm90b2MnIHwgc2VkIAo+PiAncy8uKlwo
WzAtOV1bMC05XSpcLlswLTldWzAtOV0qXC5bMC05XVswLTldKlwpLiovXDEvZydgXQo+PiArK8Kg
ICMgU2luY2UgdjIwLnggd2Ugb25seSBnZXQgZWZmZWN0aXZlbHkgdGhlIG1pbm9yIGFuZCBwYXRj
aCB2ZXJzaW9ucyBvdXQgb2YgCj4+IHByb3RvYy4KPj4gKyvCoCAjIFRyZWF0IHRoZW0gYXMgbWFq
b3IgYW5kIG1pbm9yIGFuZCBldmVyeXRoaW5nIHNob3VsZCBrZWVwIHdvcmtpbmcgCj4+IGluZGVm
aW5pdGVseS4KPj4gKyvCoCAjIFNlZSBodHRwczovL3Byb3RvYnVmLmRldi9zdXBwb3J0L3ZlcnNp
b24tc3VwcG9ydC8KPj4gKyvCoCAjIFNvIHdlJ3ZlIGdvdCBlaXRoZXIgb2YgdGhlc2U6Cj4+ICsr
wqAgIyBsaWJwcm90b2MgMi40LjEKPj4gKyvCoCAjIGxpYnByb3RvYyAyMy4zCj4+ICsrwqAgIyBU
aGUgZmlyc3Qgc2VkIGVuc3VyZXMgYWxsIHZlcnNpb25zIGhhdmUgbWFqb3IsIG1pbm9yLCBwYXRj
aCwgYnkgYWRkaW5nIAo+PiBhIC4wIG9uIHRoZSBlbmQgb2Ygb25lcyBtaXNzaW5nIGl0Cj4+ICsr
wqAgW3Byb3RvY192ZXJzaW9uPWAkUFJPVE9DIC0tdmVyc2lvbiAyPiYxIHwgZ3JlcCAnbGlicHJv
dG9jJyB8IHNlZCAKPj4gJ3MvXChbXlwuMC05XVswLTldWzAtOV0qXC5bMC05XVswLTldKlwpJC9c
MVwuMC9nJyB8IHNlZCAKPj4gJ3MvLipcKFswLTldWzAtOV0qXC5bMC05XVswLTldKlwuWzAtOV1b
MC05XSpcKS4qL1wxL2cnYF0KPj4gK8KgwqAgW3JlcXVpcmVkPSQxXQo+PiArwqDCoCBbcmVxdWly
ZWRfbWFqb3I9YGVjaG8gJHJlcXVpcmVkIHwgc2VkICdzL1teMC05XS4qLy8nYF0KPj4gK8KgwqAg
W3JlcXVpcmVkX21pbm9yPWBlY2hvICRyZXF1aXJlZCB8IHNlZCAKPj4gJ3MvWzAtOV1bMC05XSpc
LlwoWzAtOV1bMC05XSpcKVwuWzAtOV1bMC05XSovXDEvJ2BdCj4+ICstLQo+PiArMi4zNC4xCj4+
ICsKPj4gZGlmZiAtLWdpdCAKPj4gYS9wYWNrYWdlL29sYS8wMDAzLVByb3RvYy1jaGVjay1jb3Jy
ZWN0bHktbWF0Y2gtbXVsdGktZGlnaXQtbWFqb3ItdmVyc2kucGF0Y2ggCj4+IGIvcGFja2FnZS9v
bGEvMDAwMy1Qcm90b2MtY2hlY2stY29ycmVjdGx5LW1hdGNoLW11bHRpLWRpZ2l0LW1ham9yLXZl
cnNpLnBhdGNoCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmNl
ZTJjN2ViNDMKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL29sYS8wMDAzLVByb3Rv
Yy1jaGVjay1jb3JyZWN0bHktbWF0Y2gtbXVsdGktZGlnaXQtbWFqb3ItdmVyc2kucGF0Y2gKPj4g
QEAgLTAsMCArMSwyOCBAQAo+PiArRnJvbSA1NDZkOWVlOGQ5NzBjNGU1YjMzZDlkMjhiNGFjZjZl
YjM0ZjI3YTVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogUGV0ZXIgTmV3bWFu
IDxwZXRlcm5ld21hbkB1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20+Cj4+ICtEYXRlOiBGcmksIDcg
SnVsIDIwMjMgMTY6MTQ6MjEgKzAxMDAKPj4gK1N1YmplY3Q6IFtQQVRDSF0gUHJvdG9jIGNoZWNr
IC0gY29ycmVjdGx5IG1hdGNoIG11bHRpLWRpZ2l0IG1ham9yIHZlcnNpb25zCj4+ICsgKGNoZXJy
eSBwaWNrZWQgZnJvbSBjb21taXQgNjlhMjk0NjYyMmNkZmNlNTRjYjZlZDdmMjIxMGRmMmJlMGVj
NTU3NikKPj4gKwo+PiArU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20+Cj4+ICtVcHN0cmVhbTogCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVu
TGlnaHRpbmdQcm9qZWN0L29sYS9jb21taXQvNTQ2ZDllZThkOTcwYzRlNWIzM2Q5ZDI4YjRhY2Y2
ZWIzNGYyN2E1ZAo+PiArLS0tCj4+ICsgY29uZmlnL29sYS5tNCB8IDIgKy0KPj4gKyAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4gKwo+PiArZGlmZiAtLWdp
dCBhL2NvbmZpZy9vbGEubTQgYi9jb25maWcvb2xhLm00Cj4+ICtpbmRleCA1MWI2YzgyNWMuLmVh
Y2VlNWQ5NCAxMDA2NDQKPj4gKy0tLSBhL2NvbmZpZy9vbGEubTQKPj4gKysrKyBiL2NvbmZpZy9v
bGEubTQKPj4gK0BAIC01MSw3ICs1MSw3IEBAIGVsaWYgdGVzdCAtbiAiJDEiIDsgdGhlbgo+PiAr
wqDCoCAjIGxpYnByb3RvYyAyLjQuMQo+PiArwqDCoCAjIGxpYnByb3RvYyAyMy4zCj4+ICvCoMKg
ICMgVGhlIGZpcnN0IHNlZCBlbnN1cmVzIGFsbCB2ZXJzaW9ucyBoYXZlIG1ham9yLCBtaW5vciwg
cGF0Y2gsIGJ5IGFkZGluZyAKPj4gYSAuMCBvbiB0aGUgZW5kIG9mIG9uZXMgbWlzc2luZyBpdAo+
PiArLcKgIFtwcm90b2NfdmVyc2lvbj1gJFBST1RPQyAtLXZlcnNpb24gMj4mMSB8IGdyZXAgJ2xp
YnByb3RvYycgfCBzZWQgCj4+ICdzL1woW15cLjAtOV1bMC05XVswLTldKlwuWzAtOV1bMC05XSpc
KSQvXDFcLjAvZycgfCBzZWQgCj4+ICdzLy4qXChbMC05XVswLTldKlwuWzAtOV1bMC05XSpcLlsw
LTldWzAtOV0qXCkuKi9cMS9nJ2BdCj4+ICsrwqAgW3Byb3RvY192ZXJzaW9uPWAkUFJPVE9DIC0t
dmVyc2lvbiAyPiYxIHwgZ3JlcCAnbGlicHJvdG9jJyB8IHNlZCAKPj4gJ3MvXChbXlwuMC05XVsw
LTldWzAtOV0qXC5bMC05XVswLTldKlwpJC9cMVwuMC9nJyB8IHNlZCAKPj4gJ3MvW14wLTldKlwo
WzAtOV1bMC05XSpcLlswLTldWzAtOV0qXC5bMC05XVswLTldKlwpLiovXDEvZydgXQo+PiArwqDC
oCBbcmVxdWlyZWQ9JDFdCj4+ICvCoMKgIFtyZXF1aXJlZF9tYWpvcj1gZWNobyAkcmVxdWlyZWQg
fCBzZWQgJ3MvW14wLTldLiovLydgXQo+PiArwqDCoCBbcmVxdWlyZWRfbWlub3I9YGVjaG8gJHJl
cXVpcmVkIHwgc2VkIAo+PiAncy9bMC05XVswLTldKlwuXChbMC05XVswLTldKlwpXC5bMC05XVsw
LTldKi9cMS8nYF0KPj4gKy0tCj4+ICsyLjM0LjEKPj4gKwo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
