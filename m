Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B15BCD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6EFC606E1;
	Mon,  1 Jun 2026 19:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsIwzBdGCpot; Mon,  1 Jun 2026 19:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E36606E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780343738;
	bh=prQaEY7vrkug7YUxOpTWWSMX51S7mO0NIu0d4kGo5UM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ud7RI6dUv0O2Y7ycJBZrzlwkobbgpRuY4ApSjqKhyY/6dyYF1FN05Q/E0BJsdhUSC
	 lI4O0B7UyrsctEnGn4rL2IDi23bxZo03VJ2UK7aKkcRM34KUOpQum6eFkDP6J8iwYh
	 Bqn6BbWF67Ld1LFxZGxTKYzPmsOeCm2u/noEYESeE8M1FYaxfDgWfY0XjIyppo902I
	 OHeu0/p+bW+JJ8A9oOrYnPjr6X0FrZ/V+gT8BgZNS7GwB8tQunPJpZOJjDOeohFQ8n
	 NXkqExTYq6WDdHoclzcDYWXUyZVDmwLzFCeOGlwHzon4uV6kSmymJunzJR14b3WdRg
	 dglFvXiFUlNgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04E36606E3;
	Mon,  1 Jun 2026 19:55:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E03D5F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5CE1606E6
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZ2vasBuBSXR for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F7F6606E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F7F6606E1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F7F6606E1
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:55:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUosN-1wu9vU3qdt-00PwD3; Mon, 01
 Jun 2026 21:55:30 +0200
Message-ID: <a08cdebb-e453-4f49-aaf4-aff655eaeecf@gmx.de>
Date: Mon, 1 Jun 2026 21:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260506184057.665854-1-bernd@kuhls.net>
 <1f4c78fe-9df2-4703-a17e-17584fd170b2@rnout.be>
 <0e1776fd-adc4-4ab8-9ca2-826d8f3b03e8@gmx.de>
 <261fe0fb-9c4c-4ff8-a980-119f1c8c6151@rnout.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <261fe0fb-9c4c-4ff8-a980-119f1c8c6151@rnout.be>
X-Provags-ID: V03:K1:FyBzMSXCIhJ7uVb4J3Bsk3PROGASq6F3x/rLMv52WqffpDoZov8
 2/KwCbX8nu9p7GUs8EYjbRUJCRW4/7NHFYMrVrG6TKMAfcKnr+esFoma8+PeF6c0OEcAonJ
 F5dMgHxiRHgq+trafDD/vMlUwuiw+G16UAtQIK5PbKtX+VCcLx0CiORIaHQclp6j5siatMt
 5swDGzUTA1HsbuqoCiECQ==
UI-OutboundReport: notjunk:1;M01:P0:fg4+2H9Q3NY=;+J4g5uYxxh27xk3mvpb2pi4xi1P
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780343730; x=1780948530; i=fiona.klute@gmx.de;
 bh=rwGo1aOg9jZid/UunH/ouDAwzzDnsdYvHzJ0J0rLb90=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lqp4SYJ4MdPg31tuqrdbbOVNMpN84VvG/NDLvaKOJp0Cp1m13X5eh4mGEUeNlDpR
 aYyHsThCxIiXqdjT/K9tjl57vwKwvTsc9hhdGsLtlFvgKOXmIRZ8t1Y9ccsi2REaW
 yMbL2/w2v8bJ7p8I+sGI9DBzxxEZU0PXjok00f9d+AkxBX2cCCzGLD9v2ZapYxsVC
 XJDmQ45HQlCpewMvMBHtewgu87vcubOeSSsyRBquQCLTTXHzx2F9hfQ9ylCwBWe7B
 pGseOKoPwXIvo+gTzmoOkMpNdi+eE+cmyzLF3YqQULpI9GanRVc3Yoq1ctVfprXvq
 Ks3LAsxp+UgdbQ8OLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lqp4SYJ4
Subject: Re: [Buildroot] [PATCH 00/12] Add libudev-zero as provider for
 libudev
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDEuMDYuMjYgdW0gMjE6MzQgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPiAKPiAK
PiBPbiAzMC8wNS8yMDI2IDIyOjI0LCBGaW9uYSBLbHV0ZSB3cm90ZToKPj4gQW0gMjkuMDUuMjYg
dW0gMTU6Mzggc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290Ogo+Pj4K
Pj4+Cj4+PiBPbiAwNi8wNS8yMDI2IDIwOjQwLCBCZXJuZCBLdWhscyB3cm90ZToKPj4+PiBIaSwK
Pj4+Pgo+Pj4+IHRoaXMgaXMgYSBuZXcgdHJ5IHRvIGdldCBwYWNrYWdlcyB3aGljaCBuZWVkIGxp
YnVkZXYsIGJ1dCBub3QgYSBmdWxsCj4+Pj4gdWRldi1kYWVtb24sIHdvcmtpbmcgb24gc3lzdGVt
cyB0aGF0IHVzZQo+Pj4+IEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX1NUQVRJQz15Lgo+Pj4+
Cj4+Pj4gQSBjb3VwbGUgb2YgeWVhcnMgYWdvIGEgcGF0Y2ggc2VyaWVzIHNwbGl0dGluZyB0aGUg
ZXVkZXYgcGFja2FnZSBpbnRvIGEKPj4+PiBub24tZGFlbW9uL3dpdGgtZGFlbW9uIHZlcnNpb24g
ZW5kZWQgdXAgaW50byBhIGRpc2N1c3Npb24gYWJvdXQgc3BhY2UKPj4+PiBzYXZpbmcgYW5kIGNv
bXBsZXhpdHk6Cj4+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWls
ZHJvb3QvMjAyMy1BdWd1c3QvNzM1NjE2Lmh0bWwKPj4+Pgo+Pj4+IFRoaXMgbmV3IHNlcmllcyBz
dGlsbCBpbnRyb2R1Y2VzIGEgbmV3IHZpcnR1YWwgcGFja2FnZSwgbGlidWRldiwgd2l0aAo+Pj4+
IGV1ZGV2IGFuZCBzeXN0ZW1kIGFzIHBvc3NpYmxlIHByb3ZpZGVycyBidXQgb3RoZXJ3aXNlIGtl
ZXBzIHRoZXNlCj4+Pj4gcGFja2FnZXMgdW50b3VjaGVkLgo+Pj4+Cj4+Pj4gVGhlIHRoaXJkIHBy
b3ZpZGVyIGlzIHRoZSBuZXcgcGFja2FnZSBsaWJ1ZGV2LXplcm8gd2hpY2ggaXMgYSAKPj4+PiBk
YWVtb25sZXNzCj4+Pj4gcmVwbGFjZW1lbnQgZm9yIGxpYnVkZXYuCj4+Pj4KPj4+PiBSdW4tdGlt
ZSB0ZXN0ZWQga29kaSB3aXRoIGxpYmNlYyBhbmQgaW50ZWxfZ3B1X3RvcC4KPj4+Pgo+Pj4+IFJl
Z2FyZHMsIEJlcm5kCj4+Pgo+Pj4gwqDCoFNlcmllcyBhcHBsaWVkIHRvIG5leHQsIHRoYW5rcyEK
Pj4+Cj4+Pj4gQWRkaXRpb25hbCBub3RlOiBldWRldiBzZWVtcyB1bm1haW50YWluZWQgdXBzdHJl
YW06Cj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2V1ZGV2LXByb2plY3QvZXVkZXYvIAo+Pj4+IGlz
c3Vlcy8yOTYjaXNzdWVjb21tZW50LTM2NTE0NDI4MDIKPj4+Cj4+PiDCoMKgV2l0aCBsaWJ1ZGV2
LXplcm8gdGhlcmUgaXMgbGVzcyBhbmQgbGVzcyByZWFzb24gdG8gaGF2ZSBldWRldi4gT1RPSCAK
Pj4+IGFzIGxvbmcgYXMgaXQgd29ya3MsIHdlIGNhbiBrZWVwIGl0Lgo+Pgo+PiBVbmZvcnR1bmF0
ZWx5IG5vdCBldmVyeXRoaW5nIHdvcmtzIHdpdGggbGlidWRldi16ZXJvLCB0aGVyZSdzIGxpc3Qg
aW4gCj4+IHRoZSByZWFkbWU6IGh0dHBzOi8vZ2l0aHViLmNvbS9pbGxpbGl0aS9saWJ1ZGV2LXpl
cm8vI3doYXQtZG9lc250LXdvcmsKPj4gTmV0d29ya01hbmFnZXIgaXMgdGhlIGl0ZW0gSSBwZXJz
b25hbGx5IGNhcmUgYWJvdXQsIG90aGVyd2lzZSBJIAo+PiBwcm9iYWJseSB3b3VsZCd2ZSB0ZXN0
ZWQgbGlidWRldi16ZXJvLiA7LSkKPj4KPj4gSWYgZXVkZXYgaXMgY2F1c2luZyB0cm91YmxlIChv
ciBzb21lb25lJ3MgbWlzc2luZyBuZXdlciB1ZGV2IGZlYXR1cmVzKSAKPj4gd2Ugc2hvdWxkIHBy
b2JhYmx5IGxvb2sgYXQgYWRkaW5nIGEgcGFja2FnZSBmb3Igc3lzdGVtZC11ZGV2IHdpdGhvdXQg
Cj4+IHN5c3RlbWQsIHdoaWNoIGlzIHdoYXQgR2VudG9vIGhhcyBiZWVuIHJlY29tbWVuZGluZyBm
b3IgYSB3aGlsZS4KPiAKPiAgwqBJIHRoaW5rIHRoZSB1c2UgY2FzZSBpcyBzbGlnaHRseSBkaWZm
ZXJlbnQuIHN5c3RlbWQtdWRldiBwcm92aWRlcyBhbiAKPiBhY3R1YWwgdWRldiBkYWVtb24sIHdo
aWxlIGxpYnVkZXYtemVybyBqdXN0IHByb3ZpZGVzIHRoZSBsaWJyYXJ5LiBTbyAKPiB3aXRoIHN5
c3RlbWQtdWRldiB5b3Ugc3RpbGwgaGF2ZSBzb21ldGhpbmcgcmVhY3RpbmcgdG8gaG90cGx1ZyBl
dmVudHMsIAo+IHdoaWNoIHNvbWUgcGVvcGxlIG1heSBub3Qgd2FudCBhdCBhbGwuCj4gCj4gIMKg
T2YgY291cnNlLCB5b3UgY2FuIGp1c3QgZGVsZXRlIHRoZSBkYWVtb24gaW4gcG9zdC1idWlsZC4K
Q2VydGFpbmx5LCBJJ20gbm90IHRyeWluZyB0byBhcmd1ZSBhZ2FpbnN0IG1lcmdpbmcgbGlidWRl
di16ZXJvLiBUaGUgCnBvaW50IEkgd2FzIHRyeWluZyB0byBtYWtlIHdhcyBpbiByZXNwb25zZSB0
byB0aGUgImxlc3MgYW5kIGxlc3MgcmVhc29uIAp0byBoYXZlIGV1ZGV2IjogbGVzcyBkZXBlbmRp
bmcgb24gdXNlIGNhc2UsIGJ1dCBub3Qgbm9uZS4gSWYgdGhlcmUncyAKdHJvdWJsZSB3aXRoIGV1
ZGV2IHNpbXBseSBkcm9wcGluZyBpdCB3aXRob3V0IGFkZGluZyBzdGFuZGFsb25lIApzeXN0ZW1k
LXVkZXYgd291bGQgYnJlYWsgY2VydGFpbiB0aGluZ3MgdGhhdCB3b3JrIG5vdyAobGlrZSB1c2lu
ZyAKTmV0d29ya01hbmFnZXIgd2l0aG91dCBzeXN0ZW1kIGluaXQpLiBCdXQgYXMgbG9uZyBhcyBl
dWRldiB3b3JrcyB3ZWxsIAplbm91Z2ggdGhlcmUncyBubyBydXNoLiA6LSkKCkJlc3QgcmVnYXJk
cywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
