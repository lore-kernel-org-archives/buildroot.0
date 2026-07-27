Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6CEC53219
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 12:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9122980BAA;
	Mon, 27 Jul 2026 12:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUHrvij18UFK; Mon, 27 Jul 2026 12:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A742480BB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785155245;
	bh=zYXNGMXaZuN4+46K0H3TluI3RU7IOT5tPDltiLJr3Ws=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dlYBvyqN6x6FLDZw/qIMZwBAU0Vhl7uz+J7Rhs9YM+4aO2C0H+y1O1xHz3x3l5uDE
	 R16i3p4B0rbLD24+U10oPizzs/4FOFXGNEkPYHCIFFjgdifCWx6LzDEBWJGQptvotS
	 O/HfVEnbX0jOe5buoaY4KUzITWabyQYCwa7zM7o11nSemHmhW0KiHSrRiRr+ctk4EA
	 zWb/xEOMrjdXZ9z4orZaQf/9FxtJZ4TwVM/14KxnuRpr7Pw9NwIubVIrwrF3v+GhtH
	 dSovUYZgbe3T1bV1A5hMT7c0bAdkHSvaZGfcL0KKTtaQ5YAc1Ad9+lLo3KHKS1OT6o
	 VuLPgmPe59egQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A742480BB8;
	Mon, 27 Jul 2026 12:27:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F6B64C4
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2544C606DA
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tranpJvUssF for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 12:27:22 +0000 (UTC)
X-Greylist: delayed 162994 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Jul 2026 12:27:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA6D960689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6D960689
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA6D960689
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:27:21 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 93E5DBFA44;
 Mon, 27 Jul 2026 14:27:18 +0200 (CEST)
Message-ID: <a00e615b-c2b2-42d9-b525-8852fc0d74a4@grenoble.cnrs.fr>
Date: Mon, 27 Jul 2026 14:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Fiona Klute <fiona.klute@gmx.de>
References: <20260727114931.368449-1-thomas.perale@mind.be>
Content-Language: en-US, fr
In-Reply-To: <20260727114931.368449-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1785155238;
 bh=KtmR0SSyNUUYg44Mj2+l0yvX4a4mR+lseSeLMD8Ovhs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HCZhdmSD2/XJWfLxWED2v1h3kOUdY60ed+oGUIui/IfV/o4BIcZZT8YZTSuDMj3gq
 2fC43eua6L7hTLTCmWhfLPIPSTZIDnQy0kGaR1rVg9KfvCqBSmTG3cSVfxa7cSaWC7
 xJp+32rsVCiPc8wqlsdk9ioWGaHfqtmJ3diOefqMwoJA0Ju8X66ssbK0oF3boCACxr
 iXhyxsdsF0Fvg6GT9yf6x6ul6IGyutaH6OrPQovOmZCfpgLoJAw/+DJp8r7AQZa7ze
 vZEhc78vekyeotB9BpCmG26kr5LW1unjVkjnIvbHZwVFHsS8HmTqQjEV+gFoJ2UfBj
 58zkX7+STC6SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=HCZhdmSD
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: update 'releases' to
 reflect LTS changes
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAyNi0wNy0yNywgVGhvbWFzIFBlcmFsZSB3cm90ZToKPiBXaXRoIHRoZSByZWxlYXNlIG9m
IDIwMjUuMDIsIExUUyByZWxlYXNlcyBhcmUgbm93IG1hZGUgZXZlcnkgdHdvIHllYXJzCj4gd2l0
aCBhIDMteWVhciBzdXBwb3J0Lgo+IAo+IFRoaXMgcmVmbGVjdCB0aGUgdGFibGUgc2hvd2VkIGF0
IGh0dHBzOi8vbHRzLmJ1aWxkcm9vdC5vcmcvI3JlbGVhc2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KPiAtLS0KPiAgZG9jcy9tYW51
YWwvcmVsZWFzZS1lbmdpbmVlcmluZy5hZG9jIHwgMjIgKysrKysrKysrKysrLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RvY3MvbWFudWFsL3JlbGVhc2UtZW5naW5lZXJpbmcuYWRvYyBiL2RvY3Mv
bWFudWFsL3JlbGVhc2UtZW5naW5lZXJpbmcuYWRvYwo+IGluZGV4IDBjZjM4MTgzZjkuLmUyMDJl
NzA4NjggMTAwNjQ0Cj4gLS0tIGEvZG9jcy9tYW51YWwvcmVsZWFzZS1lbmdpbmVlcmluZy5hZG9j
Cj4gKysrIGIvZG9jcy9tYW51YWwvcmVsZWFzZS1lbmdpbmVlcmluZy5hZG9jCj4gQEAgLTUsMTkg
KzUsMjEgQEAKPiAgPT0gUmVsZWFzZSBFbmdpbmVlcmluZwo+ICA9PT0gUmVsZWFzZXMKPiAgCj4g
LVRoZSBCdWlsZHJvb3QgcHJvamVjdCBtYWtlcyBxdWFydGVybHkgcmVsZWFzZXMgd2l0aCBtb250
aGx5IGJ1Z2ZpeAo+IC1yZWxlYXNlcy4gIFRoZSBmaXJzdCByZWxlYXNlIG9mIGVhY2ggeWVhciBp
cyBhIGxvbmcgdGVybSBzdXBwb3J0Cj4gLXJlbGVhc2UsIExUUy4KPiArVGhlIEJ1aWxkcm9vdCBw
cm9qZWN0IG1ha2VzIHF1YXJ0ZXJseSByZWxlYXNlcyB3aXRoIG1vbnRobHkgYnVnZml4IHJlbGVh
c2VzLgo+ICtTdGFydGluZyB3aXRoIDIwMjUuMDIsIGxvbmctdGVybSBzdGFibGUgKExUUykgcmVs
ZWFzZXMgYXJlIG1hZGUgZXZlcnkgdHdvIHllYXJzCgpDb252ZW50aW9uYWxseSwg4oCcTFRT4oCd
IHN0YW5kcyBmb3Ig4oCcTG9uZy1UZXJtIFN1cHBvcnTigJ0uIFRoZSBMVFMgcGFnZVsxXQpvbiB0
aGUgQnVpbGRyb290IFdlYiBzaXRlIGhhcyB0aGUgd29yZGluZ3M6CgogKiBsb25nLXRlcm0gc3Vw
cG9ydAogKiBMb25nLXRlcm0gc3VzdGFpbmFiaWxpdHkKICogbG9uZy10ZXJtIHN0YWJsZQoKYnV0
IG9ubHkgdGhlIGZpcnN0IG9uZSBzZWVtcyBjb21tb25seSBhYmJyZXZpYXRlZCBhcyDigJxMVFPi
gJ0uCgpXaGF0IGFib3V0IGJlaW5nIG1vcmUgZXhwbGljaXQsIGxpa2Ug4oCcU3RhcnRpbmcgd2l0
aCAyMDI1LjAyLCB0aGUgZmlyc3QKcmVsZWFzZSBvZiBldmVyeSBvZGQtbnVtYmVyZWQgeWVhciBp
cyBbYW4gTFRTXeKAnT8KCj4gK2FuZCBzdXBwb3J0ZWQgZm9yIHRocmVlIHllYXJzLgo+ICAKPiAt
IC0gUXVhcnRlcmx5IHJlbGVhc2VzOiAyMDIwLjAyLCAyMDIwLjA1LCAyMDIwLjA4LCBhbmQgMjAy
MC4xMQo+IC0gLSBCdWdmaXggcmVsZWFzZXM6IDIwMjAuMDIuMSwgMjAyMC4wMi4yLCAuLi4KPiAt
IC0gTFRTIHJlbGVhc2VzOiAyMDIwLjAyLCAyMDIxLjAyLCAuLi4KPiArIC0gTFRTIHJlbGVhc2Vz
OiAyMDI1LjAyLCAyMDI3LjAyLCAyMDI5LjAyIC4uLgo+ICsgLSBTdGFibGUgcmVsZWFzZXM6IDIw
MjUuMDUsIDIwMjUuMDgsIDIwMjUuMTEgYW5kIDIwMjYuMDIsIC4uLgoKSSB3b3VsZCBhdm9pZCDi
gJxhbmTigJ0sIHdoaWNoIGltcGxpZXMgdGhhdCB3aGF0IGNvbWVzIGlzIHRoZSBsYXN0IGVsZW1l
bnQKaW4gdGhlIGxpc3QsIHNvbWV3aGF0IGNvbnRyYWRpY3RpbmcgdGhlIGVsbGlwc2lzIHRoYXQg
Zm9sbG93cy4KCk5vdGUgdGhhdCwgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhpcyBwYWdl
LCBpdCBpcyBjbGVhciB0aGF0CuKAnExUUyByZWxlYXNlc+KAnSBhcmUgYSBzdWJzZXQgb2Yg4oCc
c3RhYmxlIHJlbGVhc2Vz4oCdLiBXaXRoIHRoaXMgY2hhbmdlLCBpdApsb29rcyBtb3JlIGxpa2Ug
bm9uLW92ZXJsYXBwaW5nIGNhdGVnb3JpZXMuIElmIHRoaXMgaXMgaW50ZW5kZWQsIG1heWJlCnRo
ZSDigJxzdGFibGXigJ0gY2F0ZWdvcnkgY291bGQgYmUgcmVuYW1lZCDigJxpbnRlcmltIHJlbGVh
c2Vz4oCdLiBUaGlzIGhhcyBhbgppbXBsaWNhdGlvbiBmb3IgdGhlIG5leHQgc2VudGVuY2UuCgo+
ICsgLSBCdWdmaXggcmVsZWFzZXM6IDIwMjUuMDIuMSwgMjAyNS4wMi4yLCAuLi4KPiAgCj4gLVJl
bGVhc2VzIGFyZSBzdXBwb3J0ZWQgdW50aWwgdGhlIGZpcnN0IGJ1Z2ZpeCByZWxlYXNlIG9mIHRo
ZSBuZXh0Cj4gLXJlbGVhc2UsIGUuZy4sIDIwMjAuMDUueCBpcyBFT0wgd2hlbiAyMDIwLjA4LjEg
aXMgcmVsZWFzZWQuCj4gK1N0YWJsZSByZWxlYXNlcyBhcmUgc3VwcG9ydGVkIHVudGlsIHRoZSBu
ZXh0IHJlbGVhc2UsIGUuZy4sIDIwMjUuMDUueCBpcyBFT0wKPiArd2hlbiAyMDI1LjA4IGlzIHJl
bGVhc2VkLgoKSWYg4oCcTFRTIHJlbGVhc2Vz4oCdIGlzIGEgc3Vic2V0IG9mIOKAnHN0YWJsZSBy
ZWxlYXNlc+KAnSwgdGhlbiB0aGlzIGlzCmluY29ycmVjdDogaXQgc2hvdWxkIGJlIOKAnE5vbi1M
VFMgc3RhYmxlIHJlbGVhc2VzIGFyZSBzdXBwb3J0ZWQuLi7igJ0uCgpSZWdhcmRzLAoKRWRnYXIu
CgpbMV0gaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2x0cy5odG1sCgo+ICAKPiAtTFRTIHJlbGVhc2Vz
IGFyZSBzdXBwb3J0ZWQgdW50aWwgdGhlIGZpcnN0IGJ1Z2ZpeCByZWxlYXNlIG9mIHRoZSBuZXh0
Cj4gLUxUUywgZS5nLiwgMjAyMC4wMi54IGlzIHN1cHBvcnRlZCB1bnRpbCAyMDIxLjAyLjEgaXMg
cmVsZWFzZWQuCj4gK0xUUyByZWxlYXNlcyBhcmUgc3VwcG9ydGVkIGZvciB0aHJlZSB5ZWFycywg
d2l0aCBhIG9uZS15ZWFyIG92ZXJsYXAgd2l0aCB0aGUKPiArbmV4dCBMVFMgcmVsZWFzZSwgZS5n
LiwgMjAyNS4wMi54IGlzIEVPTCB3aGVuIDIwMjguMDIgaXMgcmVsZWFzZWQuCj4gKwo+ICtTZWUg
dGhlIHRhYmxlIGF0IGh0dHBzOi8vbHRzLmJ1aWxkcm9vdC5vcmcvI3JlbGVhc2VzW2x0cy5idWls
ZHJvb3Qub3JnXS4KPiAgCj4gID09PSBEZXZlbG9wbWVudAo+ICAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
