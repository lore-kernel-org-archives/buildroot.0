Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCE1CD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E71914188D;
	Wed, 20 May 2026 19:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKBTd6DaDl6s; Wed, 20 May 2026 19:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2354841889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779305324;
	bh=VmRWMnkuIcjTSsBqjzYVixu7wXpjlIC5BfhJQxe1Bq8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YyooCHtlxRHxCXcSsin7WfMQOLYDHQ1mxujjbiAsuL7b/tkEHB1xHKKT6OiLZkqZW
	 HfgfUL/Knfnj3JpXEF6QUMgdvpA9q5FSshxEtAfrcxm86DLYuj9thBWvyPBHD4ZvqV
	 gPx2Uyw1AYzOeKs4dezObdECgo12V50Y98BxAA+irObgNABOos6NOgZ39YBHTO2XF/
	 ig2eRn5cNmTXIQBXpacaRx5r9D02qPQ3Ff64qA7BdT9m/QQLH4evuOcRgSlewJ+RWp
	 eZGHteztACoEAl4HBq+XcWh1y7DE/bkJS+Ii1UgxjEQ095VKyplqZzH7zaOJe0GTcQ
	 TL1+ne/dMXZVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2354841889;
	Wed, 20 May 2026 19:28:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9C0E265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FEFA60DBE
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gO1e3XB043M0 for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:28:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A571860A37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A571860A37
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A571860A37
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:28:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D381B97C37D; Wed, 20 May 2026 21:28:37 +0200 (CEST)
Message-ID: <67dbf4d1-e226-4113-889c-f615b845d8d2@rnout.be>
Date: Wed, 20 May 2026 21:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Mohr <and@gmx.li>, Baruch Siach <baruch@tkos.co.il>,
 Andreas Mohr via buildroot <buildroot@buildroot.org>
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
References: <20260518220229.17936-1-and@gmx.li> <87lddgt7a7.fsf@tarshish>
 <a72de0b2-c770-4e02-9174-ed2d19ac8276@gmx.li>
Content-Language: en-GB, fr-BE
In-Reply-To: <a72de0b2-c770-4e02-9174-ed2d19ac8276@gmx.li>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779305319; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=McSfhwNATs6/jdNu31lHmD/osy4dKUikFyiVPJL+HLA=;
 b=WXeBV4J1cOq1/pd1lBQek8BH3VL8fdQNbcnUdXhxvup7h/DUJf3prXLN5SpsiZZzXoLb+r
 AgVJbl3Rdj2keD7lmbjgaxHpnZTayW6C2JZmVSnmIJYK4LMf986FZMtmemuu+d7MV1ohl5
 6AzCPeeOZ3ESysjlibZI7PDpbaYSZsp7z9NQ2ySvAebMYPUZWBuZy9Owf/EjMu0bJ4wU3l
 4dJYJp/dR579F4o/O2dUifl61blRr5fNFhq8yHcuSzXOk4uRG71KFHI5r/HMSpeCj3kKUE
 tY46tZKdo2zIUdIHtLGZ/G9DKrT3O/qHKvf5kzxU+S4bggxgFhprACstGIWuaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=WXeBV4J1
Subject: Re: [Buildroot] [PATCH v4 1/2] package/libargon2: conditionally
 shared/static build
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

CgpPbiAxOS8wNS8yMDI2IDIwOjQzLCBBbmRyZWFzIE1vaHIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBIaSBiYXJ1Y2gsCj4gCj4gQW0gMTkuMDUuMjYgdW0gMDU6MjAgc2NocmllYiBCYXJ1Y2ggU2lh
Y2g6Cj4+IEhpIEFuZHJlYXMsCj4+Cj4+IE9uIE1vbiwgTWF5IDE4IDIwMjYsIEFuZHJlYXMgTW9o
ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4gQWRkIHN0YXRpYyBidWlsZCBzdXBwb3J0IG9mIGxp
YmFyZ29uMi4KPj4+IFRoaXMgd2lsbCBhbGxvdyBkZXBlbmRlbnQgcGFja2FnZXMgbGlrZSBjcnlw
dHNldHVwIHRvIGJ1aWxkIHN0YXRpYyBhcyB3ZWxsLgo+PiBUaGUgY29tbWVudCBpbiBwYWNrYWdl
L2NyeXB0c2V0dXAvQ29uZmlnLmluIG5lZWRzIHVwZGF0ZSwgdGhlbi4KPj4KPj4gQ2FuIGx1YS1h
cmdvbjIgYnVpbGQgc3RhdGljYWxseSBub3c/IElmIG5vdCwgdGhlIGNvbW1lbnQgaW4gaXRzCj4+
IENvbmZpZy5pbiBwb2ludGluZyBhdCBsaWJhcmdvbjIgbmVlZHMgdXBkYXRlIGFzIHdlbGwuCj4+
Cj4+IFNhbWUgZ29lcyBmb3IgcHl0aG9uLWFyZ29uMi1jZmZpLWJpbmRpbmdzLgo+IAo+IFllcywg
aW4gYSBmdXR1cmUgcGF0Y2ggc2V0LCBvbmNlIHRoZSBsaWJhcmdvbjIgc3RhdGljIGJ1aWxkIHBh
dGNoIGhhcyBiZWVuIAo+IGluY29ycG9yYXRlZC4KCiAgTm8sIGl0IHJlYWxseSBoYXMgdG8gYmUg
aW4gdGhlIHNhbWUgcGF0Y2guIEp1c3Qgc2VhcmNoIHRoZSBnaXQgaGlzdG9yeSBmb3IgCm90aGVy
IGNvbW1pdHMgdGhhdCBlbmFibGUgc3RhdGljIGJ1aWxkLgoKICBJIGRpZCBpdCBteXNlbGYgYW5k
IGFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPj4gYmFy
dWNoCj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE1vaHIgPGFuZEBnbXgubGk+Cj4+PiAt
LS0KPj4+IMKgIHBhY2thZ2UvbGliYXJnb24yL0NvbmZpZy5pbsKgwqDCoCB8IDUgLS0tLS0KPj4+
IMKgIHBhY2thZ2UvbGliYXJnb24yL2xpYmFyZ29uMi5tayB8IDYgKysrKysrCj4+PiDCoCAyIGZp
bGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJhcmdvbjIvQ29uZmlnLmluIGIvcGFja2FnZS9saWJhcmdvbjIv
Q29uZmlnLmluCj4+PiBpbmRleCA2YmJhNzRjZi4uNzNjMWUwZDcgMTAwNjQ0Cj4+PiAtLS0gYS9w
YWNrYWdlL2xpYmFyZ29uMi9Db25maWcuaW4KPj4+ICsrKyBiL3BhY2thZ2UvbGliYXJnb24yL0Nv
bmZpZy5pbgo+Pj4gQEAgLTEsMTIgKzEsNyBAQAo+Pj4gwqAgY29uZmlnIEJSMl9QQUNLQUdFX0xJ
QkFSR09OMgo+Pj4gwqDCoMKgwqDCoCBib29sICJsaWJhcmdvbjIiCj4+PiDCoMKgwqDCoMKgIGRl
cGVuZHMgb24gQlIyX1VTRV9NTVUKPj4+IC3CoMKgwqAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19M
SUJTCj4+PiDCoMKgwqDCoMKgIGhlbHAKPj4+IMKgwqDCoMKgwqDCoMKgIEEgbW9kZXJuIHBhc3N3
b3JkIGhhc2hpbmcgYWxnb3JpdGhtCj4+PiDCoMKgwqDCoMKgwqDCoCBodHRwczovL3Bhc3N3b3Jk
LWhhc2hpbmcubmV0LyNhcmdvbjIKPj4+IC0KPj4+IC1jb21tZW50ICJsaWJhcmdvbiBuZWVkcyBh
IHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnkiCj4+PiAtwqDCoMKgIGRlcGVuZHMgb24gQlIy
X1VTRV9NTVUKPj4+IC3CoMKgwqAgZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMKPj4+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYmFyZ29uMi9saWJhcmdvbjIubWsgYi9wYWNrYWdlL2xpYmFyZ29u
Mi9saWJhcmdvbjIubWsKPj4+IGluZGV4IGIzZjZlMWIyLi44Y2EwMDcxYSAxMDA2NDQKPj4+IC0t
LSBhL3BhY2thZ2UvbGliYXJnb24yL2xpYmFyZ29uMi5tawo+Pj4gKysrIGIvcGFja2FnZS9saWJh
cmdvbjIvbGliYXJnb24yLm1rCj4+PiBAQCAtMjMsNiArMjMsMTIgQEAgaWZlcSAoJChCUjJfVE9P
TENIQUlOX0hBU19USFJFQURTKSwpCj4+PiDCoCBMSUJBUkdPTjJfT1BUUyArPSBOT19USFJFQURT
PTEKPj4+IMKgIGVuZGlmCj4+PiAraWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4+PiArTElC
QVJHT04yX09QVFMgKz0gTElCX1NIPSBMSU5LRURfTElCX1NIPQo+Pj4gK2Vsc2UgaWZlcSAoJChC
UjJfU0hBUkVEX0xJQlMpLHkpCj4+PiArTElCQVJHT04yX09QVFMgKz0gTElCX1NUPQo+Pj4gK2Vu
ZGlmCj4+PiArCj4+PiDCoCBkZWZpbmUgTElCQVJHT04yX0JVSUxEX0NNRFMKPj4+IMKgwqDCoMKg
wqAgJChUQVJHRVRfTUFLRV9FTlYpICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIC1D
ICQoQEQpIFwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAkKExJQkFSR09OMl9PUFRTKQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
