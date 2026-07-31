Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DB0C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 10:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A01C40EAB;
	Fri, 31 Jul 2026 10:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gN7oszR2VhdX; Fri, 31 Jul 2026 10:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D5240ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785492157;
	bh=8QbaCY0iUZFdJ5WLg9SKXiiXHqINC281AamzbsadsD4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZcYdxmAoZKhiEOVxb8UoxdYnMp5davNCv+rWeelbE9cTeeOyyXvSYbjhY79LxNqov
	 DjB2uXtJ59ddbF8ORMzPlzHhkb61GeA7u5TCK8oog1/jkjNzGiaCiKXIVerU7P0bzJ
	 FlPw3YFdlNCFe3PI1wdmRSJ2fd1xPTk8l6F25yP7OLpLUvAgIGt2Rmo3z0mvEzFlTW
	 LvT6uNN8zIaMGR7EYB/HFmZyt3GXhTUFvKzv0Bip8fTrCNNTXU2DAuDXgUzaFROWwD
	 vjHMoeNBURmZ6srwSwqyFzHFdlAacWI8Eejk6ctt4dEllP4Aou5LfzEYiVoS5Qz1tL
	 g/hLc6tE1beHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D5240ED0;
	Fri, 31 Jul 2026 10:02:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D41E627C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 10:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA2EA607C5
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 10:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWfd1SIPpchT for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 10:02:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8886607B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8886607B1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8886607B1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 10:02:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D85DCB977922; Fri, 31 Jul 2026 12:02:25 +0200 (CEST)
Message-ID: <4c5ee80b-0abb-4482-9c9a-3036312b84dd@rnout.be>
Date: Fri, 31 Jul 2026 12:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Oleg Lyovin <ovlevin@sberdevices.ru>, buildroot@buildroot.org
References: <20260730180627.1224385-1-laszlo.ersek@arm.com>
 <638ca326-29a3-499b-b8b0-57c9fc24ca1e@rnout.be>
 <2982b63d-ab0b-4649-9eff-7940bd053ef3@arm.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <2982b63d-ab0b-4649-9eff-7940bd053ef3@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1785492147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=tcYIgyGBSQwMz6X1uGgopfHHx9SCJBh/O7Sfs0ByKHE=;
 b=cOEAOGUsCm9gc5P/JX/X2/l545j0+6qgM+M58rc+68SkWmiK+lY5lVLBD7n5uMVqpkpJQY
 uZqb7pt0/KbxF/x9KLdeNSnd03+eS/wbaL1FI984rQnu5XhYzGo/1+JRCXn55HmZ+ufsV5
 MO356ifXhZTanl1DcKZKRSJzKtxb2tPVzRQKXintjuNg7h9UUg0GmweUn+BmFGpAXs32Tw
 ADuYft4LeZ2QQc7s2OoZ/O+0LzlV3gbhrDGJWD/U6cPR05vTHbNTJ1y16K6c9yoYtagXfk
 HsBxyQxB5YkZiJWZTgvj7KgW82GENpL+A/uv8Pug+KVo6uIr5ybnNneUyEvrvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=cOEAOGUs
Subject: Re: [Buildroot] [PATCH] linux/linux.mk: forcibly (re)enable Make
 jobserver
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMC8wNy8yMDI2IDIyOjE4LCBMYXN6bG8gRXJzZWsgd3JvdGU6Cj4gT24gNy8zMC8yNiAy
MDoxNCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDMwLzA3LzIwMjYg
MjA6MDYsIExhc3psbyBFcnNlayB3cm90ZToKPj4+IENvbW1pdCAwYjllZmM5OTFmOGEgKMKrbGlu
dXg6IHVzZSBCUjJfTUFLRcK7LCAyMDIzLTA0LTEwKSByZXBsYWNlZAo+Pj4gJChNQUtFKSB3aXRo
ICQoQlIyX01BS0UpIGluIGEgbnVtYmVyIG9mIHJlY2lwZXMuIEFzIGEgY29uc2VxdWVuY2UsCj4+
PiB0aGUgY2hpbGQgbWFrZSBpcyB1bmFibGUgdG8gZGlzY292ZXIgdGhlIGpvYiBzZXJ2ZXIsIGFu
ZCB3ZSBnZXQgYQo+Pj4gd2FybmluZyBzdWNoIGFzCj4+Pgo+Pj4+IHdhcm5pbmc6IGpvYnNlcnZl
ciB1bmF2YWlsYWJsZTogdXNpbmcgLWoxLiBBZGQgYCsnIHRvIHBhcmVudCBtYWtlIHJ1bGUuCj4+
Pgo+Pj4gaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9tYWtlL21hbnVhbC9odG1sX25vZGUv
RXJyb3ItTWVzc2FnZXMuaHRtbAo+Pj4gaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9tYWtl
L21hbnVhbC9odG1sX25vZGUvTUFLRS1WYXJpYWJsZS5odG1sCj4+Pgo+Pj4gSW5mb3JtIHRoZSBw
YXJlbnQgTWFrZSwgYnkgcHJlZml4aW5nIHRoZSByZWNpcGUgd2l0aCAiKyIsIHRoYXQKPj4+ICQo
QlIyX01BS0UpIGNhbiBkZWFsIHdpdGggdGhlIGpvYiBzZXJ2ZXIuCj4+Pgo+Pj4gQ2M6IEFybm91
dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4KPj4+IENjOiBPbGVnIEx5b3ZpbiA8b3Zs
ZXZpbkBzYmVyZGV2aWNlcy5ydT4KPj4+IENjOiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4g
U2lnbmVkLW9mZi1ieTogTGFzemxvIEVyc2VrIDxsYXN6bG8uZXJzZWtAYXJtLmNvbT4KPj4+IC0t
LQo+Pj4KPj4+IE5vdGVzOgo+Pj4gwqDCoMKgwqAgQ29tbWl0IDBiOWVmYzk5MWY4YSByZXBsYWNl
cyBtdWx0aXBsZSBpbnN0YW5jZXMgb2YgJChNQUtFKSB3aXRoCj4+PiDCoMKgwqDCoCAkKEJSMl9N
QUtFKTsgSSdtIG9ubHkgcHJlZml4aW5nIHRoZSBvbmUgcmVjaXBlIHdpdGggIisiIHRoYXQKPj4+
IMKgwqDCoMKgIHNlZW1zIHRvIGNhdXNlIHRoZSBtb3N0IG5vdGljZWFibGUgc2xvd2Rvd24gZm9y
IG1lIChieSBtaXNzaW5nCj4+PiDCoMKgwqDCoCBvdXQgb24gYSBwYXJhbGxlbCBrZXJuZWwgYnVp
bGQpLgo+Pgo+PiDCoCBBcmUgeW91IHJlYWxseSBzdXJlIHRoaXMgc3BlZWRzIHRoaW5ncyB1cD8K
PiAKPiBZZXMuCgogIEFoLCBJIGp1c3Qgc2F3IG5vdyB0aGF0IF9CVUlMRF9DTURTIGFscmVhZHkg
aGFzIGEgKyBpbiBwa2ctZ2VuZXJpYy5tay4KCgo+PiBUaGUgY29yZSBvZiB0aGUgd29yayBzaG91
bGQgYmUgaW4gdGhlIGBtYWtlIGFsbGAgaW52b2NhdGlvbiBvbiBsaW5lCj4+IDU0Ni4gQWxsIHRo
ZSBvdGhlciBpbnZvY2F0aW9ucyBzaG91bGQgYmUgcHJldHR5IG11Y2ggc2VyaWFsLiBJbgo+PiBw
YXJ0aWN1bGFyIHRoZSByZWJ1aWxkLXdpdGgtaW5pdHJhbWZzIHNob3VsZCBkbyBub3RoaW5nIG1v
cmUgdGhhbgo+PiByZS1saW5raW5nIGFuZCByZS1jb21wcmVzc2luZyB0aGUga2VybmVsIGJlY2F1
c2UgdGhlIGV4YWN0IHNhbWUKPj4gY29tbWFuZCB3YXMgYWxyZWFkeSBkb25lIGluIHRoZSBidWls
ZCBzdGVwLgo+IAo+IEluIG15IGNhc2UsCj4gCj4gLSBib3RoICJMSU5VWF9CVUlMRF9DTURTIiAt
LSB0aGUgImFsbCIgdGFyZ2V0IC0tLAo+IAo+IC0gYW5kICJsaW51eC1yZWJ1aWxkLXdpdGgtaW5p
dHJhbWZzIiAtLSB0aGUgJChMSU5VWF9UQVJHRVRfTkFNRSksIGFrYQo+ICDCoCAiSW1hZ2UiIHRh
cmdldCAtLQo+IAo+IHNlZW0gdG8gcGVyZm9ybSBhIHNpbWlsYXJseSBsYXJnZSBbMV0ga2VybmVs
IGJ1aWxkLiBUaGUgZmlyc3Qgb25lIGJ1aWxkcwo+IG9iamVjdCBmaWxlcyBjb25jdXJyZW50bHkg
YWxyZWFkeSwgdGhlIHNlY29uZCBvbmUgKHdpdGhvdXQgdGhpcyBwYXRjaCkKPiBkb2Vzbid0Lgo+
IAo+IFsxXSBUaGUgIkltYWdlIiBidWlsZCAoZnJvbSAibGludXgtcmVidWlsZC13aXRoLWluaXRy
YW1mcyIpIHNlZW1zIG5vdCB0bwo+IGV4ZWN1dGUgdGhlIGZvbGxvd2luZyB0eXBlcyBvZiByZWNp
cGVzIGZyb20gdGhlICJhbGwiIHRhcmdldCAoZnJvbQo+ICJMSU5VWF9CVUlMRF9DTURTIik6Cj4g
Cj4gLSBDQyBbTV0KPiAtIExEIFtNXQo+IC0gQ0hLU0hBMSBvbiB2YXJpb3VzIGhlYWRlcnMKPiAt
IENPUFkgb24gdmFyaW91cyBoZWFkZXJzCj4gLSBEVEMgb24gdmFyaW91cyBkZXZpY2UgdHJlZSBm
aWxlcwo+IC0gR1pJUCBvbiBJbWFnZS5nego+IC0gVVBEIGFuZCBXUkFQIG9uIHZhcmlvdXMgZ2Vu
ZXJhdGVkIGhlYWRlciBmaWxlcwo+IAo+IEkgdGhpbmsgdGhlc2UgZGlmZmVyZW5jZXMgYXJlIGV4
cGVjdGVkLiBIb3dldmVyLCB3aGlsZQo+ICJsaW51eC1yZWJ1aWxkLXdpdGgtaW5pdHJhbWZzIiBw
ZXJmb3JtcyBmZXdlciBidWlsZCBzdGVwcywgYWNjb3JkaW5nIHRvCj4gdGhlIGFib3ZlLCBpdCBk
b2VzIGJ1aWxkIGFsbCB0aGUgYnVpbHQtaW4gb2JqZWN0IGZpbGVzIGFuZXcsIGFuZCB0aGF0Cgog
IFRoYXQncyB3ZWlyZCB0aG91Z2guIFdlbGwsIGl0J3Mgbm90IHdlaXJkIHRoYXQgaXQgZG9lc24n
dCByZS1kbyB0aGUgbW9kdWxlcyAKYmVjYXVzZSB0aGUgTElOVVhfVEFSR0VUX05BTUUgZ29hbCBk
b2Vzbid0IGJ1aWxkIHRoZSBtb2R1bGVzLiBCdXQgaXQncyB3ZWlyZCAKdGhhdCBpdCByZWJ1aWxk
cyB0aGUgYnVpbHRpbiBvYmplY3QgZmlsZXMsIG5vdGhpbmcgc2hvdWxkIGhhdmUgY2hhbmdlZCBj
b21wYXJlZCAKdG8gdGhlIGVhcmxpZXIgcnVuIGV4Y2VwdCBmb3IgdGhlIHNpbmdsZSBvYmplY3Qg
ZmlsZSB0aGF0IGNvbnRhaW5zIHRoZSBpbml0cmFtZnMgCmNwaW8gaW1hZ2UuCgogIEl0IHdvdWxk
IGJlIG5pY2UgdG8gZml4IHRoYXQsIGJ1dCByZWdhcmRsZXNzLCBpdCdzIG5vdCBhIGJhZCBpZGVh
IHRvIGFkZCB0aGUgKyAKdG8gdGhlIHJlYnVpbGQtd2l0aC1pbml0cmFtZnMgZ29hbCBzbyBJJ2xs
IGFwcGx5IHRoaXMgcGF0Y2guCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiBoYXBwZW5zIHdheSBt
b3JlIHNsb3dseSB0aGFuIGluICJMSU5VWF9CVUlMRF9DTURTIiwgYmVjYXVzZQo+ICJsaW51eC1y
ZWJ1aWxkLXdpdGgtaW5pdHJhbWZzIiBkb2Vzbid0IGRvIGl0IGNvbmN1cnJlbnRseS4KPiAKPiAo
RldJVywgSSdtIGJhc2VkIG9mZiBvZiByZWxlYXNlIDIwMjUuMDUuKQo+IAo+IExhc3psbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
