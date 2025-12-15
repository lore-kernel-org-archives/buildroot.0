Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0932DD5B16F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 13:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8BED80B9F;
	Mon, 15 Dec 2025 13:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiW2b2TdAKYr; Mon, 15 Dec 2025 13:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F122680C89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765807190;
	bh=EcwdixxbAWc4usIIp1+gaMDNun16OAEEwl6WDL7IPDQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UkBLzrdhwFPcP3djTLcDor74DnxXnQGTsz8Vz3lxl9HUyUw33Yv0g+867Qh18b3xU
	 kP4rCWM1Q388W/q9Kor1PmcM4G9ReWK6roTu+vSlfnE8uKh5ZgRWFG+tjau6lCV52D
	 jvlBJIjP6HT/M2lc3CgKs/r80hXG96+oMCHrE/A+YFxflE/xWs2NcMgoppohKDoUel
	 JtsqPfGrq7DFMQTt9Rs98hPmC8GM6yWOnLvZSkDmEXDhae2LfaBL0KzfT3cnqcRDsy
	 XXXoa8E0afAklj1XpZucaPOzwkIF1/vmKS0E7c2Opj6iw1YGz5MFxf8oHFwIsW/LmD
	 yJ7dDg5Gw82tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F122680C89;
	Mon, 15 Dec 2025 13:59:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C38117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 13:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A31F80C3B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 13:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oARxE4cwKpwy for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 13:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CF6880B1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF6880B1C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CF6880B1C
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 13:59:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D29614E41C0A;
 Mon, 15 Dec 2025 13:59:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A798860664;
 Mon, 15 Dec 2025 13:59:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3A7611942348; Mon, 15 Dec 2025 14:59:35 +0100 (CET)
Date: Mon, 15 Dec 2025 14:59:34 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Bryan Brattlof <bb@ti.com>, Bajjuri
 Praneeth <praneeth@ti.com>, Lothar Felten <lothar.felten@gmail.com>,
 thomas.petazzoni@bootlin.com
Message-ID: <20251215145934.4ae9c02e@kmaincent-XPS-13-7390>
In-Reply-To: <83449352760f5935309de9759b56c1fb@free.fr>
References: <20251212162053.883682-1-kory.maincent@bootlin.com>
 <20251212162053.883682-2-kory.maincent@bootlin.com>
 <83449352760f5935309de9759b56c1fb@free.fr>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765807178; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CqxPnowESpkOrMa3Q+CGWSrW0pOzDNrfuXZoh11fnZc=;
 b=MWKabUCWF/iLQGVWuGh3sJQZB9hd3fYY7GA/XAiLFrwzxewE0lpd2MfZwZiJpsnvNVG3WO
 VjgSn6upqNiMnyaHYQ5DIMVgHwB6kqj6gy6zK6/ebu7/O86m2wtmMANZrJdQ5pL9WW6oTH
 m+UkTV0hfJnL0Q091VefWQYMqluADAjgGNlfEEes2tY6C4i0h9KDViTHBwKmXOGFGVHbgL
 QZejFl+7+WCRY+GzR+I+Sss0KXXMtlBtuGoNvgTRdoVzw2MWq2jvH4a6fsED0d1QQRoedU
 xvTxHHf3rMjbTyf9ZOuXOEqXOnH331ZgCAxFWTYU1dkpfnvt4TBKfAGwP95KAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=MWKabUCW
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/beaglebone: Bump to Linux
 mainline 6.18
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

T24gU2F0LCAxMyBEZWMgMjAyNSAyMTo0NjowMSArMDEwMApKdWxpZW4gT2xpdmFpbiB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEhpIEtvcnksCj4gCj4g
VGhhbmtzIGZvciB0aGUgcGF0Y2ghICBJIGhhdmUgZmV3IGNvbW1lbnRzLCBzZWUgYmVsb3cuCj4g
Cj4gT24gMTIvMTIvMjAyNSAxNzoyMCwgS29yeSBNYWluY2VudCB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+ID4gRnJvbTogIktvcnkgTWFpbmNlbnQgKFRJLmNvbSkiIDxrb3J5Lm1haW5jZW50QGJvb3Rs
aW4uY29tPgo+ID4gCj4gPiBCdW1wcyB0aGUgTGludXgga2VybmVsIHRvIHRoZSBsYXRlc3QgNi4x
OCBtYWlubGluZSB2ZXJzaW9uLgo+ID4gCj4gPiBUZXN0ZWQgb24gQmVhZ2xlQm9uZSBCbGFjay4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCAoVEkuY29tKSA8a29yeS5tYWlu
Y2VudEBib290bGluLmNvbT4KCi4uLgoKPiA+IC0tCj4gPiAyLjQzLjAgIAo+IAo+IENvdWxkIHlv
dSBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2ggZml4aW5nIHRoZSBjdXN0b20gaGFzaCBmaWxlIGFuZAo+
IHN3aXRjaGluZyB0byBCb290bGluIGV4dGVybmFsIHRvb2xjaGFpbiwgcGxlYXNlPwoKT2sgSSB3
aWxsLCB0aGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQotLQpLw7ZyeSBNYWluY2VudCwgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
