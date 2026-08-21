Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F176C5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 10:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF357607D9;
	Fri, 21 Aug 2026 10:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxNZ_Ny2FYdl; Fri, 21 Aug 2026 10:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787306928;
	bh=Uj18k2JkLU60D+HYD1lW/KhEY1WHKE99BBcvC7CXoaI=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N+VlR9lslVku722Q2S7HHrNBYs4V+VztLOYiDHzwvr7ffUnb445gKIRp/NJHf5riD
	 hd2eTLhP26wz2317jOL9/WFL33M8Jh1BxIxagAo6faY+gyfoZVfUPdcztiKbklVU1K
	 7+v/klq+GgUXHE+0pIaUscsR56fb7BSlA714qeaaLDXzJnSFy6AYju5cOkDZ1yIa6U
	 eIYQm1wBiG4oiQb0IteoDEPm+jfETTrsyyTiZqMFbdYLzKTB7DWyyHK2VYNwGu6fXN
	 DqgrHQIIa+bnFHjLMZeogNBjXhyRmgVUuN0CpHcTBN2dTihXsgXTCAsD2ylSjPPD0/
	 ThtWQXYXBfMbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57D176068A;
	Fri, 21 Aug 2026 10:08:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFE4B1B8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C55FE80FF9
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sV1rBUXLPewT for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 10:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF20680BFF
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:08:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D3ACD1A1789;
 Fri, 21 Aug 2026 10:08:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9EE49604AA;
 Fri, 21 Aug 2026 10:08:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 66DAC11C76E92; 
 Fri, 21 Aug 2026 12:08:37 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 21 Aug 2026 12:08:36 +0200
Message-Id: <DKUJFAI6X45R.3PITGBRK4AG1K@bootlin.com>
Cc: <buildroot@buildroot.org>, "Giulio Benetti"
 <giulio.benetti@benettiengineering.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260821-qt5_allow_other_openssl_implementations-v1-1-be1438707393@bootlin.com>
 <aogba9rQ9QphwNrW@windsurf>
In-Reply-To: <aogba9rQ9QphwNrW@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/qt5: relax openssl constraint to
 allow compatible implementations
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCB0aGFua3MgZm9yIHRoZSBwcm9tcHQgcmV2aWV3LAoKT24gRnJpIEF1ZyAyMSwg
MjAyNiBhdCAxMTozNyBBTSBDRVNULCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+IEhlbGxvLAo+
Cj4gT24gRnJpLCBBdWcgMjEsIDIwMjYgYXQgMTA6NTg6NTlBTSArMDIwMCwgQWxleGlzIExvdGhv
csOpIHdyb3RlOgo+PiBRdDUgY2FuIGJlIGJ1aWx0IHdpdGggb3Igd2l0aG91dCBvcGVuc3NsIHN1
cHBvcnQuIEZvbGxvd2luZyBzb21lIGJ1aWxkCj4+IGZhaWx1cmVzLCBjb21taXQgYTk0ZDM5ZDY5
M2Q4ICgicGFja2FnZS9xdDU6IGZpeCBidWlsZCBmYWlsdXJlIGR1ZSB0bwo+PiBsaWJyZXNzbCB1
c2UiKSBlbmZvcmNlZCBsaWJvcGVuc3NsIGFzIHRoZSBvbmx5IHZhbGlkIGltcGxlbWVudGF0aW9u
IGZvcgo+PiBRdDUgb3BlbnNzbCBzdXBwb3J0Lgo+PiAKPj4gV2hpbGUgdGhpcyBzb2x1dGlvbiBp
cyBmaW5lIHRvIGZpbHRlciBiZXR3ZWVuIHRoZSB0d28gb3BlbnNzbCB2YXJpYW50cwo+PiBvZmZp
Y2lhbGx5IHN1cHBvcnRlZCBieSBCdWlsZHJvb3QsIGl0IHByZXZlbnRzIHVzZXJzIGJyaW5naW5n
IHRoZWlyIG93bgo+PiBPcGVuU1NMIGltcGxlbWVudGF0aW9ucyAodGhyb3VnaCB0aGUgInByb3Zp
ZGVzIiBtZWNoYW5pc20pIGZyb20gYnVpbGRpbmcKPj4gUXQ1LCBldmVuIGlmIHRoZSBjdXN0b20g
aW1wbGVtZW50YXRpb24gbWF0Y2hlcyB0aGUgT3BlblNTTCBBUEkuCj4+IAo+PiBBbGxvdyBjb21w
YXRpYmxlIGV4dGVybmFsIGltcGxlbWVudGF0aW9ucyB0byBiZSBwcm92aWRlZCBmb3IgUXQ1IG9w
ZW5zc2wKPj4gc3VwcG9ydC4gUmVsYXggdGhlIGNvbnN0cmFpbnQgYnkgcGFydGlhbGx5IHJldmVy
dGluZyBhOTRkMzlkNjkzZDggYW5kCj4+IGNoZWNraW5nIHRoYXQgdGhlIHNlbGVjdGVkIG9wZW5z
c2wgaW1wbGVtZW50YXRpb24gaXNuJ3QgbGlicmVzc2wuIEl0Cj4+IHRoZW4gYmVjb21lcyB1cCB0
byB1c2VycyB0byBlbnN1cmUgdGhhdCB0aGUgaW1wbGVtZW50YXRpb24gdGhleSBhcmUKPj4gcHJv
dmlkaW5nIGlzIGZ1bGx5IGNvbXBhdGlibGUgd2l0aCB0aGUgbGlib3BlbnNzbCBvbmUuIFNvbWUg
cXQ1Cj4+IHN1Yi1wYWNrYWdlcyBlbmZvcmNlIEJSMl9QQUNLQUdFX09QRU5TU0xfRk9SQ0VfTElC
T1BFTlNTTCwgdGhleSBkb24ndAo+PiBuZWVkIHVwZGF0ZSBhcyBpdCBkb2VzIG5vdCByZWFsbHkg
c3RyaWN0bHkgc2VsZWN0IGxpYm9wZW5zc2wsIGl0IHJhdGhlcgo+PiBwcmV2ZW50cyBsaWJyZXNz
bCwgc28gaXQgc3RpbGwgYWxsb3dzIGN1c3RvbSBwcm92aWRlcnMuCj4+IAo+PiBTaWduZWQtb2Zm
LWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+Cj4gVGhh
bmtzIGZvciB0aGUgZ29vZCBjb21taXQgbWVzc2FnZS4KPgo+PiAtUVQ1QkFTRV9DT05GSUdVUkVf
T1BUUyArPSAkKGlmICQoQlIyX1BBQ0tBR0VfTElCT1BFTlNTTCksLW9wZW5zc2wsLW5vLW9wZW5z
c2wpCj4+IC1RVDVCQVNFX0RFUEVOREVOQ0lFUyAgICs9ICQoaWYgJChCUjJfUEFDS0FHRV9MSUJP
UEVOU1NMKSxvcGVuc3NsKQo+PiArIyBRdDUgb2ZmaWNpYWxseSBvbmx5IHN1cHBvcnRzIE9wZW5T
U0wuIFVzZXJzIGNhbiBhbHNvIHByb3ZpZGUgdGhlaXIgb3duCj4+ICsjIE9wZW5TU0wgdmFyaWFu
dCB0aHJvdWdoIHRoZSAicHJvdmlkZXMiIG1lY2hhbmlzbSwgYnV0IGl0IGlzIHRoZW4gdXAgdG8K
Pgo+IFRoZSBtZWNoYW5pc20gaXMgbm90IHJlYWxseSAicHJvdmlkZXMiLCBidXQgcmF0aGVyICJ2
aXJ0dWFsIHBhY2thZ2UiCj4gKHByb2JhYmx5IHRvIGJlIGZpeGVkIGluIHlvdXIgY29tbWl0IG1l
c3NhZ2UgYXMgd2VsbCkKCkFDSy4KCj4+ICsjIHRoZW0gdG8gZW5zdXJlIHRoYXQgdGhlIHByb3Zp
ZGVkIEFQSSBpcyBleGFjdGx5IGNvbXBhdGlibGUgd2l0aCB0aGUKPj4gKyMgbGlib3BlbnNzbCBv
bmUKPj4gK1FUNUJBU0VfQ09ORklHVVJFX09QVFMgKz0gJChpZiAkKEJSMl9QQUNLQUdFX09QRU5T
U0wpLCQoaWYgJChCUjJfUEFDS0FHRV9MSUJSRVNTTCksLW5vLW9wZW5zc2wsLW9wZW5zc2wpLC1u
by1vcGVuc3NsKQo+PiArUVQ1QkFTRV9ERVBFTkRFTkNJRVMgICArPSAkKGlmICQoQlIyX1BBQ0tB
R0VfT1BFTlNTTCksJChpZiAkKEJSMl9QQUNLQUdFX0xJQlJFU1NMKSwsb3BlbnNzbCkpCj4KPiBJ
IGRvbid0IHJlYWxseSBsaWtlIGhvdyBpdCdzIHdyaXR0ZW4gYmVjYXVzZSBteSBicmFpbiBoYXMg
dG8gcHV0IGFsbAo+IENQVXMgYXQgbWF4IGZyZXF1ZW5jeSB0byBwcm9jZXNzIGhvdyB0aGlzIHdv
cmtzLgo+Cj4gV2hhdCBhYm91dDoKPgo+ICMgUXQ1IG9mZmljaWFsbHkgb25seSBzdXBwb3J0cyBP
cGVuU1NMLCBhbmQgZG9lc24ndCBidWlsZC93b3JrIHdpdGgKPiAjIExpYnJlU1NMLiBXZSB3YW50
IHRvIGFsbG93IGFueSBPcGVuU1NMIHByb3ZpZGVyICh3aGljaCBjYW4gYmUKPiAjIGxpYm9wZW5z
c2wgb3IgYW5vdGhlciBwcm92aWRlciksIGV4Y2VwdCBsaWJyZXNzbC4KPiBpZmVxICgkKEJSMl9Q
QUNLQUdFX09QRU5TU0wpOiQoQlIyX1BBQ0tBR0VfTElCUkVTU0wpLHk6KQo+IFFUNUJBU0VfQ09O
RklHVVJFX09QVFMgKz0gLW9wZW5zc2wKPiBRVDVCQVNFX0RFUEVOREVOQ0lFUyArPSBvcGVuc3Ns
Cj4gZWxzZQo+IFFUNUJBU0VfQ09ORklHVVJFX09QVFMgKz0gLW5vLW9wZW5zc2wKPiBlbmRpZgoK
SW5kZWVkLCBsb29rcyBiZXR0ZXIsIEknbGwgdXBkYXRlIGFjY29yZGluZ2x5LgoKQWxleGlzCgoK
Ci0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
