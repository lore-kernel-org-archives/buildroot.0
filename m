Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31464C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0226E419D8;
	Fri, 16 May 2025 11:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgP2bd7SRyi5; Fri, 16 May 2025 11:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12784419BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12784419BA;
	Fri, 16 May 2025 11:04:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9121313D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7633D41867
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncuDqmANkuqT for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7349641954
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7349641954
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7349641954
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:04:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7BEF01C0DFB; Fri, 16 May 2025 13:04:38 +0200 (CEST)
Message-ID: <8187d02a-14e1-40a1-9289-720a82cd2a52@rnout.be>
Date: Fri, 16 May 2025 13:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250505190840.1316502-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250505190840.1316502-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393478; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=icdhYxCZRYny8rkj1aoJKZ5UV64Azwi8m8Ipx50zKz8=;
 b=Jy0fp8GS9SSqe+wrg1SFkft1TaMOSiF0r6YPP2mx3YYVJ30iVCi1pSZ1cX4aN3FDlDOH2F
 zU6ouHb99XmNdduMjbf60zy0NbSEYT6O1WqhD/fcp4KytH8wvOQOn8FVNJcy3g8RNmpjTC
 JCT3s7sW+LYOCtUKAa82HG5roC35rFCNhi2Jh1vgo8DiSBPpcaKQ0D/5VbVUuKyNoPc9ee
 OpCto2CE6AZLBK6o+5nkbbad+OhQFgfzW+zMT5d+HJ3G/2PLzV+Oqf0YXkWxHvnksTLdSF
 RqpRCPhhD36XVqh3BD7ZKR5tpRUEkKN0l9KbS7nyNL8v1Ms0gwB16yJoSdcoxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Jy0fp8GS
Subject: Re: [Buildroot] [PATCH 1/1] package/gmp: add patch to fix build
 with gcc-15
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

CgpPbiAwNS8wNS8yMDI1IDIxOjA4LCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBXaGVuIHVzaW5n
IGhvc3QgZ2NjIDE1LCBob3N0LWdtcCBmYWlscyBhdCBjb25maWd1cmUgdGltZSB3aXRoCj4gZXJy
b3IgbWVzc2FnZToKPiAKPiAgICAgIGNvbmZpZ3VyZTogZXJyb3I6IGNvdWxkIG5vdCBmaW5kIGEg
d29ya2luZyBjb21waWxlciwgc2VlIGNvbmZpZy5sb2cgZm9yIGRldGFpbHMKPiAKPiBUaGUgZXJy
b3IgaXMgZHVlIHRvIHRoZSBtYWNybyBHTVBfUFJPR19DQ19XT1JLUyBpbiB0aGUgZmlsZQo+IGFj
aW5jbHVkZS5tNCBjb250YWluaW5nIEMtY29kZSBkZWNsYXJpbmcgZnVuY3Rpb25zIHdpdGhvdXQg
ZGVjbGFyaW5nCj4gaXRzIHBhcmFtZXRlcnMuIFRoaXMgY29uc3RydWN0IGlzIG5vdyBhbiBlcnJv
ciBpbiBDMjMsIHdoaWNoIGlzIHRoZQo+IG5ldyBkZWZhdWx0IGluIGdjYyAxNS4gU2VlOgo+IGh0
dHBzOi8vZ2NjLmdudS5vcmcvZ2NjLTE1L3BvcnRpbmdfdG8uaHRtbCNjMjMKPiAKPiBUaGlzIGNv
bW1pdCBmaXhlcyB0aGUgaXNzdWUgYnkgYWRkaW5nIGEgcGFja2FnZSBwYXRjaCBmcm9tCj4gdXBz
dHJlYW0gY2hhbmdlc2V0cywgbm90IHlldCBwdWJsaXNoZWQgaW4gYSByZWxlYXNlLgo+IAo+IEV2
ZW4gaWYgZ2NjIDE1IGlzIG5vdCB5ZXQgaW5jbHVkZWQgaW4gQnVpbGRyb290LCB0aGlzIGNvbW1p
dCBhbHNvCj4gc2V0cyBfQVVUT1JFQ09ORiA9IFlFUyBmb3IgdGhlIHRhcmdldCBwYWNrYWdlIGlu
IG9yZGVyIHRvIGhhdmUgdGhpcwo+IHBhY2thZ2UgYWxyZWFkeSBmaXhlZC4KPiAKPiBGaXhlczoK
PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNjIzNjM0ZmE3YmJlY2Vl
YjZkOTBiMTVjZTBhYmIxYjliNGIyNDA0NS8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xp
dmFpbiA8anUub0BmcmVlLmZyPgoKICBBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKICBS
ZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiBQYXRjaCB0ZXN0ZWQgYnkgY29tcGlsaW5nIHFlbXVf
YWFyY2g2NF92aXJ0X2RlZmNvbmZpZyBpbgo+IC0gQnVpbGRyb290IHJlZmVyZW5jZSBkb2NrZXIg
aW1hZ2UgKERlYmlhbiAxMiwgaG9zdCBnY2MgMTIpCj4gLSBGZWRvcmEgNDEgKGhvc3QgZ2NjIDE0
KQo+IC0gRmVkb3JhIDQyIChob3N0IGdjYyAxNSkKPiAtLS0KPiAgIC4uLm4tcHJvdG90eXBlLWlu
LWFjaW5jbHVkZS5tNC1mb3ItQzIzLS5wYXRjaCB8IDUxICsrKysrKysrKysrKysrKysrKysKPiAg
IHBhY2thZ2UvZ21wL2dtcC5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2dtcC8wMDAxLUNvbXBsZXRlLWZ1bmN0aW9uLXByb3RvdHlwZS1pbi1hY2luY2x1
ZGUubTQtZm9yLUMyMy0ucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbXAvMDAwMS1D
b21wbGV0ZS1mdW5jdGlvbi1wcm90b3R5cGUtaW4tYWNpbmNsdWRlLm00LWZvci1DMjMtLnBhdGNo
IGIvcGFja2FnZS9nbXAvMDAwMS1Db21wbGV0ZS1mdW5jdGlvbi1wcm90b3R5cGUtaW4tYWNpbmNs
dWRlLm00LWZvci1DMjMtLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwLi4xMjlhNGE4OGUwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZ21wLzAw
MDEtQ29tcGxldGUtZnVuY3Rpb24tcHJvdG90eXBlLWluLWFjaW5jbHVkZS5tNC1mb3ItQzIzLS5w
YXRjaAo+IEBAIC0wLDAgKzEsNTEgQEAKPiArRnJvbSA5Y2QwYzM2ZDAxMTAxOTFhNWY0MmUyNjhk
N2JkMjFhOTVhMmFhODgzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBNYXJjIEds
aXNzZSA8bWFyYy5nbGlzc2VAaW5yaWEuZnI+Cj4gK0RhdGU6IFdlZCwgMjkgSmFuIDIwMjUgMjI6
Mzg6MDIgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBDb21wbGV0ZSBmdW5jdGlvbiBwcm90b3R5
cGUgaW4gYWNpbmNsdWRlLm00IGZvciBDMjMKPiArIGNvbXBhdGliaWxpdHkKPiArCj4gK0FkZCBw
YXJhbWV0ZXIgbmFtZXMgdG8gZnVuY3Rpb24gcHJvdG90eXBlCj4gKwo+ICtVcHN0cmVhbTogaHR0
cHM6Ly9nbXBsaWIub3JnL3JlcG8vZ21wL3Jldi9kNjZkNjZkODJkYmIKPiArVXBzdHJlYW06IGh0
dHBzOi8vZ21wbGliLm9yZy9yZXBvL2dtcC9yZXYvOGU3YmI0YWU3YTE4Cj4gK1NpZ25lZC1vZmYt
Ynk6IE1hcmMgR2xpc3NlIDxtYXJjLmdsaXNzZUBpbnJpYS5mcj4KPiArW0p1bGllbjogZ2l0IHBh
dGNoIGFkYXB0ZWQgZnJvbSB0d28gdXBzdHJlYW0gbWVyY3VyaWFsIGNoYW5nZXNldHNdCj4gK1Np
Z25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gKy0tLQo+ICsgQ2hh
bmdlTG9nICAgIHwgOSArKysrKysrKysKPiArIGFjaW5jbHVkZS5tNCB8IDIgKy0KPiArIDIgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAt
LWdpdCBhL0NoYW5nZUxvZyBiL0NoYW5nZUxvZwo+ICtpbmRleCAyOTAyY2QyLi5kODA4YThiIDEw
MDY0NAo+ICstLS0gYS9DaGFuZ2VMb2cKPiArKysrIGIvQ2hhbmdlTG9nCj4gK0BAIC0xLDMgKzEs
MTIgQEAKPiArKzIwMjUtMDMtMTUgIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Cj4gKysK
PiArKwkqIGFjaW5jbHVkZS5tNDogQWRkIHBhcmFtZXRlciBuYW1lcyB0byBmdW5jdGlvbiBwcm90
b3R5cGUuCj4gKysKPiArKzIwMjUtMDEtMjkgIFJ1ZGkgSGVpdGJhdW0gPHJ1ZGlAaGVpdGJhdW0u
Y29tPgo+ICsrCSAgICBNYXJjIEdsaXNzZSA8bWFyYy5nbGlzc2VAaW5yaWEuZnI+Cj4gKysKPiAr
KwkqIGFjaW5jbHVkZS5tNDogQ29tcGxldGUgZnVuY3Rpb24gcHJvdG90eXBlLgo+ICsrCj4gKyAy
MDIzLTA3LTI5ICBUb3JiasO2cm4gR3Jhbmx1bmQgIDx0Z0BnbXBsaWIub3JnPgo+ICsKPiArIAkq
IFZlcnNpb24gNi4zLjAgcmVsZWFzZWQuCj4gK2RpZmYgLS1naXQgYS9hY2luY2x1ZGUubTQgYi9h
Y2luY2x1ZGUubTQKPiAraW5kZXggOWNmOTQ4My4uYjc5YTQzMSAxMDA2NDQKPiArLS0tIGEvYWNp
bmNsdWRlLm00Cj4gKysrKyBiL2FjaW5jbHVkZS5tNAo+ICtAQCAtNjA5LDcgKzYwOSw3IEBAIEdN
UF9QUk9HX0NDX1dPUktTX1BBUlQoWyQxXSwgW2xvbmcgbG9uZyByZWxpYWJpbGl0eSB0ZXN0IDFd
LAo+ICsKPiArICNpZiBkZWZpbmVkIChfX0dOVUNfXykgJiYgISBkZWZpbmVkIChfX2NwbHVzcGx1
cykKPiArIHR5cGVkZWYgdW5zaWduZWQgbG9uZyBsb25nIHQxO3R5cGVkZWYgdDEqdDI7Cj4gKy12
b2lkIGcoKXt9Cj4gKyt2b2lkIGcoaW50IGEsdDEgY29uc3QqYix0MSBjLHQyIGQsdDEgY29uc3Qq
ZSxpbnQgZil7fQo+ICsgdm9pZCBoKCl7fQo+ICsgc3RhdGljIF9faW5saW5lX18gdDEgZSh0MiBy
cCx0MiB1cCxpbnQgbix0MSB2MCkKPiArIHt0MSBjLHgscjtpbnQgaTtpZih2MCl7Yz0xO2Zvcihp
PTE7aTxuO2krKyl7eD11cFtpXTtyPXgrMTtycFtpXT1yO319cmV0dXJuIGM7fQo+ICstLQo+ICsy
LjQ5LjAKPiArCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ21wL2dtcC5tayBiL3BhY2thZ2UvZ21w
L2dtcC5tawo+IGluZGV4IDdlOGRhOTAyNWMuLjA3YWE0YWVmZGYgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9nbXAvZ21wLm1rCj4gKysrIGIvcGFja2FnZS9nbXAvZ21wLm1rCj4gQEAgLTE0LDYgKzE0
LDEwIEBAIEdNUF9DUEVfSURfVkVORE9SID0gZ21wbGliCj4gICBHTVBfREVQRU5ERU5DSUVTID0g
aG9zdC1tNAo+ICAgSE9TVF9HTVBfREVQRU5ERU5DSUVTID0gaG9zdC1tNAo+ICAgCj4gKyMgMDAw
MS1Db21wbGV0ZS1mdW5jdGlvbi1wcm90b3R5cGUtaW4tYWNpbmNsdWRlLm00LWZvci1DMjMtLnBh
dGNoCj4gK0dNUF9BVVRPUkVDT05GID0gWUVTCj4gK0hPU1RfR01QX0FVVE9SRUNPTkYgPSBZRVMK
PiArCj4gICBHTVBfQ09ORl9FTlYgKz0gQ0NfRk9SX0JVSUxEPSIkKEhPU1RDQykgLXN0ZD1jOTki
Cj4gICAKPiAgICMgR01QIGRvZXNuJ3Qgc3VwcG9ydCBhc3NlbWJseSBmb3IgY29sZGZpcmUgb3Ig
bWlwcyByNiBJU0EgeWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
