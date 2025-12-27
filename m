Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CE9E92720
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87BE6607CA;
	Sat, 27 Dec 2025 23:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cj1TYNL39Yzc; Sat, 27 Dec 2025 23:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF575607BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766877266;
	bh=N5+eA7FRBu1axU/CQbc3y+F0b8HsD5rXtAfp6rWS7qQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jOGOyM0PMwibDRs84C6MfX2taKffCHdzxeaNNp+RAAr0gPrV+5o5aLTdWLN9Jz6m8
	 wLXvLtf0lIw7gJ/PtxTS29HSCmNl8P7yZbNf1yH4XRGeqf5vcR2eep97pum9kEmeKm
	 Ih5SbRTf/RL1y8R9N44GT52rUcpJNJ6qUrlNOTHoz5AfzgtPfQxGwz/LhOTkq2lf4R
	 uiOEBYgtp3LtKpNVWe1ymuicCx/au2jpP7orkKnwj3Y3TbPbw3nWOjahNphhOeWjfg
	 bLHO8oAf3/ikDn2yCykeK0iVe8hPpYnW9vw0TNsks2KXu9hbHj3AeAfMU45y+0Lig4
	 tbmw2cGI6kqnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF575607BB;
	Sat, 27 Dec 2025 23:14:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97AB5D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E3EB403E3
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8sxnXuXmE4J for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95E1E400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E1E400F8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95E1E400F8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:14:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 644CA4E41E22;
 Sat, 27 Dec 2025 23:14:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1BB5160725;
 Sat, 27 Dec 2025 23:14:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D7DE11978B11; Sun, 28 Dec 2025 00:14:16 +0100 (CET)
Date: Sun, 28 Dec 2025 00:14:15 +0100
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>, Angelo
 Compagnucci <angelo.compagnucci@gmail.com>, Grzegorz Blach
 <grzegorz@blach.pl>, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20251228001415.0335f4c0@windsurf>
In-Reply-To: <20251226-rgbmatrix-bump-v1-1-69c2aa62beaa@gmx.net>
References: <20251226-rgbmatrix-bump-v1-0-69c2aa62beaa@gmx.net>
 <20251226-rgbmatrix-bump-v1-1-69c2aa62beaa@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766877260; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gL/3FCJCx+AdgDvuCT3/aq+tUXZ1koukKaMLaVDkAmc=;
 b=ZbgMJ5/HrobkyeU1U67cCaF6CrTUSQYG46DhVgJk/bLUVLCYr0pgfFxBi2nvtv4X7pl5c0
 DPcD/RDFV0Y7FzA05tplIxIQdRSC+JZbqaQStmWoMV1T7SjJ4j6WGOirBVvqJiX3VyDn17
 mz1dvicz7nYWaYqj4bj6V1x2j2hff4NedbhIMG/eov63MMLVGTs99LXXGYveMx1DRBKxly
 aowWNMPHA6ysw5wRUo0ZwGK3WfQnRbgbIzOmt+EL5TzGclRT/+0PYM21druwQzrHrl9B2u
 35o/8ji2DpOpLkvTKYHlVmxfXtW+6HFOUlWLCk8bMjYI7Y1CeE7vi3d+MYxZjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ZbgMJ5/H
Subject: Re: [Buildroot] [PATCH RFC 1/2] package/python-pillow: install
 libImaging headers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSiwKClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIEZyaSwgMjYgRGVjIDIwMjUgMTc6
MDc6MTAgKzAxMDAKSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxk
cm9vdC5vcmc+IHdyb3RlOgoKPiBweXRob24tcmdibWF0cml4IGRlcGVuZHNbMV0gb24gSW1hZ2lu
Zy5oIHNpbmNlIGNvbW1pdCBiZjQ1Njc2ICgiUmVmYWN0b3IKPiBicm9rZW4gdW5zYWZlIFNldElt
YWdlUGlsbG93KCkiKS4KCllvdSBzaG91bGQgY2xhcmlmeSBoZXJlOiAiYW5kIHRoZXJlZm9yZSBj
aGFuZ2luZyBweXRob24tcGlsbG93IHRvCmluc3RhbGwgdGhpcyBoZWFkZXIgaXMgbmVlZGVkIHBy
aW9yIHRvIGJ1bXBpbmcgcHl0aG9uLXJnYm1hdHJpeCIuCgo+IERlYmlhbiBvbmx5IGluc3RhbGxz
IGZvdXIgaGVhZGVyc1syXSwgYnV0IHRoaXMgc2VlbXMgaW5zdWZmaWNpZW50LAo+IGJlY2F1c2Ug
SW1hZ2luZy5oIGluY2x1ZGVzIGF0IGxlYXN0IG9uZSBoZWFkZXIgdGhhdCBpcyBub3Qgb24gdGhp
cyBsaXN0Cj4gKEFycm93LmgpLgo+IAo+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL2h6ZWxsZXIv
cnBpLXJnYi1sZWQtbWF0cml4L3B1bGwvMTgxOAoKUGxlYXNlIHBvaW50IHRvIHRoZSBjb21taXQg
dGhhdCBoYXMgYmVlbiBtZXJnZWQsIG5vdCBzb21lICJyYW5kb20iIFBSLgoKPiBbMl06IGh0dHBz
Oi8vc291cmNlcy5kZWJpYW4ub3JnL3NyYy9waWxsb3cvMTIuMC4wLTEvZGViaWFuL3J1bGVzI0wx
MDYKClBsZWFzZSBhZGQgeW91ciBTaWduZWQtb2ZmLWJ5IGxpbmUgaGVyZS4KCkN1cmlvdXM6IHB5
dGhvbi1waWxsb3cgd291bGQgZm9yIG1lIGJlIGEuLi4gUHl0aG9uIG1vZHVsZS4gQW5kIHNvIHdv
dWxkCmJlIHB5dGhvbi1yZ2JtYXRyaXguIEJ1dCB3aXRoIHlvdXIgcGF0Y2gsIHdlIGluc3RhbGwg
c29tZSBDL0MrKwpoZWFkZXJzLiBTbyBweXRob24tcGlsbG93IGluY2x1ZGVzIGEgbmF0aXZlIGxp
YnJhcnksIGFuZApweXRob24tcmdibWF0cml4IGRpcmVjdGx5IGxpbmtzIGFnYWluc3QgdGhpcyBs
aWJyYXJ5PyBIb3cgd2FzIGl0CndvcmtpbmcgcHJpb3IgdG8gdGhpcyBjaGFuZ2U/CgpUaGFua3Mh
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
