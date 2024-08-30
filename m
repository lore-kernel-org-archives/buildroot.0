Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C74BCA0FED
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 13:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45CF942448;
	Fri, 30 Aug 2024 13:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XzRbNOTybSF; Fri, 30 Aug 2024 13:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D7A14245D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7A14245D;
	Fri, 30 Aug 2024 13:04:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73A7E1BF410
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 13:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6155261241
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 13:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xa-Okv9I0c_F for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 13:04:10 +0000 (UTC)
X-Greylist: delayed 594 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 30 Aug 2024 13:04:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D84361214
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D84361214
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:c0c:9d57::1;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D84361214
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 13:04:10 +0000 (UTC)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 8E016F4;
 Fri, 30 Aug 2024 14:54:11 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 30 Aug 2024 14:54:11 +0200
To: Niklas Cassel <Niklas.Cassel@wdc.com>
In-Reply-To: <ZtG5B5gprpGaHeWY@ryzen.lan>
References: <20240213154847.914068-1-michael@walle.cc>
 <ZtG5B5gprpGaHeWY@ryzen.lan>
Message-ID: <9ac3d58f36d3b0c97fea79983f25666e@walle.cc>
X-Sender: michael@walle.cc
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1725022451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wp8UH49WRHBQr4NXmJn+48bPl9SIJhSRfkGWh0fGN8M=;
 b=DM4pPDbl13FQqbfqVA1Kj7ybHtKooMcKvWSeuojL40ds3v4mD/d4VvfNM4YlSF6/ZXUC2n
 4K+iap5eZilvKRYIK4wTxDOlHurC7m0q/w4KFvYn3VcKA+2KK1Fqs2Patk7kTaRqzvUmZf
 EycDeTAzZld8Ppe2c+gVG0vbcwbAociVyAtFMki+OCY4jPNO6Wk54+GZ8Xm6Qemji6Yfg9
 oWLUY8H6czxUNdF6gffpawdhnDsBZL3VpSZXRvMbeMgRM38u1tbv6DfZhHr2JVuTFVSIJo
 vYWXTCOiCtaP80y+EciSpxJMFR9SV/g/X7qLN1kxwTthdnBLzrjQEeCGAmn28g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=DM4pPDbl
Subject: Re: [Buildroot] [PATCH] linux: add support for device tree overlays
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
Cc: Damien Le Moal <dlemoal@kernel.org>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgo+IE9uIFR1ZSwgRmViIDEzLCAyMDI0IGF0IDA0OjQ4OjQ3UE0gKzAxMDAsIE1pY2hhZWwg
V2FsbGUgdmlhIGJ1aWxkcm9vdCAKPiB3cm90ZToKCj4+ICskKGVycm9yICQoTElOVVhfQ1VTVE9N
X0RUU19QQVRIKSkKPiAKPiBIZXJlIHlvdSBzZWVtIHRvIGNhbGwgZXJyb3IgdW5jb25kaXRpb25h
bGx5Lgo+IFlvdXIgcGF0Y2ggZG9lcyBub3Qgd29yayB1bmxlc3MgSSByZW1vdmUgdGhpcyBsaW5l
Lgo+IFdhcyB0aGlzIHBlcmhhcHMgYSBkZWJ1ZyBsaW5lIHRoYXQgeW91IGZvcmdvdCB0byByZW1v
dmU/CgpPb3BzLCB5ZXMgeW91IGFyZSBjb3JyZWN0LgoKPiBBZGRpdGlvbmFsbHkgd2hlbiBzcGVj
aWZ5aW5nIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUQk9TCj4gSSBuZWVkIHRvIHNwZWNpZnkg
aW5jbHVkZSB0aGUgLmR0Ym8gc3VmZml4Lgo+IFRoaXMgc2VlbSB0byBiZSBpbmNvbnNpc3RlbnQg
d2l0aCBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRQo+IHdoZXJlIHlvdSBzaG91bGQg
bm90IGluY2x1ZGUgdGhlIC5kdHMgc3VmZml4Lgo+IAo+IElmIHlvdSByZWFsbHkgd2FudCB0byBr
ZWVwIHRoaXMgaW5jb25zaXN0ZW5jeSwgSSB0aGluayB0aGF0IHlvdSBzaG91bGQKPiBhdCBsZWFz
dCBjbGVhcmx5IHN0YXRlIGluIHRoZSBoZWxwIHRleHQgdGhhdCB0aGUgZmlsZXMgbXVzdCBpbmNs
dWRlIHRoZQo+IHRyYWlsaW5nIC5kdGJvLgoKTm90IHN1cmUgYW55bW9yZSB3aHkgSSBkaWQgaXQg
dGhhdCB3YXksIGl0IHdhcyBtb3JlIHRoYW4gaGFsZiBhCnllYXIgYWdvIDpvCgpJJ2xsIHJlc3Bp
biB0aGUgcGF0Y2hlcyB0byBiZSBjb25zaXN0ZW50IHdpdGggdGhlIElOVFJFRV9EVFNfTkFNRS4K
Ci1taWNoYWVsCgo+IEFsc28gc2VlIHRoaXMgb3RoZXIgcHJvcG9zYWwgZnJvbSBHYcOrbCBQb3J0
YXk6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjQwNDEyMTQwOTQ1LjE2
MjY1NzktMi1nYWVsLnBvcnRheUBydG9uZS5mci8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
