Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ED5C5AD4E
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 08:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316234054F;
	Mon, 10 Aug 2026 08:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRs8XA_m_bOE; Mon, 10 Aug 2026 08:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D7C40562
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786351500;
	bh=JwKoWpKgjXiedfsRKjIEEnqFcSiNRHkom+qaSdC8JVI=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IezEx2WXovIlXpabToBTKc2S6X+F36973krNQRAcpxaRO7pJTVCCCJ3Pb024gODJq
	 U9YrxkkK/IMrenZGbVjduoWsmnnI/pfWIe4HjSM6zNtQEwe6dqnbtw8bsLN/Hdt3fC
	 PtmwQOaiLYr6/ANK3zyOt49fVCGVRkC/7F4iQa7cbhvaPIfn3jqS6mVtAtisoaPIeA
	 xwOptnVYJkTaMFd2gvU9+hD8sBoe32NaQfW5DgFwmDH4QfyL2buLA6BezWf4tvvuuy
	 j03MFBFOW99gY3O4pfIOTyeyOBHDR8x0/H2JPfeWtrZkOZO5nbTGKnbRe8ld2Y9fnk
	 Hv4afrTnadAhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D7C40562;
	Mon, 10 Aug 2026 08:45:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D158282
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7360E80C8B
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vYub0vSuWED for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 08:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7725D80C85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7725D80C85
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7725D80C85
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:44:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4932E1A1515;
 Mon, 10 Aug 2026 08:44:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 163496033B;
 Mon, 10 Aug 2026 08:44:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0E1C811C49EFF; 
 Mon, 10 Aug 2026 10:44:49 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 10 Aug 2026 10:44:49 +0200
Message-Id: <DKL4R5768V4T.188YQE4W2AGL9@bootlin.com>
Cc: <buildroot@buildroot.org>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
 <20260806-host_tools-v1-1-19c63ecc3b10@bootlin.com>
 <anWMFshKM90_1I-z@windsurf>
In-Reply-To: <anWMFshKM90_1I-z@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786351490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UrRLONH9KXGjO1B9GMKb9p2D+TIzY18HJh1GGwhbjJA=;
 b=VhjeO/vqN8cidKQ6I39Dx12vGb0tgCtsL3/sRfQZZaUnPR7MUmDV8ZmL47adttYIM3Eki+
 ADvAwp0iXAfcC6jx/5GKnIwkW8AaOEsr5SSnX+d4BdQrEV+m5+TLVORZneCpYszEEOeafA
 HBo2+GxhHPdS+iiOtcnPjzMnJP8TSm10K4SwUS72GzkV2yETyRW5PZeDbL4Rb6l7WJgTwV
 JaaSg8BAPtoSY+at+l1rd22hRsZ4nwfWFZanQFVPIrUwX+r3naN5p4fh7P68d5KQzXNJ9F
 vTwvcyaEhiIT+sXzk6D++Q9JHfz0mfIFUknON7ovDXDBpUvG6JlEF4Q2kWD6Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=VhjeO/vq
Subject: Re: [Buildroot] [PATCH 1/2] package/uglifyjs: new package
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

SGkgVGhvbWFzLAoKT24gRnJpIEF1ZyA3LCAyMDI2IGF0IDk6NDQgQU0gQ0VTVCwgVGhvbWFzIFBl
dGF6em9uaSB3cm90ZToKPiBIZWxsbyBBbGV4aXMsCj4KPiBPbiBUaHUsIEF1ZyAwNiwgMjAyNiBh
dCAxMToyNDoyMlBNICswMjAwLCBBbGV4aXMgTG90aG9yw6kgd3JvdGU6Cj4+IHVnbGlmeWpzIGlz
IGEgSmF2YVNjcmlwdCBwYXJzZXIsIG1pbmlmaWVyLCBjb21wcmVzc29yIGFuZCBiZWF1dGlmaWVy
Cj4+IHRvb2xraXQuCj4+IAo+PiBodHRwczovL2dpdGh1Yi5jb20vbWlzaG9vL1VnbGlmeUpTCj4+
IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3Rs
aW4uY29tPgo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guIE92ZXJhbGwgbG9va3MgZ29vZC4gT25l
IG9yIHR3byBzdWdnZXN0aW9ucyBiZWxvdy4KPgo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLjkyMWQ0ZGZmZWU4ZQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBi
L3BhY2thZ2UvdWdsaWZ5anMvdWdsaWZ5anMubWsKPj4gQEAgLTAsMCArMSwyMyBAQAo+PiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4gKyMKPj4gKyMgdWdsaWZ5anMKPj4gKyMKPj4gKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4+ICsKPj4gK1VHTElGWUpTX1ZFUlNJT04gPSAzLjE5LjMKPj4g
K1VHTElGWUpTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG1pc2hvbyxVZ2xpZnlKUyx2JChVR0xJRllK
U19WRVJTSU9OKSkKPj4gK1VHTElGWUpTX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UKPj4gK1VHTElG
WUpTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4+ICtIT1NUX1VHTElGWUpTX0RFUEVOREVOQ0lF
UyA9IGhvc3Qtbm9kZWpzCj4+ICsKPj4gK2RlZmluZSBIT1NUX1VHTElGWUpTX0lOU1RBTExfQ01E
Uwo+PiArCSQoSU5TVEFMTCkgLW0gMDc1NSAtZCAkKEhPU1RfRElSKS9saWIvbm9kZV9tb2R1bGVz
L3VnbGlmeS1qcwo+PiArCXJzeW5jIC1hICQoQEQpL2JpbiAkKEhPU1RfRElSKS9saWIvbm9kZV9t
b2R1bGVzL3VnbGlmeS1qcy8KPj4gKwlyc3luYyAtYSAkKEBEKS9saWIgJChIT1NUX0RJUikvbGli
L25vZGVfbW9kdWxlcy91Z2xpZnktanMvCj4+ICsJcnN5bmMgLWEgJChARCkvdG9vbHMgJChIT1NU
X0RJUikvbGliL25vZGVfbW9kdWxlcy91Z2xpZnktanMvCj4KPiBXZSBtb3JlIGNvbW1vbmx5IHVz
ZSAiY3AgLWRwZnIiIGZvciB0aGlzIGtpbmQgb2Ygc2l0dWF0aW9uLCBhbmQgeW91Cj4gY291bGQg
YWxzbyB1c2UgYSBsb29wPwo+Cj4+ICsJJChJTlNUQUxMKSAtbSAwNzU1ICQoQEQpL3BhY2thZ2Uu
anNvbiAkKEhPU1RfRElSKS9saWIvbm9kZV9tb2R1bGVzL3VnbGlmeS1qcy8KPgo+IFNvbWV0aGlu
ZyBsaWtlOgo+Cj4gCSQoZm9yZWFjaCBwLGJpbiBsaWIgdG9vbHMgcGFja2FnZS5qc29uLFwKPiAJ
CWNwIC1kcGZyICQoQEQpLyQocCkgJChIT1NUX0RJUikvbGliL25vZGVfbW9kdWxlcy91Z2xpZnkt
anMvCj4gCSkKPgoKSW5kZWVkLCBpdCBsb29rcyBiZXR0ZXIgd2l0aCB0aGUgbG9vcCwgSSdsbCB1
cGRhdGUgYWNjb3JkaW5nbHkuCgo+PiArCWxuIC1zZiAuLi9saWIvbm9kZV9tb2R1bGVzL3VnbGlm
eS1qcy9iaW4vdWdsaWZ5anMgJChIT1NUX0RJUikvYmluL3VnbGlmeWpzCj4+ICsKPgo+IERyb3Ag
dGhpcyBlbXB0eSBuZXcgbGluZS4KPgo+PiArZW5kZWYKPj4gKwo+PiArJChldmFsICQoaG9zdC1n
ZW5lcmljLXBhY2thZ2UpKQo+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF91Z2xpZnlqcy5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfdWdsaWZ5anMucHkKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi42NjZhNWZiNDZmZjEKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3VnbGlmeWpzLnB5Cj4KPiBGb3Jnb3QgYWJvdXQgY29tbWVu
dGluZyBvbiB0aGlzIG9uIHRoZSBERVZFTE9QRVJTIGZpbGU6IHBsZWFzZSBhZGQKPiB0aGlzIGZp
bGUgdG8gdGhlIERFVkVMT1BFUlMgZmlsZSBhcyB3ZWxsLCB1bmRlciB5b3VyIG5hbWUuIFRoaXMg
d2F5IGlmCj4gdGhpcyB0ZXN0IGZhaWxzIGluIG91ciBDSSwgeW91J2xsIGdldCBub3RpZmllZC4K
CkFoLHRydWUsIEkndmUgbGlrZWx5IG1pc3NlZCB0ZXN0cyBmcm9tIHNvbWUgb3RoZXIgcGFja2Fn
ZXMgdGhlbiwgSSdsbAp1cGRhdGUgaGVyZSBhbmQgc2VuZCBhIHNlcGFyYXRlIHBhdGNoIGZvciBl
eGlzdGluZyBwYWNrYWdlcy4KCkFsZXhpcwoKPiBUaGFua3MhCj4KPiBUaG9tYXMKCgoKCi0tIApB
bGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
