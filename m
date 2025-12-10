Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB74D3C90D
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 14:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0928C407A5;
	Wed, 10 Dec 2025 14:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oprCMCnjyZUU; Wed, 10 Dec 2025 14:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F50A40A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765376025;
	bh=LdyvvO30dZF/h9BsYxdDg7QPY13vKaW0+lOfuisscyA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MhpjXff4OlP8Vty/ml56fgsFJfGWDkTEIHQC4i8gAG3NYa1MdIp+WJiqDf2QHW5VM
	 DnkQKLKmbvtb5JhxUvN2R2FEQ+DecH4yvuvHGFV6aKKXWKAcREy9gxzaOIG3d/MRHO
	 X7MLwfx+wYvBkVoOEis09XWsBExJapFTDUEh+47hvm0WDuCRNYbiCpFlrtMZVr0hcX
	 5UbqALvVWPPvjujr1PR/1oqJEXNkEyKEjAFoxRXBgPyjkBbzKXjP4JYCsx32PpJ5FZ
	 ibPrIcFS6x5nqwrr9QwuZnaWaUNDPjMAzaK4B50mlhtdnb+HGekMRrK7eJyaYRbrzq
	 KjtqagRZyg/LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F50A40A4B;
	Wed, 10 Dec 2025 14:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48E8F2C0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4646740F2E
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7RwwOu8oBwW for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 14:13:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D9044020C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D9044020C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D9044020C
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:13:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2FC6A4E41B32
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:13:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DEEE260714
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:13:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D509411930CE3; Wed, 10 Dec 2025 15:13:38 +0100 (CET)
Date: Wed, 10 Dec 2025 15:13:37 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20251210151337.7c42babf@kmaincent-XPS-13-7390>
In-Reply-To: <20251210145715.50e51799@windsurf>
References: <20251210102940.2535550-1-kory.maincent@bootlin.com>
 <20251210145715.50e51799@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765376019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UZPA7DPWJ6ofPnMg5icI6eFSSaSVYpzzEBrndLCrbgU=;
 b=jdqx9E4c3EEWvl0mCt+neT5RdYCrrQ6QZo8F8qbH4xm/Ou9t/qRS0tUX5QiFhzMzk/rJk3
 aTOTPV+IypT6vKfv2wWnGXE7VPxvkmcfQ5hOoezMd0lWt05sevwIyerQmpeuZPRLNfLQ6B
 A517YnvIeOggCUulrVucL2IQdn/a22NJRUxyH/9SJXp06/aHOoTAbrJgp/E33avgcsoriy
 upp/sg+vvzIx+xQl50nNE9P4rC59eT8iAfJG++9805tLYErcRAw+lSxzykpgy0WSrcE5EX
 nA5LhEunyiXOnuK/whTt3kzRClhneGbjVHEfxU67vsBmpMWDHd1Poyr/iYcTyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jdqx9E4c
Subject: Re: [Buildroot] [PATCH] package/util-linux: Fix host uuidd build
 configuration
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxMCBEZWMgMjAyNSAxNDo1NzoxNSArMDEwMApUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8sCj4gCj4gT24gV2VkLCAx
MCBEZWMgMjAyNSAxMDoyOTozOSArMDAwMAo+IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gVGhlIGhvc3QgYnVpbGQgaGFkIGNvbmZsaWN0aW5n
IGNvbmZpZ3VyYXRpb24gb3B0aW9ucyB3aGVyZSBsaWJ1dWlkIHdhcwo+ID4gc2ltdWx0YW5lb3Vz
bHkgZW5hYmxlZCBhbmQgZGlzYWJsZWQuIEFsdGhvdWdoIGNvbW1lbnRzIGV4cGxpY2l0bHkgc3Rh
dGVkCj4gPiB0aGF0IGxpYnV1aWQgc2hvdWxkIGJlIGVuYWJsZWQgZm9yIHRoZSBob3N0LCB0aGUg
LS1kaXNhYmxlLXV1aWRkIGZsYWcKPiA+IHdhcyBwcmV2ZW50aW5nIHRoZSB1dWlkIHRvb2xzIGZy
b20gYmVpbmcgYnVpbHQgYW5kIGluc3RhbGxlZC4gIAo+IAo+IFNvcnJ5LCBidXQgSSBkb24ndCBy
ZWFsbHkgdW5kZXJzdGFuZCB0aGUgY29uZmxpY3QuIC0tZW5hYmxlLWxpYnV1aWQgdG8KPiBtZSBk
b2VzIG5vdCBjb25mbGljdCB3aXRoIC0tZGlzYWJsZS11dWlkZC4gLS1lbmFibGUtbGlidXVpZCBl
bmFibGVzIHRoZQo+IGxpYnV1aWQgbGlicmFyeSwgLS1kaXNhYmxlLXV1aWRkIGRpc2FibGVzIHRo
ZSB1dWlkZCBkYWVtb24sIHdoaWNoIGNhbgo+IG9wdGlvbmFsbHkgYmUgdXNlZCBieSBsaWJ1dWlk
LCBidXQgaXNuJ3Qgc3RyaWN0bHkgbmVlZGVkLgoKT2ggd293LCBteSBicmFpbiByZWFkIC0tZW5h
YmxlLXV1aWQgYW5kIC0tZGlzYWJsZS11dWlkLgp1dWlkIGFuZCBsaWJ1dWlkIGFyZSBpbmRlZWQg
dHdvIGRpc3RpbmN0IHRoaW5ncywgc29ycnkgZm9yIHRoZSBjb25mdXNpb24uCiAKPiBXaGljaCBz
cGVjaWZpYyB0b29sIHdhcyBtaXNzaW5nIGluIHlvdXIgY2FzZT8KCkkgd2FzIG5lZWRpbmcgdGhl
IHV1aWRnZW4gdG9vbCBvbiBteSBjYXNlLgpUaGF0IHdoeSBJIG5lZWQgdG8gZW5hYmxlIHV1aWQu
CgpSZWdhcmRzLAotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
