Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4238DCD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB8A60749;
	Mon, 18 May 2026 20:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2KdC7oGBq-a; Mon, 18 May 2026 20:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 446D3606EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779136193;
	bh=GVvygj7rQNh9KeUEaPQ3yXr9oxWpSs62tVTBVATsi2E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VOIIwWgFfCvWDQ79NnxhV73Zm8+SswDHeUqOItuSglgkmThiNf/8Ic2/pgJRXzMTW
	 lR9+yfD16h1OnrwifvuKujlNlBJSLg/PcY8knPuqaP/ed6nW7qlmAtx3fHGIOvGupb
	 0vZTe2dWNh40t19Y1jLZ0E1vqLRK7tfKhQuHJbA3hVe9uGgJ0G0fwucs/MmpoPuNOx
	 h68tdA9OXeTndXys7cEwqBlPJDdH0wFf0XXK1YONgj/SEcYVFo5vZfotuLf+ZiG11g
	 dcWiWdgw9eqL9W/ELjM1BWYvqPoeIgjCI9iv2qN2Fi1dfdvxIMA25QKI1+STqF/GsC
	 cv4cBfr21ouAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 446D3606EF;
	Mon, 18 May 2026 20:29:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5AA6282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B76AB401DD
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5DQRmE-Szcl for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:29:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 873F9401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 873F9401C2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 873F9401C2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:29:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB6D5B97BF4D; Mon, 18 May 2026 22:29:46 +0200 (CEST)
Message-ID: <657bfb7e-7963-43ba-aa6a-a185c3eb4dbf@rnout.be>
Date: Mon, 18 May 2026 22:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>,
 Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>,
 Paul Cercueil <paul@crapouillou.net>, Refik Tuzakli
 <tuzakli.refik@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
 <20260506223341.1759760-35-james.hilliard1@gmail.com>
 <CAMwDAPiSOPm2OCNJXe1ko3YDUodcmnMBURPKB2b_nbJU+AQK=g@mail.gmail.com>
 <CADvTj4r-B5eHr0K3XchEy8g_umaYXos953A-FnARLg+gG=Z+Zw@mail.gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <CADvTj4r-B5eHr0K3XchEy8g_umaYXos953A-FnARLg+gG=Z+Zw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779136188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=gh8aBf6wYvtwH68FH0n8bc6PKKnnWCEXIT1MEkNseBI=;
 b=XyBBYV9CaooWfAnTzUYdQTmKjaxEV1S+DQRXbeobgXrh88tVLtWANXbZoE73poBx28DZ1y
 LU4c6JqfwVxfVmurnzdE39jrlcapYAfctK/yE1WB+JdUdWjwP+r2MsHWWWH5fdZsFXeqim
 DXi23m49cXbHzcZc2W8wBGe/tsSnqh5+HQDGvdO/CnwhyPfm07fj7CJsn+VRNJcZ15PsOe
 HAdWgZiGTUYGSUbEOshMJYcWkUvnJ0NrBYm05HLmmdAaxQJoUy2Jh989ok8kN3FxTogWXl
 AGo997cFAkqxHjlcm8mxsyS8Iq0AYRg3HwP4IVpPpOGvr8rT9Zz0HIHZcHnHTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XyBBYV9C
Subject: Re: [Buildroot] [PATCH 35/40] package/uboot-tools: preserve
 /usr/sbin symlink
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

CgpPbiAwOC8wNS8yMDI2IDIwOjA5LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBGcmksIE1h
eSA4LCAyMDI2IGF0IDM6NTfigK9BTSBGZXJkaW5hbmQgQmFjaG1hbm4KPiA8ZmVyZGluYW5kLmJh
Y2htYW5uQGdvLWUuY29tPiB3cm90ZToKPj4KPj4gSGkgSmFtZXMhCj4+Cj4+IC1EIG5vcm1hbGx5
IGRvZXNuJ3QgcmVwbGFjZSBzeW1saW5rcyB3aXRoIGRpcmVjdG9yaWVzLCBidXQgVWJ1bnR1IDI2
LjA0IHNoaXBzIHdpdGggUnVzdCB1dXRpbHMgaW5zdGVhZCBvZiBHTlUgY29yZXV0aWxzLCB3aGlj
aCBoYXMgYSBidWcgaW4gYGluc3RhbGxgIHRoYXQgY2F1c2VzIHRoaXM6CgogIEFoLCBJIHNob3Vs
ZCBoYXZlIHJlYWQgdGhlIHJlc3Qgb2YgdGhlIHRocmVhZCBiZWZvcmUgcmVwbHlpbmcgdG8gcGF0
Y2ggMS80MCA6LSkKCj4gT2gsIHRoYXQgbWFrZXMgbW9yZSBzZW5zZSwgSSBoYWQgYXNzdW1lZCBp
dCB3YXMgZHVlIHRvIG1lcmdlZCBiaW4KPiBzaW5jZSB0aGUgcnN5bmMgZXJyb3Igd2FzIGJhc2lj
YWxseSB0aGUgc2FtZSBhcyB0aGlzOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVp
bGRyb290L2NvbW1pdC8yODY5NGRjZWM3MmIxMWZhY2E2ZTlkOTM3MWZiMGY2NWM1OTBkZThiCj4g
Cj4gSSB0ZXN0ZWQgd2l0aCB0aGUgZG9jdW1lbnRlZCB3b3JrYXJvdW5kIG9uIGdpdGh1YiBhbmQg
aXQgc2VlbXMgdG8gaGF2ZQo+IGZpeGVkIHRoZSBpc3N1ZToKPiB1cGRhdGUtYWx0ZXJuYXRpdmVz
IC0taW5zdGFsbCAvdXNyL2Jpbi9pbnN0YWxsIGluc3RhbGwgL3Vzci9iaW4vZ251aW5zdGFsbCAx
MDAKPiAKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL3V1dGlscy9jb3JldXRpbHMvaXNzdWVzLzEy
MTY2Cj4+Cj4+IFRoaXMgYWxzbyBhZmZlY3RzIGxvdHMgb2Ygb3RoZXIgcGFja2FnZXMgKGUuZy4g
bHZtMikgYW5kIHBhdGNoaW5nIGV2ZXJ5IHNpbmdsZSBvbmUgb2YgdGhlbSB0byBub3QgdXNlIGBp
bnN0YWxsIC1EYCBpcyBwcm9iYWJseSBvdXQgb2YgdGhlIHF1ZXN0aW9uLgoKICBBY3R1YWxseSwg
aWYgaXQncyByZWFsbHkgYSB1dXRpbHMgaXNzdWUsIHBsZWFzZSByZXBvcnQgaXQgdG8gVWJ1bnR1
LiBUaGV5IGFyZSAKdmVyeSBnb29kIGF0IGZpeGluZyB0aGlzIHN0dWZmIHF1aWNrbHkuIEkgZXhw
ZWN0IHRoZSBpc3N1ZSB0byBkaXNhcHBlYXIgc2hvcnRseS4KCj4gCj4gSG1tLCB5ZWFoLCB0aGF0
J3Mgbm90IGlkZWFsLCBub3Qgc3VyZSBpZiB3ZSBzaG91bGQgc3RpbGwgY2hhbmdlIHRoZSA0MAo+
IEkgcGF0Y2hlZCBvciBub3QuCgogIE5vLCB3ZSBzaG91bGRuJ3QuIEkgbWFya2VkIHRoZSBlbnRp
cmUgc2VyaWVzIGFzIFJlamVjdGVkLgoKICBQbGVhc2UgZG9uJ3QgdGhyb3cgYXdheSB5b3VyIGJy
YW5jaCB5ZXQgdGhvdWdoLiBJZiBVYnVudHUgY2xhaW1zIHRoYXQgaXQncyBub3QgCmFjdHVhbGxs
eSBhIGJ1Zywgd2UncmUgZ29pbmcgdG8gbmVlZCBpdCBhZnRlciBhbGwuCgogIFJlZ2FyZHMsCiAg
QXJub3V0CgoKPiAKPj4gQWxzbywgY2FuIHlvdSBsb29rIGF0IG15IHBhdGNoIGZvciBpc3N1ZSAx
NzMgKGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL3dvcmtfaXRl
bXMvMTczKT8gdWJvb3QtdG9vbHMgY3VycmVudGx5IHNpbGVudGx5IGJ1aWxkcyB3aXRob3V0IEZJ
VF9TSUdOQVRVUkUgc3VwcG9ydCBldmVuIGlmIGVuYWJsZWQuIFRoaXMgc2hvdWxkIGJlIGZpeGVk
Lgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEZlcmRpbmFuZCBCYWNobWFubgo+Pgo+PiBPbiBUaHUs
IDcgTWF5IDIwMjYgYXQgMDA6MzQsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21h
aWwuY29tPiB3cm90ZToKPj4+Cj4+PiBXaXRoIEJSMl9ST09URlNfTUVSR0VEX0JJTj15LCAvdXNy
L3NiaW4gaXMgYSBzeW1saW5rIHRvIGJpbi4KPj4+IFVzaW5nIGluc3RhbGwgLUQgZm9yIGZpbGVz
IGJlbG93ICQoVEFSR0VUX0RJUikvdXNyL3NiaW4gY2FuIGNyZWF0ZQo+Pj4gdGhlIHBhcmVudCBk
aXJlY3RvcnkgcGF0aCBhbmQgcmVwbGFjZSB0aGF0IHN5bWxpbmsgd2l0aCBhIHJlYWwKPj4+IGRp
cmVjdG9yeS4KPj4+Cj4+PiBXaXRoIHBlci1wYWNrYWdlIGRpcmVjdG9yaWVzLCB0aGlzIGNhbiBs
YXRlciBtYWtlIHJzeW5jIGZhaWwgd2hlbiBhCj4+PiBwYWNrYWdlIHRhcmdldCBkaXJlY3Rvcnkg
Y29udGFpbnMgYSBub24tZW1wdHkgdXNyL3NiaW4gZGlyZWN0b3J5IGFuZAo+Pj4gdGhlIHNrZWxl
dG9uIHByb3ZpZGVzIHVzci9zYmluIC0+IGJpbi4KPj4+Cj4+PiBUaGUgc2tlbGV0b24gZGVwZW5k
ZW5jeSBoYXMgYWxyZWFkeSBjcmVhdGVkIC91c3Ivc2JpbiwgZWl0aGVyIGFzIGEKPj4+IGRpcmVj
dG9yeSBvciBhcyB0aGUgbWVyZ2VkLWJpbiBzeW1saW5rLCBzbyB1c2UgcGxhaW4gaW5zdGFsbCBh
bmQgbGV0IGl0Cj4+PiBmb2xsb3cgdGhlIGV4aXN0aW5nIHBhdGguCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4+PiAtLS0K
Pj4+ICAgcGFja2FnZS91Ym9vdC10b29scy91Ym9vdC10b29scy5tayB8IDQgKystLQo+Pj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3Vib290LXRvb2xzL3Vib290LXRvb2xzLm1rIGIvcGFja2FnZS91
Ym9vdC10b29scy91Ym9vdC10b29scy5tawo+Pj4gaW5kZXggZmEwYjZhYmE3OC4uODlkMmVjMzhl
YSAxMDA2NDQKPj4+IC0tLSBhL3BhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsKPj4+
ICsrKyBiL3BhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsKPj4+IEBAIC05MiwxNCAr
OTIsMTQgQEAgZW5kaWYKPj4+Cj4+PiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfVUJPT1RfVE9PTFNf
RldQUklOVEVOVikseSkKPj4+ICAgZGVmaW5lIFVCT09UX1RPT0xTX0lOU1RBTExfRldQUklOVEVO
Vgo+Pj4gLSAgICAgICAkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvdG9vbHMvZW52L2Z3X3By
aW50ZW52ICQoVEFSR0VUX0RJUikvdXNyL3NiaW4vZndfcHJpbnRlbnYKPj4+ICsgICAgICAgJChJ
TlNUQUxMKSAtbSAwNzU1ICQoQEQpL3Rvb2xzL2Vudi9md19wcmludGVudiAkKFRBUkdFVF9ESVIp
L3Vzci9zYmluL2Z3X3ByaW50ZW52Cj4+PiAgICAgICAgICBsbiAtc2YgZndfcHJpbnRlbnYgJChU
QVJHRVRfRElSKS91c3Ivc2Jpbi9md19zZXRlbnYKPj4+ICAgZW5kZWYKPj4+ICAgZW5kaWYKPj4+
Cj4+PiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfVUJPT1RfVE9PTFNfRFVNUElNQUdFKSx5KQo+Pj4g
ICBkZWZpbmUgVUJPT1RfVE9PTFNfSU5TVEFMTF9EVU1QSU1BR0UKPj4+IC0gICAgICAgJChJTlNU
QUxMKSAtbSAwNzU1IC1EICQoQEQpL3Rvb2xzL2R1bXBpbWFnZSAkKFRBUkdFVF9ESVIpL3Vzci9z
YmluL2R1bXBpbWFnZQo+Pj4gKyAgICAgICAkKElOU1RBTEwpIC1tIDA3NTUgJChARCkvdG9vbHMv
ZHVtcGltYWdlICQoVEFSR0VUX0RJUikvdXNyL3NiaW4vZHVtcGltYWdlCj4+PiAgIGVuZGVmCj4+
PiAgIGVuZGlmCj4+Pgo+Pj4gLS0KPj4+IDIuNTMuMAo+Pj4KPj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
