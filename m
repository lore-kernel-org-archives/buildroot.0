Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6209CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9EEB60B23;
	Fri, 16 Oct 2026 15:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mpYQ3X0lmOK; Fri, 16 Oct 2026 15:56:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5204860B22
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792166219;
	b=mrRe++O+n5V5r9KIkOHa+TM1ZHZbF/7DsDe2db49UVqOoCfpxqwqCs4NdUKCMCRSgndP
	 LJJ29i0Tui5g0/e6jdHP36FbJnVPFMsChJdWXK/VrnnbjAM5kVY52vfpRft908UQeCN50
	 LDjNIBDACIiLArHjeJ1w0baM+RzC5W9Roqq5j2QxArdpYMTOq6At9w3codeA6tnS0FC1P
	 5OFenJPq3UoW3nwv5tRdLEiqkOP/aorOPeLbx+KQBpSRAw6CIreK0+8kJVsmetFixXr/9
	 UIQtH3ACgrDFbqb4sTJywHTUxQx0Kgr3NINz/k2jngo3IfzZSCbJ3RYZxhx4G1vQQKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792166219;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=Z1K7po1nY0GfSU0/42iTU6e7aVoMcQ5Vu7r8A+rcQxo=;
	b=CD9y+FZiAwqC+uajDjMlj0xpAblmdf0cpLpUc/7y5TR+YM55rCDG4dNenosAG19gPZmK
	 W68CDkC2dRIteGBIT/UqKvIWsMWACNawSr4Hmzm0yIy5Vnd2FGxBgFkvLkJd0SlSxIrgQ
	 nueYGzZo5f9qp6divhcpY63lmEKMRCMBRrLWd5lkVHbYl5NLYx3Ke2uAv3DzpkmX4TeZf
	 ByTXmIB0wn3Ng62bogbUMzgWegtztLFcOkRJsS00FK+7YSRQCCHkyenBQokGKQaC7QLeT
	 VTt6nb0S3unWOxYXrKTkRXCXU0WO6c3roYXeeXYbWlGnA4Er6RgPS1W/oW4U3TPL9Yg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792166219;
	bh=Z1K7po1nY0GfSU0/42iTU6e7aVoMcQ5Vu7r8A+rcQxo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nv3cZcGtYhKy7/AW6Ivs+DYnoUG3oPwBIKsIXrFjAsrSAcYD4nXhOerDXQVpj1ijT
	 uHFjsZIACljfYH1fWNUHW2FaqD0bmllQwzOkxRH8BiWryZiStefc4xifc/Ibu+fXEQ
	 V6xqztCH1MyTsCVGD4dmHe8R/Z3TXwSpmSlfWKUHzsA1vG/ynRkwv+nPJWEMJGmJPn
	 O4IJkuXRj4Gap0JZxJ4XbPLBgQ3eGQKLbQwTNQ4wwgG93Z2+2V3/r8y1cuoN6uNids
	 wVbOAnCCw3v2Qe7e2r1sbSa7OdKQ4Q+XIN+ZhsdBv2RMPIAOFFp4vF7pcb0LCkln2J
	 Fik/n5uxfJ12w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5204860B22;
	Fri, 16 Oct 2026 15:56:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AB09769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CA7D81303
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zykQtkO-CycG for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 44201812E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792166217;
 b=neM3PSAybovQ7tCVtwRi7lfnBfxXYUmVXbv+1n1yFCNciR6BunzBj4YzeONJN4b3u+KJ
 iPxR/WFnRjxW8RHYiHkVNTcgkG0GCT9lvnO0rxgQ/ESqSnwNeAv4h6flCjABlpJ/W5A46
 0c1wsKoFxZHRe0NHfTMt96U68W2wh7YNvw/AwsFxeoM5f6cZbpkQahwWCUUbuWWDJONCz
 UBWnKnide0Az+tdoZibgwZzb84+J4Tkq8mUUryqvXFlkP9xpot95EOBvaHZOlUX2EFBoh
 HsitKuqdFB7D+VqCdIGyyfYYm7WbfLvR58Dg8b0ySl39361xc4do9eZe5kqHrXmIGLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792166217;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=FWD+hbLKill7l2aAn51x0jfJEZEVmJE7kXAcHLNfjNc=;
 b=nFnoj8FgHLIQCRWgAcLf4PoqloOZvi1+wMFm7lP9KSsxsL0HS+vBB9JjxbSlB0EKmKlt
 QEGe2WvT/LWGrslnSBVVmhsvEfsjd6JgKFxaSmrH/3y/PG2S91+QvVfKCjEkJdcIZzNZ9
 IuNopQlqOUEZiD7AkoqLKfj5ACaTou4EdmowYswXgn82vpjlr/fVKH3TWCjXoSoY/FZUV
 yzlCuhLqCs4Ppbx+UExsV0HWK3jB9+V//o+MSp6XzkCBOVKKdQ3xV24LIPyx6T/Y9ozaF
 0qs4uJKRyMt4xgZ+gtklgnRzTX9sm2wCVEhlMO5f5yeHFeL28mA5jObnroO3n74jtyA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=aNQUVP7d; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44201812E8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:56:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmjw-1xAYVB2QXK-00LYlx; Fri, 16
 Oct 2026 17:56:47 +0200
Message-ID: <23ac084c-10e2-4461-9173-5ee5d5175636@gmx.de>
Date: Fri, 16 Oct 2026 17:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
 <20261015193243.3299884-9-james.hilliard1@gmail.com>
 <538fe6fa-3195-44db-82e1-7dba9f48fb7a@gmx.de>
 <CADvTj4qvKJqrs=zQufpe2TzoEm+ZQsvxBNj3nfEq-bLGCjF7pA@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CADvTj4qvKJqrs=zQufpe2TzoEm+ZQsvxBNj3nfEq-bLGCjF7pA@mail.gmail.com>
X-Provags-ID: V03:K1:cBSGoXkih+Anx5fjBuV2jkqFU7bTJzalcGPjTh3XlPnhUvEOuXF
 wiBENR3TN3r2StfIbLBsx6ZCyerRGN099Tgo3pi2JBD30Co5G2h7PsDUjjxa9YX9KaSU+fI
 YR36Czzi6JGiKTO04MngHES7d8fPerH+Eibcim50Cv8lGfk01qOVp6fw4muLADZyImaLzUf
 LYYR12+P739dMo9dxctzw==
UI-OutboundReport: notjunk:1;M01:P0:eofSebraY4I=;wlSRvfcjvzjEB0oHm1RT+yPGiEB
 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
 1lwUrAoeVvk=
Subject: Re: [Buildroot] [PATCH v2 9/9] boot/uboot: add
 host-python-pkg-resources dependency
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMTUuMTAuMjYgdW0gMjI6MjYgc2NocmllYiBKYW1lcyBIaWxsaWFyZDoKPiBPbiBUaHUsIE9j
dCAxNSwgMjAyNiBhdCAyOjIz4oCvUE0gRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlQGdteC5kZT4g
d3JvdGU6Cj4+Cj4+IEFtIDE1LjEwLjI2IHVtIDIxOjMyIHNjaHJpZWIgSmFtZXMgSGlsbGlhcmQ6
Cj4+PiBVLUJvb3QgY29uZmlndXJhdGlvbnMgc2VsZWN0aW5nIEJSMl9UQVJHRVRfVUJPT1RfTkVF
RFNfUFlUSE9OMyBhbHJlYWR5Cj4+PiBkZXBlbmQgb24gaG9zdC1weXRob24tc2V0dXB0b29scywg
d2hpY2ggcHJvdmlkZWQgcGtnX3Jlc291cmNlcyBiZWZvcmUKPj4+IGl0cyByZW1vdmFsIGluIHNl
dHVwdG9vbHMgODIuCj4+Pgo+Pj4gQWRkIHRoZSBzdGFuZGFsb25lIGhvc3QgcGFja2FnZSB1bmRl
ciB0aGUgc2FtZSBjb25kaXRpb24gdG8gcHJlc2VydmUKPj4+IHBrZ19yZXNvdXJjZXMgYXZhaWxh
YmlsaXR5IGZvciBvbGRlciBVLUJvb3QgcmVsZWFzZXMgYW5kIHZlbmRvciB0cmVlcywKPj4+IGlu
Y2x1ZGluZyB2ZXJzaW9ucyB3aG9zZSBCaW5tYW4gc3RpbGwgaW1wb3J0cyBpdC4KPj4KPj4gSSdk
IHN0aWxsIGxpa2UgYSBzZXBhcmF0ZSBvcHRpb24uIFdlIG5lZWQgcGtnX3Jlc291cmNlcyBhcyBh
ICJsZWFzdCBiYWQiCj4+IHNvbHV0aW9uIHNvIG9sZCBVLUJvb3QgdmVyc2lvbnMgYnVpbGQgd2l0
aG91dCBCdWlsZHJvb3QgZ2V0dGluZyBzdHVjayBvbgo+PiBvbGQgc2V0dXB0b29scywgYnV0IG90
aGVyd2lzZSBpdCBzaG91bGQgbm90IGJlIHVzZWQgYXQgYWxsLiBJIGtub3cgdGhhdAo+PiBtZWFu
cyBkZWZjb25maWdzIHdpbGwgYnJlYWsgdW50aWwgdXBkYXRlZCB0byB1c2UgdGhhdCBvcHRpb24g
KG9yCj4+IGhvcGVmdWxseSBhIGN1cnJlbnQgVS1Cb290IHZlcnNpb24pLCBidXQgdGhhdCBzZWVt
cyBiZXR0ZXIgdG8gbWUgdGhhbgo+PiBkcmFnZ2luZyBpdCBpbnRvIGV2ZXJ5IFUtQm9vdCBidWls
ZCB0aGF0IHVzZXMgUHl0aG9uLgo+IAo+IFllYWgsIEknbSB0aGlua2luZyBpdCBwcm9iYWJseSBt
YWtlcyBtb3JlIHNlbnNlIHRvIHNwbGl0IGl0IG91dCBhcyBhCj4gc2VwYXJhdGUgZm9sbG93IHVw
IGhvd2V2ZXIuCgpUaGF0IHdvcmtzIGZvciBtZSwgdG9vLgoKV2UgY291bGQgYWxzbyBhZGQgYW4g
b3B0aW9uIHdpdGggImRlZmF1bHQgeSIgYW5kIHdhcm4gZGVmY29uZmlnIApkZXZlbG9wZXJzIHRo
YXQgaXQgd2lsbCBiZSBmbGlwcGVkIHRvIGRlZmF1bHQgb2ZmIGF0IGEgY2VydGFpbiB0aW1lLgoK
QmVzdCByZWdhcmRzLApGaW9uYQoKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBGaW9uYQo+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
Cj4+Pgo+Pj4gLS0tCj4+PiBDaGFuZ2VzIHYxIC0+IHYyOgo+Pj4gICAgIC0gVGllIGhvc3QtcHl0
aG9uLXBrZy1yZXNvdXJjZXMgdG8gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWVRIT04zCj4+PiAg
ICAgICBpbnN0ZWFkIG9mIEJSMl9UQVJHRVRfVUJPT1RfVVNFX0JJTk1BTi4KPj4+IC0tLQo+Pj4g
ICAgYm9vdC91Ym9vdC91Ym9vdC5tayB8IDUgKysrKy0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC91
Ym9vdC91Ym9vdC5tayBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPj4+IGluZGV4IDk2YjhjZDBkMmUu
LmRhYTg0MTMwOWMgMTAwNjQ0Cj4+PiAtLS0gYS9ib290L3Vib290L3Vib290Lm1rCj4+PiArKysg
Yi9ib290L3Vib290L3Vib290Lm1rCj4+PiBAQCAtMjY4LDcgKzI2OCwxMCBAQCBVQk9PVF9NQUtF
X09QVFMgKz0gRFRDPSQoSE9TVF9ESVIpL2Jpbi9kdGMKPj4+ICAgIGVuZGlmCj4+Pgo+Pj4gICAg
aWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX1BZVEhPTjMpLHkpCj4+PiAtVUJPT1RfREVQ
RU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uMyBob3N0LXB5dGhvbi1zZXR1cHRvb2xzCj4+PiArVUJP
T1RfREVQRU5ERU5DSUVTICs9IFwKPj4+ICsgICAgIGhvc3QtcHl0aG9uMyBcCj4+PiArICAgICBo
b3N0LXB5dGhvbi1wa2ctcmVzb3VyY2VzIFwKPj4+ICsgICAgIGhvc3QtcHl0aG9uLXNldHVwdG9v
bHMKPj4+ICAgIGVuZGlmCj4+Pgo+Pj4gICAgaWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURT
X1BZTElCRkRUKSx5KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
