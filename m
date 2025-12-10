Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1F5D3C526
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 14:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93A5040886;
	Wed, 10 Dec 2025 14:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wv4qOVeAstCE; Wed, 10 Dec 2025 14:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92C3408BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765377542;
	bh=x5bP/GemMcNxamDVIOI/YzurBF3vgC8+ozmskZ2Q26k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=blJ1aGrdIPW7qS1FfaREmT9Q7xyikB+PE1In/O9hOYmU6iDD6fxDYFRsoxRw0zbKw
	 AI5LypuEyPZhKdGnkLJZjHvbSFkL8k1DFTuGZBC061HgJtMEZBuGpJPcHLJPuIe+N7
	 FgU/FuKE2pfudXCK6T1YQFJ47H1nus3+5OUrZ9+eIZ9xOAXwO8hmdoHLF4LbEHsws5
	 wkJORsWa0rI6S195h4PzuQWrGJIh4z2fw/xZy2z1vD+KbivbxXVJfI3LBWDtAf6dn3
	 vMTTMvjZuzC4mDSZ7nNr2WKvNX56pBUe9ogoDjSKwoYfJ6GMysJ0pn7RSqWHMYoYYI
	 GCpYT335W6iDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B92C3408BA;
	Wed, 10 Dec 2025 14:39:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E15A22C0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D34F9401F0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnB_5BlN7I6P for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 14:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3A9440144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3A9440144
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3A9440144
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:38:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7C9EE1A20A8
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:38:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5471960714
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:38:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A132D119317D9; Wed, 10 Dec 2025 15:38:56 +0100 (CET)
Date: Wed, 10 Dec 2025 15:38:55 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20251210153855.71c77aeb@kmaincent-XPS-13-7390>
In-Reply-To: <20251210152657.5422b252@windsurf>
References: <20251210102940.2535550-1-kory.maincent@bootlin.com>
 <20251210145715.50e51799@windsurf>
 <20251210151337.7c42babf@kmaincent-XPS-13-7390>
 <20251210152657.5422b252@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765377537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vpyV7YnlcuR9UaBni8JgCpL7151b1u5mGbK8jZ//OKQ=;
 b=r0zCjkqvCYIdrL6p0UWFqeLALU1spyVE214xfG2QOA+D+qwMQ+pc7OxObsohnOuumVr5bo
 X3K8XAgwq/tI/49qE7HT8lBg8+oOX9LxhdVVS2rZy6MBGEMzTDdN6zT/23LSMLi+DnYUxA
 qeDrZwf80s8wlFUZsFYxB48FROAGdRXETu2PD63SLzfJTCJk2Jtlo/MR/oaUlPAZ1Q9P2t
 vmBMQyI7CXIIdozLCRGvaVU6uy9OGCSB4EQYD/ctGBsBUKNJhxDYohcnl7b2J/LQUbQQVx
 fJJ5f/hkKjEmIy80H7woVSFkCXHrdZ1uIdgHR6Tzh2Rtw3tgFo4qbjleK9xi3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=r0zCjkqv
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

T24gV2VkLCAxMCBEZWMgMjAyNSAxNToyNjo1NyArMDEwMApUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8sCj4gCj4gT24gV2VkLCAx
MCBEZWMgMjAyNSAxNToxMzozNyArMDEwMAo+IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gPiBTb3JyeSwgYnV0IEkgZG9uJ3QgcmVhbGx5IHVu
ZGVyc3RhbmQgdGhlIGNvbmZsaWN0LiAtLWVuYWJsZS1saWJ1dWlkIHRvCj4gPiA+IG1lIGRvZXMg
bm90IGNvbmZsaWN0IHdpdGggLS1kaXNhYmxlLXV1aWRkLiAtLWVuYWJsZS1saWJ1dWlkIGVuYWJs
ZXMgdGhlCj4gPiA+IGxpYnV1aWQgbGlicmFyeSwgLS1kaXNhYmxlLXV1aWRkIGRpc2FibGVzIHRo
ZSB1dWlkZCBkYWVtb24sIHdoaWNoIGNhbgo+ID4gPiBvcHRpb25hbGx5IGJlIHVzZWQgYnkgbGli
dXVpZCwgYnV0IGlzbid0IHN0cmljdGx5IG5lZWRlZC4gICAgCj4gPiAKPiA+IE9oIHdvdywgbXkg
YnJhaW4gcmVhZCAtLWVuYWJsZS11dWlkIGFuZCAtLWRpc2FibGUtdXVpZC4KPiA+IHV1aWQgYW5k
IGxpYnV1aWQgYXJlIGluZGVlZCB0d28gZGlzdGluY3QgdGhpbmdzLCBzb3JyeSBmb3IgdGhlIGNv
bmZ1c2lvbi4KPiA+ICAgIAo+ID4gPiBXaGljaCBzcGVjaWZpYyB0b29sIHdhcyBtaXNzaW5nIGlu
IHlvdXIgY2FzZT8gICAgCj4gPiAKPiA+IEkgd2FzIG5lZWRpbmcgdGhlIHV1aWRnZW4gdG9vbCBv
biBteSBjYXNlLgo+ID4gVGhhdCB3aHkgSSBuZWVkIHRvIGVuYWJsZSB1dWlkLiAgCj4gCj4gQW5k
IC0tZW5hYmxlLXV1aWRkIGNvbnRyb2xzIHdoZXRoZXIgdXVpZGdlbiBpcyBidWlsdD8KCnllcy4K
Cj4gSSdsbCBnZW5lcmFsbHkgYmUgZmluZSB3aXRoIGRyb3BwaW5nIC0tZGlzYWJsZS11aWlkZCwg
YnV0IHBsZWFzZQo+IHByb3ZpZGUgYSBnb29kIGNvbW1pdCBsb2csIGV4cGxhaW5pbmcgdGhlIGRp
ZmZlcmVuY2UgaW4gYnVpbGQgdGltZQo+IChzaW5jZSBpdCdzIGEgaG9zdCBwYWNrYWdlLCB3ZSBk
b24ndCBjYXJlIGFib3V0IHRoZSBkaWZmZXJlbmNlIGluCj4gaW5zdGFsbGVkIHNpemUpLiBJIHBy
ZXN1bWUgdGhlIGJ1aWxkIHRpbWUgZGlmZmVyZW5jZSB3aWxsIGJlIG1pbmltYWwgaWYKPiBub3Qg
bmVnbGlnaWJsZS4KClllcyBzdXJlLCBJIHdpbGwhCgpSZWdhcmRzLAotLSAKS8O2cnkgTWFpbmNl
bnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
