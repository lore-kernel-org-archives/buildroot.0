Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457BBC3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08BD3409B4;
	Tue,  9 Jul 2024 21:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9P8_iXqTd0rw; Tue,  9 Jul 2024 21:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB0A410DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFB0A410DB;
	Tue,  9 Jul 2024 21:35:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0CCC1BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DA9E4038D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTNdyn3_y0dz for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:35:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 549D740308
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549D740308
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 549D740308
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 21:35:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89A3BFF806;
 Tue,  9 Jul 2024 21:35:28 +0000 (UTC)
Date: Tue, 9 Jul 2024 23:35:27 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240709233527.0ba40ce9@windsurf>
In-Reply-To: <A6E24BF2-2EBA-46F1-A502-93C0B3B5EA06@benettiengineering.com>
References: <20240702231947.279854-1-james.hilliard1@gmail.com>
 <A6E24BF2-2EBA-46F1-A502-93C0B3B5EA06@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720560928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+b1Gl3+3P1R4miQm3m1sHa34A9Kwzt+yfjOtST+Vzg=;
 b=me7EcSWgIU5OQG6luVRzTuYRTinJm+KgDUyGij11P2Gav4vD7zuP1f4eVo+X5X9JApmEhf
 Osr/dAocHZRsFMqeBdP3eCo2H68nmfz3zqsMUiw8O5EmNq5fQsnbxJLOMeGvueAlktdYa7
 Io+BMt/c5I6y8EV8IkdgT1DDA4LastNUlwdi1V1es7y80RjEoQ32RhG6v9yRRuP+2oW1ir
 LJHijqsd6hWWniyMVPYwhtBpZmalljuf0tNEZ8HmStDjAD80SO10UDeyymnUp+5C1vShPd
 vgaHzUIdv5BSHg4np5ZpuLq6RTSSpCkv9h9NEAVZB4N6zHrRo/K/utZht8z4rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=me7EcSWg
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2024.05.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAzIEp1bCAyMDI0IDExOjA3OjQzICswMjAwCkdpdWxpbyBCZW5ldHRpIDxnaXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKCj4gdGhhbmsgeW91IGJ1dCBJ
4oCZdmUgYWxyZWFkeSBzZW50IGEgcGF0Y2ggZm9yIHRoaXM6Cj4gcGFja2FnZS9zd3VwZGF0ZTog
YnVtcCB0byB2ZXJzaW9uIDIwMjQuMDUuMiAtIFBhdGNod29yawo+IHBhdGNod29yay5vemxhYnMu
b3JnCgpTb3JyeSwgSSBub3RpY2VkIHlvdXIgcGF0Y2ggYWZ0ZXIgYXBwbHlpbmcgdGhlIG9uZSBm
cm9tIEphbWVzLiBNeSBiYWQKOi0vCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93
bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
