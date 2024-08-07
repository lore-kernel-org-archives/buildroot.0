Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAF7C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 19:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDD0808A7;
	Wed,  7 Aug 2024 19:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHNOge3cOwWl; Wed,  7 Aug 2024 19:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C86BC808AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C86BC808AD;
	Wed,  7 Aug 2024 19:39:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D55251BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEB7C40385
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7u1HudbmpQtO for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 19:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 488D24025E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 488D24025E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 488D24025E
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 19:39:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78EA460005;
 Wed,  7 Aug 2024 19:39:53 +0000 (UTC)
Date: Wed, 7 Aug 2024 21:39:52 +0200
To: Mattias =?UTF-8?B?V2Fsc3Ryw7Zt?= <lazzer@gmail.com>
Message-ID: <20240807213952.67a49e15@windsurf>
In-Reply-To: <20240807140441.3795948-1-lazzer@gmail.com>
References: <20240807140441.3795948-1-lazzer@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723059593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhH3hRTz1LV6MxVsxYYYniRExeNTyhsRl6arp01isxw=;
 b=Z1lNnQbdux2sGZrGY3n+BJ20Eu6X/CT/p5aWmaBaSq3MZ9A1izTOy57eBgGwIu7Z5RtuDw
 XcjD0lIh8q9uE/qZK2tvTN34HarawtYvHotyXHQg7dLwFVt4onUu+YE0TAXHa9HKWQ4bxp
 AeAjiSxdlqKc0aalM3MVJ+Q+zVMzQhltZJ317kGUvvQ75gFtfbisKN75OLo+BycPOJVXy3
 diL+p7spNh2KHMYaMQxqk3p09ogDQ/DWVIrUONX9NNzT8NpfPVBEpdvu6WeJEk1yhynTDI
 1y1s9vBrf7npjI1EVAlpYCVk3u7qTIrY/MQRatlz92kJAGyms4Bk2XmxcAjILQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z1lNnQbd
Subject: Re: [Buildroot] [PATCH 1/2] package/uboot-tools: Bump to version
 2024.04
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWF0dGlhcywKClRoYW5rcyBmb3IgdGhpcyBjb250cmlidXRpb24hCgpPbiBXZWQsICA3
IEF1ZyAyMDI0IDE2OjA0OjQwICswMjAwCk1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwu
Y29tPiB3cm90ZToKCj4gU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBn
bWFpbC5jb20+Cj4gLS0tCj4gIC4uLi8wMDAxLWRyb3AtY29uZmlnaC1mcm9tLXRvb2xzLnBhdGNo
ICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysKPiAgLi4uLXRvb2xzLW9ubHktaW4tbm8tZG90
LWNvbmZpZy10YXJnZXRzLnBhdGNoIHwgMTEgKysrKy0tLS0tCj4gIHBhY2thZ2UvdWJvb3QtdG9v
bHMvQ29uZmlnLmluICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS91Ym9vdC10b29s
cy91Ym9vdC10b29scy5oYXNoICAgICAgICAgIHwgIDIgKy0KPiAgcGFja2FnZS91Ym9vdC10b29s
cy91Ym9vdC10b29scy5tayAgICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKy0tLS0tLQo+ICA1
IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKSSB0aGlu
ayBJJ2QgbGlrZSB0byBtZXJnZSB0aGlzIHVwZGF0ZSwgYnV0IEkgd291bGQgbGlrZSBmaXJzdCB0
bwp1bmRlcnN0YW5kIHdoYXQncyBnb2luZyBvbiB3aXRoOgoKICBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMzAzMTcxOTM3LjQ5MDU1My0x
LWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tLwoKSSBoYXZlbid0IGJlZW4gYWJsZSB0byByZXBy
b2R1Y2UgdGhlIGlzc3VlIG9uIG15IHNpZGUgd2l0aCBzaW1wbGUKYnVpbGRzLCBzbyBJIGNvdWxk
bid0IGludmVzdGlnYXRlLiBCdXQgdGhpcyBpc3N1ZSBjb250aW51ZXMgdG8gb2NjdXIgaW4KdGhl
IGF1dG9idWlsZGVyczoKCiAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0Lz9yZWFzb249
dWJvb3QtdG9vbHMlCgpJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIHRoZSBpc3N1ZSBiZWZvcmUgYXBw
bHlpbmcgdGhlIGJ1bXAsIGJlY2F1c2UgdGhlCmlzc3VlIGV4aXN0cyBpbiBvdXIgMjAyNC4wMi54
IG1haW50ZW5hbmNlIGJyYW5jaCwgc28gd2Ugd2FudCB0bwp1bmRlcnN0YW5kIGlmIGl0IGNhbiBi
ZSBmaXhlZCBvbiB0aGlzIGJyYW5jaCwgaW5kZXBlbmRlbnRseSBvciBub3QgZnJvbQp0aGUgdmVy
c2lvbiBidW1wLgoKUmVnYXJkaW5nIHlvdXIgcGF0Y2g6IGNhbiB3ZSBtYWtlIE1LRUZJQ0FQU1VM
RSBjb25maWd1cmFibGUgaW4KaG9zdC11Ym9vdC10b29scywganVzdCBsaWtlIGl0IGlzIGZvciB0
YXJnZXQgdWJvb3QtdG9vbHM/IFRoaXMgd291bGQKYWxsb3cgdG8gbm90IGhhdmUgaG9zdC1nbnV0
bHMgYXMgYSBtYW5kYXRvcnkgZGVwZW5kZW5jeS4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
