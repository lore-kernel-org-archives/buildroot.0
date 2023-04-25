Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03664C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 14:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A45D60AAC;
	Tue, 25 Apr 2023 14:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A45D60AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEZCqtwyGjVv; Tue, 25 Apr 2023 14:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F9861430;
	Tue, 25 Apr 2023 14:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62F9861430
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0031BF315
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 14:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5648961430
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 14:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5648961430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3UDuTZpxH6B for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 14:30:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0856360AAC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0856360AAC
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 14:30:44 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1prJgl-00BgPt-M2; Tue, 25 Apr 2023 16:30:39 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 1344e45e;
 Tue, 25 Apr 2023 14:30:37 +0000 (UTC)
Date: Tue, 25 Apr 2023 17:30:33 +0300
Message-ID: <20230425173033.GB998279@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20230424151152.GB3960430@igalia.com>
References: <20230227105838.358916-1-thomas.devoogdt@barco.com>
 <20230424151152.GB3960430@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lHG9rRq+nDZ+irozVQMj6RvCJbb3wyM9797fH87Cd4Q=; b=Bf6C/4j4PjIJV6/bPCT7tSvFaJ
 DMRKlWa+74GsrSfSissodim8aXb/RtTmwQwGotN9fLGuTT/lUQp+MFlHB630efjaPvQC6r3PhdR4/
 OF0y2+QAyTVx81TNcs9ksbb/3JzTtiDLPHmEtjEc+VXLsEdEPcoJi0QFyxHRjIvMYmxhd5DLlGSE3
 QJsmfeThlittY4QkcKrrZjryiBTzADOrXFNivG06k7ru7HlqJjJc5gf/1eL25vjInCT5u8NYfkHk0
 nO315vNI9SRVaK6LP9fk/DMIja+NfU37MwsCASP4v6EIToIXu7JKZLshyUuylpmhJkhCCpNUksRm0
 aO0x2YIg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=Bf6C/4j4
Subject: Re: [Buildroot] [PATCH v5 1/5] package/at-spi2-core: bump to
 version 2.47.1
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
Cc: Daniel Lang <d.lang@abatec.at>, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0894484006942209781=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0894484006942209781==
Content-Type: multipart/signed; boundary="trPV9A4v7OK9Rz0n"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--trPV9A4v7OK9Rz0n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gYWdhaW4sCgpPbiBNb24sIDI0IEFwciAyMDIzIDE1OjExOjUyICswMzAwIEFkcmlhbiBQ
ZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiBIaSBhbGwsCj4gCj4g
T24gTW9uLCAyNyBGZWIgMjAyMyAxMTo1ODozNCArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+ID4gRnJvbTogRGFuaWVsIExhbmcgPGQubGFuZ0BhYmF0
ZWMuYXQ+Cj4gPiAKPiA+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9hdC1zcGkyLWNv
cmUvLS9ibG9iL0FUX1NQSTJfQ09SRV8yXzQ3XzEvTkVXUwo+ID4gCj4gPiAtIFgxMSBpcyBub3cg
b3B0aW9uYWwuCj4gPiAtIGxpYnhtbDIgaXMgbm8gbG9uZ2VyIG9wdGlvbmFsLgo+ID4gLSBhdGsg
YW5kIGF0LXNwaTItYXRrIGhhdmUgYmVlbiBtZXJnZWQgaW50byBhdC1zcGkyLWNvcmUuCj4gPiAt
IGF0ayBpbnRyb3NwZWN0aW9uIG9wdGlvbiBhZGRlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
RGFuaWVsIExhbmcgPGQubGFuZ0BhYmF0ZWMuYXQ+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
RGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+Cj4gCj4gSSB0ZXN0ZWQgdGhpcyBw
YXRjaCBzZXJpZXMgYW5kIGluZGVlZCBpdCBhbHNvIHNvbHZlcyB0aGUgV2ViS2l0R1RLIGJ1aWxk
Cj4gaXNzdWVzIGNhdXNlcyBieSBhdGstYnJpZGdlIGJlaW5nIG1pc3NpbmcuIE92ZXJhbGwgSSBw
cmVmZXIgdGhpcyBhcHByb2FjaAo+IGJldHRlciB0aGFuIHBhdGNoaW5nIGxpYmd0azMncyBNZXNv
biBidWlsZCBzeXN0ZW0gYXMgc3VnZ2VzdGVkIGluIGFub3RoZXIKPiBwYXRjaC4KPiAKPiBUaGVy
ZSBpcyBvbmUgaHVyZGxlLCB0aG91Z2g6IEkgaGF2ZSB0byBtYWtlIG9uZSBwYXRjaCBmb3IgYXQt
c3BpMi1jb3JlCj4gYmVjYXVzZSBJIGhhdmUgZGJ1cy1icm9rZXIgaW5zdGFsbGVkIGluIG9uZSBv
ZiBteSBjb21wdXRlcnMgYW5kIHRyeWluZyB0bwo+IGJ1aWxkIHRoZXJlIHJlc3VsdCBpbiB0aGUg
YnVpbGQgY29uZmlndXJhdGlvbiB0aGlua2luZyB0aGF0IGl0IG5lZWRzIHRvCj4gdXNlIGxpYnN5
c3RlbWQgd2hlbiB0aGUgQnVpbGRyb290IGNvbmZpZ3VyYXRpb24gaGFzIGl0IGRpc2FibGVkLiBJ
IG1hZGUKPiB0aGlzIHBhdGNoIHdoaWNoIHNvbHZlZCB0aGUgaXNzdWUgZm9yIG1lLCBhbHRob3Vn
aCBJIGFtIG5vdCAxMDAlIHN1cmUgaXQKPiBpcyB0aGUgYmVzdCB3YXkgdG8gZ286Cj4gCj4gICBo
dHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvYXQtc3BpMi1jb3JlLy0vbWVyZ2VfcmVxdWVz
dHMvMTM0Cj4gCj4gV2UgbWF5IHdhbnQgdG8gaW5jbHVkZSB0aGlzIHBhdGNoIChvciBhIHNpbWls
YXIgb25lKSB3aGlsZSB1cHN0cmVhbSBkb2VzCj4gbm90IGhhdmUgYSBzb2x1dGlvbiBmb3IgdGhp
cyBpc3N1ZS4KCk15IHBhdGNoIGZvciBhdC1zcGkyLWNvcmUgd2FzIG1lcmdlZCwgaWYgeW91IHdv
dWxkIHJlc3VibWl0IHRoZSB2ZXJzaW9uCmJ1bXAgd2l0aCBpdCBpbmNsdWRlZCwgSSB3aWxsIGhh
cHBpbHkgYWRkIG15IFRlc3RlZC1CeSAvIFJldmlld2VkLUJ5IHRvCnRoZSB3aG9sZSBzZXJpZXMg
Oy0pCiAKPiA+IC0tLQo+ID4gdjM6Cj4gPiAgLSByZWJhc2VkIG9uIGh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTMzNjI1NAo+ID4gIC0g
bmVlZGVkIHRvIGZpeCB0aGUgd2Via2l0Z3RrIDIuMzguNSBjb21waWxhdGlvbgo+ID4gICAgKGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzAy
MjAwOTA5MjMuMjE1NTYzNS0yLXRob21hcy5kZXZvb2dkdEBiYXJjby5jb20vKQo+ID4gdjU6IHJl
YmFzZWQgKyBncm91cGVkIHBhdGNoZXMKPiA+IC0tLQo+ID4gIHBhY2thZ2UvYXQtc3BpMi1jb3Jl
L0NvbmZpZy5pbiAgICAgICAgIHwgIDggKystLS0tLS0KPiA+ICBwYWNrYWdlL2F0LXNwaTItY29y
ZS9hdC1zcGkyLWNvcmUuaGFzaCB8ICA0ICsrLS0KPiA+ICBwYWNrYWdlL2F0LXNwaTItY29yZS9h
dC1zcGkyLWNvcmUubWsgICB8IDIwICsrKysrKysrKysrKysrKysrLS0tCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvYXQtc3BpMi1jb3JlL0NvbmZpZy5pbiBiL3BhY2thZ2UvYXQtc3BpMi1j
b3JlL0NvbmZpZy5pbgo+ID4gaW5kZXggZjU2YzViOTNjNC4uMWY2YzQyMTc3NyAxMDA2NDQKPiA+
IC0tLSBhL3BhY2thZ2UvYXQtc3BpMi1jb3JlL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9h
dC1zcGkyLWNvcmUvQ29uZmlnLmluCj4gPiBAQCAtMSwxMiArMSwxMiBAQAo+ID4gIGNvbmZpZyBC
UjJfUEFDS0FHRV9BVF9TUEkyX0NPUkUKPiA+ICAJYm9vbCAiYXQtc3BpMi1jb3JlIgo+ID4gLQlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1hPUkc3ICMgeGxpYi1saWJ4dHN0Cj4gPiAgCWRlcGVuZHMg
b24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGRidXMsIGdsaWIyCj4gPiAgCWRlcGVuZHMg
b24gQlIyX1VTRV9NTVUgIyBnbGliMgo+ID4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBn
bGliMgo+ID4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfREJVUwo+ID4gIAlzZWxlY3QgQlIyX1BBQ0tB
R0VfTElCR0xJQjIKPiA+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJfTElCWFRTVAo+ID4gKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfTElCWE1MMgo+ID4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfWExJQl9M
SUJYVFNUIGlmIEJSMl9QQUNLQUdFX1hPUkc3ICMgb3B0aW9uYWxseSBmb3IgWDExCj4gPiAgCWhl
bHAKPiA+ICAJICBUaGUgQXQtU3BpMiBDb3JlIHBhY2thZ2UgaXMgYSBwYXJ0IG9mIHRoZSBHTk9N
RQo+ID4gIAkgIEFjY2Vzc2liaWxpdHkgUHJvamVjdC4gSXQgcHJvdmlkZXMgYSBTZXJ2aWNlIFBy
b3ZpZGVyCj4gPiBAQCAtMTksNyArMTksMyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQVRfU1BJMl9D
T1JFCj4gPiAgY29tbWVudCAiYXQtc3BpMi1jb3JlIG5lZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFy
LCB0aHJlYWRzIgo+ID4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCj4gPiAgCWRlcGVuZHMgb24g
IUJSMl9VU0VfV0NIQVIgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiA+IC0KPiA+IC1j
b21tZW50ICJhdC1zcGkyLWNvcmUgZGVwZW5kcyBvbiBYLm9yZyIKPiA+IC0JZGVwZW5kcyBvbiBC
UjJfVVNFX01NVQo+ID4gLQlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9YT1JHNwo+ID4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvYXQtc3BpMi1jb3JlL2F0LXNwaTItY29yZS5oYXNoIGIvcGFja2FnZS9h
dC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLmhhc2gKPiA+IGluZGV4IDc2NGU0YzM2NjEuLjQ1MzFi
ZjM5NmMgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2F0LXNwaTItY29yZS9hdC1zcGkyLWNvcmUu
aGFzaAo+ID4gKysrIGIvcGFja2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLmhhc2gKPiA+
IEBAIC0xLDUgKzEsNSBAQAo+ID4gLSMgRnJvbSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9z
b3VyY2VzL2F0LXNwaTItY29yZS8yLjM2L2F0LXNwaTItY29yZS0yLjM2LjAuc2hhMjU2c3VtCj4g
PiAtc2hhMjU2ICA4OGRhNTdkZTBhN2UzYzYwYmMzNDFhOTc0YTgwZmRiYTA5MTYxMmRiMzU0N2M0
MTBkNmRlYWIwMzljYTVjMDVhICBhdC1zcGkyLWNvcmUtMi4zNi4wLnRhci54ego+ID4gKyMgRnJv
bSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2F0LXNwaTItY29yZS8yLjQ3L2F0
LXNwaTItY29yZS0yLjQ3LjEuc2hhMjU2c3VtCj4gPiArc2hhMjU2ICBjNmJhN2MxNjA0MzRlZGVi
ZjA5ZDI5MzY5MzM1NjljOTM2ZjZlYzk3MjMwMTc2NmYyYmRhYzVhNGQ0MTgxNTNjICBhdC1zcGky
LWNvcmUtMi40Ny4xLnRhci54ego+ID4gIAo+ID4gICMgbG9jYWxseSBjYWxjdWxhdGVkCj4gPiAg
c2hhMjU2ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3YTY0ZmUzYWRiMDYz
Nzk5ZDhhYjAzMmZlNTUxICBDT1BZSU5HCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdC1zcGky
LWNvcmUvYXQtc3BpMi1jb3JlLm1rIGIvcGFja2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3Jl
Lm1rCj4gPiBpbmRleCBmMGIwMTljMGVkLi5lOThlNzc5ODg0IDEwMDY0NAo+ID4gLS0tIGEvcGFj
a2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLm1rCj4gPiArKysgYi9wYWNrYWdlL2F0LXNw
aTItY29yZS9hdC1zcGkyLWNvcmUubWsKPiA+IEBAIC00LDE3ICs0LDMxIEBACj4gPiAgIwo+ID4g
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiAgCj4gPiAtQVRfU1BJMl9DT1JFX1ZFUlNJT05f
TUFKT1IgPSAyLjM2Cj4gPiAtQVRfU1BJMl9DT1JFX1ZFUlNJT04gPSAkKEFUX1NQSTJfQ09SRV9W
RVJTSU9OX01BSk9SKS4wCj4gPiArQVRfU1BJMl9DT1JFX1ZFUlNJT05fTUFKT1IgPSAyLjQ3Cj4g
PiArQVRfU1BJMl9DT1JFX1ZFUlNJT04gPSAkKEFUX1NQSTJfQ09SRV9WRVJTSU9OX01BSk9SKS4x
Cj4gPiAgQVRfU1BJMl9DT1JFX1NPVVJDRSA9IGF0LXNwaTItY29yZS0kKEFUX1NQSTJfQ09SRV9W
RVJTSU9OKS50YXIueHoKPiA+ICBBVF9TUEkyX0NPUkVfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQu
Z25vbWUub3JnL3NvdXJjZXMvYXQtc3BpMi1jb3JlLyQoQVRfU1BJMl9DT1JFX1ZFUlNJT05fTUFK
T1IpCj4gPiAgQVRfU1BJMl9DT1JFX0xJQ0VOU0UgPSBMR1BMLTIuMSsKPiA+ICBBVF9TUEkyX0NP
UkVfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiA+ICBBVF9TUEkyX0NPUkVfSU5TVEFMTF9TVEFH
SU5HID0gWUVTCj4gPiAtQVRfU1BJMl9DT1JFX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBk
YnVzIGxpYmdsaWIyIHhsaWJfbGliWHRzdCBcCj4gPiArQVRfU1BJMl9DT1JFX0RFUEVOREVOQ0lF
UyA9IGhvc3QtcGtnY29uZiBkYnVzIGxpYmdsaWIyIGxpYnhtbDIgXAo+ID4gIAkkKFRBUkdFVF9O
TFNfREVQRU5ERU5DSUVTKQo+ID4gIEFUX1NQSTJfQ09SRV9DT05GX09QVFMgPSAtRGRidXNfZGFl
bW9uPS91c3IvYmluL2RidXMtZGFlbW9uCj4gPiAgCj4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9Y
T1JHNykseSkKPiA+ICtBVF9TUEkyX0NPUkVfQ09ORl9PUFRTICs9IC1EeDExPWVuYWJsZWQKPiA+
ICtBVF9TUEkyX0NPUkVfREVQRU5ERU5DSUVTICs9IHhsaWJfbGliWHRzdAo+ID4gK2Vsc2UKPiA+
ICtBVF9TUEkyX0NPUkVfQ09ORl9PUFRTICs9IC1EeDExPWRpc2FibGVkCj4gPiArZW5kaWYKPiA+
ICsKPiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0dPQkpFQ1RfSU5UUk9TUEVDVElPTikseSkKPiA+
ICtBVF9TUEkyX0NPUkVfQ09ORl9PUFRTICs9IC1EaW50cm9zcGVjdGlvbj1lbmFibGVkCj4gPiAr
QVRfU1BJMl9DT1JFX0RFUEVOREVOQ0lFUyArPSBnb2JqZWN0LWludHJvc3BlY3Rpb24KPiA+ICtl
bHNlCj4gPiArQVRfU1BJMl9DT1JFX0NPTkZfT1BUUyArPSAtRGludHJvc3BlY3Rpb249ZGlzYWJs
ZWQKPiA+ICtlbmRpZgo+ID4gKwo+ID4gIEFUX1NQSTJfQ09SRV9MREZMQUdTID0gJChUQVJHRVRf
TERGTEFHUykgJChUQVJHRVRfTkxTX0xJQlMpCj4gPiAgCj4gPiAgJChldmFsICQobWVzb24tcGFj
a2FnZSkpCj4gPiAtLSAKPiA+IDIuMzkuMgo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4gCj4gCj4gQ2hlZXJzLAo+IOKAlEFkcmnDoW4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKQ2hlZXJzLArigJRB
ZHJpw6FuCg==

--trPV9A4v7OK9Rz0n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZEfkCQAKCRCRxVnb5MkS
OzTvAJ9C0N+BK0Rj+CkySu5MSFMeS/MFxACfTH8TDSI7SSlF0iALOWkHDSxwzjs=
=fXW1
-----END PGP SIGNATURE-----

--trPV9A4v7OK9Rz0n--

--===============0894484006942209781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0894484006942209781==--
