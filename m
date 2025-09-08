Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B0ECAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 13:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49FF84C84;
	Mon,  8 Sep 2025 13:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxvyeQrn_jkC; Mon,  8 Sep 2025 13:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB31284C92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB31284C92;
	Mon,  8 Sep 2025 13:32:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9ADC1D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 13:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 925AA84C6D
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 13:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNQxWrodAXyP for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 13:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EB1984C4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EB1984C4E
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EB1984C4E
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 13:32:29 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 3FE79440668;
 Mon,  8 Sep 2025 16:32:08 +0300 (IDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale via buildroot <buildroot@buildroot.org>,  Alexis
 =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <20250908131340.898397-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Mon, 8 Sep 2025 15:13:40 +0200")
References: <87ldmpgphl.fsf@tarshish>
 <20250908131340.898397-1-thomas.perale@mind.be>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 08 Sep 2025 16:32:26 +0300
Message-ID: <87cy81gjdh.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1757338328;
 bh=6lan5Sn/zdOWZ3cJyqC9SeNoJomrwmJeqlWbYiPnd5E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SnCu1V4PQF9I7peVn4Xf0RKXqYcq4dhR1oRlHkIHj8P6w0jHsfrIW1V4E/OW/F0R/
 3PYqNzoJ55X+YOIvwptpn6SJh9Ah4uFD/s0oGTmbOGKOPq6VldjT9yQueN+I1U7uFR
 HF10nzjIztHHPayDyf6QQfwsZ/4pCbJIRXryum+cw5qWDW2lPfN7beh3uhVgXgB+lG
 wHbncSA+gKNh3vs43K2Ys8BkZDCcUYBHeC3LtxYaU1HXAMR23Ih/MOyHEau4I7wJ06
 yqGuYrQJeH9S0fbkTv4KeiVh4v0Igad6giZuAxm59MS458XDF/8RnfmJB2E5gTp22j
 +xoSfwo5oVgqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=SnCu1V4P
Subject: Re: [Buildroot] [PATCH v3] package/php-lua: fix build with
 PHP8/GCC14
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gTW9uLCBTZXAgMDggMjAyNSwgVGhvbWFzIFBlcmFsZSB3cm90ZToKPiBJ
biByZXBseSBvZjoKPj4gT24gTW9uLCBTZXAgMDggMjAyNSwgVGhvbWFzIFBlcmFsZSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+PiA+IEluIHJlcGx5IG9mOgo+PiA+PiBPbiBib3RoIEJ1aWxkcm9vdCAy
MDI1LjAyLnggYW5kIG1hc3RlciBicmFuY2gsIHBocC1sdWEgYnVpbGQgZmFpbHMgb24KPj4gPj4g
dGhlIGZvbGxvd2luZyBlcnJvcjoKPj4gPj4gCj4+ID4+IGx1YS5jOjg2Mjo0NDogZXJyb3I6IGFz
c2lnbm1lbnQgdG8gJ3plbmRfb2JqZWN0X3dyaXRlX3Byb3BlcnR5X3QnIHtha2EKPj4gPj4gJ3N0
cnVjdCBfenZhbF9zdHJ1Y3QgKiAoKikoc3RydWN0IF96ZW5kX29iamVjdCAqLCBzdHJ1Y3QgX3pl
bmRfc3RyaW5nICosCj4+ID4+IHN0cnVjdCBfenZhbF9zdHJ1Y3QgKiwgdm9pZCAqKiknfSBmcm9t
IGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgJ3ZvaWQKPj4gPj4gKCopKHp2YWwgKiwgenZhbCAq
LCB6dmFsICosIHZvaWQgKiopJyB7YWthICd2b2lkICgqKShzdHJ1Y3QgX3p2YWxfc3RydWN0Cj4+
ID4+ICosIHN0cnVjdCBfenZhbF9zdHJ1Y3QgKiwgc3RydWN0IF96dmFsX3N0cnVjdCAqLCB2b2lk
ICoqKSd9Cj4+ID4+IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+PiA+PiAgIDg2MiB8
ICAgICAgICAgbHVhX29iamVjdF9oYW5kbGVycy53cml0ZV9wcm9wZXJ0eSA9Cj4+ID4+IHBocF9s
dWFfd3JpdGVfcHJvcGVydHk7Cj4+ID4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF4KPj4gPj4gbHVhLmM6ODYzOjQ0OiBlcnJvcjogYXNzaWdubWVu
dCB0byAnemVuZF9vYmplY3RfcmVhZF9wcm9wZXJ0eV90JyB7YWthCj4+ID4+ICdzdHJ1Y3QgX3p2
YWxfc3RydWN0ICogKCopKHN0cnVjdCBfemVuZF9vYmplY3QgKiwgc3RydWN0IF96ZW5kX3N0cmlu
ZyAqLAo+PiA+PiBpbnQsICB2b2lkICoqLCBzdHJ1Y3QgX3p2YWxfc3RydWN0ICopJ30gZnJvbSBp
bmNvbXBhdGlibGUgcG9pbnRlciB0eXBlCj4+ID4+ICd6dmFsICogKCopKHp2YWwgKiwgenZhbCAq
LCBpbnQsICB2b2lkICoqLCB6dmFsICopJyB7YWthICdzdHJ1Y3QKPj4gPj4gX3p2YWxfc3RydWN0
ICogKCopKHN0cnVjdCBfenZhbF9zdHJ1Y3QgKiwgc3RydWN0IF96dmFsX3N0cnVjdCAqLCBpbnQs
Cj4+ID4+IHZvaWQgKiosIHN0cnVjdCBfenZhbF9zdHJ1Y3QgKiknfSBbLVdpbmNvbXBhdGlibGUt
cG9pbnRlci10eXBlc10KPj4gPj4gICA4NjMgfCAgICAgICAgIGx1YV9vYmplY3RfaGFuZGxlcnMu
cmVhZF9wcm9wZXJ0eSAgPQo+PiA+PiBwaHBfbHVhX3JlYWRfcHJvcGVydHk7Cj4+ID4+ICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4gPj4gbWFr
ZVsyXTogKioqIFtNYWtlZmlsZToyMTQ6IGx1YS5sb10gRXJyb3IgMQo+PiA+PiAKPj4gPj4gVGhl
IGVycm9yIGNhbiBiZSByZXByb2R1Y2VkIHdpdGggdGhlIGZvbGxvd2luZyBtaW5pbWFsIGRlZmNv
bmZpZzoKPj4gPj4gCj4+ID4+IEJSMl9hcm09eQo+PiA+PiBCUjJfY29ydGV4X2E5PXkKPj4gPj4g
QlIyX0FSTV9FTkFCTEVfTkVPTj15Cj4+ID4+IEJSMl9BUk1fRU5BQkxFX1ZGUD15Cj4+ID4+IEJS
Ml9BUk1fRlBVX05FT049eQo+PiA+PiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPj4gPj4gQlIy
X1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPj4gPj4gQlIyX1BBQ0tBR0VfTFVBPXkKPj4g
Pj4gQlIyX1BBQ0tBR0VfUEhQPXkKPj4gPj4gQlIyX1BBQ0tBR0VfUEhQX0xVQT15Cj4+ID4+IAo+
PiA+PiBUaGlzIGJ1aWxkIGZhaWx1cmUgaXMgdGhlIHJlc3VsdCBvZiB0d28gZXZlbnRzL2NvbmRp
dGlvbnM6Cj4+ID4+IC0gdGhlIHVwZGF0ZSB0byBQSFA4IGhhcyBjaGFuZ2VkIHRoZSBwcm90b3R5
cGUgZm9yCj4+ID4+ICAgemVuZF9vYmplY3RfcmVhZF9wcm9wZXJ0eV90IChzZWUgWzFdKS4gQnV0
IGF0IHRoaXMgdGltZSwgcGhwLWx1YSBqdXN0Cj4+ID4+ICAgZ2VuZXJhdGVkIGEgbmV3IHdhcm5p
bmcgKC1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXMpCj4+ID4+IC0gdXNpbmcgYm9vdGxpbiBi
bGVlZGluZy1lZGdlIHRvb2xjaGFpbiBicmluZ3MgaW4gR0NDMTQsIHdoaWNoIG5vdyB0dXJucwo+
PiA+PiAgIHRoaXMgd2FybmluZyBpbnRvIGEgc3lzdGVtYXRpYyBlcnJvciAoc2VlIFsyXSkKPj4g
Pj4gCj4+ID4+IFRoaXMgaXNzdWUgaXMgc3RpbGwgcHJlc2VudCBvbiB0aGUgdXBzdHJlYW0gcmVw
b3NpdG9yeSwgYnV0IGl0IGhhcyBiZWVuCj4+ID4+IGZpeGVkIG9uIG9uZSBvZiBpdHMgZm9ya3Mu
IEJyaW5nIHRoZSByZWxldmFudCBwYXRjaCBmcm9tIHRoZSBmb3JrIHRvCj4+ID4+IGFsbG93IGJ1
aWxkaW5nIHBocC1sdWEuCj4+ID4+IAo+PiA+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3BocC9w
aHAtc3JjL2NvbW1pdC85MWVmNDEyNGU1Ngo+PiA+PiBbMl0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9n
Y2MtMTQvcG9ydGluZ190by5odG1sI2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzCj4+ID4+IAo+
PiA+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3Rs
aW4uY29tPgo+PiA+Cj4+ID4gQXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI1LjA1LnguIFRoYW5r
cwo+PiAKPj4gTm90IGluIDIwMjUuMDIueCBhcyBvZiBjb21taXQgMmQ1YzI5OGQ1YTM1ICgicGFj
a2FnZS9pcGVyZjM6IGFkZCBwYXRjaAo+PiB0byBmaXggQ1ZFLTIwMjUtNTQzNTAiKS4KPj4gCj4+
IEFsc28gbm90IGluIDIwMjUuMDUueCBhcyBvZiBjb21taXQgNmYxOTFiNGRjYzgwICgicGFja2Fn
ZS9jcHAtaHR0cGxpYjoKPj4gYWRkIHBhdGNoIGZvciBDVkUtMjAyNS00NjcyOCIpLgo+Cj4gSW5k
ZWVkLCB0aGFua3MgZm9yIHRoZSBtZXNzYWdlLiBJdCB3YXMgZGVjaWRlZCB0byBub3QgaW5jbHVk
ZSB0aGlzIHBhdGNoIGluIHRoZQo+IGVuZCBiZWNhdXNlIGl0IHdhcyBzdXNwZWN0ZWQgdG8gYmUg
dGhlIHJlYXNvbiBvZiB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yCj4gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMTE3Njc3NDk0MQo+Cj4gSSBhbHJl
YWR5IGhhZCBteSBlbWFpbCByZXBseSBwcmVwYXJlZCBhbmQgZm9yZ290IHRvIHJlbW92ZSB0aGlz
IGVudHJ5IGJlZm9yZQo+IHNlbmRpbmcgdGhlbSB0byB0aGUgbGlzdCB3aGVuIHdlIHN5bmNlZC4K
ClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uCgpXaGF0IGFib3V0IHRoZSBUZXN0WHZpc29y
IHBhdGNoOgoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MDgxMDU2MDAuNjgy
MTM2LTEtdGhvbWFzLnBlcmFsZUBtaW5kLmJlLwoKSXQncyBub3QgaW4gMjAyNS4wMi54LzIwMjUu
MDUueCBlaXRoZXIuCgpiYXJ1Y2gKCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0t
LS0tLS17PQogICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBo
dHRwOi8vd3d3LnRrb3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
