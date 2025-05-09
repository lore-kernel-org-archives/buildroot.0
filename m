Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD13FC3ABC9
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 18:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B8D7408F4;
	Fri,  9 May 2025 18:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6qMlNmyWvhA; Fri,  9 May 2025 18:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5E140720
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5E140720;
	Fri,  9 May 2025 18:12:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8685E2
 for <buildroot@buildroot.org>; Fri,  9 May 2025 18:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B96FA40702
 for <buildroot@buildroot.org>; Fri,  9 May 2025 18:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i39gV3DICy4K for <buildroot@buildroot.org>;
 Fri,  9 May 2025 18:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41FA940543
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FA940543
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41FA940543
 for <buildroot@buildroot.org>; Fri,  9 May 2025 18:11:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 374DC58038F
 for <buildroot@buildroot.org>; Fri,  9 May 2025 17:33:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72F1943B55
 for <buildroot@buildroot.org>; Fri,  9 May 2025 17:33:15 +0000 (UTC)
Message-ID: <639760d2-daa8-4796-9a4c-e8fbeb1386fe@bootlin.com>
Date: Fri, 9 May 2025 19:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250507114042.96291-1-olivier.benjamin@bootlin.com>
 <5dfc6296ee5eed106bfa325dee29e39d@free.fr>
Content-Language: en-US
In-Reply-To: <5dfc6296ee5eed106bfa325dee29e39d@free.fr>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevhfeiieekueffgfekfeefgfejhfdtvdfgtedvffethefhteetjeevieeifeefgfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopeglkffrggeimedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiegnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughro
 hhothdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746811995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UexlANQRrMfahVEgwR+HFVyPqRmIF+GwBrOLuX9jSr4=;
 b=In1Ra6vYx/n0r8RNg/raiam688tj66c3v0uQaTuTDSCm+wuUdrRtlI3FyRodh7shWmHTDF
 cp6qMXhG/8V9ofsuu5yvM2CU5atDsmLsRNZ7Wxb++HgkaPXQl0qFXnGuaADdHZFBT2evRV
 FIAHJP35LZ0H7M/A+ejhe12BWXkUkCl1NHoeoPcGb14wADnmgfr/3uwLuWPxxDV1jMLo9U
 2Gyya7m7F+3qkEpn3OTMSv0KuolDQLHkWP7HsmVD6uqjOVnFBlmelycMuwWlAOapdHqjr5
 d4nIPi0galXSSonz6O6/4BxzVsqhS/DgTx4oXoi3aLdD76uJauh5pKWBZxOCKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=In1Ra6vY
Subject: Re: [Buildroot] [PATCH 1/1] package/psplash: add support for
 fullscreen config option
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
From: Olivier Benjamin via buildroot <buildroot@buildroot.org>
Reply-To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiA1LzkvMjUgMTU6MjcsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+IEhpIE9saXZpZXIsCj4g
Cj4gT24gMDcvMDUvMjAyNSAxMzo0MCwgT2xpdmllciBCZW5qYW1pbiB2aWEgYnVpbGRyb290IHdy
b3RlOgo+PiBBZGQgc3VwcG9ydCBmb3IgYSBwc3BsYXNoIGNvbmZpZ3VyZSBvcHRpb246Cj4+IMKg
IC0tZW5hYmxlLWltZy1mdWxsc2NyZWVuLCB2aWEgQlIyX1BBQ0tBR0VfUFNQTEFTSF9GVUxMX1ND
UkVFTgo+Pgo+PiBUaGUgQnVpbGRyb290IG9wdGlvbiB3aWxsIGRlZmF1bHQgdG8gJ24nIHRvIGJl
IGNvbXBhdGlibGUgd2l0aAo+PiB0aGUgcHJldmlvdXMgYmVoYXZpb3VyLCBhcyBpdCB3YXMgZGlz
YWJsZWQgYnkgZGVmYXVsdCBpbiBwc3BsYXNoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVy
IEJlbmphbWluIDxvbGl2aWVyLmJlbmphbWluQGJvb3RsaW4uY29tPgo+IAo+IEFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCj4gCnRoYW5rcyBmb3IgdGhlIHN1cGVyIHF1aWNrIHR1cm4tYXJvdW5k
IQo+IEkgYWxzbyBzZWUgdGhhdCBwc3BsYXNoIHVwc3RyZWFtIHJlY2VpdmVkIGZldyB1cGRhdGVz
LCBpbmNsdWRpbmcKPiBnY2MxNS9DMjMgZml4ZXM6IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5v
cmcvcHNwbGFzaC9sb2cvCj4gQXMgYSBzdWdnZXN0aW9uLCBjb3VsZCB5b3Ugc2VuZCBhIGJ1bXAg
dG8gdGhlIGxhdGVzdCBjb21taXQgcGxlYXNlPwo+IApJJ2xsIHRha2UgYSBsb29rCj4gQmVzdCBy
ZWdhcmRzLAo+IAo+IEp1bGllbi4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKLS0gCk9saXZpZXIgQmVuamFtaW4sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
