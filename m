Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E312FC4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 19:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A89C960611;
	Tue, 21 Jul 2026 19:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LfkmmWRctqh; Tue, 21 Jul 2026 19:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABBDB60632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784663987;
	bh=QyKqXfp/YhPdMJIyQUq+vA/unxiYjwM4pgru4SaFoiA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MjcasHuHrpq4wk2YM1xNv48D+cK5kN6PIkSp8neEzJ1MMR9sZfDZCa3Spq6wWakgq
	 Tn1ru3N/weRwhywt9G8hqvfXqVT9z1KVZ3wfjlf9XW2L2QYP2sXR/y/uAf09s8xmcU
	 xDiXt4lAGk1S1Bohri+6ch408KbWD6aYSITCIOOVbmzhnFA6AN2hU5JbvzXDsV/VJo
	 +t4uDi5opEWgdHbZaDgda76GYUu5y+aYsCxuj8iLJJhIoG1UXArVAzr52odg/H//M8
	 uR3Zv7NRkua19wgeKbg4NJqS5hhXXAqW/iEy8pMr3Ub8aKe/sjmR8aSsWp587uB4Bw
	 DNkLU1qnuoImw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABBDB60632;
	Tue, 21 Jul 2026 19:59:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DB6ADF0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EBE38096A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fltQK8xXR8kK for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 19:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA62980969
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA62980969
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA62980969
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:59:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 270315FFB4;
 Tue, 21 Jul 2026 21:59:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jul 2026 21:59:42 +0200
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 21:59:42 +0200
To: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CABNF3=Z2VPCDu6Od07=qNV7V=_xFSp-Jc1m294MP+AnKsNZpwg@mail.gmail.com>
References: <20260720122202.3073325-1-andrea.ricchi@amarulasolutions.com>
 <677b873ff2144474ec7024f39b6496ff@free.fr>
 <CABNF3=Z2VPCDu6Od07=qNV7V=_xFSp-Jc1m294MP+AnKsNZpwg@mail.gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <ddab76e125902757f19b380a6cf1b3ac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784663983;
 bh=kYyvRn8K247bw0BJZ9tAZk4WCZvJ5rwkmD34iIHnv/s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HRxQxp3vrG4rTXwfx7T6rK8IW1zqrDRBmbogRecGufWMhyHovBWUfvOgIJ0kOL56F
 7ilG3TzP3mEF1veLOmGtyzF89hweldtAyrKKJ2WnEvzKbbM0WCc2WjDxEDJFk+e8lS
 kam6BOnrxndZpudm8kjcRO3rOgpejudMqeLt2cxv+whZOM9Ay5jqat2Lk/HTV6nOct
 rC2VvXyjQhqqOR/n6y3In3LjAZmcyE3SUlJBmIR3+lrAOkdpXDQY9BaLpWWhLZ+Kd+
 7o6guI57cgtHcBG7Cdn7yuG+UlnY1fQj5sNytAV4AC5Hhuk0Iem508iLCfnUj+GfV4
 E9cmLB8UkORbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HRxQxp3v
Subject: Re: [Buildroot] [PATCH v3] package/libcppconnman: add new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhLAoKT24gMjEvMDcvMjAyNiAwOTowNiwgQW5kcmVhIFJpY2NoaSB3cm90ZToKPiBI
aSBKdWxpZW4sCj4gCj4gVGhhbmtzIGFnYWluIGZvciB0aGUgcmV2aWV3LCBhbmQgc29ycnkgYWJv
dXQgdGhlIHBpcGVsaW5lIGlzc3VlLgo+IAo+IEkgdHJpZWQgcnVubmluZyAuL3V0aWxzL3Rlc3Qt
cGtnIC1hIC1wIGxpYmNwcGNvbm5tYW4gbG9jYWxseSBhbmQgZ290Cj4gYm9vdGxpbi1zcGFyYy11
Y2xpYmMgWzI0LzMyXTogT0suIEluIG15IC5jb25maWcsIEkgaGF2ZSB0aGUgZm9sbG93aW5nCj4g
c2V0Ogo+IAo+IEJSMl9QQUNLQUdFX0xJQkNQUENPTk5NQU49eQo+IEJSMl9QQUNLQUdFX0xJQkNQ
UENPTk5NQU5fRVhBTVBMRT15Cj4gCj4gRG8geW91IGhhdmUgYW55IGlkZWEgd2h5IGl0IHdvcmtz
IG9uIG15IG1hY2hpbmUgYnV0IGZhaWxzIGluIHRoZQo+IEdpdExhYiBwaXBlbGluZT8gQ291bGQg
aXQgYmUgZHVlIHRvIHNvbWUgc3BlY2lmaWMgYnVpbGQgZW52aXJvbm1lbnQKPiBjb25maWd1cmF0
aW9uPwoKVGhlIGhvc3QgZW52aXJvbm1lbnQgc2hvdWxkIG5vdCBoYXZlIGFueSBpbXBhY3QgZm9y
IHRoaXMga2luZCBvZiBpc3N1ZS4KCkFyZSB5b3UgdXNpbmcgdGhlIGNvcnJlY3QgY29tbWFuZCBh
bmQgYXJlIHlvdSBsb29raW5nIGF0CnRoZSByaWdodCBjb25maWcgZmlsZT8KCkZvciBlbmFibGlu
ZyBleGFtcGxlcyBpbiBhIHRlc3QtcGtnIHJ1biwgeW91IHNob3VsZCB1c2UKY29tbWFuZHMgbGlr
ZToKCmNhdCA+bXkuY29uZmlnIDw8RU9GCkJSMl9QQUNLQUdFX0xJQkNQUENPTk5NQU49eQpCUjJf
UEFDS0FHRV9MSUJDUFBDT05OTUFOX0VYQU1QTEU9eQpFT0YKdXRpbHMvdGVzdC1wa2cgLWEgLXAg
bGliY3BwY29ubm1hbiAtYyBteS5jb25maWcKClRoZSBnZW5lcmF0ZWQgY29uZmlnIG9mIGEgZmFp
bGluZyBidWlsZHMgc2hvdWxkIGJlIGluOgoifi9ici10ZXN0LXBrZy9ib290bGluLW1pY3JvYmxh
emVlbC11Y2xpYmMvLmNvbmZpZyIKcmF0aGVyIHRoYW4gaW4gIi4vLmNvbmZpZyIuCgo+IFRoYW5r
cyEKPiAKPiBBbmRyZWEgUmljY2hpCj4gRW1iZWRkZWQgU29mdHdhcmUgRW5naW5lZXIKPiBNLiAr
MzkgMzMzIDc3NSA0OTczCj4gYW5kcmVhLnJpY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQo+IOKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQo+IEFtYXJ1bGEgU29s
dXRpb25zIFNSTAo+ICBWaWEgRmVsaWNlIENhdmFsbG90dGkgMjVELCA0MTAxMiBDYXJwaSwgTU8s
IElUCj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IHd3dy5hbWFydWxhc29sdXRpb25zLmNv
bSBbMl0KPiAKPiBPbiBNb24sIEp1bCAyMCwgMjAyNiBhdCA5OjIy4oCvUE0gSnVsaWVuIE9saXZh
aW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4gCj4+IEhpIEFuZHJlYSwKPj4gCj4+IFRoYW5rcyBm
b3IgdGhlIHVwZGF0ZWQgcGF0Y2ghCj4+IAo+PiBPbiAyMC8wNy8yMDI2IDE0OjIyLCBBbmRyZWEg
UmljY2hpIHdyb3RlOgo+Pj4gbGliY3BwY29ubm1hbiBpcyBhIEMrKyBsaWJyYXJ5IHRoYXQgcHJv
dmlkZXMgYW4gZWFzeS10by11c2UgQVBJCj4+PiB0byBjb21tdW5pY2F0ZSB3aXRoIENvbm5NYW4g
b3ZlciBELUJ1cyB1c2luZyBHREJ1cy4KPj4+IAo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2FtYXJ1
bGEvbGliY3BwY29ubm1hbgo+Pj4gCj4+PiBBbHNvIGFkZCBteXNlbGYgdG8gREVWRUxPUEVSUyBm
b3IgdGhpcyBwYWNrYWdlLgo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWEgUmljY2hpIDxh
bmRyZWEucmljY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pj4gLS0tCj4+PiBDaGFuZ2VzIHYy
IC0+IHYzOgo+Pj4gLSBDb25maWcuaW46IGFkZCBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8x
MCBkZXBlbmRlbmN5IChDKysyMAo+PiAvCj4+PiA8cmFuZ2VzPiksCj4+PiBmaXhpbmcgYnVpbGQg
ZmFpbHVyZXMgb24gR0NDIDwgMTAgdG9vbGNoYWlucyByZXBvcnRlZCBieSB0aGUKPj4+IGF1dG9i
dWlsZGVycwo+Pj4gLSBDb25maWcuaW4sIGxpYmNwcGNvbm5tYW4ubWsgWzFdOiBzZWxlY3QgYW5k
IGRlcGVuZCBvbiByZWFkbGluZQo+PiBmb3IgdGhlCj4+PiBleGFtcGxlLAo+Pj4gZml4aW5nIHRo
ZSBtaXNzaW5nIHJlYWRsaW5lIGxpYnJhcnkgY29uZmlndXJlIGVycm9yIHdoZW4KPj4gZXhhbXBs
ZXMKPj4+IGFyZSBlbmFibGVkCj4+PiAKPj4+IENoYW5nZXMgdjEgLT4gdjI6Cj4+PiAtIGFkZCBt
aXNzaW5nIGxpYmNwcGNvbm5tYW4gZW50cnkgaW4gcGFja2FnZS9Db25maWcuaW4KPj4+IC0gbWVy
Z2UgdGhlIERFVkVMT1BFUlMgYWRkaXRpb24gaW50byB0aGlzIHBhdGNoCj4+PiAKPj4+IERFVkVM
T1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+PiBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+Pj4gcGFja2FnZS9saWJjcHBj
b25ubWFuL0NvbmZpZy5pbiAgICAgICAgICB8IDI4Cj4+ICsrKysrKysrKysrKysrKysrKysrKysr
Kwo+Pj4gcGFja2FnZS9saWJjcHBjb25ubWFuL2xpYmNwcGNvbm5tYW4uaGFzaCB8ICAzICsrKwo+
Pj4gcGFja2FnZS9saWJjcHBjb25ubWFuL2xpYmNwcGNvbm5tYW4ubWsgWzFdICAgfCAyNQo+PiAr
KysrKysrKysrKysrKysrKysrKysKPj4+IDUgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygr
KQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliY3BwY29ubm1hbi9Db25maWcuaW4K
Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmNwcGNvbm5tYW4vbGliY3BwY29ubm1h
bi5oYXNoCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJjcHBjb25ubWFuL2xpYmNw
cGNvbm5tYW4ubWsgWzFdCj4+PiAKPj4gWy4uLl0KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xp
YmNwcGNvbm5tYW4vQ29uZmlnLmluCj4+PiBiL3BhY2thZ2UvbGliY3BwY29ubm1hbi9Db25maWcu
aW4KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi5kOTlkNzEx
ZTI1Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9wYWNrYWdlL2xpYmNwcGNvbm5tYW4vQ29u
ZmlnLmluCj4+PiBAQCAtMCwwICsxLDI4IEBACj4+PiArY29uZmlnIEJSMl9QQUNLQUdFX0xJQkNQ
UENPTk5NQU4KPj4+ICsgICAgIGJvb2wgImxpYmNwcGNvbm5tYW4iCj4+PiArICAgICBkZXBlbmRz
IG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUAo+Pj4gKyAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENI
QUlOX0dDQ19BVF9MRUFTVF8xMCAjIEMrKzIwCj4+PiArICAgICBkZXBlbmRzIG9uIEJSMl9VU0Vf
V0NIQVIgIyBsaWJnbGliMgo+Pj4gKyAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19U
SFJFQURTICMgbGliZ2xpYjIKPj4+ICsgICAgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBsaWJn
bGliMgo+Pj4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkdMSUIyCj4+PiArICAgICBoZWxw
Cj4+PiArICAgICAgIGxpYmNwcGNvbm5tYW4gcHJvdmlkZSBlYXN5IHRvIHVzZSBDKysgQVBJIHRv
IGNvbW11bmljYXRlCj4+PiArICAgICAgIHdpdGggQ29ubk1hbiB2aWEgdGhlIERCdXMgdXNpbmcg
R0RCdXMuCj4+PiArCj4+PiArICAgICAgIGh0dHBzOi8vYW1hcnVsYS5naXRodWIuaW8vbGliY3Bw
Y29ubm1hbi8KPj4+ICsKPj4+ICtjb21tZW50ICJsaWJjcHBjb25ubWFuIG5lZWRzIGEgdG9vbGNo
YWluIHcvIEMrKzIwLCB3Y2hhciwKPj4gdGhyZWFkcyIKPj4+ICsgICAgIGRlcGVuZHMgb24gQlIy
X1VTRV9NTVUKPj4+ICsgICAgIGRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAh
QlIyX1VTRV9XQ0hBUiB8fCBcCj4+PiArICAgICAgICAgICAgICFCUjJfVE9PTENIQUlOX0hBU19U
SFJFQURTIHx8Cj4+ICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMAo+Pj4gKwo+Pj4gK2lm
IEJSMl9QQUNLQUdFX0xJQkNQUENPTk5NQU4KPj4+ICsKPj4+ICtjb25maWcgQlIyX1BBQ0tBR0Vf
TElCQ1BQQ09OTk1BTl9FWEFNUExFCj4+PiArICAgICBib29sICJsaWJjcHBjb25ubWFuIGV4YW1w
bGUiCj4+IAo+PiBJdCBzZWVtcyB0aGVyZSBpcyBzdGlsbCAyIGJ1aWxkIGZhaWx1cmVzIHdpdGgg
dGhlIGV4YW1wbGVzLiBTZWU6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJv
b3QvLS9waXBlbGluZXMvMjY5MTQ1MTg3OQo+PiAKPj4gSXQgaXMgbGlrZWx5IGR1ZSB0byBhIG1p
c3NpbmcgZGVwZW5kZW5jeSBvbgo+PiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzEuCj4+IAo+PiBD
b3VsZCB5b3UgaGF2ZSBhIGxvb2sgcGxlYXNlPwo+PiAKPj4+ICsgICAgIHNlbGVjdCBCUjJfUEFD
S0FHRV9SRUFETElORQo+Pj4gKyAgICAgaGVscAo+Pj4gKyAgICAgICBDb21waWxlIENMSSBleGFt
cGxlLgo+Pj4gKwo+Pj4gK2VuZGlmCj4+IAo+PiBCZXN0IHJlZ2FyZHMsCj4+IAo+PiBKdWxpZW4u
Cj4gCj4gCj4gTGlua3M6Cj4gLS0tLS0tCj4gWzFdIGh0dHA6Ly9saWJjcHBjb25ubWFuLm1rCj4g
WzJdIGh0dHA6Ly93d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20vCgpCZXN0IHJlZ2FyZHMsCgpKdWxp
ZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
